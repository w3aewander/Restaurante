<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Banco - Cadastro de Bancoa
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Banco extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("banco");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "nome" => "varchar(50) not null",
            "numero" => "varchar(20)",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

    /**
     * 
     * @return type
     */
    public function listar() {
        try {
            $sql = "select * from banco ";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(\PDO::FETCH_OBJ);
        } catch (\PDOException $ex) {
            die("Erro na linha " . $ex->getLine() . " :" . $ex->getMessage());
        }
    }

}
