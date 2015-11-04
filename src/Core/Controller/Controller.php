<?php

/**
 * Controlador padrao do Framework
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 1.0
 *
 */

namespace Core\Controller;

abstract class Controller extends \Smarty {

    protected $model = "";
    protected $view = "";
    protected $viewfile;
    protected $template;
    protected $__token;

    public function __construct() {
        parent::__construct();

        $token = new \Core\Security\Token();
        $this->__token = $token->Tokenize();

        $this->template = new \Smarty;
        $this->template->setLeftDelimiter("{<");
        $this->template->setRightDelimiter(">}");
        $this->template->setCacheDir("src/App/cache/");
        $this->template->setTemplateDir("src/App/View");
        $this->template->setCompileDir("/tmp");
        $this->template->assign("__token", $token->Tokenize());
    }

    public function getToken() {
        return $this->__token;
    }

    public function submit() {
        
    }

    /**
     * Arquivo vidw gerado dinamicamente pelo framework
     * 
     * @param string $viewfile Nome do arquivo gravado fisicamente no disco.
     * @return none 
     */
    public function setViewFile($viewfile) {
        $this->viewfile = $viewfile;
    }

    /**
     * Obtém o nome do arquivo que será gerado automaticamente
     * 
     * @return type
     */
    public function getViewFile() {
        return $this->viewfile;
    }

    /**
     * Valida a sessão do usuário para não permitir Cross-script
     * @return string Token  validado
     */
    public function validaToken() {
        if ($this->__token != $_SESSION['__token']):
            die("Tentativa XSS detectado.");
        endif;
    }

}
