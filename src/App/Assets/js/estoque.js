
/* global btnExcluir */

/**
 * @author Wanderlei Silva do Carmo
 */


$(document).ready(function () {

    carregarEstoque();
    
});
function carregarEstoque() {

    var tbody = document.querySelector("table tbody");
    var tr = document.createElement("tr");
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: '/estoque/exibir',
        success: function (data) {

            $('tbody').html("");
            $.each(data, function (k, v) {
                var id, produto, qtde_min, qtde_max, qtde_atual, botoes;
                
                tr = document.createElement("tr");
                id = document.createElement("td");
                id.appendChild(document.createTextNode(v.id));
                id.style.width = "60px";
                id.setAttribute("align", "right");

                tr.appendChild(id);

                produto = document.createElement("td");
                produto.appendChild(document.createTextNode(v.produto_nome));
                produto.style.width = "250px";
                tr.appendChild(produto);
                
                qtde_min = document.createElement("td");
                qtde_min.appendChild(document.createTextNode(v.qtde_min));
                qtde_min.style.width = "60px";
                tr.appendChild(qtde_min);

                qtde_max = document.createElement("td");
                qtde_max.appendChild(document.createTextNode(v.qtde_max));
                qtde_max.style.width = "60px";
                tr.appendChild(qtde_max);

                qtde_atual = document.createElement("td");
                qtde_atual.appendChild(document.createTextNode(v.qtde_atual));
                qtde_atual.style.width = "60px";
                tr.appendChild(qtde_atual);


                botoes = document.createElement("td");
                botoes.setAttribute("align", "right");

                btnEditar = document.createElement("button");

                btnEditar.setAttribute("class", "btn btn-block btn-default glyphicon glyphicon-pencil");

                btnEditar.addEventListener("click", function () {
                    
                    $("#id").val(v.id);
                    $("#produto_id").val(v.produto_id);
                    $("#qtde_min").val(v.qtde_min);
                    $("#qtde_max").val(v.qtde_max);
                    $("#qtde_atual").val(v.qtde_atual);
                });

                div = document.createElement("div");
                div.setAttribute("class", "btn-group");
                div.appendChild(botoes);
                botoes.appendChild(btnEditar);

                tr.appendChild(div);
                tbody.appendChild(tr);

                
                $("#id").val(v.id);
                $("#produto").val(v.produto_id+"-"+v.produto_nome);
                $("#qtde_min").val(v.qtde_min);
                $("#qtde_max").val(v.qtde_max);
                $("#qtde_atual").val(v.qtde_atual);
            });
        },
        error: function (erro, x, y) {
            console.log(erro);
        }
    });
}

function salvarCategoria() {

    if (!confirm("Confirmar salvar?")) {
        alert('Operação cancelada.');
        return;
    }
    
    
    var id = $("#id").val();
    var produto_id = $("#produto").val().splice()[0];
    var qtde_min = $("#qtde_min").val();
    var qtde_max = $("#qtde_max").val();
    var qtde_atual = $("#qtde_atual").val();
    
    $.ajax({
        beforeSend: function () {

        },
        type: 'POST',
        url: '/estoque/salvar',
        data: {id: id, produto_id: produto_id, qtde_min: qtde_min,qtde_max:qtde_max,qtde_atual:qtde_atual},
        success: function (data) {
            carregarEstoque();
        },
        error: function (erro) {
            alert('Ocorreu um erro...:' + erro.statusText);
        }
    });
}


function excluirCategoria() {

    var id = $("#id").val();

    alert(id);

    $.ajax({
        beforeSend: function () {
            //$("#status").text('Salvando dados...');  
        },
        type: 'POST',
        url: '/categoria/excluir',
        data: {id: id},
        success: function (data) {
            carregarCategorias();

        },
        error: function (erro) {
            alert('Ocorreu um erro...:' + erro.statusText);
        }
    });


}

function novaCategoria() {
    $("#id").val("0");
    $("#nome").val("");
    $("#descricao").val("");
}