package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Corretora;
import iseg.app.model.Pessoa;
import iseg.app.model.Proposta;

import java.util.HashMap;
import java.util.Map;


public class EnvelopeReportAction extends ReportAction {
	
	private static final long serialVersionUID = 1L;
	protected PropostaService service;
	private Proposta proposta;
	private Pessoa pessoa;
	
	public EnvelopeReportAction(PropostaService service) {
		super(service);
		this.service = service;
	}
	
	public String execute(){
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("CLIENTE_ID",this.proposta.getCliente().getId());
		parameters.put("PARAMETRO_PROPOSTAID",this.proposta.getId());
		
		Corretora corretoraEmUso = (Corretora) this.getSession().get("corretoraEmUso");
		if (corretoraEmUso.getCorretora().getId().equals(374250L)) //G8 CORRETORA
			parameters.put("topmargin", 200);
		else if (corretoraEmUso.getCorretora().getId().equals(1872772L)) //NAVESA CORRETORA
			parameters.put("topmargin", 200);
		
		String pathRelatorio = "/../report/Envelope_iseg.jasper";

		return gerarReport(pathRelatorio, parameters);
	}


	public Proposta getProposta() {
		return proposta;
	}


	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}


	public Pessoa getPessoa() {
		return pessoa;
	}


	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public PropostaService getService() {
		return service;
	}

	public void setService(PropostaService service) {
		this.service = service;
	}

}
