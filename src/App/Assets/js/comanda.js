function addConsumo() {
    
    var comanda_id = $("#comanda_id").val();
    var produto_id = $("#produto_id").val();
    var qtde = $("#qtde").val();

    $.ajax({
        url: "/comanda/registrarconsumo",
        type: "POST",
        data: {comanda_id: comanda_id, produto_id: produto_id, qtde: qtde},
        success: function (data) {

        },
        error: function () {
            alert("Erro ao tentar registrar consumo.");
        }
    });
}

function addComanda() {

    var comanda_id = $("#comanda_id").val();
    var mesa_id = $("#mesa_id").val();


    $.ajax({
       
        url: '/comanda/incluir',
        type: 'POST',
        
        data: {
            comanda_id: comanda_id,
            mesa_id: mesa_id
        },
        
        success: function (data) {
            alert(data);
        },
        
        error: function (jqXHR,x,y) {
            if (jqXHR.status && jqXHR.status === 400) {
                alert(jqXHR.responseText);
            } else {
                alert("Erro..." + y);
            }
        },
        complete: function(){
            alert('Requisição enviada.');
        }

    });


}
