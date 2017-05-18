package iseg.app.report;

import iseg.app.business.PropostaService;

import com.opensymphony.xwork2.Action;

public class ApoliceParaRenovacaoReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;
	private Long situacaoOperacional;

	public Long getSituacaoOperacional() {
		return situacaoOperacional;
	}

	public void setSituacaoOperacional(Long situacaoOperacional) {
		this.situacaoOperacional = situacaoOperacional;
	}

	public ApoliceParaRenovacaoReportAction(PropostaService service) {
		super(service);
	}

	/**
	 * Ações do controle 
	 **/
	public String execute(){
		super.addParameterIfNotNull("SITUACAO_PROPOSTA", this.getSituacaoOperacional());
		String retorno = super.execute();
		return retorno.equals(Action.SUCCESS) ? "report" : retorno;
	}

	public String relatorio(){
		return Action.SUCCESS;
	}

	/**
	 * Getters and Setters
	 **/
	public String getJasperName(){
		if (this.isDetalhado==0 || this.isDetalhado==1)
			return "/WEB-INF/report/RelListagemRenovacoesDetalhado.jasper";
		else
			return "/WEB-INF/report/RelListagemRenovacoesModelo2.jasper";
	}

	public String getTitulo() {
		return "Relatório Apólice para Renovação";
	}
}