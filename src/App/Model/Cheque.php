<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Cheque - Cheques emitidos e recebidos
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Cheque extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("cheque");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "emitente"=>"varchar(50) not null",
            "numero"=>"varchar(50) not null",
            "banco"=>"varchar(50) not null",
            "vencimento"=>"date",
            "emitido_recebido"=>"enum('emitido','recebido') default 'recebido' ",
            "valor"=>"float not null default 0.00",
            "motivo"=>"varchar(100)",
            "obs"=>"text",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   

}
