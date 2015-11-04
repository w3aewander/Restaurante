<?php

/**
 *
 * HomeController 
 *
 *
 */

namespace App\Controller;

Class ErroController extends \Core\Controller\Controller {

    protected $view;
    private $erro;

    
    public function __construct($erro="Ops! Algo de errado ocorreu.") {
        parent::__construct();
        $this->view = new \Core\View\View('src/App/View/erro.php');
        $this->erro = $erro;
    }

    public function index() {
        $data["erro"] = $this->erro;
        $this->view->render($data);
    }

}
