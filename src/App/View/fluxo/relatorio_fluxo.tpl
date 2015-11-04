{<extends file="relatorio_template.tpl">}


{<block name="body">}



<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">Fluxo de Caixa</div>
    </div>
    <div class="panel-body">
        <table class="table " style="width: 100%;">
            <thead>
                <tr>
                    <th>Qtde</th>
                    <th>Tipo</th>
                    <th>Motivo</th>
                    <th>Forma</th>
                    <th align="right" width="150">Valor (R$)</th>
            </thead>
            <tbody>

                {< assign var=entradas value=0 >}
                {< assign var=saidas value = 0  >}
                {< assign var=cartao value = 0  >}
                {< assign var=dinheiro value = 0  >}
                {< assign var=cheque value = 0  >}

                {<foreach from=$arr_fluxo item=fluxo  >}


                <tr style="border-bottom: 1px solid #333;">
                    {<*<td width="150">{<$fluxo->id>}</td>*>}
                    <td width="50">{<$fluxo->qtde>}</td>
                    <td align="left">{<$fluxo->tipo>}</td>
                    <td>{<$fluxo->motivo>}</td>
                    <td align="150">{<$fluxo->forma_pagto>}</td>
                    <td align="right" width="150">{<$fluxo->valor|number_format: 2>}</td>
                </tr>

                {<if  $fluxo->tipo eq "entrada" >}
                {<$entradas = $entradas + $fluxo->valor>}

                {<if $fluxo->forma_pagto eq "Dinheiro" >}
                    {<$dinheiro = $dinheiro + $fluxo->valor>}   
                {<elseif $fluxo->forma_pagto eq "Cartão">}
                    {<$cartao = $cartao + $fluxo->valor>}                           
                {<else>}
                    {<$cheque = $cheque + $fluxo->valor>} 
                {</if>}1

                {<else>}
                {<$saidas = $entradas + $fluxo->valor>}                     
                {</if>}

                {</foreach>}

            </tbody>

            <tfoot>
                <tr>
                    <th align="left"  colspan="5">&nbsp;</th>       
                </tr>
            </tfoot>
        </table>
    </div>        
</div>

{</block>}


{<block name="footer">}

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            <p class="text-info">Totalização:</p>
        </div>
    </div>
    <div class="panel-body">

        <div class="control-group">
            <span>Dinheiro: </span>
            <span>R$ {<$dinheiro|number_format: 2>}</span>
        </div>
        <div class="control-group">
            <span>Cartão: </span>
            <span>R$ {<$cartao|number_format: 2>}</span>
        </div>
        <div class="control-group">
            <span>Cheque: </span>
            <span>R$ {<$cheque|number_format: 2>}</span>
        </div>
        <div class="control-group">
            <span>Total em entradas: </span>
            <span>R$ {<$entradas|number_format: 2>}</span>
        </div>
        <div class="control-group">
            <span>Total em saídas:</span>
            <span>R$ {<$saidas|number_format: 2>}</span>
        </div>
        <div class="control-group">
            <span>Fechamento: </span>
            {<assign var="resultado" value=$entradas - $saidas>}
            {<if $resultado ge 0 >}
                <span class="text-success">R$ {<$resultado|number_format: 2>}</span>
            {<else>}
                <span class="text-danger">R$ {<$resultado|number_format: 2>}</span>
            {</if>}
        </div>
    </div>

    <div class="panel-footer">
        <h6>Total de registros: {<$total_registros>}</h6>
    </div>
</div>

{</block>}
