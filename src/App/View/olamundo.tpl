
<section>

<header>
  <hgroup>
     <h1>Olá Mundo</h1>
     <h2>Aplicativo exemplo</h2>
  </hgroup>
</header>

<article>
   <p class="text-info">
      {$data["flashmsg"]}
  </p>

<form method="post" action="/olamundo/submit" class="form-horizontal">

<input type="number" name="codigo" id="codigo" class="form-control" />
<input type="text" name="nome" id="nome" class="form-control"  />
<input type="email" name="email" id="email" class="form-control"  />

<button type="submit">Salvar</button>

</form>

<table class="table table-bordered">

<thead>
   <tr>
        <td>Código</th> 
        <th>Nome</th>
        <th>E-mail</th> 
  </tr>
</thead>
<tbody>

    %-- foreach ( $data["arr_data"] as $exemplo ) : --%
            <tr>
              <td>{$exemplo->id}</td>
              <td>{$exemplo->nome}</td>
              <td>{$exemplo->email}</td>
            </tr>  
    %-- endforeach --%
</tbody>
<tfoot></tfoot>

</table>
</article>

<footer></footer>

</section>
