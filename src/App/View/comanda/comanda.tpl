{<extends file="relatorio_template.tpl">}

{<block name="body">}

<div class="panel panel-default" style="padding: 20px;">

    <div class="panel-heading">
        <div class="panel-title">
            <div class="text-info">COMANDA {<$comanda_id>}</div>
        </div>
    </div>    
    <div class="panel-body">
        <table  class="table table-striped" cellpadding="4" colspacing="3" cellspacing="4">
            <thead>
                <tr>
                    <th width="50">Item</th>
                    <th width="400">Produto</th>
                    <th width="100">Unidade</th>
                    <th width="100" align="right">Qtde</th>
                    <th width="100" align="right">V.Unitário</th>
                    <th width="150" align="right">Valor</th>
                </tr>
            </thead>
            <tbody>

                {<assign var="valor_total" value="0">}

                {<foreach from=$arr_consumo item=consumo>}
                <tr>
                    <td>{<$consumo->id>}</td>
                    <td>{<$consumo->produto|upper>}</td>
                    <td>{<$consumo->unidade|upper>}</td>
                    <td align="right">{<$consumo->qtde>}</td>
                    <td align="right">{<$consumo->valor_unitario|number_format: 2>}</td>
                    <td align="right">{<$consumo->valor|number_format: 2>}</td>
                </tr>

                {<$valor_total = $valor_total + $consumo->valor>}

                {</foreach>}

                {<$linhas_em_branco=20 - $consumo|count>}
                {<section name=i loop=$linhas_em_branco>}
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

                {</section>}

            </tbody>
            <tfoot>
                <tr style="border-bottom: 1px solid #ccc;">
                    <th align="right" colspan="5">Total:</th>
                    <th align="right">{<$valor_total|number_format: 2>}</th>
                </tr>
            </tfoot>

        </table>
    </div>
</div>
{</block>}