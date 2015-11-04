<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Produto
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Produto extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("produto");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment",
            "descricao" => "varchar(35) not null",
            "fornecedor_id"=>"integer not null",
            "unidade_id"=>"integer not null",
            "categoria_id"=>"integer not null default 0",
            "valor_unitario"=>"float",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

   public function listar(){
       
       $sql = "select produto.id, produto.descricao, unidade.nome as unidade, produto.valor_unitario ";
       $sql .= " from produto, unidade ";
       $sql .= " where produto.unidade_id = unidade.id";
       
       $stmt = $this->conn->prepare($sql);
       
       $stmt->execute();

       return $stmt->fetchAll(\PDO::FETCH_OBJ);
   }

}