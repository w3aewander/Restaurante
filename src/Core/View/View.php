<?php

/**
 * Arquivo responsavel pela camada View do Framework 
 * @author Wanderlei Silva do Carmo <Wander.silva@gmail.com>
 * @version 1.0
 */

namespace Core\View;

Class View {

   
  private $template;


   /**
    * 
    * @param type $filename
    * @param type $accurate
    */
   public function __construct($filename) {
       $this->template = $filename;
   }

   /**
     * Core View padrão do framework  
     * 
     * @param type $viewfile
     *  @param  mixed $data dados a envia para a view111
     */
    public function render($data="") {      
        require_once( $this->template);
    }

    /**
     * Acrescenta parametros para a view
     * 
     * @param type $data
     * @return type
     */

    public function with($data) {

        return $data;
    }

}
