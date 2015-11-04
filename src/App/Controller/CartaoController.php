<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of CartaoController
 *
 * @author wanderlei
 */
class CartaoController extends \Core\Controller\Controller {

    protected $model;

    public function __construct() {
        parent::__construct();
        $this->model = new \App\Model\Cartao;
        $this->template->assign("subtitulo","Cadastro de Cartões");
    }
    
    public function index(){
       $this->template->display("cartao/index.tpl");
    }

    public function listar(){
        return json_encode($this->model->listar());
    }
    

   public function salvar(){

       
       $id = filter_input(INPUT_POST,'id',FILTER_SANITIZE_NUMBER_INT);

       
       $arr_data = [
     
           "numero"   =>  filter_input(INPUT_POST, 'numero', FILTER_SANITIZE_STRING),
           "emitente" =>  filter_input(INPUT_POST, 'emitente', FILTER_SANITIZE_STRING),
           "bandeira" =>  filter_input(INPUT_POST, 'bandeira', FILTER_SANITIZE_STRING),
           "tipo"     =>  filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_STRING),
           "motivo"   =>  filter_input(INPUT_POST, 'motivo',FILTER_SANITIZE_STRING),
           "valor"    =>  filter_input(INPUT_POST, 'valor', FILTER_SANITIZE_STRING),
           "created_at" =>  date('Y-m-d H:i:s'),
           "updated_at"=>  date('Y-m-d H:i:s')
            ];
       
       if ( $id == 0):
           $retval = $this->model->insert($arr_data);
       else:
           $to_find = $this->model->find_one($id);
           $retval = $this->model->save($to_find->id, $arr_data);
       endif;
       
       return $retval;
   }    
   
   public function exibir($id){
       return json_encode ( $this->model->find_one($id) );
   }
}
