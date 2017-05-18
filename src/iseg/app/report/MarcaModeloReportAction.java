package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Fabricante;
import iseg.app.model.VeiculoModelo;

import com.opensymphony.xwork2.Action;

public class MarcaModeloReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;

	private Fabricante fabricante;
	private VeiculoModelo modelo;

	public MarcaModeloReportAction(PropostaService service) {
		super(service);
	}

	public String relatorio(){
		return Action.SUCCESS;
	}
	
	public String execute(){

		//this.setQuebra(null);
		this.setOrdem("cliente_nome");
		
		if (fabricante != null) {
			super.addParameterIfNotNull("MARCA_ID", fabricante.getId());
			super.addParameterIfNotNull("MARCA_NOME", fabricante.getNome());
		}
		
		if (modelo != null) {
			super.addParameterIfNotNull("MODELO", modelo.getDescricao());
		}

		return super.execute();
	}

	public String getSubReportItens(){
		return "";
	}
	
	public String getTitulo() {
		return "Relatório de Marcas e Modelos";
	}

	public String getJasperName(){
		String jasperName = "";
		jasperName = "/WEB-INF/report/RelMarcasModelos.jasper";
		return jasperName;
	}
	
	public Fabricante getFabricante() {
		return fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

	public VeiculoModelo getModelo() {
		return modelo;
	}

	public void setModelo(VeiculoModelo modelo) {
		this.modelo = modelo;
	}
	

}