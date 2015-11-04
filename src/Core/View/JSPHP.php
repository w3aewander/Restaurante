<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Core\View;

/**
 * Description of JSPHP
 *
 * @author wanderlei
 */
class JSPHP {
    
    public function __construct() {
        echo $this->ShowDialog();
    }
    
    function ShowDialog($titulo="Titulo",$msg="Mensagem padrão",$pcoes=""){
        
        $script  = " <script>";
        
        $script .= " var janela=document.createElement('div'); ";
        $script .= " var divtitulo = document.createElement('div');";
        $script .= "     divtitulo.appendChild(document.createTextNode('$titulo')); ";
        $script .= " var divcorpo = document.createElement('div');";
        $script .= " divcorpo.appendChild(document.createTextNode('$msg')); ";
        $script .= " janela.appendChild(divtitulo); ";
        $script .= " janela.appendChild(divcorpo); ";
        $script .= " janela.setAttribute('style','display: block;margin: 0 auto;width: 500px;height:400px;border:1px solid green;');";
        $script .= " </script>";
        
        return $script ;
        
    }
    
    
}
