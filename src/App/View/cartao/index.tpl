{<extends file="template_default.tpl">}

{<block name="header">}
<style>
    select{
        width: 350px;
    }
</style>

<script>

    listar();
    
    function limparForm() {
        $("#cartao_id").val(0);
        $("#cartao_numero").val("");
        $("#cartao_emitente").val("");
        $("#cartao_bandeira").val("");
        $("#cartao_motivo").val("");
        $("#cartao_valor").val("0.00");
    }

    function salvar() {

        $.ajax({
            type: 'POST',
            url: '/cartao/salvar',
            dataType: 'JSON',
            data: {
                id: parseInt($("#cartao_id").val()),
                numero: $("#cartao_numero").val(),
                emitente: $("#cartao_emitente").val(),
                bandeira: $("#cartao_bandeira").val(),
                tipo: $("#cartao_tipo").val(),
                motivo: $("#cartao_motivo").val(),
                valor: $("#cartao_valor").val()
            },
            success: function (data) {
                limpar();
            },
            error: function (erro) {
                alert(erro.responseText);
            },
            complete: function(){
                listar();
            }
        });
    }

    function listar() {

        var total = 0;

        $.getJSON('/cartao/listar', function (data) {
            $('tbody').empty();
            $.each(data, function (k, v) {
                $('tbody').append('<tr><td>' + v.id + '</td><td>' + v.numero + '</td><td>' + v.emitente + '</td><td>' + v.motivo + '</td><td>' + parseFloat(v.valor).toFixed(2) + '</td><td class="btn glyphicon glyphicon-edit" onclick="exibir(' + v.id + ');"></td></tr>');
                total = total + 1;
            });

            $("#total_registros").text("Total registros: " + total);
        });
    }

    function exibir(id) {
        $.getJSON('/cartao/exibir/' + id, function (v) {

            $("#cartao_id").val(v.id);
            $("#cartao_numero").val(v.numero);
            $("#cartao_emitente").val(v.emitente);
            $("#cartao_bandeira").val(v.bandeira);
            $("#cartao_tipo").val(v.tipo);
            $("#cartao_motivo").val(v.motivo);
            $("#cartao_valor").val(parseFloat( v.valor).toFixed(2) );
        });
    }

    function cartao_excluir(id) {
        $.post('/cartao/excluir/' + id, function (data) {
           listar();
        });
    }
</script>

{</block>}

{<block name="conteudo">}

<div class="panel panel-default">
    <div class="panel-heading" id="tipo_cartao">

        <h2 class="panel-title">Cadastro de Cartões</h2>

    </div>
    <div class="panel-body">

        <div class="control-group">
            <label class="form-label">ID:</label>  
            <input class="input-sm" type="number" name="cartao_id" id="cartao_id" size="50" value="0" readonly="readonly">              
        </div>
        <div class="control-group">
            <label class="form-label">Número:</label>  
            <input class="input-sm" type="number" name="cartao_numero" id="cartao_numero" size="50">              
        </div>

        <fieldset><legend>Tipo de Cartão</legend>
            <div class="control-group">
                <label class="form-label">Tipo:</label>
                <select class="control" name="cartao_tipo" id="cartao_tipo">
                    <option value="débito">Débito</option>
                    <option value="crédito">Crédito</option>
                    <option value="vale refeição">Vale Refeição</option>
                    <option value="tiket restaurante">Tiket Restaurante</option>
                    <option value="outros">Outros</option>
                </select>
            </div>
        </fieldset>
        <br />
        <fieldset><legend>Informações adicionais</legend>

            <div class="control-group">
                <label class="form-label">Emitente/Reponsável:</label>  
                <input class="input-sm" type="text" name="cartao_emitente" id="cartao_emitente" size="50">   
            </div>
            <div class="control-group">
                <label class="form-label">Bandeira:</label>
                <select name="cartao_bandeira" id="cartao_bandeira" class="control">
                    <option selected value="">Selecione uma bandeira...</option>
                    <option value="Visa">Visa</option>
                    <option value="Credcard">Credcard</option>
                    <option value="Mastercard">Mastercard</option>
                    <option value="Dinners Club">Dinners Club</option>
                    <option value="Elo">Elo</option>
                    <option value="Cielo">Cielo</option>
                    <option value="America Express">American Express</option>
                </select>

            </div>
            <div class="control-group">
                <label class="form-label">Motivo:</label>  
                <select name="cartao_motivo" id="cartao_motivo">
                    <option selected value="">Selecione um motivo...</option>
                    <option value="Comanda">Comanda</option>
                    <option value="Venda Balcão">Venda balcão</option>
                    <option value="Pagto Fiados">Pagto de fiados</option>
                    <option value="Estorno de Caixa">Estorno de Caixa</option>
                </select>
            </div>
            <div class="control-group">
                <label class="form-label">Valor:</label>  
                <input class="input-sm" type="number" name="cartao_valor" id="cartao_valor" >              
            </div>

        </fieldset>
    </div>
    <div class="panel-footer">
        <div class="btn-group">
                        <button class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></button>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>
        </div>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">Listagem de Cartões</h2>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-hover table-striped tab-pane">
            <thead>
                <tr>
                    <th width="50">Código</th>
                    <th>Número</th>
                    <th>Emitente</th>
                    <th>Motivo</th>
                    <th>Valor</th>
                    <th class="glyphicon glyphicon-cog"></th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <div class="text-info" id="total_registros">Total registros:</div>
    </div>
</div>

{</block>}