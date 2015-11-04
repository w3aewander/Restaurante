<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of ProdutoController
 *
 * @author wanderlei
 */

namespace App\Controller;

use \App\Model\Produto as Produto;

Class ProdutoController extends \Core\Controller\Controller {

    protected $model;

    public function __construct() {
        parent::__construct();
        $this->model = new Produto();
        $this->template->assign("subtitle", "Página Inicial");



        $unidades = new \App\Model\Unidade;
        $arr_unidades = $unidades->show_all();
        //Número máximo de linhas a ser exibida na tabela.
        $this->template->assign("total_registros", $this->model->Count());
        $this->template->assign("max_rows_table", \App\Config\Config::$MAX_ROWS_TABLE);
        $this->template->assign("arr_unidades", $arr_unidades);

        $fornecedores = new \App\Model\Fornecedor;
        $arr_fornecedores = $fornecedores->show_all();
        $this->template->assign("arr_fornecedores", $arr_fornecedores);

        $this->template->assign("__token", $this->getToken());
    }

    /**
     * 
     * @return type
     */
    public function index() {

        $this->template->display("produto/index.tpl");
    }

    /**
     * Este método atualiza um o registro caso exista ou inserir se nenhum id for informado. 
     * 
     * @return type
     */
    public function salvar() {

        $retval = false;

        $id = filter_input(INPUT_POST, 'produto_id', FILTER_SANITIZE_NUMBER_INT|FILTER_SANITIZE_STRING);
        $valor_unitario = filter_input(INPUT_POST, 'valor_unitario');
        

        if ($id == 0):
            $arr_data = [
                
                "descricao" => filter_input(INPUT_POST, 'descricao', FILTER_SANITIZE_STRING),
                "fornecedor_id" => filter_input(INPUT_POST, 'fornecedor_id', FILTER_SANITIZE_NUMBER_INT),
                "unidade_id" => filter_input(INPUT_POST, 'unidade_id', FILTER_SANITIZE_NUMBER_INT),
                "valor_unitario" => $valor_unitario,
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s')
            ];
            $retval = $this->model->insert($arr_data);
        else:
            $to_find = $this->model->find_one($id);

            $arr_data = [
              
                "descricao" => filter_input(INPUT_POST, 'descricao', FILTER_SANITIZE_STRING),
                "fornecedor_id" => filter_input(INPUT_POST, 'fornecedor_id', FILTER_SANITIZE_NUMBER_INT),
                "unidade_id" => filter_input(INPUT_POST, 'unidade_id', FILTER_SANITIZE_NUMBER_INT),
                "valor_unitario" => $valor_unitario,
                "updated_at" => date('Y-m-d H:i:s')
            ];
            $retval = $this->model->save($to_find->id, $arr_data);

        endif;

        return $retval;
    }

    /**
     * 
     * @param type $id
     * @return type
     */
    public function editar($id) {
        $arr_ret = $this->model->find_one($id);

        $data[] = [ "id" => $arr_ret->id, "nome" => $arr_ret->nome, "descricao" => $arr_ret->descricao];

        return json_encode($data);
    }

    public function exibir($id) {

        $produto = $this->model->find_one($id);
        
            $data = [
                "id" => $produto->id,
                "descricao" => $produto->descricao,
                "fornecedor_id"=>$produto->fornecedor_id,
                "unidade_id"=>$produto->unidade_id,
                "valor_unitario"=>$produto->valor_unitario,
                "created_at"=>$produto->created_at,
                "updated_at"=>$produto->updated_at
            ];

        return json_encode($data);
    }

    public function excluir() {
        $this->validaToken();

        $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
        return $this->model->remove($id);
    }

    public function novo() {

        $this->template->display("produto/novo.tpl");
    }
    /**
     * 
     * @return json
     */
    public function listar(){
        $arr_ret =  $this->model->listar();
        $data = [];
        foreach ( $arr_ret as $produto){
            $data [] = $produto;
        }
        return json_encode($data);
    }    

}
