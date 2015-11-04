<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;


/**
 * Description of Consumo
 *
 * @author wanderlei
 */
class Consumo extends \Core\Model\AppModel {

    private $comanda_id;
    private $mesa_id;
    private $item_id;
    private $qtde_item;

    /**
     * 
     * @param type $comanda
     * @param type $item_id
     * @param type $qtde_item
     */
    public function __construct() {

        parent::__construct();

        $entity = "consumo";
        $this->setEntity($entity);
        $this->setup();
    }

    /**
     * Cria a entidade mapeando para tabela no banco de dados;
     * 
     * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
     * @version 0.1alpha-dev
     */
    public function setup() {

        $fields = [
            "id" => "integer not null primary key auto_increment",
            "comanda_id" => "integer not null",
            "mesa_id" => "integer not null",
            "item_id" => "integer not null",
            "qtde" => "float not null",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
        
        $sql = " alter table consumo add  constraint fk_comanda_consumo foreign key (comanda_id ) references comanda(id) on update cascade on delete cascade; ";
        $sql .= " alter table consumo add  constraint fk_comanda_produto_id foreign key (item_id ) references produto(id) on update cascade on delete cascade; ";
    }

    /**
     * Registra o consumo conforme descrito na comanda
     * 
     */
    public function registrarConsumo($comanda_id, $mesa_id, $item_id, $qtde) {

        $arr_data = [
            "comanda_id" => $comanda_id,
            "mesa_id" => $mesa_id,
            "item_id" => $item_id,
            "qtde" => $qtde,
            "created_at" => date('Y-m-d H:i:s'),
            "updated_at" => date('Y-m-d H:i:s'),         
        ];

        return $this->insert($arr_data) == 1;
    }

    /**
     * 
     * @param type $comanda_id
     * @return string
     */
    function listar($comanda_id) {

        try {
            $sql = "select c.id id,date_format(c.created_at,'%d/%m/%Y %H:%i:%s') as created_at, p.descricao produto,u.sigla unidade, c.qtde qtde , p.valor_unitario, c.qtde * p.valor_unitario as valor ";
            $sql .= " from consumo c inner join produto p ";
            $sql .= " inner join unidade u ";
            $sql .= " on c.item_id=p.id and p.unidade_id=u.id and c.comanda_id = ? ";

            $stmt = $this->conn->prepare($sql);

            $stmt->bindValue(1, $comanda_id);
            $stmt->execute();

            $arr_consumo = $stmt->fetchAll(\PDO::FETCH_OBJ);

            return $arr_consumo;
        } catch (\PDOException $ex) {
            die("Erro linha " . $ex->getLine() . ":" . $ex->getMessage());
        }
    }

    function getValorTotalConsumo($comanda_id) {
        try {
            $sql = " select SUM(consumo.qtde * produto.valor_unitario )  as total from consumo ";
            $sql .= " inner join produto ";
            $sql .= " on consumo.item_id = produto.id ";
            $sql .= " and consumo.comanda_id = ? ";

            $stmt = $this->conn->prepare($sql);

            $stmt->bindValue(1, $comanda_id);

            $stmt->execute();
            $stmt->setFetchMode(\PDO::FETCH_OBJ);
            $all = $stmt->fetch();

            return $all->total;
        } catch (\PDOException $e) {
            print $e->getMessage();
        }
    }

}
