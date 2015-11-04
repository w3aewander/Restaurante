<?php

/**
 *
 * HomeController 
 *
 *
 */

namespace App\Controller;

use App\View\View;
use Core\View\Template;

Class AboutController extends \Core\Controller\Controller {

    protected $view;

    public function __construct() {
        parent::__construct();
        $this->view = new Template('src/App/View/sobre.html');
    }

    public function index() {
        //$this->view->data = date('d/m/Y - H:i:s');
        //$this->view->autor = "Wanderlei Silva do Carmo <wander.silva@gmail.com>";
        $this->view->show();
    }

}
