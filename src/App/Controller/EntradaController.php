<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of EntradaController
 *
 * @author wanderlei
 */
class EntradaController extends \Core\Controller\Controller {

    protected $template;

    public function __construct() {
        parent::__construct();
      $this->template->assign("fluxo/entrada.tpl");
       
    }

    public function index() {
         $this->template->display("fluxo/entrada.tpl");
    }

}
