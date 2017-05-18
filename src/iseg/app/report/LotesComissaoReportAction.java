package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.BorderoComissao;
import iseg.app.model.Corretora;
import iseg.app.model.Endereco;

import java.util.HashMap;
import java.util.Map;


import com.opensymphony.xwork2.Action;

public class LotesComissaoReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;
	
	protected PropostaService service;
	private Map<String,Object>parameters = new HashMap<String, Object>();
	
	private BorderoComissao borderoComissao;

	private String jasperName;
	private String usuario;
	private String imagemFile;
	private String nomeCorretora;
	private String emailCorretora;
	private String dataSource = null;


	public LotesComissaoReportAction(PropostaService service) {
		super(service);
		this.service = service;
	}


	public String execute(){
		try {
			
			Corretora corretora = (Corretora)this.getUsuarioEmUso().getCorretora();
			imagemFile = corretora.getImagemLogo()==null ? "logo_iSeg.png" : corretora.getImagemLogo().equals("") ? "logo_iSeg.png" : corretora.getImagemLogo().toLowerCase();
			nomeCorretora = corretora.getNome();
			emailCorretora = corretora.getEmail();
			Endereco enderecoCorretora = (Endereco) this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaETipo", new Object[]{corretora.getId(),"C"});

			String subReportItens = "";
			
			jasperName = "/WEB-INF/report/RelLoteBaixaDeComissao.jasper";

			this.parameters.put("NOME_CORRETORA", nomeCorretora);
			this.parameters.put("ENDERECO_CORRETORA", enderecoCorretora.getEnderecoCompleto());
			this.parameters.put("EMAIL_CORRETORA", emailCorretora);
			this.parameters.put("IMAGEM_FILE", imagemFile);
			this.parameters.put("SUBREPORT_ITENS", subReportItens);

			this.borderoComissao = (BorderoComissao)this.service.find(borderoComissao);
			this.parameters.put("BORDERO_COMISSAO_ID", borderoComissao.getId());
			this.parameters.put("SEGURADORA", borderoComissao.getSeguradora().getNome());
			this.parameters.put("DATA_EXTRATO", borderoComissao.getDataDocumento());
			this.parameters.put("NRO_EXTRATO", borderoComissao.getNroExtrato());
			this.parameters.put("TOTAL_EXTRATO", borderoComissao.getValorTotal());
			
			//JasperRunManager.runReportToPdf(jasperName, parameters, getConnection());			//this.getParameters().put("PROPOSTA_ID", this.getProposta().getId());
			//JasperCompileManager.compileReportToFile("/WEB-INF/report/RelPedidoSeguro.jrxml");
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}

		return Action.SUCCESS;
	}

	public Map<String, Object> getParameters() {
		if(this.parameters == null){
			this.parameters = new HashMap<String, Object>();
		}
		return parameters;
	}

	public void setParameters(Map<String, Object> parameters) {
		this.parameters = parameters;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountProposta", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	@Override
	protected void setPObjectInstance() throws Exception {
		// TODO Auto-generated method stub
		
	}

	public String getJasperName() {
		return jasperName;
	}

	public void setJasperName(String jasperName) {
		this.jasperName = jasperName;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getImagemFile() {
		return imagemFile;
	}

	public void setImagemFile(String imagemFile) {
		this.imagemFile = imagemFile;
	}

	public String getNomeCorretora() {
		return nomeCorretora;
	}

	public void setNomeCorretora(String nomeCorretora) {
		this.nomeCorretora = nomeCorretora;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public BorderoComissao getBorderoComissao() {
		return borderoComissao;
	}

	public void setBorderoComissao(BorderoComissao borderoComissao) {
		this.borderoComissao = borderoComissao;
	}
}