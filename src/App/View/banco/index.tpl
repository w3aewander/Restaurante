{<extends file="template_default.tpl">}

{<block name="header">}

<script>
    
    listar();

    function limparForm() {
        $("#id").val(0);
        $("#nome").val("");
        $("#numero").val(0);
    }

    function listar() {
        
        $('tbody').empty();

        $.getJSON('/banco/listar', function (data) {

            $.each(data, function (k, v) {
                $('tbody').append('<tr><td>' + v.id + '</td><td>' + v.nome + '</td><td>' + v.numero + '</td><td class="btn btn-sm glyphicon glyphicon-edit" onclick="exibir(' + v.id + ');"></td></tr>');
            });
            var total = data.length;
            $("#total_registros").text("Total de registros: " + total);
        });
    }

    function salvar() {
        $.post('/banco/salvar',
                {
                    id: parseInt($("#id").val()),
                    nome: $("#nome").val(),
                    numero: $("#numero").val()
                },
        function (data, status) {
            if (data) {
                $("#flashmsg").text("Registro salvo com sucesso");
                setTimeout(function () {
                    $("#flashmsg").text("");
                }, 3000);
            }
        });
        listar();
    }

    function exibir(id) {
        $.getJSON('/banco/exibir/' + id, function (data) {
            if (data) {
                $("#id").val(data.id);
                $("#nome").val(data.nome);
                $("#numero").val(data.numero);
            }
        });
    }

</script>

{</block>}

{<block name="conteudo">}
<div class="panel panel-default">

    <div class="panel-heading">
        <h2 class="panel-title">{<$subtitulo>}</h2>
    </div>
    <div class="panel-body">
        <div class="well well-lg">
            <div class="control-group">
                <label class="control-label">Código:</label>
                <input class="input-sm" type="text" id="id" name="id" value="0" readonly="readonly" /> 
            </div>

            <div class="control-group">
                <label class="control-label">Nome do banco:</label>
                <input class="input-sm" type="text" id="nome" name="nome" size="50"/> 
            </div>

            <div class="control-group">
                <label class="control-label">Número do banco:</label>
                <input class="input-sm" type="text" id="numero" name="numero" /> 
            </div>

        </div>
    </div>

    <div class="panel-footer">
        <div class="btn-group">
                        <button class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></button>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>
        </div>
    </div>    

    <div class="panel panel-default">

        <div class="panel-heading">
            <h2 class="panel-title">Listagem de Bancos Cadastrados</h2>
        </div>
        <div class="panel-body">

            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th width="50">Código</th>
                        <th>Nome</th>
                        <th width="50">Número</th>
                        <th class="glyphicon glyphicon-cog"></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

                <tfoot>
                    <tr>
                        <th colspan="3"><div class="text-info" id="total_registros"></div></th>
                    </tr>
                </tfoot>

            </table>

        </div>

        <div class="panel-footer">

        </div>    
    </div>

</div>
{</block>}