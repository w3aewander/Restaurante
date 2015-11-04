<?php

/**
 *
 *
 *
 *
 */

namespace App\Model;

class User extends \Core\Model\AppModel {

    public function __construct() {
        parent::__construct();

        $this->setEntity('users');
    }

}
