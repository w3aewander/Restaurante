<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of CategoriaController
 *
 * @author wanderlei
 */

namespace App\Controller;

use \App\Model\Categoria as Categoria;
use Core\Security\Filter as Filter;

Class CategoriaController extends \Core\Controller\Controller {

    protected $template;
    protected $model;

    public function __construct() {
        parent::__construct();
        $this->model = new Categoria();
        $viewfile = 'src/App/View/categoria.tpl';
        $this->template = new \Core\View\TemplateWFW($viewfile);
    }

    /**
     * 
     * @return type
     */
    public function index() {

        $data = $this->model->show_all();
        $this->template->parse($data);
    }

    /**
     * Este método atualiza um o registro caso exista ou inserir se nenhum id for informado. 
     * 
     * @return type
     */
    public function salvar() {
        $input = $_POST;

        $retval = "";

        if (!$input['id']):
            $arr_data = [
                "nome" => Filter::XSS($input["nome"]),
                "descricao" => Filter::XSS($input["descricao"]),
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s')
            ];
            $retval = $this->model->insert($arr_data);
        else:
            $to_find = $this->model->find_one($input['id']);

            $arr_data = [
                "nome" => Filter::XSS($input["nome"]),
                "descricao" => Filter::XSS($input["descricao"]),
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

    public function exibir() {

        foreach ($this->model->show_all() as $categoria):
            $data[] = [
                "id" => $categoria->id,
                "nome" => $categoria->nome,
                "descricao" => $categoria->descricao
            ];
        endforeach;


        return json_encode($data);
    }

    public function excluir() {
        $id = $_POST['id'];
        return $this->model->remove($id);
    }

}
