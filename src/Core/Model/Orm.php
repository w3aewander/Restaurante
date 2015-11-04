<?php

/**
 * Classe: operações básicas em banco de dados..
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 1.0
 *
 * */

namespace Core\Model;

use \App\Model\Connection as Connection;

abstract class Orm {

    protected $entity;
    protected $conn;

    public function __construct() {
        $conn = new Connection;
        $this->conn = $conn->getConnection();
    }

    /**
     * Retorna a conexao do model.
     * @return type
     */
    public function getConnection(){
        return $this->conn;
    }
    /**
     *
     * @param string $entity
     */
    public function setEntity($entity) {
        $this->entity = $entity;
    }

    /**
     *
     * @return string
     */
    public function getEntity() {
        return $this->entity;
    }

    /**
     * Cria uma tabela com os parametros informados.
     * @param $conn PDOConnection, $table_name string, $fields array
     * @return
     * */
    public function create_table($table_name, $fields = []) {

        try {

            $this->conn->beginTransaction();

            $sql = 'create table if not exists `' . $table_name . '`( ';
            $f = "";
            foreach ($fields as $name => $type):
                $f .= sprintf("`%s` %s,", $name, $type);
            endforeach;

            $sql .= rtrim($f, ',');
            $sql .= ');';
            $this->conn->exec($sql);

            $this->conn->commit();
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     * Exclui a tabela informada em $table_name
     * @param $conn PDOConnection, $table_name string
     * @return
     * */
    public function drop_table($table_name) {

        try {

            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $sql = ' drop table if exists `' . $table_name . '`';
            $this->conn->exec($sql);

            $this->conn->commit();
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     * Acrescenta um novo arquivo na tabela
     * @params $conn PDOConnection, $table_name string, $field_name string, $field_position
     * @return
     * */
    public function add_field($table_name, $field_name, $field_type, $field_position = null) {

        try {
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $sql = ' alter table `' . $table_name . '` add `' . $field_name . '` ' . $field_type . ' ' . $field_position;

            $this->conn->exec($sql);
            $this->conn->commit();
        } catch (Exception $ex) {

            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     * Exclui uma coluna da tabela
     * @param $conn PDOConnection, $table_name string, $field_name string
     * @return
     * */
    public function drop_column($table_name, $field_name) {
        try {
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $sql = sprintf('alter table `%s` drop  `%s`', $table_name, $field_name);

            $this->conn->exec($sql);
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     *
     * @param string $table_name
     * @param string $field_name
     * @param string $field_type
     */
    public function modify_column($table_name, $field_name, $field_type) {
        try {
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $sql = sprintf('alter table `%s` modify `%s` %s', $table_name, $field_name, $field_type);

            $this->conn->exec($sql);
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     *
     * @param string $table_name
     * @param string $field_name
     * @param string $new_field_name
     */
    public function rename_column($table_name, $field_name, $new_field_name, $data_type) {
        try {
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $sql = sprintf('alter table %s change column %s %s  %s ', $table_name, $field_name, $new_field_name, $data_type);

            $this->conn->exec($sql);
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     *
     * @param type $conn
     * @param type $table
     * @param type $arr_data
     */
    public function insert($arr_data = []) {
        try {
            $this->conn->beginTransaction();

            $arr_columns = [];
            $arr_values = [];

            foreach ($arr_data as $column => $value):
                $arr_columns[] .= $column;
                $arr_values[] .= "?,";
            endforeach;

            $columns = rtrim(implode($arr_columns, ','));
            $values = rtrim(implode($arr_values), ',');

            $sql = sprintf("insert into `%s` ( %s ) values ( %s )", $this->getEntity(), $columns, htmlspecialchars($values));

            $stmt = $this->conn->prepare($sql);

            $i = 1;
            //$params = "";
            foreach ($arr_data as $key => $value):
                //$params .= sprintf("[ %s , %s ]<br /> ",$key,$value);
                $stmt->bindValue($i, $value);
                $i++;
            endforeach;

            //print($params);

            $retval = $stmt->execute();

            $this->conn->commit();

            return $retval;
            
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     *
     * @param PDOConnection $conn
     * @param string $table
     * @param string $where
     */
    public function delete_where($where = null) {

        try {
            $this->conn->beginTransaction();
            $sql = sprintf("delete from %s %s", $this->getEntity(), $where);
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            $this->conn->commit();
            return $stmt->rowCount();
            
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     *
     * @param PDOConnection $conn
     * @param string $table_name
     * @param integer $id
     */
    public function remove($id) {
        try {

            $this->conn->beginTransaction();

            $sql = sprintf("delete from `%s` where id = ?", $this->getEntity());
            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(1, $id);

            $retval = $stmt->execute();

            $this->conn->commit();

            return $retval;
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }

    /**
     * Retorna uma tupla na tabela
     *
     * @param integer $id id da tabela
     * @return string
     */
    public function find_one($id) {
        try {

            $sql = sprintf("select * from `%s` where id = ? ", $this->getEntity());

            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(1, $id);

            $stmt->execute();

            return $stmt->fetch(\PDO::FETCH_OBJ);
            
        } catch (Exception $ex) {

            die(printf("Erro: %s", $ex->getMessage()));
        }
    }

    /**
     * Retorna uma tupla na tabela
     *
     * @param integer $id id da tabela
     * @return string
     */
    public function find_one_field($field, $value) {
        try {

            $where = sprintf(" where `%s` =  ? ", $field);

            $sql = sprintf("select * from `%s` %s ", $this->getEntity(), $where);

            $stmt = $this->conn->prepare($sql);
            $stmt->bindValue(1, $value);

            $stmt->execute();

            if ($stmt->rowCount()):
                return $stmt->fetch(\PDO::FETCH_OBJ);
            else :
                return null;
            endif;
        } catch (Exception $ex) {

            die(sprintf("Erro: %s", $ex->getMessage()));
        }
    }

    /**
     * Retorna todos os registros
     *
     * @param type $where Condição para pesquisa
     * @return type
     */
    public function show_all($where = "") {

        $sql = sprintf("select * from `%s` %s  ", $this->getEntity(), $where );
        $all = $this->conn->query($sql, \PDO::FETCH_OBJ);

        return $all;
    }

    /**
     /**
     * 
     * @return string
     */
    public function find_many() {
    return "Not implemented yet";
    }

    public function Count($field = "*", $where = "") {
        $sql = " select count($field) as count from " .$this->getEntity() . " " . $where ;
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $res = $stmt->fetch(\PDO::FETCH_OBJ);
        return $res->count;
    }

    public function save($id, $arr_data = []) {

        try {
            $this->conn->beginTransaction();

            $_sql = sprintf(" update `%s`  set ", $this->getEntity());

            foreach ($arr_data as $key => $value):
                $_sql .= sprintf("`%s` = '%s',", $key, $value);
            endforeach;
            $sql = \rtrim($_sql, ',');

            $sql .= sprintf(" where `id` =  %s",  $id);

            $retval = $this->conn->exec($sql);

            $this->conn->commit();

            return $retval;
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }

        return $sql;

        // $sql = sprintf("select count(%s) as count from `%s` %s", $field, $this->getEntity(), $where);
        // $all = $this->conn->query($sql, \PDO::FETCH_OBJ);
        //  $res = $all->fetch();
        // return $res->count;
    }

    /**
     *
     * @param type $sql
     * @return type
     */
    public function create_view($sql) {

        try {
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->conn->beginTransaction();

            $stmt = $this->conn->exec($sql);

            $this->conn->commit();
        } catch (Exception $ex) {
            $this->conn->rollback();
            printf("Erro: %s", $ex->getMessage());
        }
    }
    
    public function exist($id){
        return $this->Count("*", sprintf(" where id='%s'",$id ) ) > 0;
    }

}
