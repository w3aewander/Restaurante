
<link rel="stylesheet" href="src/App/Assets/css/pdv.css" />


<div class="btn-group">
    <div class="btn btn-primary glyphicon glyphicon-list"><span> </span>Listar</div> 

    <div class="btn btn-primary glyphicon glyphicon-plus-sign"><span> </span>Nova</div> 
</div>

<div class="panel">
    <div class="panel-heading">
        <div class="panel-title">Nova comanda</div>
    </div>
    <div class="panel-body">
        <div class="input-group">
            Comanda: <input type="number" name="comanda_id"  id="comanda_id" />
            Mesa: <input type="number" name="mesa_id" id="mesa_id" />
            <div class="btn btn-sm btn-warning glyphicon glyphicon-plus-sign" 
                    onclick="addComanda();"> Incluir</div>
        </div>
    </div>
    <div class="panel-footer">

    </div>
</div>
%-- if ( $data["comandas"]->rowcount() > 0  ) : --%

<div class="row">
    <div class="col-md-12 centered">

        %-- foreach( $data["comandas"] as $comanda) : --%
        <div class="panel-group inline">

            <div class="panel comanda">
                <div class="panel-heading bg-primary">
                    <div class="bg-primary btn-block">
                        Comanda: <span class="badge">{$comanda->id}</span> 
                    </div>

                </div>            

                <div class="panel-body">
                    <div class="well well-sm fundo-mesa">
                        <h2 class="text-info">Mesa: { $comanda->mesa }</h2>
                        <h5 class="text-danger">Consumo: <span class="glyphicon glyphicon-usd"></span> 0,00</h5>
                    </div>
                    <button class="btn btn-info glyphicon glyphicon-plus-sign" 
                            title="Registrar consumo"
                            onclick="addConsumo();">

                    </button>
                    <button class="btn btn-danger glyphicon glyphicon-remove-sign" title="Fechar comanda"></button>
                    <button class="btn btn-primary glyphicon glyphicon-print" title="Imprimir comanda"></button>

                </div>
                <div class="panel-heading bg-primary">
                    %-- if ($comanda->status == "Livre"): --% 
                    <span class="btn btn-sm btn-success glyphicon glyphicon-cutlery"> Livre </span> 
                    %-- else: --%
                    <span class="btn btn-sm btn-danger glyphicon glyphicon-cutlery"> Ocupada </span>
                    %-- endif --% 
                </div>

            </div>
        </div>

        %-- endforeach --%

    </div>
</div>
%-- else: --%

<div class="well well-sm">Não há comandas registradas</div>
%-- endif --%

