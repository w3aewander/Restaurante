<?php

namespace Core\View;

use Core\Security\Token as Token;
use Core\Presenter\Presenter as Presenter;

/**
 * Classe responsável por criar de forma dinâmica formulários HTML 
 * e seus repectivos controles.
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha-dev;
 * 
 */
class Form {

    /**
     * Cria tag Form no documento com os parâmetros informados.
     * 
     * @param string $name Nome do formulário
     * @param string $target alvo dos dados. Arquivo que processará os dados enviados pelo formulário
     * @param string $method método de envio POST,GET,PUT, etc.
     * @param array $attributes Atributos do formulário tais como nome,class,etc..
     * @return string  $out Saída em html do formulário
     */
    public static function Open($name = "", $target = "#", $method = "GET", $attributes = []) {

        $token = new Token();

        $security = $token->Tokenize();

        $_SESSION["__token"] = $security;

        $attr = Presenter::AttributesParse($attributes);
        $form = sprintf("<form name='%s' id='%s' action='%s' method='%s' %s>", $name, $name, $target, $method, $attr);
        
        if ( ! $target ):            
                $form = sprintf("<form name='%s' id='%s' %s>", $name, $name, $attr);
        endif;
        
        
        $out = \sprintf("%s", $form);

        $out .= self::InputHidden("__token", $security);

        return $out;
    }

    /**
     * Cria a tag de fechamento  do formulário
     * 
     * @param none
     * @return none
     */
    public static function Close() {
        return "</form>";
    }

    /**
     * Cria um rótulo html [ Label ]
     * 
     * @param string $name Nome do rótulo
     * @param array $attributes Atributos do rótulos tais como, nome,class, etc..
     * @return $out Saída em html do rótulo.
     */
    public static function Label($label, $for, $attributes = []) {

        $arr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<label for='%s' %s>%s</label>", $for, $arr, $label);

        return $out;
    }

    /**
     * Cria um botão submit para envio dos dados do formulário
     * 
     * @param string $name Nome do controle
     * @param string $value Texto do input submit
     * @param array $attributes Atributos do controle
     * @return string $out html form button submit
     */
    public static function Submit($name = "submit", $value = "Enviar", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<input type='submit' name='%s' id='%s' value='%s' %s />", $name, $name, $value, $attr);

        return $out;
    }

    public static function InputHidden($name = "__token", $value = "") {

        $out = \sprintf("<input type='hidden' id='%s' name='%s' value='%s'>", $name, $name, $value);
        return $out;
    }

    /**
     * Cria um botão reset para limpar os textos dos controles do formulário
     * 
     * @param string $name Nome do controle
     * @param string $value Texto do input reset
     * @param array $attributes Atributos do controle
     * @return string $out html form button reset
     */
    public static function Reset($name = "reset", $value = "Limpar", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<input type='reset' name='%s ' id='%s' value='%s' %s />", $name, $name, $value, $attr);

        return $out;
    }

    /**
     * Cria um input text
     * 
     * @param string $name Nome do input text
     * @param array $attributes Atributos do input text
     * @return string Saída em html do input
     */
    public static function InputText($name = "", $value = "", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<input type='text' name='%s' id='%s' value='%s' %s />", $name, $name, $value, $attr);

        return $out;
    }

    /**
     * Cria um controle para digitar emails
     * 
     * @param string $name Nome do controle E-mail
     * @param string $value Valor do texto do controle
     * @param array $attributes Atributos do controle tais como: nome,class, etc...
     * @return string Saída do html do controle
     */
    public static function Email($name = "", $value = "", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<input type='email' name='%s' id='%s' value='%s' %s />", $name, $name, $value, $attr);

        return $out;
    }

    /**
     * Cria uma caixa de texto Textarea
     * 
     * @param string $name Nome do controle 
     * @param string $value Valor do texto do controle
     * @param array $attributes Atributos do controle tais como: nome,class, etc...
     * @return string Saída do html do controle
     */
    public static function TextArea($name = "", $value = "", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);

        $out = \sprintf("<textarea name='%s' id='%s' %s>%s</textarea>", $name, $name, $attr, $value);

        return $out;
    }

    /**
     * Cria um  radio button 
     * 
     * @param string $name Nome do controle 
     * @param string $value Valor do texto do controle
     * @param array $attributes Atributos do controle tais como: nome,class, etc...
     * @return string Saída do html do controle
     */
    public static function InputRadio($name = "checkbox", $label = "", $value = "", $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $radio = "<label>";
        $radio.= sprintf("<input type='radio' name='%s' id='%s' value='%s' %s> %s", $name, $name, $value, $attr, $label);
        $radio .= "</label>";

        return $radio;
    }

    /**
     * Cria um input checkbox
     * 
     * @param string $name Nome do controle 
     * @param string $value Valor do texto do controle
     * @param array $attributes Atributos do controle tais como: nome,class, etc...
     * @return string Saída do html do controle
     */
    public static function InputCheckbox($name = "checkbox", $label = "", $value = "", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $checkbox = "<label>";
        $checkbox .= sprintf("<input type='checkbox' name='%s' id='%s' value='%s' %s> %s", $name, $name, $value, $attr, $label);
        $checkbox .= "</label>";

        return $checkbox;
    }

    /**
     * Cria um controle select
     * 
     * @param string $name Nome do controle 
     * @param string $value Valor do texto do controle
     * @param array $attributes Atributos do controle tais como: nome,class, etc...
     * @return string Saída do html do controle
     */
    public static function Select($name = "", $arr_options = [], $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);

        $select = \sprintf("<select name='%s' id='%s' %s>", $name, $name, $attr);

        $select .= "<option selected value=''>Escolha uma opção abaixo</option>";

        foreach ($arr_options as $key => $value):
            $select .= \sprintf("<option value='%s'>%s</option>", $key, $value);
        endforeach;

        $select .= "</select>";

        return $select;
    }

    /**
     * Cria um controle button
     * 
     * @param string $content Conteúdo da botão
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html da controle
     */
    public static function Button($name = "Ok", $text = "", $attributes = []) {

        $attr = Presenter::AttributesParse($attributes);
        $out = \sprintf("<button name='%s' id='%s' %s>%s</button>", $name, $name, $attr, $text);

        return $out;
    }

    /**
     * Cria uma tabela com o conteúdo indicado.
     * Antes de usar esta funcção deve-se cirar toda sua estrutura interna
     * tais como, head,body e footer, se necessário.
     * 
     * @param string $content Conteúdo da tabela
     * @param array $attributes Atributos (ex.: border,width,class,etc..
     * @return string  saída html da tabela
     */
    public static function Table($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $table = sprintf("<table %s>%s</table>", $attr, $content);
        return $table;
    }

    /**
     * Cria uma coluna <TR></TR> de tabela com os atributos opcionais informados
     * 
     * @param string $content Conteúdo da coluna
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html da coluna
     */
    public static function TableRow($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $row = sprintf("<tr %s>%s</tr>", $attr, $content);
        return $row;
    }

    /**
     * Cria uma coluna <TD></TD> na tabela com os atributos e conteúdos indicados
     * 
     * @param string $content Conteúdo da linha
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html da linha
     */
    public static function TableColumn($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $col = sprintf("<td %s>%s</td>", $attr, $content);
        return $col;
    }

    /**
     * Cria o cabeçalho da tabela <THEAD></THEAD>
     * 
     * @param string $content Conteúdo do cabeçalho
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html do cabeçalho
     */
    public static function TableHead($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $head = sprintf("<thead %s>%s</thead>", $attr, $content);
        return $head;
    }
    
    
    /**
     * Cria o corpo da tabela <TBODY></TBODY>
     * 
     * @param string $content Conteúdo do cabeçalho
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html do cabeçalho
     */
    public static function TableBody($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $tbody = sprintf("<tbody %s>%s</tbody>", $attr, $content);
        return $tbody;
    }
    
    /**
     * Cria o rodapé da tabela <TBODY></TBODY>
     * 
     * @param string $content Conteúdo do rodapé
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html do rodapé
     */
    public static function TableFooter($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $tfooter = sprintf("<tfooter %s>%s</tfooter>", $attr, $content);
        return $tfooter;
    }

    /**
     * Cria o caption da tabela <CAPTION></CAPTION>
     * 
     * @param string $content Conteúdo do caption
     * @param array $attributes Atributos (ex.: width,class,etc..
     * @return string  saída html do rodapé
     */
    public static function TableCaption($content, $attributes = []) {
        $attr = Presenter::AttributesParse($attributes);
        $caption = sprintf("<tfooter %s>%s</tfooter>", $attr, $content);
        return $caption;
    }
    
    
}
