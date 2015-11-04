{<extends file="template_default.tpl">}

{<block name="header">}

<script>


    function calcularTroco() {

        var recebido = $("#recebido").val();
        var pagar = $("#valor_pagar").val();

        var troco = parseFloat(recebido) - parseFloat(pagar);
        if ( $.isNumeric(troco)) {
            $("#troco").text(parseFloat(troco).toFixed(2));
        } else {
            $("#troco").text("");
        }
    }

    function registrar() {

        $.ajax({
            type: 'POST',
            url: '/fluxocaixa/registrar',
            data: {
                tipo: "entrada",
                motivo: "comanda ",
                forma_pagto: $("#forma_pagto").val(),
                valor: parseFloat($("#valor_pagar").val()),
            },
            dataType: 'JSON',
            success: function (data) {

                $.get('/comanda/fechar/' + parseInt($("#comanda_id").val()));

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
</script>

{</block>}

{<block name="conteudo">}

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Finalizando Comanda</div>
        <div id="flashmsg"></div>
    </div>

    <div class="panel-body">

        <div class="control-group">
            <label>Comanda:</label>
            <input type="number" class="input-sm" id="comanda_id" value="{<$comanda_id>}" readonly="readonly" /> 
        </div>
        <div class="control-group">
            <label>Valor a pagar R$:</label> 
            <input class="input-sm" 
                   type="number" 
                   name="valor_pagar" 
                   id="valor_pagar"  
                   readonly="readonly" 
                   value="{<$valor_pagar|number_format:2>}" />
        </div>
        <div class="control-group">
            <label >Forma de Pagamento:</label>
            <select name="forma_pagto" id="forma_pagto" class="input-sm">
                <option selected value="">Selecione uma forma de pagto...</option>
                <option value="Dinheiro">Dinheiro</option>
                <option value="Cartão">Cartão   </option>
                <option value="Cheque">Cheque</option>
            </select>
        </div>    
        <br />
        <div class="control-group">
            <label >Recebido R$:</label> 
            <input class="input-sm" 
                   type="number" 
                   name="recebido" 
                   id="recebido" 
                   onkeyup="calcularTroco();" />
        </div>
        <div style="margin: 15px;">
            <span style="font-size: 250%">Troco: R$ </span>
            <span id="troco" 
                  style="margin: 5px auto; font-size: 250%; font-weight: bold; color: #F21; padding:10px;">                   
            </span>
        </div>    
    </div>

    <div class="panel-footer">       
        <button  class="btn btn-default btn-lg glyphicon glyphicon-usd" onclick="registrar();"> Fechar</button>     
    </div>

</div>

{</block>}