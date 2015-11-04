<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">

        <link href="/src/App/Assets/js/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="/src/App/Assets/bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>

        <script src="/src/App/Assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="/src/App/Assets/js/jquery-ui.min.js" type="text/javascript"></script>

        <link href="/src/App/Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="/src/App/Assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


        <style>

            body{
                background-color: #666;
            }

            select,input{
             text-transform: uppercase;
             padding: 5px;
            }
            input[type="text"]:read-only, input[type="number"]:read-only {
                background: #eee;
                color: #F21;
                font-size: 120%;
                font-weight: bold;
                padding: 5px;
                border: 1px outset #4cae4c;
            }
            

            label{
                width: 160px
            }
            select{
                height: 30px;
            }
            .table{
                width: 100%;
            }
            .bg-primary{
                background-color: #ff670f;
            }
            .container{
                background-color: #fff;
                width: 90%;
                height: 1280px;
                overflow:scroll;
                border: 1px solid #555;
            }
            .comanda{
                display: block;
                height: 120px;
                background-image: url('/src/App/Assets/imagens/mesax.png');
                background-repeat: no-repeat;
                background-position: right center;
                background-size: 60%;
            }
            .tbl_fornecedor,
            .tbl_produto, 
            .tbl_cliente,
            .tbl_estoque {
                margin: 10px auto;
                display: block;
                height: 500px;
                overflow-y: scroll;
            }

            .jumbotron{
                background-color: #ff670f;
                background-image: url('/src/App/Assets/imagens/banner_topo_nossacasa.png');
                background-repeat: no-repeat;
                background-position: center center;
                background-size: 100% 110%;
                text-align: left;
                height: 180px;

            }
            .footer{
                display: block;
                bottom: 10px;
                margin: 0 auto;
                padding: 20px;
                text-align: center;
                width: 90%;
                height: 150px;
                background-color: #ccc;
            }

        </style>

        <script>
            setInterval(function () {
                 var tempo = new Date();
                 
                 var hora=tempo.getHours();
                 var minuto=tempo.getMinutes();
                 var segundo=tempo.getSeconds();
                 
                 if ( hora < 10){
                     hora = "0"+hora;
                 }
                 if ( minuto < 10){
                     minuto = "0"+minuto;
                 }
                 if ( segundo < 10 ){
                     segundo = "0"+segundo;
                 }
                 
                 $("#relogio").text(hora+":"+minuto+":"+segundo);
                 
            }, 1000);
        </script>

        {<block name="header">}


        {</block>}

    </head>

    <body>

        <div class="container">

            <div class="jumbotron">
            </div>


            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Nossa Casa</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">                    
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Acesso Rápido <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/pdv">Controle de Comandas</a></li>
                                    <li><a href="/balcao">Venda Avulsa</a></li>
                                    <li><a href="/cliente">Clientes</a></li>
                                    <li><a href="/fornecedor">Fornecedores</a></li>
                                    <li><a href="/produto">Produtos</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="/fluxocaixa">Fluxo de Caixa</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Relatórios</a></li>
                                </ul>
                            </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="btn"><h2 id="relogio">00:00:00</h2></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>



            <div class="col-md-3">
                {<block name="menu">}
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h2 class="panel-title">Cadastros</h2>
                    </div>   
                    <div class="panel-body">
                        <div class="list-group">


                            <a href="/" class="list-group-item glyphicon glyphicon-home">
                                Inicio
                            </a>
                            <a href="/cliente" class="list-group-item glyphicon glyphicon-globe">
                                Clientes
                            </a>

                            <a href="/fornecedor" class="list-group-item glyphicon glyphicon-bishop">
                                Fornecedores
                            </a>
                            <a href="/estoque" class="list-group-item glyphicon glyphicon-export">
                                Estoque
                            </a>
                            <a href="/unidade" class="list-group-item glyphicon glyphicon-export">
                                Unidades
                            </a>
                            <a href="/produto" class="list-group-item glyphicon glyphicon-paperclip">
                                Produtos
                            </a>
                            </a>
                            <a href="/banco" class="list-group-item glyphicon glyphicon-console">
                                Bancos
                            </a>
                            <a href="/cartao" class="list-group-item glyphicon glyphicon-console">
                                Cartões
                            </a>


                        </div>

                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Operações</h2>
                    </div>
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="/pdv" class="list-group-item glyphicon glyphicon-console">
                                Comandas
                            </a>
                            <a href="/balcao" class="list-group-item glyphicon glyphicon-console">
                                Venda avulsa
                            </a>
                            <a href="/fluxocaixa/saida" class="list-group-item glyphicon glyphicon-console">
                                Retirada/Saída
                            </a>
                        </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Relatórios</h2>
                    </div>
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="/fluxocaixa" class="list-group-item glyphicon glyphicon-console">
                                Fluxo de caixa
                            </a>
                        </div>
                    </div>
                </div>

                {</block>}
            </div>

            <div class="col-md-9">
                {<block name="conteudo">}

                {</block>}

            </div>




        </div>

        <div class="footer">

        </div>
    </body>

</html>