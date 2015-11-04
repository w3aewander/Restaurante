<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Unidade
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Unidade extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("unidade");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "nome" => "varchar(50) not null",
            "sigla" => "varchar(10)",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

    public function listar() {
        try {
            $sql = "select id,nome,sigla, date_format(created_at,'%d/%m/%Y %T') created_at, date_format(updated_at,'%d/%m/%Y %T') as updated_at from unidade ";
            $stmt = $this->conn->prepare($sql);
            
            $stmt->execute();
            
            return $stmt->fetchAll(\PDO::FETCH_OBJ);
            
        } catch (\PDOException $ex) {
            die("Erro na linha " . $ex->getLine() . ":" . $ex->getMessage());
        }
    }

}
