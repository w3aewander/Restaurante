/*****************************************************************
 * Funçao para buscar CEP nos sites do correio via Javascript
 * 
 * @author Wanderlei Silva do Carmo <wander.silva@gmail.com>
 * @version 0.1alpha
 *****************************************************************/
/**
 * 
 * @returns {json}
 */
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
