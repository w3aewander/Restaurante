
<div class="panel panel-title"><h1 class="text-success">Pedidos</h2></div>

<form id="form-pedido" action="/pedido/submit" method="POST" class="form-horizontal">
    
    <label for="nome" class="form-label">Nome:</label>
    <input type="text" id="nome" name="nome" class="form-control">
    
<div class="btn-group">

    <label for="cep" class="form-label">Cep:</label>
    <input type="text" id="cep" name="cep" class="form-control">

    <label for="numero" class="form-label">Número:</label>
    <input type="number" id="numero" name="numero" class="form-control">

    <label for="nome" class="form-label">Nome:</label>
    <input type="text" id="nome" name="nome" class="form-control">
    
    <span class="btn glyphicon glyphicon-search btn-success" onclick="buscarCep();">Preencher endereço</span>

    <textarea id="endereco" name="endereco" rows="5" cols="60" class="form-control">
        
    </textarea> 
   
</div>


<div class="control-group">
    <div class="controls">
        <label for="qtde">Quantidade:</label>
        <input type="text" name="qtde" id="qtde" class="input-sm" />
        
        <label for="tipo_marmitext">Tipo marmitex:</label>
        <select id="tipo_marmitex" name="tipo_marmitext">
            <option selected="">Escoha tipo marmitext</option>
            <option value="pequena">Pequena</option>
            <option value="media">Media</option>
            <option value="grande">Grande</option>
        </select>

    </div>
</div>


<div class="well well-sm control-group">
    %-- foreach ($data["cardapio"] as $cardapio): --%
    <input type="checkbox" name="preferencia[]" value="{$cardapio->descricao}">{$cardapio->descricao}
    %-- endforeach --%
</div>

    <textarea name="obs" id="obs" rows="5" cols="60" class="form-control" placeholder="Outras informações que julgar necessário.">
         
    </textarea>

<div class="btn-group">
    <button type="submit" class="btn btn-danger glyphicon glyphicon-ok">Enviar</button>
    <button type="reset" class="btn btn-danger glyphicon glyphicon-refresh">Limpar</button>
</div>

</form>


