package iseg.app.report;

import iseg.app.business.PropostaService;

import com.opensymphony.xwork2.Action;

public class ComparativoMensalReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;

	public ComparativoMensalReportAction(PropostaService service) {
		super(service);
	}

	/**
	 * Ações do controle 
	 **/
	public String execute(){
		String retorno = super.execute();
		return retorno.equals(Action.SUCCESS) ? "report" : retorno;
	}

	public String compMensalProdutor(){
		this.setIdRelatorio("1");
		return Action.SUCCESS;
	}

	public String compMensalCorretora(){
		this.setIdRelatorio("2");
		return Action.SUCCESS;
	}

	public String relatorio(){
		return Action.SUCCESS;
	}

	/**
	 * Getters and Setters
	 **/
	public String getJasperName(){
		if (this.getIdRelatorio().equals("1")){
			return "/WEB-INF/report/RelComparativoMensalProdutor.jasper";
		}else
			return "/WEB-INF/report/RelComparativoMensalCorretora.jasper";
	}
	
	public String getTitulo() {
		if (this.getIdRelatorio().equals("1")){
			return "Relatório Comparativo Mensal por Produtor";
		}else
			return "Relatório Comparativo Mensal por Corretora";
	}
}