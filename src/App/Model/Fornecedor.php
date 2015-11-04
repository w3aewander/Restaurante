<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Fornecedor
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Fornecedor extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("fornecedor");
        $this->setup();
        
        
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "razao" => "varchar(50) not null",
            "fantasia" => "varchar(50)",
            "cpf_cnpj"=>"varchar(15) not null default 000000000000000",
            "cep"=>"varchar(9)",
            "endereco"=>"varchar(70)",
            "bairro"=>"varchar(50)",
            "cidade"=>"varchar(50)",
            "uf"=>"varchar(2)",
            "contato"=>"varchar(25)",
            "telefone"=>"varchar(50)",
            "celular"=>"varchar(50)",
            "email"=>"varchar(60)",
            "site"=>"varchar(60)",
            "obs"=>"text",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   

}