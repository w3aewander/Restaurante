<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of BalcaoController
 *
 * @author wanderlei
 */
class BalcaoController extends \Core\Controller\Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $produtos = new \App\Model\Produto;
        $arr_produtos = $produtos->listar();
        $this->template->assign("arr_produtos", $arr_produtos);
        $this->template->display("balcao/index.tpl");
    }

}
