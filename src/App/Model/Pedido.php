<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

/**
 * Description of Pedido
 *
 * @author wanderlei
 */
class Pedido extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();

        $this->setEntity("pedido_entrega");
        $this->setup();
    }

    public function setup() {

        $fields = ["id" => "integer not null primary key auto_increment",
            "nome" => "varchar(50) not null",
            "endereco" => "varchar(255) not null",
            "pedido" => "text",
            "data_entrega" => "datetime",
            "created_at" => "datetime",
            "updated_at" => "datetime"];

        $this->create_table($this->getEntity(), $fields);

        
    }

}
