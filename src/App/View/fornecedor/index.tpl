{<extends file="template_default.tpl">}
{<block name="header">}
<style>
    textarea{
        background-color: transparent;
        border: 1px solid #000000;
    }
    .form-label{
        width: 110px;
    }
</style>
<script type="text/javascript">
    {<literal>}
        listar();
        function limparForm() {
            $("#fornecedor_id").val("0");
            $("#cpf_cnpj").val("");
            $("#razao").val("");
            $("#fantasia").val("");
            $("#cep").val("");
            $("#endereco").val("");
            $("#bairro").val("");
            $("#cidade").val("");
            $("#contato").val("");
            $("#telefone").val("");
            $("#celular").val("");
            $("#email").val("");
            $("#site").val("");
            $("#obs").val("");
            $("#uf").val("");
        }
        function editar(id) {
            $.ajax({
                url: '/fornecedor/exibir/' + id,
                type: 'GET',
                success: function (data) {
                    var json = $.parseJSON(data);
                    $("#fornecedor_id").val(json[0].fornecedor_id);
                    $("#cpf_cnpj").val(json[0].cpf_cnpj);
                    $("#razao").val(json[0].razao);
                    $("#fantasia").val(json[0].fantasia);
                    $("#cep").val(json[0].cep);
                    $("#endereco").val(json[0].endereco);
                    $("#bairro").val(json[0].bairro);
                    $("#cidade").val(json[0].cidade);
                    $("#contato").val(json[0].contato);
                    $("#telefone").val(json[0].telefone);
                    $("#celular").val(json[0].celular);
                    $("#email").val(json[0].email);
                    $("#site").val(json[0].site);
                    $("#obs").val(json[0].obs);
                    $("#uf").val(json[0].uf);
                },
                error: function (error) {

                }
            });
            return false;
        }
        function salvar() {

            if ($("#cpf_cnpj").val() === "" || $("#razao").val() === "") {
                alert("Você deve informar pelo menos CPF/CNPJ e a razão social do fornecedor.");
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/fornecedor/salvar',
                dataType: 'json',
                data: {
                    beforeSend: function () {
                        $("#flashmsg").text("Enviando requisição.");
                    },
                    fornecedor_id: parseInt($("#fornecedor_id").val()),
                    cpf_cnpj: $("#cpf_cnpj").val(),
                    razao: $("#razao").val(),
                    fantasia: $("#fantasia").val(),
                    cep: $("#cep").val(),
                    endereco: $("#endereco").val(),
                    bairro: $("#bairro").val(),
                    cidade: $("#cidade").val(),
                    contato: $("#contato").val(),
                    telefone: $("#telefone").val(),
                    celular: $("#celular").val(),
                    email: $("#email").val(),
                    site: $("#site").val(),
                    obs: $("#obs").val(),
                    uf: $("#uf").val()
                },
                success: function (data) {
                    if (data) {
                        $("#flashmsg").text("Registro salvo com sucesso.");
                        limparForm();
                        setTimeout(function () {
                            $("#flashmsg").text("");
                        }, 3000);
                    }
                },
                error: function (erro) {
                    alert(erro.responseText);
                },
                complete: function () {
                    listar();
                }

            });
            return false;
        }
        function listar() {
            $.ajax({
                beforeSend: function () {
                    $('tbody').empty();
                },
                url: '/fornecedor/listar',
                type: 'GET',
                success: function (data) {
                    var json = $.parseJSON(data);
                    for (var i = 0; i < json.length; ++i)
                    {

                        $('tbody').append('<tr><td>' + json[i].id + '</td><td>' + json[i].razao + '</td><td>' + json[i].fantasia + '</td><td>' + json[i].cpf_cnpj + '</td><td>' + json[i].bairro + '</td><td>' + json[i].cidade + '</td><td>' + json[i].uf + '</td><td class="btn glyphicon glyphicon-edit" onclick="editar(' + json[i].id + ');"></td></tr>');
                    }

                    $('#total_registros').text(json.length);
                },
                error: function (error) {

                }
            });
            return false;
        }


        function buscarCep() {

            var cep = $("#cep").val();
            $.ajax({
                url: 'https://viacep.com.br/ws/' + cep + '/json/',
                dataType: 'jsonp',
                success: function (dados) {
                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#endereco").val(dados.logradouro);
                        $("#bairro").val(dados.bairro);
                        $("#cidade").val(dados.localidade);
                        $("#uf").val(dados.uf);
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        alert("CEP não encontrado.");
                    }
                }

            });
            return false;
        }
    {</literal>}

</script>

{</block>}


{<block name="conteudo">}


<div class="panel panel-default">

    <div class="panel-heading">
        <div class="panel-title">
            <h2 class="panel-title">{<$subtitulo>}</h2>
        </div>
    </div>
    <div id="flashmsg" class="text-danger">

    </div>
    <div class="panel-body">
        <div class="controls">
            <div class="control-group">
                <label for="fornecedor_id" class="form-label">Código:</label>
                <input type="number" id="fornecedor_id" name="fornecedor_id"  min="0"  value="0" class="control" readonly="readonly" />
            </div>
            <div class="control-group">
                <label for="cpf_cnpj" class="form-label">CPF/CNPJ:</label>
                <input type="text" id="cpf_cnpj" name="cpf_cnpj" class="control" size="50" />                      
            </div>
            <div class="control-group">
                <label for="razao" class="form-label">Razao Social:</label>
                <input type="text" id="razao" name="razao" class="control" size="50" />                      
            </div>
            <div class="control-group">
                <label for="fantasia" class="form-label">Fantasia:</label>
                <input type="text" id="fantasia" name="fantasia" class="control" size="50" />                      
            </div>
            <div class="control-group">
                <label for="cep" class="form-label">CEP:</label>
                <input type="text" id="cep" name="cep" class="control" />
                <span class="btn btn-sm btn-success glyphicon glyphicon-check" onclick="buscarCep();"></span>

            </div>
            <div class="control-group">
                <label for="endereco" class="form-label">Endereco:</label>
                <input type="text" id="endereco" name="endereco" class="control" size="50" />
            </div>
            <div class="control-group">
                <label for="bairro" class="form-label">Bairro:</label>
                <input type="text" id="bairro" name="bairro" class="control" />
            </div>
            <div class="control-group">
                <label for="cidade" class="form-label">Cidade:</label>
                <input type="text" id="cidade" name="cidade" class="control" />
            </div>
            <div class="control-group">
                <label for="uf" class="form-label">Estado:</label>
                <select name="uf" id="uf" class="control">
                    <option selected="">Selection um Estado</option>
                    <option value="ES">Espirito Santo</option>
                    <option value="SP">São Paulo</option>
                    <option value="RJ">Rio de Janeiro</option>
                    <option value="MG">Minas Gerais</option>
                </select>
            </div>
            <div class="control-group">
                <label for="contato" class="form-label">Contato:</label>
                <input type="text" id="contato" name="contato" class="control" />
            </div>
            <div class="control-group">
                <label for="telefone" class="form-label">Telefone:</label>
                <input type="text" id="telefone" name="telefone" class="control" />
                <label for="celular" class="form-label">Celular:</label>
                <input type="text" id="celular" name="celular" class="control" />
            </div>
            <div class="control-group">
                <label for="email" class="form-label">E-mail:</label>
                <input type="email" id="email" name="email" size="60" class="control" />
            </div>
            <div class="control-group">
                <label for="site" class="form-label">Site:</label>
                <input type="text" id="site" name="site" size="60" class="control" />
            </div>

            <div class="panel"> 
                <label>Informações adicionais:</label><br />
                <textarea name="obs" id="obs" cols="60" rows="5">
                    Informações adicionais aqui.
                </textarea>
            </div>
        </div>
    </div>
</div>
<div class="panel-footer">
    <div class="btn-group">
        <div class="input-group">
                        <div class="btn btn-default glyphicon glyphicon-new-window" title="Novo" onclick="limparForm();"></div>
                        <button class="btn btn-default glyphicon glyphicon-floppy-save" title="Salvar" onclick="salvar();"></button>
                        <button class="btn btn-default glyphicon glyphicon-list-alt" title="Atualizar visualização" onclick="listar();"></button>  
        </div>
    </div>

</div>

<div class="panel panel-default">
    <div class="panel-heading">
        Total de registros: <span id="total_registros"></span>
    </div>

</div>
<div class="panel-body tbl_fornecedor">
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th width="70">Código</th>
                <th width="300">Razao</th>
                <th width="300">Fantasia</th>
                <th>CPF/CNPJ</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>UF</th>
                <th><span class="glyphicon glyphicon-grain"></span></th>
            </tr>
        </thead>
        <tbody>
        <div id="fornecedor_tbody">

        </div>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="8">&nbsp;</th>                            
            </tr>
        </tfoot>
    </table>
</div>
<div class="panel-footer">
    <span>Status:</span>
</div>
</div>

{</block>}