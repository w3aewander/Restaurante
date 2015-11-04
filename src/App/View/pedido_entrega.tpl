<!-- template pedido de entrega -->

%-- use Core\Presenter\Presenter as Presenter --%
%-- use Core\View\Html as Html --%
%-- use Core\View\Form as Form --%
%-- $html = new Html() --%
        
<link rel="import" href="/src/App/View/header.html" />

<div class="well well-lg">
    <h2 class='text text-info'>Pedido Entrega Número {$data['pedido']->id} </h2>
</div>

<div  class="container">
    
{Form::Open("form-pedido", "/pedido/atender", "POST",["class"=>"form-horizontal"])}

{Form::InputHidden("id", $data['pedido']->id )}
{Form::InputHidden("confirmar", false )}


{Form::Label("Data e hora do pedido:", "data_pedido", ["class" => "form-label"])}
{Form::InputText("data_pedido", Presenter::dateTimeFromDB($data['pedido']->created_at), ["class" => "form-control","readonly"=>"readonly"])}

{Form::Label("Data e hora do atendimento:", "data_entrega", ["class" => "form-label"])}

%-- if ( !is_null($data['pedido']->data_entrega )):
    $data_entrega = Presenter::dateTimeFromDB($data['pedido']->data_entrega);
else:
    $data_entrega = "__/__/____";
endif --%


{Form::InputText("data_entrega", $data_entrega , ["class" => "form-control","readonly"=>"readonly"])}

{Form::Label("Nome:", "nome")}
{Form::InputText("nome", $data['pedido']->nome, ["class" => "form-control", "readonly" => "readonly"])}

{Form::Label("Endereo:", "endereco")}
<textarea id="endereco" name="endereco" rows="5" cols="60" readonly="readonly" class="form-control">
   {$data['pedido']->endereco}
</textarea>

<div class="btn-group">

{Form::Label("Pedido:", "pedido")}
<textarea id="pedido" name="pedido" rows="5" cols="60" readonly="readonly" class="form-control">
   {$data['pedido']->pedido}
</textarea>

{Form::Submit("btnOk", "Finalizar", ["class" => "btn btn-success","onclick"=>"fecharJanela();"])}

</div>

{Form::Close()}

</div>