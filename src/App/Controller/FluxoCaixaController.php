<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of FluxoCaixaController
 *
 * @author wanderlei
 */
class FluxoCaixaController extends \Core\Controller\Controller {
    
    protected $model;
    
    public function __construct() {
        parent::__construct();
        
        $this->model = new \App\Model\Fluxocaixa;
        $arr_fluxo = $this->model->listar();
        $this->template->assign("arr_fluxo",$arr_fluxo);
    }
    
    public function index(){       
        $this->template->display("fluxo/index.tpl");
    }
    public function registrar(){
        
        try {
            $arr_data = [
                "tipo" => filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_STRING),
                "motivo" => filter_input(INPUT_POST, 'motivo', FILTER_SANITIZE_STRING),
                "forma_pagto" => filter_input(INPUT_POST, 'forma_pagto', FILTER_SANITIZE_STRING),
                "valor" => filter_input(INPUT_POST, 'valor', FILTER_SANITIZE_STRING),
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s')
            ];

            return $this->model->insert($arr_data);
            
        } catch (\PDOException $ex) {
            die("Erro na linha " . $ex->getLine() . " :" . $ex->getMessage());
        }
    }
    
    public function listar(){
        
       return json_encode ( $this->model->listar() ) ;
    }
    
    public function imprimir($data=""){
        
        try {
         
        //$data  = filter_input(INPUT_GET,'data',FILTER_SANITIZE_STRING);    
            
        $sql = "  select  tipo,  motivo, forma_pagto, count(*) as qtde, sum(valor) as valor ";
        $sql .= " from fluxo_caixa " ;
        $sql .= "  where date_format(created_at,'%Y-%m-%d') = ? group by tipo,motivo,forma_pagto;";
        
        $stmt = $this->model->getConnection()->prepare($sql);

        $stmt->bindValue(1,  $data  );
        
        $stmt->execute();
        
        $res = $stmt->fetchAll(\PDO::FETCH_OBJ);
       
        $titulo = "Relatório de Fluxo de Caixa";
        $this->template->assign("titulo",$titulo);

        $this->template->assign("data_referencia",$data);
        //die(var_dump($res));
        
        $this->template->assign("arr_fluxo", $res);
        $this->template->assign("total_registros", count($res));
        
       
        
        $pdf = new \mPDF("utf-8");
        
        $pdf->SetHeader( '{DATE j-m-Y}|WFW-Restaurante Nossa Casa|{PAGENO}/{nbpg}');
        $pdf->setTitle("Relatório de Fluxo de Caixa");
        $pdf->SetFooter("Impresso com mPDF");
        
        $tpl = $this->template->fetch("fluxo/relatorio_fluxo.tpl");        
       
        $pdf->writeHTMLHeaders();
        $pdf->WriteHTML($tpl);        
        $pdf->writeHTMLFooters();
        
        $pdf->Output();
        
        } catch ( \PDOException $ex ){
            
            die ("Erro na linha " . $ex->getLine() . "  : " . $ex->getMessage());
        }
        
        exit();
    }
    
    
}
