{<extends file="template_default.tpl">}

{<block name="header">}
<script>
 function imprimir(){
    var data = $("#data").val();
    //alert(data);
    window.open("/fluxocaixa/imprimir/"+data,"Relatório Fluxo de Caixa", "width=800 height=600");

 }
 </script>
{</block>}

{<block name="conteudo">}


<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Fluxo de Caixa</div>
        <p >Parâmetros de pesquisa</p>
    </div>
    <div class="panel-body">
       <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Data</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <input type="date" id="data" name="data" value="{<$smarty.now|date_format: 'Y-m-d'>}" class="form-control">
                            <span class="input-group-btn">
                                <button class="btn glyphicon glyphicon-send" type="button" onclick="imprimir();"></button>
                            </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->
                    </div>
                </div>
            </div>
        </div>
       </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Tipo Movimento</h2>
                </div>
                <div class="panel-body">
                    <div class="controls">
                        <label class="control">
                            <input class="checkbox checkbox-inline" type="checkbox" id="entrada" name="entrada" value="entrada" checked="checked" />
                            Entradas
                        </label>
                        <label class="control">
                            <input class="checkbox checkbox-inline" type="checkbox" id="saida" name="saida" value="saida"  checked="checked" />
                            Saídas
                        </label>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="panel-footer">
        <button class="btn btn-lg btn-default"><i class="glyphicon glyphicon-search" title="Executar"></i></button>
        <button class="btn btn-lg btn-default"><i class="glyphicon glyphicon-refresh" title="Voltar"></i></button>
        <a class="btn btn-lg btn-default  glyphicon glyphicon-print" title="imprimir" href="/fluxocaixa/imprimir"></a>
    </div>
</div>

<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Fluxo de Caixa</h2>
    </div>
    <div class="panel-body">

        <table class="table table-borderless table-hover table-striped table-condensed">

            <thead>
                <tr>
                    <th>Código</th>
                    <th>Data/Hora</th>
                    <th>Tipo Movimento</th>
                    <th>Motivo/Origem</th>
                    <th>valor</th>
                </tr>
            </thead>
            <tbody>

                {<foreach from=$arr_fluxo item=fluxo>}
                <tr>
                    <td>{<$fluxo->id>}</td>
                    <td>{<$fluxo->created_at|date_format: 'd/m/Y H:i:s'>}</td>
                    <td>{<$fluxo->tipo>}</td>
                    <td>{<$fluxo->motivo>}</td>
                    <td>{<$fluxo->valor|number_format:2>}</td>                                    
                </tr>
                {</foreach>}

            </tbody>
            <tfoot>
            </tfoot>
        </table>

    </div>
</div>

{</block>}