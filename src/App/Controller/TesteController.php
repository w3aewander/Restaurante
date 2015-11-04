<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;


/**
 * Description of TesteController
 *
 * @author wanderlei
 */
class TesteController extends \Core\Controller\Controller{

    protected $template;

    public function __construct() {
        parent::__construct();


    }
    
    public function index(){

        $this->comanda->setNumero(5);
        $data = [];
        $this->template->parse($data);


        }


    }
