{<extends file="template_default.tpl">}
{<block name="header">}
<style>

    label{
        width: 160px
    }

</style>
<script type="text/javascript">
    
    

        
    listar();
 
    function limparForm(){
         $("#produto_id").val("0");
         $("#descricao").val("");
         $("#fornecedor_id").val("0");
         $("#unidade_id").val("");
         $("#valor_unitario").val("0.00");
     }
     
       function editar(id) {
            $.ajax({
                url: '/produto/exibir/'+id,
                type: 'GET',
                success: function (data) {
                    var json = $.parseJSON(data);

                    $("#produto_id").val(json.id);
                    $("#descricao").val(json.descricao);
                    $("#fornecedor_id").val(json.fornecedor_id);
                    $("#unidade_id").val(json.unidade_id);
                    $("#valor_unitario").val(parseFloat(json.valor_unitario).toFixed(2));
                    
                },
                error: function (error) {

                }
            });

            return false;
        }    
     function salvar(){
        
         $.post(
                 '/produto/salvar',
             {
                produto_id:$("#produto_id").val(),
                descricao:$("#descricao").val(),
                fornecedor_id:$("#fornecedor_id").val(),
                unidade_id:$("#unidade_id").val(),
                valor_unitario:$("#valor_unitario").val()
             }, function(data,status){
                 // alert("Dados: "+ data +"\nStatus:"+status);
                  listar();
              }
          );
     }
     
     function listar(){
            $.ajax({
                beforeSend: function () {
                    $('tbody').empty();
                },
                url: '/produto/listar',
                type: 'GET',
                success: function (data) {
                    var json = $.parseJSON(data);

                    for (var i = 0; i < json.length; ++i)
                    {

                        $('tbody').append('<tr><td>' + json[i].id + '</td><td>' + json[i].descricao + '</td><td>' + json[i].unidade+ '</td><td align="right">' + parseFloat(json[i].valor_unitario).toFixed(2) + '</td><td class="btn glyphicon glyphicon-edit" onclick="editar(' + json[i].id + ');"></td></tr>');
                    }

                    $('#total_registros').text(json.length);
                },
                error: function (error) {

                }
            });

            return false;
     }

</script>
{</block>}

{<block name="conteudo">}
 
<div class="panel">
 
        <div class="panel panel-default">
            
            <div class="panel-heading">
                <h2 class="panel-title">Cadastro de Produtos</h2>
            </div>
            
            <div class="panel-body">

                <div class="controls">
                    <input type="hidden" name="__token" id="__token" value="{<$__token>}" />
                    <div class="control-group">
                        <label for="produto_id" class="form-label">Código:</label>
                        <input type="number" id="produto_id" name="produto_id"  min="0"  value="0" class="control" readonly="readonly" />
                    </div>
                    <div class="control-group">
                        <label for="fornecedor_id" class="form-label">Fornecedor:</label>
                        <select name="fornecedor_id" id="fornecedor_id">
                            <option selected value="">Escolha o fornecedor:</option>
                            {<foreach  from=$arr_fornecedores item=fornecedor>}
                            <option value="{<$fornecedor->id>}">{<$fornecedor->fantasia>}</option>
                            {</foreach>}
                        </select>
                    </div>
                    <div class="control-group">
                        <label for="descricao" class="form-label">Descrição:</label>
                        <input type="text" id="descricao" name="descricao" class="control" size="50" />
                    </div>
                    <div class="control-group">
                        <label for="unidade_id" class="form-label">Unidade de Venda:</label>
                        <select name="unidade_id" id="unidade_id">
                            <option selected value="">Escolha a unidade</option>
                            {<foreach  from=$arr_unidades item=unidade>}
                            <option value="{<$unidade->id>}">{<$unidade->nome>}</option>
                            {</foreach>}
                        </select>
                    </div>
                    <div class="control-group">
                        <label for="valor_unitario" class="form-label">Valor unitário:</label>
                        <input type="number" id="valor_unitario" name="valor_unitario" placeholder="0.00"  class="control" />
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group">
                    <div class="input-group">
                        <button class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></button>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>  
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Listagem de Produtos</h2>
                </div>
            </div>
            <div class="panel-body tbl_produto">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th width="150">Código</th>
                            <th width="500">Descrição</th>
                            <th>Unidade</th>
                            <th width="100">V.Unit.(R$)</th>
                            <th class="glyphicon glyphicon-cog"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <div id="produto_tbody">
                        
                        
                    </div>

                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Total de registros:</th>                            
                            <td colspan="3"><span id="total_registros"></span></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="panel-footer">

               </div>
        </div>
    </div>

{</block>}