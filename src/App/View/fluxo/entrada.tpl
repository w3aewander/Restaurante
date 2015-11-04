{<extends file="template_default.tpl">}

{<block name="header">}
    <script>

        var entrada = {
            novo: function () {
                $("#entrada_id").val("0");
                $("#valor").val("0.00");
                $("#motivo").val("");
                $("#forma_pagto").val("");
            },
            salvar: function () {
                $.ajax({
                    type: 'POST',
                    url: '/fluxocaixa/registrar',
                    dataType: 'JSON',
                    data: {
                        id: $("#entrada_id").val(),
                        tipo:"entrada",
                        valor: $("#valor").val(),
                        motivo: $("#motivo").val(),
                        forma_pagto: $("#forma_pagto").val()
                    },
                    success: function(data){
                        $("#flashmsg").val("Registro salvo com sucesso");
                        setTimeout( function(){
                           $("#flashmsg").val(""); 
                        },2000);
                    }

                });
            }

        };
    </script>        
{</block>}

{<block name="conteudo">}
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="panel-title">
                <h2 class="title">Fluxo/Entradas</h2>
            </div>
        </div>
        <div class="panel-body">
            <div class="form-vertical">
                <div class="form-group">
                    <div class="control-group">
                        <label class="label-control">Código:</label>
                        <input type="number" id="entrada_id" name="entrada_id" value="0" readonly="readonly" />
                    </div>
                    <div class="control-group">
                        <label class="label-control">Valor:</label>
                        <input type="number" id="valor" name="valor" min="0.00" value="0.00" />
                    </div>

                    <div class="control-group">
                        <label class="label-control">Motivo/Origem:</label>
                        <select  id="motivo" name="motivo">
                            <option selected value="">Selecione um motivo ou origem...</option>
                            <option value="pagamento fiado">Pagamento de Fiados</option>
                            <option value="retorno ao caixa">Retorno ao caixa</option>
                            <option value="venda avulsa balcao">Venda avulsa balcão</option>
                            <option value="comanda">Comanda</option>
                            <option value="aluguel para evento">Aluguel do salão para eventos</option>  
                        </select>
                    </div>


                    <div class="control-group">
                        <label class="label-control">Forma de pagto:</label>
                        <select  id="forma_pagto" name="forma_pagto">
                            <option selected value="">Selecione uma forma de pagamento...</option>
                            <option value="dinheiro">Dinheiro</option>
                            <option value="cheque">Cheque</option>
                            <option value="cartao de credito">Cartão de crédito</option>
                            <option value="cartao de debito">Cartão de débito</option>
                            <option value="ticket ou cartao restaurante">Ticket/Cartão restaurante</option>  
                            <option value="ticket ou cartao refeição">Ticket/Cartão refeição</option>  
                        </select>

                    </div>

                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group">
                    <div class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="entrada.novo();"></div>
                    <div class="btn btn-default glyphicon glyphicon-save-file" title="Salvar" onclick="entrada.salvar();"></div>
                    <div class="btn btn-default glyphicon glyphicon-chevron-left" title="Sair"></div>
                </div>
            </div>
        </div>
    </div>

{</block>}