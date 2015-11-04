<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Core\Security;

/**
 * Prover segurança básica para o envio dos dados do formulário html via POST
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha-dev;
 * 
 */
class Token  {

    private $token;
    private $salt;

    /**
     * Construtor principal do site;
     * 
     */
   public function __construct() {
        
        $this->salt = \sha1("S0m3nT3D3u53053n1-10R");
        $this->token = \session_id() . $this->salt;
        
    }
    /**
     * Gera uma chave criptografada com base na sessão atualmente aberta
     * 
     * @param none Nenhum parâmetro adicional requerido
     * @return string token 
     * 
     */
    public function Tokenize(){
        return $this->token;
    }

}
