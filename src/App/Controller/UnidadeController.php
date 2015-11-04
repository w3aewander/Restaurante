<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of UnidadeController
 *
 * @author wanderlei
 */
class UnidadeController extends \Core\Controller\Controller  {
    
    protected $unidade;
    
    public function __construct(){
        parent::__construct();
        $this->unidade = new \App\Model\Unidade;
    }
    
    public function index(){
        $this->template->assign("subtitulo","Cadastro de Unidades de Venda de Produtos.");
        $this->template->display("unidade/index.tpl");
    }
    /**
     * 
     */
    public function listar(){
        return \json_encode ($this->unidade->listar());
    }
    /**
     * 
     */
    public function salvar(){
     
        $id = filter_input(INPUT_POST,'id', FILTER_SANITIZE_NUMBER_INT);
       
         $arr_data = [            
            "nome"=>  filter_input(INPUT_POST,'nome', FILTER_SANITIZE_STRING),
            "sigla"=> filter_input(INPUT_POST,'sigla',FILTER_SANITIZE_STRING),
            "created_at"=> date('Y-m-d H:i:s'),
            "updated_at"=> date('Y-m-d H:i:s'),
        ];
         
        if ( $id == 0):
           $retval = $this->unidade->insert($arr_data);   
        else:
            $to_find = $this->unidade->find_one($id);
            $retval = $this->unidade->save($to_find->id, $arr_data);
        endif;
        
        return $retval;
        
    }    
    /**
     * 
     * @param type $id
     */
    public function exibir($id){
        return json_encode($this->unidade->find_one($id));
    }
    /**
     * 
     * @param type $id
     */
    public function excluir($id){
        return $this->unidade->remove($id);
    }
}
