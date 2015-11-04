<?php

namespace App\Controller;

/**
 * Executar operações com comandas
 *
 * @author wanderlei
 */
class ComandaController extends \Core\Controller\Controller {

    protected $model;
    protected $umero;
    protected $mesa;
    protected $status;
    protected $template;

    /**
     * 
     * @param type $status
     */
    public function __construct() {
        parent::__construct();

        $this->model = new \App\Model\Comanda;
    }

    /**
     * 
     */
    public function incluir() {

        $comanda_id = filter_input(INPUT_POST, 'comanda_id', FILTER_SANITIZE_NUMBER_INT);

        if ($comanda_id == 0):

            $mesa_id = filter_input(INPUT_POST, 'mesa_id', FILTER_SANITIZE_NUMBER_INT);
            $status = "aberta";
            $created_at = date('Y-m-d H:i:s');
            $updated_at = date('Y-m-d H:i:s');

            $arr_data = [
                "mesa" => $mesa_id,
                "status" => $status,
                "created_at" => $created_at,
                "updated_at" => $updated_at];

            $retval = $this->model->insert($arr_data);

        endif;

        return $retval;
    }

    /**
     * 
     */
    public function excluir() {

        $comanda_id = filter_input(INPUT_POST, 'comanda_id', FILTER_SANITIZE_NUMBER_INT);
        $mesa_id = filter_input(INPUT_POST, 'mesa_id', FILTER_SANITIZE_NUMBER_INT);

        return $this->model->excluir(sprintf(" where id='%s' and mesa = '%s'  ", $comanda_id, $mesa_id));
    }

    /**
     * 
     * @param type $comanda_id
     */
    public function exibir($comanda_id) {

        $arr_comanda = $this->model->find_one($comanda_id);
        $produtos = new \App\Model\Produto;
        $arr_produtos = $produtos->listar();

        $this->template->assign('arr_produtos', $arr_produtos);
        $this->template->assign('arr_comanda', $arr_comanda);
        $this->template->display("src/App/View/comanda/exibir.tpl");
    }

    /**
     * Fechar comanda...
     * @return type
     */
    public function receber($comanda_id) {
        $bancos = new \App\Model\Banco;
        $cartoes = new \App\Model\Cartao;

        $arr_cartoes = $cartoes->listar();
        $arr_bancos = $bancos->listar();

        $this->template->assign("arr_bancos", $arr_bancos);
        $this->template->assign("comanda_id", $comanda_id);
        $this->template->assign("valor_pagar", $this->model->totalConsumo($comanda_id));
        $this->template->display("src/App/View/comanda/fechar.tpl");
    }

    public function fechar($comanda_id) {

        $id = $comanda_id;
        $dados = $this->model->find_one($id);

        $arr_data = [
            'mesa' => $dados->mesa,
            'status' => 'fechada',
            'updated_at' => date('Y-m-d H:i:s')
        ];
        return $this->model->save($id, $arr_data);
    }

    public function listar($status = "aberta") {
        return $this->model->listar($status);
    }

    public function imprimir($comanda_id) {

        $consumo = new \App\Model\Consumo;
        $arr_consumo = $consumo->listar($comanda_id);

        $pdf = new \mPDF("utf-8");
        $pdf->SetHeader('{DATE j-m-Y}|WFW-Restaurante Nossa Casa|{PAGENO}/{nbpg}');
        $pdf->setTitle("Relatório de Fluxo de Caixa");
        $pdf->SetFooter("Impresso com mPdf");

        if ($arr_consumo):
            $this->template->assign("arr_consumo", $arr_consumo);
            $this->template->assign("data_referencia", $arr_consumo[0]->created_at);

            $this->template->assign("comanda_id", $comanda_id);

            $pdf->SetTitle("Consumo Comanda " . $comanda_id);

            $tpl = $this->template->fetch("comanda/comanda.tpl");



            $pdf->WriteHTML($tpl);

        else:

            $pdf->WriteHTML("<h2 class='text-info'>Não há consumo registrado para esta comanda</h2>");

        endif;

        $pdf->SetDisplayMode('fullpage', 'two');
        $pdf->Output();
    }

}
