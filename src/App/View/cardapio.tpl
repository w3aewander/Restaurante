

<div class="container-cardapio">
    <section>

        <header class="well well-lg">
            <hgroup>
                <h1 class="text-info">Cardápio Semanal</h1>
                <h2>Self Service</h2>
            </hgroup>
        </header>
        <article>
            <p>Várias opções de acompanhamento, frios e sobremesas.</p>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="30" align="right">Referência</th>
                        <th>Descrição</th>
                    </tr>
                </thead>
                <tbody>

                    %-- foreach ($cardapio as $p): --%
                        <tr><td><?= $p->id; ?></td><td>{$p->descricao}</td></tr>
                    %-- endforeach; --%

                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </article>
        <footer></footer>
    </section>

</div>