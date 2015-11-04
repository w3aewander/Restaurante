<?php

/**
 * AppModel.php
 *
 * 
 *
 */

namespace Core\Model;

abstract class AppModel extends \Core\Model\Orm {

    public function __construct() {
        parent::__construct();
    }

    public function ToJSON($data){
        if ( is_object($data) ):
            foreach ( $data as $obj=>$value):
               $arr_json[] = $value;
            endforeach;
            return $arr_json;
        endif;
        
        if (is_array($data)):
            return json_encode($data);           
        endif;
    }
}
