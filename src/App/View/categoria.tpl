%-- use \Core\View\Form as Form --%

<link rel="stylesheet" href="/src/App/Assets/css/categoria.css" />
<script src="/src/App/Assets/js/categoria.js"></script>

<div class="container-categoria">
    <div class="well well-lg">
        <h1 class="text-info">Categorias</h1>
    </div>
    {Form::Open("form-categoria","","",["class"=>"form-horizontal"])}
        <div class="input-group">
            <label for="id">Código:</label>
            <input type="text" id="id" name="id" value="0" class="control" readonly="readonly"/>
        </div>
        <div class="input-group">
            <label for="id">Nome:</label>
            <input type="text" id="nome" name="nome" class="control"/>
        </div>
        <div class="input-group">
            <label for="id">Descrição:</label>
            <input type="text" id="descricao" name="descricao" class="control"/>
        </div>
        <div class="button-group">
            <div  class="btn btn-default glyphicon glyphicon-plus" onclick="novaCategoria();"  title="Criar uma nova categoria"></div>
            <div  class="btn btn-default glyphicon glyphicon-check" onclick="salvarCategoria();" title="Salvar categoria existente"></div>
            <div  class="btn btn-default glyphicon glyphicon-remove" onclick="excluirCategoria();" title="remover categoria"></div>
        </div>
    {Form::Close()}
 
    <div class="tbl-categoria">
        <table align="center" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th width="6" ><span class="btn btn-block btn-default">Código</span></th>
                    <th width="30"><span class="btn btn-block btn-default">Nome</span></th>
                    <th width="70"><span class="btn btn-block btn-default">Descrição</span></th>
                    <th align="center"><span class="btn  btn-block  btn-default glyphicon glyphicon-wrench"></span></th>
                </tr>
            </thead>       
            <tbody class="tbl-categoria-body">
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2">Total de registros:</th>
                    <td colspan="2"></td>
                </tr>
            </tfoot>
        </table>

    </div>
</div>