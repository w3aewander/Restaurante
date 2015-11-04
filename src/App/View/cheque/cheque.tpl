<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">Cadastro de Cheques:</h2>
    </div>
    <div class="panel-body">
        <fieldset><legend>Emitido/Recebido:</legend>
            <div class="control-group">
                <label class="form-label">  
                    <input class="control" type="radio" name="cheque_emitido_recebido" id="cheque_emitido_recebido" value="recebido" checked="checked">              
                    Recebido:</label>

                <label class="form-label">
                    <input class="control" type="radio" name="cheque_emitido_recebido" id="cheque_emitido_recebido" value="emitido">
                    Emitido</label>
            </div>
        </fieldset>
        <div class="control-group">
            <label class="form-label">Banco:</label>
            <select class="input-sm" name="cheque_banco" id="cheque_banco">
                <option value="">Selectione o banco...</option>
                {<foreach from=$arr_bancos item=banco key=key>}
                <option value="{<$banco->id>}">{<$banco->nome>}</option>
                {</foreach>}
            </select>
        </div>
        <div class="control-group">
            <label class="form-label">Emitente:</label>
            <input class="input-sm" type="text" name="cheque_emitente" id="cheque_emitente" size="50" >
        </div>
        <div class="control-group">
            <label class="form-label">Motivo:</label>
            <input class="input-sm" type="text" name="cheque_motivo" id="cheque_motivo" size="50" >
        </div>
        <div class="control-group">
            <label class="form-label">Vencimento:</label>  
            <input class="input-sm" type="date" name="cheque_vencimento" id="cheque_vencimento" >              
        </div>
        <div class="control-group">
            <label class="form-label">Valor:</label>  
            <input class="input-sm" type="text" name="cheque_valor" id="cheque_valor" value="{<$valor_pagar|number_format:2>}">              
        </div>
    </div>

    <div class="panel-footer">
        <div class="btn-group">
            <button class="btn btn-success glyphicon glyphicon-new-window" onclick="cheque_limparForm();">Novo</button>
            <button class="btn btn-success glyphicon glyphicon-save" onclick="cheque_salvar();">Salvar</button>
            <button class="btn btn-success glyphicon glyphicon-list" onclick="cheque_listar();">Listar</button>
        </div>
    </div>
</div>