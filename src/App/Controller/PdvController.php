<?php

namespace App\Controller;


/**
 * Class para controle do ponto de venda do restaurante
 *
 * 
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha;
 * 
 */
class PdvController extends \Core\Controller\Controller {


    public function __construct() {
        parent::__construct();
      
    }

    /**
     * Ação principal, se nenhuma ação for informada esta será executada
     * 
     * @param none Nenhum parâmetro requerido
     * @return none Será enviada uma página php para ser renderizada.
     */
    public function index() {
  
        $comanda = new \App\Controller\ComandaController;
        $arr_comandas = $comanda->listar("aberta"); 
        $this->template->assign("arr_comandas",$arr_comandas);
        
       $this->template->display("pdv/index.tpl");
       
    }

}
