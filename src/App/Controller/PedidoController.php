<?php

/**
 * Controlador principal do Framework
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha-dev;
 *
 */

namespace App\Controller;

use Core\Presenter\Presenter as Presenter;
use \Core\Security\Filter as Filter;
use \Core\View\Form as Form;
use \Core\View\Html as Html;
use \Core\View\View as View;

class PedidoController extends \Core\Controller\Controller {

    protected $template;
    protected $model;
    protected $table;
    protected $filter;

    /**
     * Construtor padrao
     *
     */
    public function __construct() {
        parent::__construct();

        $this->filter = new Filter();

        $this->model = new \App\Model\Pedido();

        $viewfile = "src/App/View/pedido.tpl";

        $this->template = new \Core\View\TemplateWFW($viewfile);
    }

    /**
     * Action index
     * @param none
     */
    public function index() {
        //$all = $this->model->show_all();
        $m = new \App\Model\Cardapio();
        $data['cardapio'] = $m->show_all();

        $this->template->parse($data);
    }

    /**
     *
     */
    public function submit() {

        $input = $_POST;

        $this->template = new \Core\View\TemplateWFW("src/App/View/confirmarpedido.tpl");

        $pedido_entrega = new \App\Model\Pedido;
        $pedido_entrega->setEntity('pedido_entrega');

        if (is_array($input["preferencia"])):
            $preferencia = trim(implode(", ", $input["preferencia"]), ',');
        endif;

        $itens_pedido = $input["qtde"] . " " .
                "marmitex " . " " . $input["tipo_marmitex"] . " " .
                $preferencia . " " .
                $input["obs"];

        $arr_data = [
            "nome" => $this->filter->XSS($input["nome"]),
            "endereco" => $this->filter->XSS($input["endereco"]),
            "pedido" => $this->filter->XSS(strToUpper($itens_pedido)),
            "created_at" => date('Y-m-d H:i:s'),
            "updated_at" => date('Y-m-d H:i:s')];

        //die(print_r($arr_data));

        if ($pedido_entrega->insert($arr_data) == 1):
            $msg = "Pedido enviado com sucesso";
        else :
            $msg = "Houve um erro no processamento de seu pedido. Pedido não enviado!";
        endif;

        $data["flash_msg"] = $this->filter->XSS($msg);
        $data["data_pedido"] = \Core\Presenter\Presenter::dateTimeFromDB(date('Y-m-d H:i:s'));

        $this->template->parse($data);
    }

    public function atender() {
        $html = new Html();
        require "src/App/View/header.html";

        $valid = filter_input(INPUT_POST, '__token', FILTER_SANITIZE_STRING) === $_SESSION['__token'];
        $input = $_POST;

        //die ( print_r($input) );
        if (!$valid):
            die("XSRF Detectado...");
        endif;

        if ($input['confirmar'] == "true"):

            if ($this->model->save($input["id"], ["data_entrega" => $input["data_entrega"]])):
                $out = $html->CreateElement("div", "<h2 class='text-info''>Sucesso!</h2><p class='text-success'>Entrega finalizada.</p>", ["class" => "well well-lg"]);
                $out .= $html->CreateElement("div", " Ok", ["class" => "btn btn-success glyphicon glyphicon-ok", "onclick" => "fecharJanela();"]);
                echo $html->CreateElement("div", $out, ["class" => "container"]);

                $this->model->remove($input['id']);
                
                return;
            endif;

        endif;

        $form = $html->CreateElement("h1", "Finalizar Pedido (confirmar entrega)", ["class" => "text text-info"]);

        $form .= $html->CreateElement("div", "", ["class" => "well well-lg"]);

        $form .= Form::Open("form-pedido", "/pedido/atender", "POST", ["class" => "form-horizontal"]);
        $form .= Form::InputHidden("id", $input["id"]);
        $form .= Form::InputHidden("confirmar", "true");

        $form .= Form::Label("Data da Entrega/Atendimento: ", "data_entrega");
        $form .= Form::InputHidden("data_entrega", date('Y-m-d H:i:s'));
        $form .= Form::InputText("data_entrega_humana", date('d/m/Y H:i:s'), ["class" => "form-control", "readonly" => "readonly"]);
        $form .= Form::Submit("btnOk", "Finalizar", ["class" => "btn btn-danger glyphicon glyphicon-remove"]);
        $form .= Form::Close();

        return $form;
    }

    public function show($pedido_numero = 0) {
        if ($pedido_numero > 0):
            $pedido = $this->model->find_one($pedido_numero);
            $template = new \Core\View\TemplateWFW('src/App/View/pedido_entrega.tpl');
            $data["pedido"] = $pedido;
            $template->parse($data);
        else :
            if ($pedido_numero == "all"):
                foreach ($this->model->show_all() as $pedido):
                    $pedidos[] = $pedido;
                endforeach;
                return json_encode($pedidos);
            endif;
        endif;
    }

    /**
     *
     * @return type
     */
    public function buscarCep() {

        $cep = filter_input(INPUT_POST, 'cep', FILTER_SANITIZE_NUMBER_INT);

        $reg = simplexml_load_file("http://cep.republicavirtual.com.br/web_cep.php?formato=xml&cep=" . $cep);

        $dados['sucesso'] = (string) $reg->resultado;
        $dados['rua'] = (string) $reg->tipo_logradouro . ' ' . $reg->logradouro;
        $dados['bairro'] = (string) $reg->bairro;
        $dados['cidade'] = (string) $reg->cidade;
        $dados['estado'] = (string) $reg->uf;

        return json_encode($dados);
    }

    public function atualizaFilaPedidos() {
        print("<script>showFilaPedidos();</script>");
    }

}
