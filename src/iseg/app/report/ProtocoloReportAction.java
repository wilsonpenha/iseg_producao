package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Protocolo;

public class ProtocoloReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;
	
	private Protocolo protocolo;
	
	private Integer opcao;

	public ProtocoloReportAction(PropostaService service) {
		super(service);
	}

	public String execute(){

		super.addParameterIfNotNull("PROTOCOLO_ID", this.protocolo.getId());

		return super.execute();
	}

	public String getSubReportItens(){
		return "";
	}

	public String getJasperName(){
		String jasperName = "";
		if (this.opcao == null || this.opcao.intValue() == 1) {
			jasperName = "/WEB-INF/report/RelProtocoloDePropostas.jasper";
		} else if (this.opcao.intValue() == 2) {
			jasperName = "/WEB-INF/report/ReciboEntregaApolice.jasper";
		} else {
			jasperName = "/WEB-INF/report/RelProtocoloDePropostas.jasper";
		}
		
		return jasperName;
	}

	public Protocolo getProtocolo() {
		return protocolo;
	}

	public void setProtocolo(Protocolo protocolo) {
		this.protocolo = protocolo;
	}

	public Integer getOpcao() {
		return opcao;
	}

	public void setOpcao(Integer opcao) {
		this.opcao = opcao;
	}
	
	
}