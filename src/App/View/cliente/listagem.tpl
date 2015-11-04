{<extends file="relatorio_template.tpl">}


{<block name="body">}

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Cadastro de Clientes</div>
    </div>
    <div class="panel-body">
        <table class="table  table-striped  table-hover">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>CNPJ/CPF</th>
                    <th>Cidade</th>
                    <th>UF</th>
            </thead>
            <tbody>

                {<foreach from=$arr_clientes item=cliente  >}

                <tr style="border-bottom: 1px solid #333;">
                    <td width="150">{<$cliente->id>}</td>
                    <td align="left">{<$cliente->nome>}</td>
                    <td>{<$cliente->cpf_cnpj>}</td>
                    <td>{<$cliente->cidade>}</td>
                    <td width="5">{<$cliente->uf>}</td>
                </tr>
                {</foreach>}

            </tbody>

            <tfoot>
                <tr>
                    <th align="left" colspan="2">Total de registros: {<$total_registros>}</th>       
                </tr>
            </tfoot>
        </table>
    </div>        
</div>

{</block>}


{<block name="footer">}

{</block>}
