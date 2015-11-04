{<extends file="template_default.tpl">}

{<block name="header">}
    <script>

        var saida = {
            novo: function () {
                $("#saida_id").val("0");
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
                        tipo:"saida",
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
                <h2 class="title">Fluxo/Saídas</h2>
            </div>
        </div>
        <div class="panel-body">
            <div class="form-vertical">
                <div class="form-group">
                    <div class="control-group">
                        <label class="label-control">Código:</label>
                        <input type="number" id="saida_id" name="entrada_id" value="0" readonly="readonly" />
                    </div>
                    <div class="control-group">
                        <label class="label-control">Valor:</label>
                        <input type="number" id="valor" name="valor" min="0.00" value="0.00" />
                    </div>

                    <div class="control-group">
                        <label class="label-control">Motivo/Origem:</label>
                        <input type="text"  id="motivo" name="motivo" class="form-control" />
                           
                    </div>


                    <div class="control-group">
                        <label class="label-control">Forma de pagto:</label>
                        <select  id="forma_pagto" name="forma_pagto">
                            <option selected value="">Selecione uma forma de pagamento...</option>
                            <option value="dinheiro">Dinheiro</option>
                            <option value="cheque">Cheque</option>
                            </option>  
                        </select>

                    </div>

                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group">
                    <div class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="saida.novo();"></div>
                    <div class="btn btn-default glyphicon glyphicon-save-file" title="Salvar" onclick="saida.salvar();"></div>
                    <div class="btn btn-default glyphicon glyphicon-chevron-left" title="Sair"></div>
                </div>
            </div>
        </div>
    </div>

{</block>}