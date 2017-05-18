package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Periodo;

import java.math.BigDecimal;

import com.opensymphony.xwork2.Action;


public class ComissoesAReceberERecebidasReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;

	private Periodo periodoDoLancamento;
	private Periodo periodoDoPagamento;
	private String ignorarDiferenca;
	private Double valorComissaoReceber;

	public ComissoesAReceberERecebidasReportAction(PropostaService service) {
		super(service);
	}

	public String relatorio(){
		return Action.SUCCESS;
	}
	
	public String execute(){
		this.setQuebra(null);
		this.setOrdem("data_pagamento");

		if(periodoDoLancamento != null){
			super.addParameterIfNotNull("periodoDoLancamento", periodoDoLancamento.toString());
			super.addParameterIfNotNull("INICIO_DATA_LANCAMENTO", periodoDoLancamento.getInicio());
			super.addParameterIfNotNull("FIM_DATA_LANCAMENTO", periodoDoLancamento.getFim());
		}
		if(periodoDoPagamento != null){
			super.addParameterIfNotNull("periodoDoPagamento", periodoDoPagamento.toString());
			super.addParameterIfNotNull("INICIO_INICIO_RECEBIMENTO", periodoDoPagamento.getInicio());
			super.addParameterIfNotNull("FIM_INICIO_RECEBIMENTO", periodoDoPagamento.getFim());
		}
		if(this.valorComissaoReceber != null){
			super.addParameterIfNotNull("IGNORAR_DIFERENCA", " WHERE valorDeComissaoAReceber ".concat(this.ignorarDiferenca).concat(" ").concat(this.valorComissaoReceber.toString()));
		}

		return super.execute();
	}

	public String getSubReportItens(){
		return "";
	}

	public String getJasperName(){
		String jasperName = "";
		jasperName = "/WEB-INF/report/RelComissoesAReceberERecebidas.jasper";
		return jasperName;
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

	public String getIgnorarDiferenca() {
		return ignorarDiferenca;
	}

	public void setIgnorarDiferenca(String ignorarDiferenca) {
		this.ignorarDiferenca = ignorarDiferenca;
	}

	public Double getValorComissaoReceber() {
		return valorComissaoReceber;
	}

	public void setValorComissaoReceber(Double valorComissaoReceber) {
		this.valorComissaoReceber = valorComissaoReceber;
	}
	
}