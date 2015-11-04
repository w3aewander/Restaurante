<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller;

/**
 * Description of ConsumoController
 *
 * @author wanderlei
 */
class ConsumoController extends \Core\Controller\Controller {

    protected $model;

    /**
     * 
     */
    public function __construct() {
        parent::__construct();
        $this->model = new \App\Model\Consumo;
    }

    /**
     * 
     * @param type $comanda_id
     */
    public function listar($comanda_id) {
        return json_encode($this->model->listar($comanda_id));
    }

    /**
     * 
     * @param int $comanda_id Número da comanda
     * @param int $mesa_id Número da mesa
     * @param int $produto_id Código do produto
     * @param float $qtde Quantidade do produto
     */
    public function registrar() {

        $comanda_id = filter_input(INPUT_POST, 'comanda_id', FILTER_SANITIZE_NUMBER_INT);
        $mesa_id = filter_input(INPUT_POST, 'mesa_id', FILTER_SANITIZE_NUMBER_INT);
        $produto_id = filter_input(INPUT_POST, 'produto_id', FILTER_SANITIZE_NUMBER_INT);

        $qtde = filter_input(INPUT_POST, 'qtde', FILTER_SANITIZE_STRING);
        $created_at = date('Y-m-d H:i:s');
        $updated_at = date('Y-m-d H:i:s');


        $arr_consumo = [
            "comanda_id" => $comanda_id,
            "mesa_id" => $mesa_id,
            "item_id" => $produto_id,
            "qtde" => $qtde,
            "created_at" => $created_at,
            "updated_at" => $updated_at
        ];

        $this->model->insert($arr_consumo);
    }

    /**
     * 
     * @param type $comanda_id
     * @return type
     */
    public function totalizar($comanda_id) {
        $valor_total = [ "valor_total" => $this->model->getValorTotalConsumo($comanda_id) ];
        return json_encode($valor_total);
    }
    
    /*
     * Exclui um item de consumo da comanda.
     * @return type
     */
    public function excluir(){
        $id = filter_input(INPUT_POST,'id',FILTER_SANITIZE_NUMBER_INT);
        return $this->model->remove($id);
    }

}
