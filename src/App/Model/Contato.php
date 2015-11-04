<?php

/**
 *
 *
 *
 *
 */

namespace App\Model;

class Contato extends \Core\Model\AppModel {

     
    public function __construct() {
        parent::__construct();
        
        $entity = "contato";
        $this->setEntity($entity);
        $this->setup();
    }

    public function setup() {

        $fields = ["id" => "integer not null primary key auto_increment",
            "nome" => "varchar(50) not null",
            "email" => "varchar(60) not null",
            "assunto" => "varchar(50) not null",
            "mensagem" => "text",
            "created_at"=>  "datetime",
            "updated_at"=> "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

}
