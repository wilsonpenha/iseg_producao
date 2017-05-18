package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Corretora;
import iseg.app.model.Endereco;
import iseg.app.model.Proposta;

import org.apache.commons.lang.StringUtils;


import com.opensymphony.xwork2.Action;

public class PropostaReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;

	private PropostaService service;
	private String jasperName;
	private Boolean isFrota;
	private Boolean printInclusaoVeiculo;
	private Boolean printExclusoesVeiculo;
	private Boolean printVeiculoInalterado;

	public PropostaReportAction(PropostaService service) {
		super(service);
		this.service = service;
	}

	public String execute() {

		try{
			Corretora corretora = this.getCorretoraEmUso();
			Endereco enderecoCorretora = (Endereco) this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaETipo", new Object[]{corretora.getId(),"C"});
			Proposta proposta = (Proposta)this.service.find(this.getProposta());

			addParameter("PROPOSTA_ID", this.getProposta().getId());
			addParameter("POSSUI_PERFIL", proposta.getBlnPossuiPerfil());
			addParameter("NOME_CORRETORA", corretora.getNome());
			if (enderecoCorretora != null)
				addParameter("ENDERECO_CORRETORA", enderecoCorretora.getEnderecoCompleto()+"/"+corretora.getTelefones());
			else
				addParameter("ENDERECO_CORRETORA", "N/I");

			addParameter("EMAIL_CORRETORA", corretora.getEmail());
			addParameter("IMAGEM_FILE", StringUtils.isNotBlank(corretora.getImagemLogo()) ? corretora.getImagemLogo().toLowerCase() : "logo_iSeg.png");
			addParameter("IMAGEM_DIR", "../../common/images/");
			addParameter("SUBREPORT_DIR", "/../report/");
			if(isFrota != null && isFrota){
				addParameter("PRINT_INCLUSAO_VEICULO", this.printInclusaoVeiculo);
				addParameter("PRINT_EXCLUSOES_VEICULO", this.printExclusoesVeiculo);
				addParameter("PRINT_VEICULO_INALTERADO", this.printVeiculoInalterado);
				jasperName = "/WEB-INF/report/RelPedidoSeguroAutoFrota.jasper";
			}else{
				jasperName = "/WEB-INF/report/RelPedidoSeguroAuto.jasper";
			}
			/*parameters.put("SUBREPORT_ITENS", "/../report/");
			parameters.put("SUBREPORT_COBERTURAS", "/../report/");
			parameters.put("SUBREPORT_SERVICOS", "/../report/");*/


		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}

		return Action.SUCCESS;
	}

	public String getJasperName() {
		return jasperName;
	}

	public void setJasperName(String jasperName) {
		this.jasperName = jasperName;
	}
	public Boolean getIsFrota() {
		return isFrota;
	}

	public void setIsFrota(Boolean isFrota) {
		this.isFrota = isFrota;
	}

	public Boolean getPrintInclusaoVeiculo() {
		return printInclusaoVeiculo;
	}

	public void setPrintInclusaoVeiculo(Boolean printInclusaoVeiculo) {
		this.printInclusaoVeiculo = printInclusaoVeiculo;
	}

	public Boolean getPrintExclusoesVeiculo() {
		return printExclusoesVeiculo;
	}

	public void setPrintExclusoesVeiculo(Boolean printExclusoesVeiculo) {
		this.printExclusoesVeiculo = printExclusoesVeiculo;
	}

	public Boolean getPrintVeiculoInalterado() {
		return printVeiculoInalterado;
	}

	public void setPrintVeiculoInalterado(Boolean printVeiculoInalterado) {
		this.printVeiculoInalterado = printVeiculoInalterado;
	}
}