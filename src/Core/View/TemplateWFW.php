<?php
/**
 *
 * Classe de template
 *
 */

 namespace Core\View;

 class TemplateWFW {
 
    private $template;


    public function __construct($template=""){
        $this->template = $template;
    }

    public function __set($key,$value){
    	$this->$key = $value;
    }

    public function __get($var){
    	return $this->$var;
    }

    public function setTemplate($template){
    	$this->template = $template;
    }

    public function getTemplate(){
        return $this->template;
    }

    public function parse($data){

        $pattern = ['/\{\s*/','/\}/','/%--\s*/', '/--%/'];
        $replace = ['<?=', ' ;?>','<?php ', ' ;?>'];

        $template = file_get_contents($this->template);
        $out = preg_filter($pattern,$replace,$template );
     
        foreach ( $data as $key=>$value):
                  $$key = $value ;
        endforeach;

        
        //echo $out;
        $tmp_file =  '/tmp/'.session_id()."_".basename($this->template);

        file_put_contents($tmp_file,$out);
       
        require_once($tmp_file);    	
    }
 }

