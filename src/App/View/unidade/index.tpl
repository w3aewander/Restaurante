{<extends file="template_default.tpl">}

{<block name="header">}
<script>
    listar();
    function limparForm() {
        $("#id").val("0");
        $("#nome").val("");
        $("#sigla").val("");
    }
    function salvar() {
        $.post('/unidade/salvar',
                {
                    id: $("#id").val(),
                    nome: $("#nome").val(),
                    sigla: $("#sigla").val()
                },
        function (data, status) {
            $("#flashmsg").text("Registro salvo com sucesso.");
            listar();
            setTimeout(function () {
                $("#flashmsg").text("");
            }, 3000);
        });
    }

    function listar() {
        $('tbody').empty();
        $.getJSON('/unidade/listar', function (data) {
            $.each(data, function (k, v) {
                $('tbody').append('<tr><td>' + v.id + '</td><td>' + v.nome + '</td><td>' + v.sigla + '</td><td class="btn btn-sm glyphicon glyphicon-edit" onclick="exibir(' + v.id + ');"></td><tr>');
            });
        });
    }

    function exibir(id) {
        $.getJSON('/unidade/exibir/' + id, function(data){
            $("#id").val(data.id);
            $("#nome").val(data.nome);
            $("#sigla").val(data.sigla);
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

        <div class="control-group">
            <label for="id" class="label-control">Código:</label>
            <input type="text" name="id" id="id" readonly="reaonly" value="0" placeholder="0" class="input-sm control" />
        </div>
        <div class="control-group">
            <label for="nome" class="label-control">Nome da Unidade:</label>
            <input type="text" name="nome" id="nome"  placeholder="nome da unidade" class="input-sm control" size="50"/>
        </div>
        <div class="control-group">
            <label for="sigla" class="label-control">Sigla/Abreviação:</label>
            <input type="text" name="sigla" id="sigla" placeholder="sigla ou abreviação"  class="input-sm control" />
        </div>
    </div>
    <div class="panel-footer">
        <div class="btn-group">
                        <div class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></div>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>  
        </div>

    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">Listagem de unidades</h2>
    </div>
    <div class="panel-body">
        <table class="table table-bordered tab-content table-striped">
            <thead>
                <tr>
                    <th width="50">Codigo</th>
                    <th>Nome</th>
                    <th width="150">Sigla</th>
                    <th align="center" class="glyphicon glyphicon-cog"></th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
            <h2 class="text-info" id="total_registros"></h2>    
            </tfoot>
        </table>
    </div>
    <div class="panel-footer">

    </div>
</div>

{</block>}