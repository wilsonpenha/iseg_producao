package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.TipoDeRelatorio;
import iseg.app.model.TipoDeRelatorioDeRankingDeVendas;

import com.opensymphony.xwork2.Action;

public class RankingReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;
	private TipoDeRelatorioDeRankingDeVendas tipoDeRelatorio;

	public RankingReportAction(PropostaService service) {
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
		if (this.isQuebraCorretora() && (getTipoDeRelatorio().toString().indexOf("RAMO")>-1 || getTipoDeRelatorio().toString().indexOf("SEGURADORA")>-1)){
			if (getTipoDeRelatorio().toString().indexOf("RAMO")>-1)
				return "/WEB-INF/report/RelRankingRamoPorCorretora.jasper";
			else
				return "/WEB-INF/report/RelRankingSeguradoraPorCorretora.jasper";
		}else
			return getTipoDeRelatorio() != null ? "/WEB-INF/report/"+getTipoDeRelatorio().getNomeDoArquivoDoRelatorio() : "";
	}
	
	public String getTitulo() {
		return "Relatório de Ranking de Vendas";
	}

	public TipoDeRelatorio[] getTiposDeRelatorios(){
		return TipoDeRelatorioDeRankingDeVendas.values();
	}

	public TipoDeRelatorioDeRankingDeVendas getTipoDeRelatorio() {
		return tipoDeRelatorio;
	}

	public void setTipoDeRelatorio(TipoDeRelatorioDeRankingDeVendas tipoDeRelatorio) {
		this.tipoDeRelatorio = tipoDeRelatorio;
	}
}