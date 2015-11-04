{<extends file="template_default.tpl">}

{<block name="header">}

<script>
    {<literal>}
        function incluir() {
            $.post("/comanda/incluir",
                    {
                        comanda_id: "0",
                        mesa_id: $("#mesa_id").val()
                    }, function (data) {
                location.href = "/pdv";
            });
            return false;
        }
        function excluir(comanda_id, mesa_id) {

            var confirma = confirm("Confirma finalizar comanda?");
            if (!confirma) {
                alert("Procedimento cancelado. Comanda permanece ativa.");
                return false;
            }

            $.post("/comanda/excluir",
                    {
                        comanda_id: comanda_id,
                        mesa_id: mesa_id

                    }, function (data) {
                location.href = "/pdv";
            });
            return false;
        }
        
        function imprimir(comanda_id){
            window.open('/comanda/imprimir/'+comanda_id,"Registro de consumo de comanda ", "width=800,height=600, status=no");
            
        }
    {</literal>}
</script>
{</block>}

{<block name="conteudo">}

<div class="panel panel-default">

    <div class="panel-heading">
        <div class="panel-title">Registro de Comandas</div>
    </div>
    <div class="panel-body">

        <div class="col-md-4">
            <div class="input-group">
                <span class="input-group-addon">Mesa:</span>
                <input type="number" id="mesa_id" class="form-control" aria-label="Mesa:">
                <span class="input-group-addon">
                    <button class="btn-success glyphicon glyphicon-plus-sign" onclick="incluir();"></button>
                </span>
            </div>    
        </div>
    </div>
</div>


<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Comandas Abertas</div>
    </div>

    <div class="panel-body">

        {<foreach from=$arr_comandas item=comanda key=key >}

        <div class="col-md-4">
            <div class="panel panel-default centered">
                <div class="panel-heading">
                    <h1 class="panel-title">Comanda {<$comanda->id>}</h1>
                </div>

                <div class="panel-body">
                    <div class=" comanda well well-sm">
                        <div class="badge "><h4> Mesa: {<$comanda->mesa>}</h4></div> 
                    </div>

                    <div class="text-danger"> 
                        <h2 class="text-danger glyphicon glyphicon-usd" id="valor_total_{<$key>}"></h2>
                    </div>
                </div>

                    
                <div class="panel-footer text-center">
                 <div class="btn-group">
                    <a href="/comanda/exibir/{<$comanda->id>}" 
                       class="btn btn-default glyphicon glyphicon-list-alt" 
                       title="Exibir"></a>
                    <button onclick="imprimir('{<$comanda->id>}');" 
                       class="btn btn-default glyphicon glyphicon-print" 
                       title="Imprimir"></button>
                 </div>
                </div>
            </div>

        </div>
        <script>
            $.get('/consumo/totalizar/{<$comanda->id>}', function (data) {
                var json = $.parseJSON(data);
                   $('#valor_total_{<$key>}').text( parseFloat(json.valor_total).toFixed(2) );              
            });
        </script>
        {<foreachelse>}



        <div class="well well-lg">
            <h2>Não há comandas abertas</h2>
        </div>       


        {</foreach>}

    </div>
</div>
{</block>}