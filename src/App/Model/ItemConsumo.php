<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ItemConsumo
 *
 * @author wanderlei
 */

namespace App\Model;

class ItemConsumo extends \Core\Model\AppModel {

    protected $comanda_id;
    protected $mesa_id;
    protected $qtde;
    protected $created_at;
    protected $updated_at;

    /**
     * 
     * @param int $comanda_id Número da comanda
     * @param int $mesa_id Número da mesa
     * @param float $qtde Quantidade
     */
    public function __construct($comanda_id = "", $mesa_id = "", $qtde = "") {
        parent::__construct();
        $this->comanda_id = $comanda_id;
        $this->mesa_id = $mesa_id;
        $this->qtde = $qtde;
        $this->created_at = date('Y-m-d H:i:s');
        $this->updated_at = date('Y-m-d H:i:s');
        
        $this->setEntity('consumo');
    }

    /**
     * Criação dinâmica da tabela
     */
    public function setup() {

        $fields = ["comanda_id" => "integer not null ",
            "mesa_id" => "varchar(50) not null",
            "produto_id" => "integer not null",
            "qtde" => "float",
            "created_at"=>"datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

    /**
     * 
     * @param int $comanda_id Número da comanda
     */
    public function setComandaId($comanda_id) {
        $this->comanda_id = $comanda_id;
    }

    /**
     * 
     * @return int 
     */
    public function getComandaId() {
        return $this->comanda_id;
    }

    /**
     * 
     * @param int $mesa_id Número da mesa
     */
    public function setMesaId($mesa_id) {
        $this->mesa_id = $mesa_id;
    }

    /**
     * 
     * @param float $qtde Quantidade do produto
     */
    public function setQtde($qtde) {
        $this->qtde = $qtde;
    }

    /**
     * 
     * @return float
     */
    public function getQtde() {
        return $this->qtde;
    }

    /**
     * 
     * @return Date Data da criação do ítem
     */
    public function getCreatedAt() {
        return $this->created_at;
    }

    /**
     * 
     * @param Date $updated_at Data da última atualização do ítem da comanda.
     */
    public function setUpdatedAt($updated_at) {
        $this->updated_at = $updated_at;
    }

    /**
     * 
     * @return Date
     */
    public function getUpdatedAt() {
        return $this->updated_at;
    }

}
