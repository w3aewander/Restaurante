{<extends file="template_default.tpl">}

{<block name="header">}

<script>

    function registrar() {
        var comanda_id = $("#comanda_id").val();
        var mesa_id = $("#mesa_id").val();
        var produto_id = $("#produto_id").val();
        var qtde = $("#qtde").val();

        $.ajax({
            type: 'POST',
            url: '/consumo/registrar',
            data: {
                comanda_id: comanda_id,
                mesa_id: mesa_id,
                produto_id: produto_id,
                qtde: qtde
            },
            dataType: 'JSON',
            success: function (data) {
                $("#flashmsg").val(data);
                setTimeout(function () {
                    $("#flashmsg").val("");
                }, 5000);
            },
            error: function (error) {
                $("#flashmsg").val(error);
                setTimeout(function () {
                    $("#flashmsg").val("");
                }, 5000);
            },
            complete: function () {
                $("#qtde").val("");
                $("#produto_id").val("");
                listar(comanda_id);
            }
        });

    }

    function listar(comanda_id) {
        $.ajax({
            beforeSend: function () {
                $('tbody').empty();
            },
            type: 'GET',
            url: '/consumo/listar/' + comanda_id,
            success: function (data) {
                $("#flashmsg").val(data);
                setTimeout(function () {
                    $("#flashmsg").val("");
                }, 5000);

                var dados = $.parseJSON(data);
                var total = 0.00;
                var total_registros = 0;

                $.each(dados, function (k, v) {
                    $('tbody').append('<tr><td>' + v.id + '</td><td>' + v.created_at + '</td><td>' + v.produto + '</td><td align="center">' + v.unidade + '</td><td align="right">' + parseFloat(v.qtde).toFixed(3) + '</td><td align="right">R$ ' + parseFloat(v.valor_unitario).toFixed(2) + '</td><td align="right">R$ ' + parseFloat(v.valor).toFixed(2) + '</td><td class="btn glyphicon glyphicon-minus" title="remover item" onclick="excluir(' + v.id + ');listar(' + comanda_id + ');"></td></tr>');
                    total += v.qtde * v.valor_unitario;
                    total_registros += 1;
                });

                total = parseFloat(total).toFixed(2);

                $("#valor_total").text(total);
                $("#total_registros").text(total_registros);
            },
            error: function (error) {
                $("#flashmsg").val(error);
                setTimeout(function () {
                    $("#flashmsg").val("");
                }, 5000);
            }
        });
    }

    function excluir(item_id) {
        var confirma = confirm("Tem certeza que deseja remover este item ?", "Confirmação", 0);
        if (!confirma) {
            $("#flashmsg").text("Item não foi removido.");
            setTimeout(function () {
                $("#flashmsg").text("");
            }, 3000);
            return;
        }
        $.post('/consumo/excluir/',{id:item_id}, function () {
            $("#flashmsg").text("Item " + item_id + " removido com sucesso!");
            setTimeout(function () {
                $("#flashmsg").text("");
            }, 3000)
        });
    }

</script>
{</block>}


{<block name="conteudo">}

<div class="panel panel-default">

    <div class="panel-heading">
        <div class="panel-title">Registro de Consumo em Comanda</div>
        <div class="text-danger" id="flashmsg"></div>  
    </div>
    <div class="panel-body">
            
            <div class="form-vertical">
                <div class="controls">
                    <div class="control-group">                        
                        <label for="comanda_id" class="form-label">Comanda:</label>
                        <input type="number" name="comanda_id" id="comanda_id" value="{<$arr_comanda->id>}" readonly="readonly" />
                    </div>
                    <div class="control-group">
                        <label for="mesa_id" class="form-label">Mesa:</label>
                        <input type="number" name="mesa_id" id="mesa_id" value="{<$arr_comanda->mesa>}" readonly="readonly" />
                    </div>   
                    <div class="control-group">
                        <label for="produto_id" class="control-label">Produto:</label>
                        <select name="produto_id" id="produto_id" class="control">
                            {<foreach from=$arr_produtos item=produto>}
                            <option value="{<$produto->id>}">{<$produto->descricao>} | {<$produto->unidade>} | {<$produto->valor_unitario|number_format: 2>}</option>
                            {</foreach>}
                        </select>
                    </div>
                    <div class="control-group">
                        <label for="qtde">Quantidade: </label>
                        <input type="number" name="qtde" id="qtde" size="5" /><br />
                    </div>
                    <div class="btn-group" style="margin-top: 20px;">

                        <button class="btn btn-default glyphicon glyphicon-save" 
                                onclick="registrar();"> Registrar
                        </button>
                        <button class="btn btn-default glyphicon glyphicon-list" 
                                onclick="listar('{<$arr_comanda->id>}');" 
                                title="Listar {<$arr_comanda->id>},{<$arr_comanda->mesa>}"> Listar
                        </button>
                        <a href="/comanda/receber/{<$arr_comanda->id>}" 
                           class="btn btn-default glyphicon glyphicon-usd" 
                           title="Receber {<$arr_comanda->id>}"> Receber</a>
 
                           <a href="/comanda/imprimir/{<$arr_comanda->id>}" 
                           class="btn btn-default glyphicon glyphicon-print" 
                           title="Imprimir {<$arr_comanda->id>}"> Imprimir</a>
                           
                           <a href="/pdv" 
                           class="btn btn-default glyphicon glyphicon-backward" 
                           title="Voltar"> Voltar</a>
                    </div>
                </div>    
            </div>
       
    </div>
                    
<div class="panel-footer">
        <strong>Total de registros: </strong><h2 class="text-info" id="total_registros">00</h2>
        <strong>Valor total da comada: R$</strong> <h2 class="text-info" id="valor_total" style="color:#F21;">0,00</h2>   
</div>

</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Listagem de Comandas</div>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-striped table-hover table-condensed">
            <thead>
            <th width="60" align="center">Item</th>
            <th width="250" align="center">Hora</th>
            <th width="350" align="center">Produto</th>
            <th align="center" >Unidade</th>
            <th width="50" align="right">Qtde</th>
            <th width="150" align="right">V.Unitário</th>
            <th width="200" align="right">Valor</th>
            <th  align="center" class="btn glyphicon glyphicon-cog"></th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <div class="panel-footer">

    </div>   
</div>

</div>

{</block>}