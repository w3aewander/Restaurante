<?php
/**
* Controlador da aplicaçao
* @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
* @version 1.0
*
*/

namespace App\Controller;
use App\View\View;
use Core\View\Template;


Class LoginController extends \Core\Controller\Controller{


         protected $view;

         public function __construct(){
               $this->view = new Template("src/App/View/login.html");
         }  

         public function index(){

              $this->view->show();
         }
} 