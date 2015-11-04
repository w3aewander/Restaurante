<?php
/**
 *
 *
 */
$url = $_SERVER["REQUEST_URI"];
$uri = \explode("/", rtrim($url, '/'));

//detectando o controlador
$controller = !isset($uri[1])?"home":$uri[1];
$action     = !isset($uri[2])?"index":$uri[2];

//detectando os parametros enviados
$parm1 = !isset($uri[3])?null:$uri[3];
$parm2 = !isset($uri[4])?null:$uri[4];

//Usando convensao ao inves de configuracao
$controller = trim(ucfirst($controller)."Controller", '/');
$wfw  = "\\App\\Controller\\$controller";
$data = ['data' => date('Y')];

class ParentController extends \Core\Controller\Controller {};
$token = new ParentController();

$_SESSION["__token"] = $token->getToken();

//Tratamento das rotas
if (!class_exists($wfw)):
  $msg = "Controller  not  implemented yet!!!";
  die($msg);
endif;

$x = new $wfw;

if (!method_exists($wfw, $action)):
  $msg = "Action not implemented yet!!!";
  $x   = new \App\Controller\ErroController;
  printf("%s", $x->index());
  die();
endif;
