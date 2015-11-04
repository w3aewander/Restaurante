
<link rel="import" href="/src/App/View/header.html" />

<div class="container">

    <div class="panel ">
        <div class="panel-body bg-success"> 
            <div class="jumbotron">
                <h1>Pedido de Entrega</h1>
                <p>{ $data["flash_msg"] }</p>
            </div>
        </div>
        <div class="panel-footer">
            Processado em : { $data["data_pedido"] }
        </div>
    </div>
</div>