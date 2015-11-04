<?php


/**
 * Description of Cardapio
 *
 * @author wanderlei
 */

namespace App\Model;

class Cardapio extends \Core\Model\AppModel {

    /**
     * Construtor padrao
     */
    public function __construct() {
        parent::__construct();
       
        $this->setEntity('cardapio');
        $this->setup();
    }

    /**
     * Criar a estrutura da tabela
     */
    public function setup() {

        $fields = [

            "id" => "integer not null primary key auto_increment ",
            "descricao" => "varchar(100) not null"
        ];

        $this->create_table($this->getEntity(), $fields);

    }

}
