
/* global btnExcluir */

/**
 * @author Wanderlei Silva do Carmo
 */


$(document).ready(function () {

    carregarCategorias();
});
function carregarCategorias() {

    var tbody = document.querySelector("table tbody");
    var tr = document.createElement("tr");
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: '/categoria/exibir',
        success: function (data) {

            $('tbody').html("");
            $.each(data, function (k, v) {
                var id, nome, descricao, botoes;
                tr = document.createElement("tr");
                id = document.createElement("td");
                id.appendChild(document.createTextNode(v.id));
                id.style.width = "60px";
                id.setAttribute("align", "right");

                tr.appendChild(id);

                nome = document.createElement("td");
                nome.appendChild(document.createTextNode(v.nome));
                tr.appendChild(nome);
                nome.style.width = "250px";
                descricao = document.createElement("td");
                descricao.appendChild(document.createTextNode(v.descricao));
                descricao.style.width = "300px";
                tr.appendChild(descricao);

                botoes = document.createElement("td");
                botoes.setAttribute("align", "right");

                btnEditar = document.createElement("button");

                btnEditar.setAttribute("class", "btn btn-block btn-default glyphicon glyphicon-pencil");

                btnEditar.addEventListener("click", function () {
                    $("#id").val(v.id);
                    $("#nome").val(v.nome);
                    $("#descricao").val(v.descricao);
                });

                div = document.createElement("div");
                div.setAttribute("class", "btn-group");
                div.appendChild(botoes);
                botoes.appendChild(btnEditar);

                tr.appendChild(div);
                tbody.appendChild(tr);

                $("#id").val(v.id);
                $("#nome").val(v.nome);
                $("#descricao").val(v.descricao)
            });
        },
        error: function (erro, x, y) {
            console.log(erro);
        }
    });
}

function salvarCategoria() {

    if (!confirm("Confirmar salvar a categoria")) {
        alert('Operação cancelada.');
        return;
    }
    
    var id = $("#id").val();
    var nome = $("#nome").val();
    var descricao = $("#descricao").val();
    $.ajax({
        beforeSend: function () {

        },
        type: 'POST',
        url: '/categoria/salvar',
        data: {id: id, nome: nome, descricao: descricao},
        success: function (data) {
            carregarCategorias();
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