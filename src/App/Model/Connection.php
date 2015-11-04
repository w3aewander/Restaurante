<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

/**
 * Description of Conexao
 *
 * @author wanderlei
 */
class Connection {

	private $bd     = "mysql:host=localhost;dbname=restaurante";
	private $dbuser = "restaurante";
	private $dbpass = "12qwaszx";
	private $conn   = NULL;

	public function __construct() {

		if (!$this->conn = $this->getConnection()):
		die("Não foi possível conectar o banco de dados.");
		endif;
	}

	public function getConnection() {
		try {

			$options = [\PDO::ATTR_PERSISTENT => true, \PDO::ATTR_AUTOCOMMIT => true, /**\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION**/];

			$this->conn = new \PDO($this->bd, $this->dbuser, $this->dbpass, $options);

			return $this->conn;

		} catch (\PDOException $e) {
			die($e->getMessage());
		}
	}

	public function __destruct() {
		if ($this->conn):
		$this->conn = NULL;
		endif;
	}

}
