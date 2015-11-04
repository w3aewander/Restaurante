<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Cliente
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Cliente extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("cliente");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "tipo_pessoa" => "varchar(50) not null",
            "nome" => "varchar(50)",
            "cpf_cnpj"=>"varchar(15) not null default 000000000000000",
            "cep"=>"varchar(9)",
            "endereco"=>"varchar(70)",
            "bairro"=>"varchar(50)",
            "cidade"=>"varchar(50)",
            "uf"=>"varchar(2)",
            "contato"=>"varchar(25)",
            "telefone"=>"varchar(25)",
            "celular"=>"varchar(25)",
            "email"=>"varchar(50)",
            "site"=>"varchar(50)",
            "obs"=>"text ",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   public function listar(){
       
       try {
           
       $sql = "select * from " . $this->getEntity();
       $stmt = $this->conn->prepare($sql);
       
       $stmt->execute();
       
       return $stmt->fetchAll(\PDO::FETCH_OBJ);
       } catch ( \PDOException $ex){
           die("Erro na linha " . $ex->getLine() . " :" . $ex->getMessage());
       }
   }

}