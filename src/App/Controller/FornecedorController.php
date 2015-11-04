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

use App\Model\Fornecedor as Fornecedor;
use Core\Security\Filter as Filter;


Class FornecedorController extends \Core\Controller\Controller {


    protected $model;

    public function __construct() {
        parent::__construct();
        $this->model = new Fornecedor();
        $this->template->assign("subtitulo","Cadastro de Fornecedores");    
         
        $this->model = new Fornecedor;
        $arr_fornecedores = $this->model->show_all();
        $this->template->assign("arr_fornecedores",$arr_fornecedores);
        //Número máximo de linhas a ser exibida na tabela.
        $this->template->assign("max_rows_table", \App\Config\Config::$MAX_ROWS_TABLE);
  
    }

    /**
     * 
     * @return type
     */
    public function index() {
         
         $this->template->display("fornecedor/index.tpl");
        
    }

    /**
     * Este método atualiza um o registro caso exista ou inserir se nenhum id for informado. 
     * 
     * @return type
     */
    public function salvar() {
        
        //$this->validaToken();
        
        $retval = "";
        $id  = filter_input(INPUT_POST, "fornecedor_id", FILTER_SANITIZE_NUMBER_INT);
              
        if (! $id ):
            $arr_data = [
                "cpf_cnpj" => filter_input(INPUT_POST, "cpf_cnpj", FILTER_SANITIZE_STRING),
                "razao" => filter_input(INPUT_POST, "razao", FILTER_SANITIZE_STRING),
                "fantasia" => filter_input(INPUT_POST, "fantasia", FILTER_SANITIZE_STRING),
                "cep" => filter_input(INPUT_POST, "cep", FILTER_SANITIZE_STRING),
                "endereco" => filter_input(INPUT_POST, "endereco", FILTER_SANITIZE_STRING),
                "bairro" => filter_input(INPUT_POST, "bairro", FILTER_SANITIZE_STRING),
                "cidade" => filter_input(INPUT_POST, "cidade", FILTER_SANITIZE_STRING),
                "uf" => filter_input(INPUT_POST, "uf", FILTER_SANITIZE_STRING),
                "contato" => filter_input(INPUT_POST, "contato", FILTER_SANITIZE_STRING),
                "telefone" => filter_input(INPUT_POST, "telefone", FILTER_SANITIZE_STRING),
                "celular" => filter_input(INPUT_POST, "celular", FILTER_SANITIZE_STRING),
                "email" => filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL),
                "site" => filter_input(INPUT_POST, "site", FILTER_SANITIZE_URL),
                "obs" => filter_input(INPUT_POST, "obs", FILTER_SANITIZE_STRING),
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s')
            ];
            $retval = $this->model->insert($arr_data);
        else:
            $to_find = $this->model->find_one($id);

            $arr_data = [
                "cpf_cnpj" => filter_input(INPUT_POST, "cpf_cnpj", FILTER_SANITIZE_STRING),
                "razao" => filter_input(INPUT_POST, "razao", FILTER_SANITIZE_STRING),
                "fantasia" => filter_input(INPUT_POST, "fantasia", FILTER_SANITIZE_STRING),
                "cep" => filter_input(INPUT_POST, "cep", FILTER_SANITIZE_STRING),
                "endereco" => filter_input(INPUT_POST, "endereco", FILTER_SANITIZE_STRING),
                "bairro" => filter_input(INPUT_POST, "bairro", FILTER_SANITIZE_STRING),
                "cidade" => filter_input(INPUT_POST, "cidade", FILTER_SANITIZE_STRING),
                "uf" => filter_input(INPUT_POST, "uf", FILTER_SANITIZE_STRING),
                "contato" => filter_input(INPUT_POST, "contato", FILTER_SANITIZE_STRING),
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
    public function exibir($id) {
        $arr_ret = $this->model->find_one($id);

        $data[] = [ 
                        "fornecedor_id" => $arr_ret->id, 
                        "razao" => $arr_ret->razao, 
                        "fantasia" => $arr_ret->fantasia,
                        "cep" => $arr_ret->cep,
                        "cpf_cnpj"=>$arr_ret->cpf_cnpj,
                        "endereco"=>$arr_ret->endereco,
                        "bairro"=>$arr_ret->bairro,
                        "cidade"=>$arr_ret->cidade,
                        "contato"=>$arr_ret->contato,
                        "telefone"=>$arr_ret->telefone,
                        "celular"=>$arr_ret->celular,
                        "email"=>$arr_ret->email,
                        "site"=>$arr_ret->site,
                        "obs"=>$arr_ret->obs,
                        "uf"=>$arr_ret->uf,
                       
                ];

        return json_encode($data);
    }

    public function excluir() {
        $id = filter_input(INPUT_POST,'id',FILTER_SANITIZE_NUMBER_INT);
        return $this->model->remove($id);
    }
    
    public function validaToken(){
        if ( $_POST["__token"] != $_SESSION['__token']):
            die("Tentativa XSS detectado.");
        endif;
    }
    
    public function novo(){

        $this->template->display("produto/novo.tpl");
    }
    
    /**
     * 
     * @return json
     */
    public function listar(){
        $arr_ret =  $this->model->show_all();
        $data = [];
        foreach ( $arr_ret as $fornecedor){
            $data [] = $fornecedor;
        }
        return json_encode($data);
    }

}
