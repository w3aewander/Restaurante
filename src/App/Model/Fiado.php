<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Fiado -Controle de Venda a receber
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Fiado extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("fiado");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "cliente_id"=>"integer not null",
            "descrição"=>"text",
            "valor"=>"float not null default '0.00'",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   

}
