package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Periodo;
import iseg.app.model.TipoDeQuebraDeRelatorio;

public class ComissoesReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;

	private Periodo periodoDoLancamento;
	private Periodo periodoDoPagamento;
	private Integer situacao;
	private Integer natureza;

	public ComissoesReportAction(PropostaService service) {
		super(service);
	}

	public String execute(){

		this.setQuebra(TipoDeQuebraDeRelatorio.POR_SEGURADORA);
		this.setOrdem("data_pagamento");

		if(periodoDoLancamento != null){
			super.addParameterIfNotNull("INICIO_DATA_LANCAMENTO", periodoDoLancamento.getInicio());
			super.addParameterIfNotNull("FIM_DATA_LANCAMENTO", periodoDoLancamento.getFim());
		}
		if(periodoDoPagamento != null){
			super.addParameterIfNotNull("periodoDoPagamento", periodoDoPagamento.toString());
			super.addParameterIfNotNull("INICIO_DATA_PAGAMENTO", periodoDoPagamento.getInicio());
			super.addParameterIfNotNull("FIM_DATA_PAGAMENTO", periodoDoPagamento.getFim());
		}
		super.addParameterIfNotNull("SITUACAO_COMISSAO", situacao);
		super.addParameterIfNotNull("NATUREZA_LANCAMENTO", natureza);

		return super.execute();
	}

	public String getSubReportItens(){
		return "";
	}

	public String getJasperName(){
		String jasperName = "";
		if(this.getIdRelatorio().equals("1")){
			jasperName = "/WEB-INF/report/RelComissoesDetalhada.jasper";
		}else if(this.getIdRelatorio().equals("2")){
			jasperName = "/WEB-INF/report/RelMovimentoDeComissoes.jasper";
		}else if(this.getIdRelatorio().equals("3")){
			jasperName = "/WEB-INF/report/RelExtratoRepasse.jasper";
		}
		return jasperName;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Integer getNatureza() {
		return natureza;
	}

	public void setNatureza(Integer natureza) {
		this.natureza = natureza;
	}

	public Periodo getPeriodoDoLancamento() {
		return periodoDoLancamento;
	}

	public void setPeriodoDoLancamento(Periodo periodoDoLancamento) {
		this.periodoDoLancamento = periodoDoLancamento;
	}

	public Periodo getPeriodoDoPagamento() {
		return periodoDoPagamento;
	}

	public void setPeriodoDoPagamento(Periodo periodoDoPagamento) {
		this.periodoDoPagamento = periodoDoPagamento;
	}
}