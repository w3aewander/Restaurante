<?php

/**
 * Description of Html
 *
 * @author wanderlei
 */

namespace Core\View;

use Core\Presenter\Presenter as Presenter;

class Html {

    protected $title;
    protected $header;

    public function __construct($title = "WFW Freamework", $header = NULL, $footer = NULL) {

        $this->header = $header;
        $this->footer = $footer;
        $this->title = $title;
    }

    /**
     * Cria elementos HTML
     * 
     * @param string $element Elemento html a criar
     * @param string $content Conteúdo do elemento se houver
     * @param type $attributes Atributos do elemento tais como propriedades e classes
     * @return string Rertorna o HTML do elemento gerado 
     */
    public function CreateElement($element, $content = "", $attributes = []) {

        $arr = Presenter::AttributesParse($attributes);

        $html = \sprintf("<%s %s>%s</%s>", $element, $arr, $content, $element);

        return $html;
    }

    /**
     * Abre o documento HTML insere folhas de estilo e javascript padrão 
     * 
     * @return string Rertorna o HTML do elemento gerado
     */
    public function Open() {

        $html = "<!DOCTYPE html>";
        $html .= "<html lang='pt-br'>";
        $html .= "<head>";
        $html .= "<meta charset='utf-8'>";
        
        //carregando os estilos padrão do sistema.
        $header  = $this->addCSS("/src/App/Assets/bootstrap/css/bootstrap.min.css");
        $header .= $this->addCSS("/src/App/Assets/js/jquery-ui.min.css");

        // Carregando os javascripts necessários para o sistema.
        $header .= $this->addJS("/src/App/Assets/js/jquery.min.js");
        $header .= $this->addJS("/src/App/Assets/js/jquery-ui.min.js");
        $header .= $this->addJS("/src/App/Assets/bootstrap/js/bootstrap.min.js");
        $header .= $this->addJS("/src/App/Assets/js/app.js");
        $header .= $this->addJS("/src/App/Assets/js/comanda.js");
        
        $html .= "</head>";
        
        $html .= "<body>";

        return $html;
    }

    /**
     * 
     * @param type $css
     * @return type
     */
    public function addCSS($css) {
        $html = \sprintf("<link rel='stylesheet' type='text/css' href='%s'>", $css);
        return $html;
    }

    /**
     * Injeta script Javascript
     * 
     * @param type $js
     * @return type
     */
    public function addJS($js) {
        $html = \sprintf("<script type='text/javascript' src='%s'></script>", $js);
        return $html;
    }

    /**
     * Define o setter da Propriedade  informada
     * 
     * @param string $property Propriedade que se quer atribuir valor 
     * @param string $value Valor da propriedade
     */
    public function Set($property, $value) {
        $this->$property = $value;
    }

    /**
     * Define o getter da propriedade informada
     * 
     * @param string $property  Nome da propriedade
     * @return string  retorna o o valor da propriedade informada.
     */
    public function Get($property) {
        return $property;
    }

    /**
     * Cria a tag de fechamento do documento HTML gerado [/body e /html]
     * 
     * @return string 
     */
    public function Close() {
        $html = "</body></html>";
        return $html;
    }
    
    /**
     *
     * @return string
     */
    public function CreateLineBreak(){
        return "<br />";
    }
    
    /**
     * Cria uma linha html <HR>
     * 
     * @param array atributos Define atributos para a linha <HR> a ser criada
     */
    public function CreateLine($attributes=[]){
        $attr = Presenter::AttributesParse($attributes);
        return sprintf("<hr %s>", $attr); 
    }

}
