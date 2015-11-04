<?php

/**
 *
 *
 *
 *
 */

namespace App\Model;

use \App\Model\Consumo as Consumo;

class Comanda extends \Core\Model\AppModel {

    private $numero;
    private $mesa;
    private $status;
    protected $consumo;

    public function __construct() {
        parent::__construct();

        $this->setEntity("comanda");
        $this->consumo = new Consumo;
        $this->setup();
    }

    public function setup() {

        $fields = [
            "id" => "integer not null primary key auto_increment",
            "mesa" => "varchar(50) not null",
            "status" => "enum('aberta','fechada') default  'aberta'",
            "created_at" => "datetime",
            "updated_at" => "datetime"
        ];

        $this->create_table($this->getEntity(), $fields);
    }

    public function setNumero($numero) {
        $this->numero = $numero;
    }

    /**
     * 
     * @return type
     */
    public function getNumero() {
        return $this->find_one($this->numero)->numero;
    }

    /**
     * 
     * @param type $mesa
     */
    public function setMesa($mesa) {
        $this->mesa = $mesa;
    }

    /**
     * 
     * @return type
     */
    public function getMesa() {
        return $this->find_one($this->numero)->mesa;
    }

    /**
     * 
     */
    public function excluir($where = "") {
        return $this->delete_where($where);
    }

    /**
     * 
     * @param type $status
     */
    public function setStatus($status = "Livre") {
        $this->status = $status;
    }

    public function getStatus() {

        return $this->find_one($this->numero)->status;
    }

    /**
     * 
     * @return type
     */
    public function getCreatedAt() {
        return $this->createdAt;
    }

    /**
     * 
     * @param type $datetime
     */
    public function setUpdateAt($datetime) {
        $this->updated_at = $datetime;
    }

    /**
     * Retorna a data da última modificação da comanda.
     * 
     * @return type
     */
    public function getUpdatedAt() {
        return $this->updatedAt();
    }

    public function totalConsumo($comanda_id) {
        return $this->consumo->getValorTotalConsumo($comanda_id);
    }

    public function getItensConsumo() {
        //return $this->consumo->getItensConsumo($this->numero,$this->mesa);
    }

    public function listar($status = 'aberta') {
        try {
            $sql = "  select id,mesa,status,created_at,updated_at" ;
            $sql .= " from comanda where status = ? " ;

            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(1, $status);

            $stmt->execute();

            return $stmt->fetchAll(\PDO::FETCH_OBJ);
        } catch (\PDOException $ex) {
            die("Erro na linha: " . $ex->getLine() . ":" . $ex->getMessage());
        }
    }


}
