<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller ;

/**
 * Description of BancoController
 *
 * @author wanderlei
 */
class BancoController extends \Core\Controller\Controller  {
    
    protected  $model;
    
    public function __construct() {
        parent::__construct();
        
        $this->model = new \App\Model\Banco;
        
    }
    
    public function index(){
        $this->template->assign("subtitulo","Cadastro de Bancos");
        $this->template->display("banco/index.tpl");
    }
    
    /**
     * 
     * @return type
     */
    public function listar(){
        return json_encode($this->model->listar());
    }
    
    public function salvar(){
    
        $id = filter_input(INPUT_POST,'id',FILTER_SANITIZE_NUMBER_INT);
    
        $arr_data = [
            
               "nome"=>  filter_input(INPUT_POST, 'nome',FILTER_SANITIZE_STRING),  
               "numero"=>  filter_input(INPUT_POST, 'numero',FILTER_SANITIZE_STRING),  
               "created_at"=>  date('Y-m-d H:i:s'),
               "updated_at"=>  date('Y-m-d H:i:s')            
        ];
        
        if ( $id == 0):
           $retval = $this->model->insert($arr_data);
        else:
            $to_find = $this->model->find_one($id);
            $retval = $this->model->save($to_find->id,$arr_data);
        endif;
        
        return $retval;
    }
    
    public function excluir($id){
        
        return $this->model->remove($id);
    }
    
    public function exibir($id){
        return json_encode($this->model->find_one($id));
    }
}
