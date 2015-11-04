<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Preco - Tabela de Preços
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Preco extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("tabela_preco");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "produto_id"=>"integer not null default 0",
            "valor_unitario"=>"float not null default 0.00",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   

}
