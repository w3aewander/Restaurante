
<?php


$tags = [];

$pattern = '/@[w+]{1,2}/';

$subject ='/**
* Chave primária
* @type=integer
* @notnull=true
* @size=255
* @meta (atributo1=valor1, atributo2=valor2)
* @meta1 (atributo3=valor3)
*/';


$valida = function($telefone,$tipo=""){

  if ( ! $tipo ):
     die(sprintf("%s\n","Deve ser definido um tipo para validar."));
  endif;
  	
  switch ($tipo) {
  	case 'telefone':
        $pattern = '/(\d{2,3})\s{0,1}(\d{4})(\s{0,2})(\d{4})/';  		# code...
  		break;
  	case 'cep':
  	    $pattern = '/(\d{5})(-{0,1})(\d{3})/';
  	     break;
  	case 'cpf':
  	     $pattern = '/(\d{3})(.{0,1})(\d{3})(.{0,1})(\d{3})(-{0,1})(\d{2})/'; 
  	     break;
    case 'email':
         $pattern = '/[a-zA-Z0-9](@{1})[a-zA-Z0-9]\.*/';
         break;

  	default:
  		# code...
  		break;
  }
  
  if ( preg_match_all( $pattern, $telefone, $tags ) ):
      printf("%s validado com sucesso.\n",ucfirst($tipo) );
  else:
  	   printf("%s em formato nao valido.\n",ucfirst($tipo) );
  endif;

};


//teste de validacao
$valida("27 3323 8376","telefone");
$valida("29032-267","cep");
$valida("828993207-34","cpf");
$valida("wander.silva@gmail.com","email");
//testando tipo invalido
$valida("456098");