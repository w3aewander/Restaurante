<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

use App\Model\Contato as Contato;
use Core\Security\Filter as Filter;
use Core\View\TemplateWFW as View;

/**
 * Classe para informaçãoes de contato com os administradores do site
 *
 * @author wanderlei
 * @version 0.1alpha-dev
 */

class ContatoController extends \Core\Controller\Controller {

	protected $view;
	protected $model;
	protected $filter;

	public function __construct() {

		parent::__construct();

		$this->filter = new Filter();
		$this->model  = new Contato();

		$viewfile = "src/App/View/contato.tpl";

		$this->view = new View($viewfile);
		
	}

	public function index() {
		$data = [];
		$this->view->parse($data);
	}

	public function submit() {

		$input = \filter_input_array(INPUT_POST, $_POST);

		//var_dump($input);

		if ($input["__token"] !== $_SESSION["__token"]):
		return $this->view->with('CSRF detectado..');
		endif;

		$arr_data = [
			"nome"       => $this->filter->XSS($input["nome"]),
			"email"      => $this->filter->XSS($input["email"]),
			"assunto"    => $this->filter->XSS($input["assunto"]),
			"mensagem"   => $this->filter->XSS($input["mensagem"]),
			"created_at" => date('Y-m-d H:i:s'),
			"updated_at" => date('Y-m-d H:i:s')
		];

		if ($this->model->insert($arr_data) == 1):

		$viewretorno = "src/App/View/retorno_submit.php";
		$this->view  = new View($viewretorno);
		$this->view->render($viewretorno);

		 else :
		header("location: /erro");
		endif;

	}

}
