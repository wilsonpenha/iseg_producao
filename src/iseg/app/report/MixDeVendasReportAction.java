package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.TipoDeRelatorio;
import iseg.app.model.TipoDeRelatorioDeMixDeVendas;

import com.opensymphony.xwork2.Action;

public class MixDeVendasReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;
	private TipoDeRelatorioDeMixDeVendas tipoDeRelatorio;

	public MixDeVendasReportAction(PropostaService service) {
		super(service);
	}

	/**
	 * Ações do controle 
	 **/
	public String execute(){
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
		if (!this.isQuebraCorretora()){
			String report = getTipoDeRelatorio().getNomeDoArquivoDoRelatorio();
			report = report.substring(0,report.indexOf("."))+"SemCorretora.jasper";
			return "/WEB-INF/report/"+report;
		}
		return "/WEB-INF/report/"+getTipoDeRelatorio().getNomeDoArquivoDoRelatorio();
	}
	
	public String getTitulo() {
		return "Relatório de Mix de Vendas";
	}

	public TipoDeRelatorio[] getTiposDeRelatorios(){
		return TipoDeRelatorioDeMixDeVendas.values();
	}

	public TipoDeRelatorioDeMixDeVendas getTipoDeRelatorio() {
		return tipoDeRelatorio;
	}

	public void setTipoDeRelatorio(TipoDeRelatorioDeMixDeVendas tipoDeRelatorio) {
		this.tipoDeRelatorio = tipoDeRelatorio;
	}
}