<?php
/**
 *Arquivo presenter usando o padrao decorator
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 1.0
*/

namespace Core\Presenter;

Class Presenter {

  public  static function dateTimeFromDB($date){

      $dateRaw = split("[-. :]", $date);

      list($year,$month,$day,$hour,$minute,$second) = $dateRaw;
                  
       //print_r($dateRaw);

  	  return (sprintf("%s/%s/%s %s:%s:%s",$day,$month,$year,$hour,$minute,$second) );

  } 

  public static function dateFromDB($date){
  	  $dateRaw = split("[-. :]", $date);
  	  list($year,$month,$day,$hour,$minute,$second) = $dateRaw;
  	  return (sprintf("%s/%s/%s",$day,$month,$year) );
  }


  public static function timeFromDB($date){
  	  $dateRaw = split("[-. :]", $date);
  	  list($year,$month,$day,$hour,$minute,$second) = $dateRaw;
  	  return (sprintf("%s:%s:%s",$hour,$minute,$second) ); 
  }
  
  public static function dateForhumans(){
      return date('d/m/Y H:i:s'); 
  }
  
  
    /**
     * Faz o parse dos atributos enviados por array
     * 
     * @param array $attributes Atributos do controle.
     * @return string $out atributos espaçados em atributos e valores
     */
    public static function AttributesParse($attributes = []) {
        
        $out = "";
        
        if ($attributes):
        
            foreach($attributes as $attr=>$value):
               $out .= " $attr='$value' ";
            endforeach;
            
              
        endif;
        
        return $out;
    }
} 