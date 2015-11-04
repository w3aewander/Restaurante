<?php
/**
*
* HomeController 
*
*
*/

namespace App\Controller;
use App\Model\User;
use App\View\View;
use Core\Presenter\Presenter as Presenter;
use Core\View\Template;

Class UserController extends \Core\Controller\Controller{
   
    protected $view;

    public function __construct(){
           $this->view = new Template('src/App/View/users.html');

    }

    public function index(){

          $this->view->msg="Index of site...";
    	  $this->view->show();
    }

    /**
     * Solicita ao model para obter um unico registro da tabela 
     * cujo id seja o informado no argumento
     * 
     * @param  long $id
     * @return template
    */
    public function showOne($id){
		
		$this->view->user_name = "Usuario inexistente";

		if ( $user = User::find_one($id) ):
          $this->view->user_id =  $user->id;
          $this->view->user_name =  $user->name;
          $this->view->user_email =  $user->email;
          $this->view->created_at = Presenter::dateFromDB($user->created_at);
          $this->view->updated_at = Presenter::dateTimeFromDB($user->updated_at);

        endif; 

        $this->view->show();
    }
}
