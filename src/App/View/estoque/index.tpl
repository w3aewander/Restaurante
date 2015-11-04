{<extends file="template_default.tpl">}

{<block name="header">}
<style>
    {<literal>}
    .btn-group{
        margin: 10px;
    }
    #opt_produto > select{
        width: 260px;
    }
    {</literal>}
</style>
<script>
    {<literal>}

        $.ajax({
            type: 'GET',
            url: "/produto/listar",
            success: function (data) {

                var html = "<select name='produto_id' id='produto_id' class='control'>";
                html += "<option selected value=''>Selecione um produto</option>";
                var dados = $.parseJSON(data);
                $.each(dados, function (k, v) {
                    html += "<option value=" + v.id + ">" + v.descricao + "</option>";
                });

                html += "</select>";

                $("#opt_produto").html(html);
            }
        });

        listar();

        function limparForm() {

            $("#produto_id").val("");
            $("#qtde_maxima").val("");
            $("#qtde_atual").val("");
            $("#qtde_minima").val("");

        }
        function editar(id) {
            $.ajax({
                type: 'GET',
                url: '/estoque/exibir/' + id,
                success: function (data) {
                    var dados = $.parseJSON(data);
             
        
                        $("#produto_id").val(dados.produto_id);
                        $("#qtde_minima").val(dados.qtde_minima);
                        $("#qtde_maxima").val(dados.qtde_maxima);
                        $("#qtde_atual").val(dados.qtde_atual);
         
                }
            });

        }

        function salvar() {

            $.ajax({
                beforeSend: function () {
                    $("#flashmsg").text("Atualizando lista!");
                    setTimeout(function () {
                        $("#flashmsg").text(" ");
                    }, 5000);
                },
                type: 'POST',
                url: '/estoque/salvar',
                dataType: 'JSON',
                data: {
                    produto_id: $("#produto_id").val(),
                    qtde_minima: $("#qtde_minima").val(),
                    qtde_atual: $("#qtde_atual").val(),
                    qtde_maxima: $("#qtde_maxima").val()
                },
                success: function (data) {
                    if (data === "1") {
                        $("#flashmsg").text("Registro salvo com sucesso!");
                        setTimeout(function () {
                            $("#flashmsg").text(" ");
                        }, 5000);
                    }
                },
                error: function (erro) {
                    $("#flashmsg").text(erro.responseText);
                },
                complete: function () {
                    listar();
                }
            });
        }

        function listar() {
            $('tbody').empty();
            $.get("/estoque/listar", function (data) {
                var dados = $.parseJSON(data);
                $("#total_registros").text("Total de registros: " + dados.length);
                $.each(dados, function (k, v) {
                    $('tbody').append('<tr><td>' + v.produto_id + '<td>' + v.descricao + '</td>' + '<td>' + v.qtde_maxima + '</td>' + '<td>' + v.qtde_minima + '</td>' + '<td>' + v.qtde_atual + '</td><td class="btn glyphicon glyphicon-edit" onclick="editar(' + v.produto_id + ');"></td></tr>');
                });
            });
        }
    {</literal>}
</script>
{</block>}

{<block name="conteudo">}

<div class="panel panel-default">
    <div class="well well-sm" id="flashmsg">Mensagem:</div>
    <div class="panel-heading">
        <h2 class="panel-title">{<$subtitulo>}</h2>
    </div>

    <div class="panel-body" >

        <div class="controls">
            <label class="label-control" for="produto_id">Produto:</label>
            <span  id="opt_produto"></span> 
        </div>

        <div class="input-group">
            <label class="label-control" for="qtde_minima">Qtde Minima:</label>
            <input class="control" type="number" id="qtde_minima" name="qtde_minima" value="" placeholder="0" />
        </div>
        <div class="input-group">
            <label class="label-control" for="qtde_maxima">Qtde Maxima:</label>
            <input  class="control" type="number" id="qtde_maxima" name="qtde_maxima" value="" placeholder="0" />
        </div>

        <div class="input-group">
            <label class="label-control" for="qtde_atual">Qtde Atual:</label>
            <input  class="control" type="number" id="qtde_atual" name="qtde_atual" value="" placeholder="0" />
        </div>
    </div>
    <div class="panel-footer">
        <div class="btn-group">
                        <div class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></div>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>  
        </div>  
    </div>
</div>
<div class="panel panel-default">         
    <div class="panel panel-heading">
        <h2 class="panel-title"><span id="total_registros"></span></h2>
    </div>
    <div class="panel-body  tbl_estoque">
        <table class="table table-hover table-bordered table-striped">
            <thead>
                <tr>
                    <th width="50">Código</th>
                    <th width="500" >Descrição</th>
                    <th width="100">Qte Máx.</th>
                    <th width="100">Qtde Mín.</th>
                    <th width="100">Qtd Atual</th>
                    <th class="glyphicon glyphicon-cog"></th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2"></th>
                    <th colspan="4"></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
</div>

{</block>}