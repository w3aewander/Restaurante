<?php

/**
 *
 * HomeController
 *
 *
 */

namespace App\Controller;

use \App\Model\User as User;
use \App\Mode\Pedido as Pedido;

Class HomeController extends \Core\Controller\Controller {

    protected $pedido;

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $comanda = new \App\Controller\ComandaController;
        $arr_comandas = $comanda->listar("aberta");
        $this->template->assign("arr_comandas", $arr_comandas);
        $this->template->display("pdv/index.tpl");
    }

}
