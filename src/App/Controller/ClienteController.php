<?php

/**
 * Cliente controller
 */

namespace App\Controller;

use Core\Security\Filter as Filter;
use App\Model\Cliente as Cliente;

/**
 * Classe para informaçãoes de contato com os administradores do site
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha-dev
 */
class ClienteController extends \Core\Controller\Controller {

    protected $model;
    protected $filter;
    protected $template;

    /**
     * 
     */
    public function __construct() {
        parent::__construct();

        $this->model = new Cliente();
        $this->template->assign("__token", $this->__token);
        $this->template->assign("flashmsg", "");
        $this->template->assign("subtitulo", "Cadastro de clientes");
    }

    /**
     * 
     */
    public function index() {

        $this->template->display("cliente/index.tpl");
    }

    /**
     * 
     */
    public function salvar() {

        $this->validaToken();

        $id = filter_input(INPUT_POST, 'cliente_id', FILTER_SANITIZE_NUMBER_INT);

        $arr_data = [
            "tipo_pessoa" => filter_input(INPUT_POST, "tipo_pessoa", FILTER_SANITIZE_STRING),
            "nome" => filter_input(INPUT_POST, "nome", FILTER_SANITIZE_STRING),
            "cpf_cnpj" => filter_input(INPUT_POST, "cpf_cnpj", FILTER_SANITIZE_STRING),
            "cep" => filter_input(INPUT_POST, "cep", FILTER_SANITIZE_STRING),
            "endereco" => filter_input(INPUT_POST, "endereco", FILTER_SANITIZE_STRING),
            "bairro" => filter_input(INPUT_POST, "bairro", FILTER_SANITIZE_STRING),
            "cidade" => filter_input(INPUT_POST, "cidade", FILTER_SANITIZE_STRING),
            "uf" => filter_input(INPUT_POST, "uf", FILTER_SANITIZE_STRING),
            "contato" => filter_input(INPUT_POST, "contato", FILTER_SANITIZE_STRING),
            "telefone" => filter_input(INPUT_POST, "telefone", FILTER_SANITIZE_STRING),
            "celular" => filter_input(INPUT_POST, "celular", FILTER_SANITIZE_STRING),
            "email" => filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL),
            "site" => filter_input(INPUT_POST, "site", FILTER_SANITIZE_STRING),
            "obs" => filter_input(INPUT_POST, "obs", FILTER_SANITIZE_STRING),
            "created_at" => date('Y-m-d H:i:s'),
            "updated_at" => date('Y-m-d H:i:s')
        ];


        if ($id == 0):
            $this->model->insert($arr_data);
        else:

            $to_find = $this->model->find_one($id);
            $this->model->save($to_find->id, $arr_data);
        endif;
    }

    public function listar() {

        return json_encode($clientes = $this->model->listar());
    }

    /**
     * 
     * @param type $id
     * @return type
     */
    public function exibir($id) {
        return json_encode($this->model->find_one($id));
    }

    /**
     * 
     * @param type $id
     * @return type
     */
    public function excluir($id) {
        return $this->model->remove($id);
    }

    public function imprimir() {
        
        $this->template->assign("arr_clientes", $this->model->listar());
        $this->template->assign("total_registros", $this->model->Count());
        
        $this->template->assign("titulo","Listagem de Clientes");
        
        $pdf = new \mPDF("utf-8");
        
        $tpl = $this->template->fetch("cliente/listagem.tpl");
        
        $pdf->WriteHTML($tpl);
        
        $pdf->Output();

    }

}
