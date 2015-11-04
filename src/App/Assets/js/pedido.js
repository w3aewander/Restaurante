/**
 * pedido.js
 */

function enviarPedido(){
   
   $.ajax({
       
      type: 'POST',
      url: '/pedido/submit',
      data: {
                nome:$("#nome").val(),
                preferencia:$("#preferencia").val(),
                obs:$("#obs").val(),
                endereco:$("#endereco").val(),
                qtde:$("#qtde").val(),
                tipo_marmitext:$("#tipo_marmitext").val() 
            },
      dataType: 'json',
      success: function(){
          return true;
      },
      error: function(s,e,x){
          alert('Não foi possível salvar o pedido.:' + x);
      }
      
   });
   
   return false;
}