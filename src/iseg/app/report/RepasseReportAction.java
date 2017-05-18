package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Periodo;

public class RepasseReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;
	
	private Periodo periodoDoLancamento;
	private Periodo periodoDoPagamento;
	private Integer situacao;
	private Boolean imprimirRecibo;
	private Boolean imprimirPrevisaoRepasse;


	public RepasseReportAction(PropostaService service) {
		super(service);
	}

	public String execute(){

		super.addParameterIfNotNull("IMPRIMIR_RECIBO", imprimirRecibo);
		super.addParameterIfNotNull("SITUACAO_COMISSAO", situacao);
		
		if(periodoDoLancamento != null){
			if (this.getImprimirPrevisaoRepasse() != null && this.getImprimirPrevisaoRepasse()) {
				super.addParameterIfNotNull("periodoDoInicioDaVigencia", periodoDoLancamento.toString());
				super.addParameterIfNotNull("INICIO_INICIO_VIGENCIA", periodoDoLancamento.getInicio());
				super.addParameterIfNotNull("FIM_INICIO_VIGENCIA", periodoDoLancamento.getFim());
			} else {
				super.addParameterIfNotNull("periodoDoLancamento", periodoDoLancamento.toString());
				super.addParameterIfNotNull("INICIO_DATA_LANCAMENTO", periodoDoLancamento.getInicio());
				super.addParameterIfNotNull("FIM_DATA_LANCAMENTO", periodoDoLancamento.getFim());
			}
		}
		
		if(periodoDoPagamento != null){
			if (this.getImprimirPrevisaoRepasse() != null && this.getImprimirPrevisaoRepasse()) {
				super.addParameterIfNotNull("periodoDoInicioDaVigencia", periodoDoLancamento.toString());
				super.addParameterIfNotNull("INICIO_INICIO_VIGENCIA", periodoDoLancamento.getInicio());
				super.addParameterIfNotNull("FIM_INICIO_VIGENCIA", periodoDoLancamento.getFim());
			} else {
				super.addParameterIfNotNull("periodoDoPagamento", periodoDoPagamento.toString());
				super.addParameterIfNotNull("INICIO_DATA_PAGAMENTO", periodoDoPagamento.getInicio());
				super.addParameterIfNotNull("FIM_DATA_PAGAMENTO", periodoDoPagamento.getFim());
			}
		}

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
			if (this.getImprimirPrevisaoRepasse() != null && this.getImprimirPrevisaoRepasse()) {
				jasperName = "/WEB-INF/report/RelExtratoRepassePrevisao.jasper";
			} else {
				jasperName = "/WEB-INF/report/RelExtratoRepasse.jasper";
			}
		}
		return jasperName;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Boolean getImprimirRecibo() {
		return imprimirRecibo;
	}

	public void setImprimirRecibo(Boolean imprimirRecibo) {
		this.imprimirRecibo = imprimirRecibo;
	}

	public Periodo getPeriodoDoPagamento() {
		return periodoDoPagamento;
	}

	public void setPeriodoDoPagamento(Periodo periodoDoPagamento) {
		this.periodoDoPagamento = periodoDoPagamento;
	}
	
	public Periodo getPeriodoDoLancamento() {
		return periodoDoLancamento;
	}

	public void setPeriodoDoLancamento(Periodo periodoDoLancamento) {
		this.periodoDoLancamento = periodoDoLancamento;
	}

	public Boolean getImprimirPrevisaoRepasse() {
		return imprimirPrevisaoRepasse;
	}

	public void setImprimirPrevisaoRepasse(Boolean imprimirPrevisaoRepasse) {
		this.imprimirPrevisaoRepasse = imprimirPrevisaoRepasse;
	}


}