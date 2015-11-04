<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Fluxo de CAixa - Controle do Fluxo de Caixa
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Fluxocaixa extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("fluxo_caixa");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "tipo" => "enum('entrada','saida') not null default 'entrada'",
            "motivo" => "varchar(50) not null",
            "forma_pagto" => "varchar(50)",
            "valor" => "float",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

    public function listar() {
        try {
            
            
            $sql = sprintf( "select * from fluxo_caixa ");
            $stmt = $this->conn->prepare($sql);
           
            
            $stmt->execute();
            
            return $stmt->fetchAll(\PDO::FETCH_OBJ);
        } catch (\PDOException $ex) {
            die("Erro na linha " . $ex->getLine() . " :" . $ex->getMessage());
        }
    }

    public function listarPorPeriodo($arr_periodo = [],$start=0,$limit="") {
        try {
            $sql = "select * from fluxo_caixa where created_at between ? and ?  limit ?,? ";
            $stmt = $this->conn->prepare($sql);

            $stmt->bindValue(1, $arr_periodo["data_inicial"]);
            $stmt->bindValue(2, $arr_periodo["data_final"]);
            $stmt->bindValue(3, $start);
            $stmt->bindValue(4, $limit);

            $stmt->execute();

            return $stmt->fetchAll(\PDO::FETCH_OBJ);
        } catch (\PDOException $ex) {
            die("Erro na linha " . $ex->getLine() . " :" . $ex->getMessage());
        }
    }
    
}
