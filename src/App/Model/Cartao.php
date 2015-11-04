<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;


/**
 * Model Cartão - Cartoes emitidos
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Cartao extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("cartao");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "numero"=>"varchar(50) not null",
            "bandeira"=>"varchar(50) not null",
            "emitente"=>"varchar(50) not null",
            "tipo"=>"enum('débito','crédito','tiket restaurante','vale refeição','outros') not null default 'débito' ",
            "motivo"=>"varchar(100)",
            "valor"=>"float not null default 0.00",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   public function listar(){
       
       $sql="select * from cartao";
       $stmt = $this->conn->prepare($sql);
       $stmt->execute();
       return $stmt->fetchAll(\PDO::FETCH_OBJ);
   }
   
   
}
