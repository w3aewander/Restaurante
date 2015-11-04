/*************************************************************************
 * API para uso no Framework wfw
 *
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha-dev
 *
 **************************************************************************/



$(document).ready(function () {
                                                                                                    
    $(".popup").draggable();
//    $(".painel-fila-pedidos .panel-heading").click(function () {
//        $(".painel-fila-pedidos .panel-body").slideToggle(500);
//    });

    //setInterval( function(){showFilaPedidos()}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          , 5000);


});

/**
 * *************************************************************************
 * Funçao para criar uma janela de dialog que carregara os documentos
 * requisitados pela açao dos cliques nos botoes
 * 
 * @author Wanderlei Silva do Camo <wander.silva@gmail.com>
 * @version 0.1alpha-dev. 
 *
 * @param {string} url
 * @param {string} caption
 * @returns {none}
 **************************************************************************/

function loadModule(url, caption) {

    $(".popup").show(150);
    var iframe = $("#iframe-popup");
    $("#titulo-popup").text(caption);
    
    //$("#iframe-popup").attr("src", url);
    $("#iframe").load(url);
}


/**
 * 
 * 
 * @param {type} title
 * @param {type} mensagem
 * @returns {undefined}
 */
function dialogBox(title, mensagem) {

    var dialogo = document.createElement("div");

    var header = document.createElement("div");
    header.setAttribute("class", "panel-heading bg-primary");
    header.appendChild(document.createTextNode(title));

    var body = document.createElement("div");
    body.setAttribute("style", "display: block; height: 180px;");
    body.setAttribute("class", "panel panel-body text-info");
    body.appendChild(document.createTextNode(mensagem));

    var footer = document.createElement("div");
    footer.setAttribute("style", "text-align: center");
    footer.setAttribute("class", "panel panel-footer text-info bg-primary");

    var btnFechar = document.createElement("button");
    btnFechar.setAttribute("class", "btn glyphicon glyphicon-ok btn-danger");
    btnFechar.appendChild(document.createTextNode(" Fechar"));

    btnFechar.addEventListener('click', function () {
        container.removeChild(dialogo);
    });

    footer.appendChild(btnFechar);


    dialogo.setAttribute("style", "border: 2px solid #333;");
    dialogo.setAttribute("class", "panel");

    dialogo.appendChild(header);
    dialogo.appendChild(body);
    dialogo.appendChild(footer);

    dialogo.style.position = "absolute";

    dialogo.style.width = "400px";
    dialogo.style.height = "300px";


    dialogo.style.top = "150px";
    dialogo.style.left = "200px";

    dialogo.style.display = "block";
    $(dialogo).draggable();

    var container = document.querySelector(".container");
    container.appendChild(dialogo);
    container.style.display = "block";


}
/**
 * Centraliza janela na tela de acordo com a largura do browser;
 * 
 * @param {type} child
 * @returns {Number|centerDialog.div_width|String|centerDialog.browser_width}
 * 
 */
function centerDialog(child) {

    //Obtem a largura do element body;

    var w = child.style.width;
    var div_width = parseInt(w.substring(0, w.length - 2));

    var browser_width = parseInt(window.innerWidth);

    var div_left = (browser_width - div_width) / 2;

    div_left = div_left + 50 + "px";

    return div_left;

}


function showFilaPedidos() {

    $.getJSON('/pedido/show/all', function (data) {
        var div_pedidos = document.querySelector(".painel-fila-pedidos .panel .panel-body");

        $(div_pedidos).html("");
        $(div_pedidos).append("<ul class='list-group'>");

        var item = "";
        var contador = 0;
        $.each(data, function (id, obj) {

            if (obj.data_entrega === null) {
                item = $("<li class='btn list-group-item'><a href='javascript:loadModule(\"/pedido/show/" + obj.id + "\",\"Pedido Entrega\");'>" + obj.id + " - " + obj.nome + "</a></li>");
                contador++;
                $(div_pedidos).append(item);
            }

        });

        $(div_pedidos).append("</ul>");
        $("#total_pedidos").text(contador.toString());

    });
}
function fecharJanela() {
    $(".popup").hide();
}
function maximizarJanela() {

    if ($(".main-popup").width() === window.innerWidth - 50) {
        $(".main-popup").width(800);
        $(".main-popup").height(600);
        $(".popup").left(50);

    } else {
        $(".main-popup").width(window.innerWidth - 50);
        $(".main-popup").height(window.innerHeight - 50);
        $(".popup").left(centerDialog( $(".popup") ));
    }
}

function minimizarJanela(){
    $(".main-popup").height(0);
    $(".popup").top(window.innerHeight -50);
}
