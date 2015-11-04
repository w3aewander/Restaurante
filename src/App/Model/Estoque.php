<?php

/**
 * Cria a classe Categoria para criação dinâmica da tabela.
 */

namespace App\Model;

/**
 * Model Estoque
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1apha-dev
 */
class Estoque extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();
        $this->setEntity("estoque");
        $this->setup();
    }

    /**
     * Cria a estrura da tabela automamente
     * 
     */
    public function setup() {

        $fields = [
            "produto_id" => "integer not null primary key default 0",
            "qtde_minima" => "integer not null default 0",
            "qtde_maxima" => "integer not null default 0",
            "qtde_atual" => "integer not null default 0",
            "created_at" => "datetime",
            "updated_at" => "timestamp"
        ];

        $this->create_table($this->getEntity(), $fields);
       
    }
    

   public function listar(){
       
       $sql = "  select estoque.produto_id produto_id, produto.descricao descricao,  ";
       $sql .= " estoque.qtde_minima qtde_minima, estoque.qtde_atual qtde_atual, ";
       $sql .= " estoque.qtde_maxima qtde_maxima, ";
       $sql .= " estoque.created_at created_at, estoque.updated_at updated_at ";
       $sql .= " from produto ";
       $sql .= " inner join estoque on produto.id = estoque.produto_id ";
       
       $stmt = $this->conn->prepare($sql);
       
       $stmt->execute();

       return $stmt->fetchAll();
   }        

   public function salvar($arr_data=[]) {
    
      
       try {
         
       $produto_id = $arr_data["produto_id"];  
       $qtde_minima = $arr_data["qtde_minima"]; 
       $qtde_maxima = $arr_data["qtde_maxima"];  
       $qtde_atual = $arr_data["qtde_atual"];
       $created_at = date("Y-m-d H:i:s");
       $updated_at = date("Y-m-d H:i:s");
       
      
       $count = $this->Count('produto_id', sprintf(" where `produto_id`=%s", $produto_id) );
  
     
       if ( $count ==  0 ):
           
           $sql  = "insert into estoque (`produto_id`,`qtde_minima`,`qtde_maxima`,`qtde_atual`,`created_at`,`updated_at`) ";
           $sql .= " values ( ?,?,?,?,?,?) ";
           
           $stmt = $this->conn->prepare($sql);
           
           $stmt->bindValue(1,$produto_id);
           $stmt->bindValue(2,$qtde_minima);
           $stmt->bindValue(3,$qtde_maxima);
           $stmt->bindValue(4,$qtde_atual);
           $stmt->bindValue(5,$created_at);
           $stmt->bindValue(6,$updated_at);
           
           $retval = $stmt->execute();
           
       else:
           $sql  = " update estoque set `qtde_minima`= ?,`qtde_maxima`= ?,`qtde_atual`= ?,`updated_at`= ? ";
           $sql .= " where `produto_id`= ? ";
           
           $stmt = $this->conn->prepare($sql);
           
           $stmt->bindValue(1, $qtde_minima);
           $stmt->bindValue(2, $qtde_maxima);
           $stmt->bindValue(3, $qtde_atual);
           $stmt->bindValue(4, $updated_at);
           $stmt->bindValue(5, $produto_id);
           
           $retval = $stmt->execute();
           
       endif;
       
       return $retval;
       
     } catch  ( \PDOException $e){
         return("Erro na linha: ".$e->getLine() .":=>". $e->getMessage());
     }
   }
    
}
