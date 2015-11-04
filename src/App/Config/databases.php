<?php

/**
 * Arquivo de configuracao do Framework
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 1.0
 * 
 */
//Faz os requires necessarios para uso com o ORM
$_config = [
    'dsn' => 'mysql:host=localhost;dbname=restaurante',
    'user' => 'restaurante',
    'pass' => '12qwaszx',
    'options' => [\PDO::ATTR_PERSISTENT => true],
];

$dsn = $_config["dsn"];
$user = $_config["user"];
$pass = $_config["pass"];
$options = $_config["options"];


