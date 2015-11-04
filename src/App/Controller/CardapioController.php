<?php

/**
 *
 * HomeController 
 *
 *
 */

namespace App\Controller;

Class CardapioController extends \Core\Controller\Controller {

    protected $model;
    protected $template;


    /**
     * Construtor principal
     */
    public function __construct() {
        parent::__construct();
        $this->model = new \App\Model\Cardapio;
        //$this->view = new \Core\View\View('src/App/View/cardapio.php');
        $this->template = new \Core\View\TemplateWFW("src/App/View/cardapio.tpl");
    }

    /**
     * Action principal
     * $param none
     */
    public function index() {
        //$view->data = date('d/m/Y - H:i:s');
        //$view->autor = "Wanderlei Silva do Carmo <wander.silva@gmail.com>";
        $data['cardapio'] = $this->model->show_all();
        
        $this->template->parse($data);
    }

}
