<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

use \App\Model\Estoque as Estoque;
use \App\Model\Produto as Produto;

/**
 * Description of TesteController
 *
 * @author wanderlei
 */
class EstoqueController extends \Core\Controller\Controller {

    protected $estoque, $produto;

    public function __construct() {
        parent::__construct();

        $this->estoque = new Estoque();
        $this->produto = new Produto();

        $arr_produto = $this->produto->listar();
        $arr_estoque = $this->estoque->listar();

        $this->template->assign("max_rows_table", \App\Config\Config::$MAX_ROWS_TABLE);
        $this->template->assign("subtitulo", "Cadastro de Estoque");
        $this->template->assign("arr_estoque", $arr_estoque);
        $this->template->assign("arr_produto", $arr_produto);
    }

    public function index() {

        $this->template->display("estoque/index.tpl");
    }

    public function salvar() {

        $arr_data = [
            "produto_id" => filter_input(INPUT_POST, 'produto_id', FILTER_SANITIZE_NUMBER_INT),
            "qtde_minima" => filter_input(INPUT_POST, 'qtde_minima', FILTER_SANITIZE_NUMBER_INT),
            "qtde_maxima" => filter_input(INPUT_POST, 'qtde_maxima', FILTER_SANITIZE_NUMBER_INT),
            "qtde_atual" => filter_input(INPUT_POST, 'qtde_atual', FILTER_SANITIZE_NUMBER_INT)
        ];

        $retval = $this->estoque->salvar($arr_data);

        return $retval;
    }

    public function listar() {
        return json_encode($this->estoque->listar());
    }

    public function exibir($produto_id){
        
        $res = $this->estoque->find_one_field('produto_id',$produto_id);
                
        $arr_data = [
                   'produto_id'=>$res->produto_id,
                   'qtde_minima'=>$res->qtde_minima,
                   'qtde_maxima'=>$res->qtde_maxima,
                   'qtde_atual'=>$res->qtde_atual,
                   'created_at'=>$res->created_at,
                   'updated_at'=>$res->updated_at
        ];
        
        return json_encode($arr_data);
    }
}
