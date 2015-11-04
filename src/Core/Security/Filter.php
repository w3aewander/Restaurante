<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Core\Security;

/**
 * Esta classe contém métodos que faz a filtragem de strings
 * para proteção contra XSS (Cross Site Spoofing
 * 
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version -.1alpha-dev
 * 
 */
class Filter {

    /**
     * Proteção contra XSS - retira todos os caracteres especiais e os converte em entidades HTML
     * 
     * @param string $string A string que será filtrada
     * @return string
     */
    public function XSS($string) {

                
        $pattern = array('/&lt;/','/&gt;/','/<?php/','/script/','/;/');
        $out = preg_filter($pattern, " ", \htmlspecialchars(trim($string)));
        $out  .= htmlspecialchars($string);
        
        return $out;
    }
    
}
