{<extends file="template_default.tpl">}
{<block name="header">}

<script>

    function calcularValor() {
        var qtde = parseFloat($("#qtde").val()).toFixed(2);
        var valor = parseFloat($("#valor_produto").val()).toFixed(2);
        var valor_pagar = qtde * valor;
        $("#valor_pagar").val(parseFloat(valor_pagar).toFixed(2));
        $("#recebido").val("");
    }

    function calcularTroco() {
        var pago = $("#valor_pagar").val();
        var recebido = $("#recebido").val();
        var troco = parseFloat(recebido) - parseFloat(pago);
        $("#troco").text(parseFloat(troco).toFixed(2));
    }

    function registrar() {

        $.ajax({
            type: 'POST',
            url: '/fluxocaixa/registrar',
            data: {
                tipo: "entrada",
                motivo: "venda balcao",
                forma_pagto: $("#forma_pagto").val(),
                valor: parseFloat($("#valor_pagar").val()),
            },
            dataType: 'JSON',
            success: function (data) {

                $("#flashmsg").val("Venda registrada com sucesso.");
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
                location.href = "/pdv";
            }
        });

    }

    function exibir(id) {

        $.getJSON('/produto/exibir/' + id, function (data) {
            var valor_unitario = parseFloat(data.valor_unitario).toFixed(2);
             $("#valor_produto").val(valor_unitario);
        });
    }

</script>
{</block>}

{<block name="conteudo">}
<div class="panel panel-default">

    <div class="panel-heading">
        <h2 class="panel-title">Venda Avulsa</h2>
        <div class="flashmsg"></div>
    </div>
    <div class="panel-body">

        <div class="control-group">
            <label for="produto_id" class="control-label">Produto:</label>
            <select name="produto_id" id="produto_id" class="input-sm" onchange="exibir(this.value);">
                <option selected value="">Selecione um produto... </option>
                {<foreach from=$arr_produtos item=produto>}
                <option value="{<$produto->id>}"> 
                    {<$produto->descricao>} | {<$produto->unidade>} | {<$produto->valor_unitario|number_format: 2>}
                </option>
                {</foreach>}
            </select>
        </div>
        <div class="control-group">
            <label for="valor_produto">Valor do produto: </label>
            <input class="input-sm" type="number" name="valor_produto" id="valor_produto" size="10" readonly="readonly"/><br />           
        </div>    
        <br />
        <div class="control-group">
            <label for="qtde">Quantidade: </label>
            <input class="input-sm" type="number" name="qtde" id="qtde" size="5"  onkeyup="calcularValor();"/><br />           
        </div>
        <br />
        <div class="control-group">
            <label for="valor_pagar">Valor a pagar: </label>
            <input class="input-sm" type="number" name="valor_pagar" id="valor_pagar" size="10" readonly="readonly"/><br />           
        </div>    
        <div class="control-group">
            <label>Forma de Pagto:</label>
            <select name="forma_pagto" id="forma_pagto" class="input-sm">
                <option value="">Selecione a forma de pagamento...</option>
                <option value="Dinheiro">Dinheiro</option>
                <option value="Cartão">Cartão   </option>
                <option value="Cheque">Cheque</option>
            </select>
        </div>
        <br />
        <div class="control-group">
            <label for="recebido">Valor recebido: </label>
            <input class="input-sm" type="number" name="recebido" id="recebido" size="10" placeholder="0.00" onkeyup="calcularTroco();"/>
        </div>
        <div style="margin: 15px;">
            <span style="font-size: 250%">Troco: R$ </span>
            <span id="troco" style="margin: 5px auto; font-size: 350%; font-weight: bold; color: #F21; padding:10px;"></span>
        </div>    
    </div>
    <div class="panel-footer">
        <button class="btn btn-lg  btn-default glyphicon glyphicon-floppy-disk" onclick="registrar();" > Registrar</button>       
    </div>
</div>
{</block>}

