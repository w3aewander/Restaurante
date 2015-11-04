<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">

        <title>Relatório</title>

        {<block name="header">}


        <link href="/src/App/Assets/js/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="/src/App/Assets/bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>

        <script src="/src/App/Assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="/src/App/Assets/js/jquery-ui.min.js" type="text/javascript"></script>

        <link href="/src/App/Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="/src/App/Assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        {</block>}

    </head>
    <body>

        
        <div class="container">
            {<include file="relatorio_header.tpl">}
            {<block name="body">}


            {</block>}
        </div>

        {<block name="footer">}

        {</block>}

    </body>
</html>