package iseg.app.action;

import iseg.app.business.OrcamentoSegAutoService;
import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.AcessoSeguradora;
import iseg.app.model.Acessorios;
import iseg.app.model.Automovel;
import iseg.app.model.AutomovelCobertura;
import iseg.app.model.AutomovelOrcAcessorios;
import iseg.app.model.AutomovelOrcamento;
import iseg.app.model.AutomovelServicos;
import iseg.app.model.BancoRelacionamento;
import iseg.app.model.Coberturas;
import iseg.app.model.CoberturasIseg;
import iseg.app.model.Condutor;
import iseg.app.model.Corretora;
import iseg.app.model.CorretoraCoberturasIseg;
import iseg.app.model.CorretoraServicosIseg;
import iseg.app.model.CrossTabRelatorio;
import iseg.app.model.DominioEsp;
import iseg.app.model.Endereco;
import iseg.app.model.Fabricante;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.Menu;
import iseg.app.model.OrcamentoBancos;
import iseg.app.model.OrcamentoCobertura;
import iseg.app.model.OrcamentoCoberturaIseg;
import iseg.app.model.OrcamentoFranquias;
import iseg.app.model.OrcamentoSeguradora;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.model.OrcamentoServicos;
import iseg.app.model.OrcamentoServicosIseg;
import iseg.app.model.ParcelasOrcamento;
import iseg.app.model.Perfil;
import iseg.app.model.PerguntasPerfil;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Produtor;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaAnexo;
import iseg.app.model.ProprietarioArrendatario;
import iseg.app.model.Ramo;
import iseg.app.model.RespostaPerfil;
import iseg.app.model.Seguradora;
import iseg.app.model.SeguradorasPreferenciais;
import iseg.app.model.Servicos;
import iseg.app.model.ServicosIseg;
import iseg.app.model.Situacao;
import iseg.app.model.TemplateMensagem;
import iseg.app.model.VeiculoModelo;
import iseg.app.persistence.PObject;
import iseg.app.webservice.client.CalculoSeguro;
import iseg.app.webservice.client.bradesco.ArrayOfEOpcionalVo;
import iseg.app.webservice.client.bradesco.ArrayOfMensagemAlertaVo;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import br.com.bradseg.paol.calculoauto.model.vo.CalculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECalculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECoberturaVo;
import br.com.bradseg.paol.calculoauto.model.vo.EOpcionalVo;
import br.com.bradseg.paol.calculoauto.model.vo.EPacoteServicoVo;
import br.com.bradseg.paol.calculoauto.model.vo.EParametroVo;
import br.com.bradseg.paol.calculoauto.model.vo.EPerfilVo;
import br.com.bradseg.paol.calculoauto.model.vo.ERenovacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.EVeiculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.MensagemAlertaVo;
import br.com.bradseg.paol.wsat.controller.services.BolCalculoAuto;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Preparable;

/**
 * @author David
 */
public class OrcamentoSegAutoAction extends OrcamentoSeguroAction implements Preparable, ServletRequestAware,ServletResponseAware {
	private static final long serialVersionUID = -8481638176160014396L;

	private Boolean isCondutorPrincipal;
	private String apoliceCancelada;
	private String seguradoProprietarioVeiculo;
	private String kitGas;
	private String financiado;
	private ProprietarioArrendatario proprietarioArrendatario;
	private List<Condutor> condutores = new ArrayList<Condutor>();
	private List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegList;
	private List<OrcamentoServicosIseg> orcamentoServicosIsegList;
	private OrcamentoCoberturaIseg orcamentoCoberturaIseg = new OrcamentoCoberturaIseg();
	private OrcamentoServicosIseg orcamentoServicosIseg = new OrcamentoServicosIseg();
	private OrcamentoSeguradora orcamentoSeguradora = new OrcamentoSeguradora(); 
	private List<RespostaPerfil> respostaPerfilList;
	private Condutor condutor;
	private Fabricante marca;
	private OrcamentoCobertura orcamentoCobertura;
	private OrcamentoServicos orcamentoServico;
	private VeiculoModelo veiculoModelo;
	private List<VeiculoModelo> modelos;
	private Long[] acessoriosId; 
	private List<OrcamentoSeguradora> orcamentoSeguradoraList = new ArrayList<OrcamentoSeguradora>();
	private OrcamentoFranquias orcamentoFranquias = new OrcamentoFranquias();
	private List<OrcamentoFranquias> orcamentoFranquiasList = new ArrayList<OrcamentoFranquias>();
	private List<ParcelasOrcamento> parcelasOrcamentoList = new ArrayList<ParcelasOrcamento>();
	private List<Coberturas> coberturasList = new ArrayList<Coberturas>();
	private List<Servicos> servicosList = new ArrayList<Servicos>();
	private Long clienteCondutorId;
	private ParcelasOrcamento parcelasOrcamento = new ParcelasOrcamento();
	private InputStream inputStream;
	private Long[] orcamentoSegId;
	private Long[] bancosRelacionamentoIds;
	private List<Produtor> corretorList = new ArrayList<Produtor>();
	private String textoEmail;
	private String emailTo;
	private String emailCC;
	private Boolean notResponse;
	private Boolean possuiCobServ;
	private TemplateMensagem templateMensagem;
	private TemplateMensagem templateSms;
	private String assuntoEmail;
	
	private HttpServletRequest request;
	
	private HttpServletResponse response;
	
	private String fileUploadContentType;
	private InputStream imageStream;
	private PropostaAnexo propostaAnexo;
	private List<PropostaAnexo>propostaAnexoList = new ArrayList<PropostaAnexo>();
	private File fileUpload;
	private String fileUploadFileName;
	
	private Double premioTotal;
	private Integer qtdeParcelas;
	private Integer qtdeParDeb;
	private Integer qtdeParCarne;
	private Integer qtdeParCred;
	private Integer qtdeParCheq;
	
	private List<Perfil> perfilList;
	private Boolean blnPossuiPerfil;
	private OrcamentoSegAutoService service;

	private Integer itemCorrente;
	private Integer itens;
	private Boolean automovelAlterado = false;
	private Boolean perfilAlterado = false;
	private Integer formaPagamento;
	private GrupoDeVenda grupoDeVenda; 
	
	// definindo como static para ser acessados por todos
	private static Hashtable<String, String> tabelaVeiculoBradesco = new Hashtable<String, String>();
	
	private CalculoVo calculoVo = null;
	private List <CalculoVo> listOfCalculoVo = new ArrayList<CalculoVo>();

	//@Autowired
	public OrcamentoSegAutoAction(OrcamentoSegAutoService service) {
		super(service);
		this.service = service;
		// Colocar esta carga em um lugar melhor
		// Usando aqui para melhor debugar
		try {
			Workbook workbook = Workbook.getWorkbook(new File("/Projetos/workspace/iseg_producao/doc/cias/bradesco/Planilha_Veiculos_MAI_2012.xls"));
			
			int c = workbook.getSheet(0).getRows();
			for (int i = 2; i <= c; i++) {
				// Coluna I = codFipe, Coluna A = codVeiculo.
				tabelaVeiculoBradesco.put(workbook.getSheet(0).getCell("I"+i).getContents(), workbook.getSheet(0).getCell("A"+i).getContents().trim());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@SkipValidation
	public String novo() {
		try {
			if(this.proposta != null && this.proposta.getId() != null){
				this.orcamentoSeguro = new OrcamentoSeguro();
				if(HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica){
					this.tipoCliente = Constants.CLIENTE_PF;
					this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
				}
				else if(HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaJuridica){
					this.tipoCliente = Constants.CLIENTE_PJ;
					this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
				}
				this.orcamentoSeguro.setProposta(this.proposta);
				this.orcamentoSeguro.setCliente(this.proposta.getCliente());
				this.orcamentoSeguro.setRamo(this.proposta.getRamo());
				this.orcamentoSeguro.setDataOrcamento(new Date());
				if(this.proposta.getPropostaAutomovelCollection() != null && !this.proposta.getPropostaAutomovelCollection().isEmpty()){
					AutomovelOrcamento automovelOrcamento = new AutomovelOrcamento();
					automovelOrcamento.setFimVigApoliceAnterior(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getFimVigApoliceAnterior());
					automovelOrcamento.setNroApoliceAnterior(this.proposta.getNroApolice());
					automovelOrcamento.setClasseBonus(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getClasseBonus());
					automovelOrcamento.setCodigoIdentificacao(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getCodigoIdentificacao());
					automovelOrcamento.setVeiculoModelo(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getModeloVeiculo());
					automovelOrcamento.setAnoFabricacao(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getAnoFabricacao());
					automovelOrcamento.setAnoModelo(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getAnoModelo());
					automovelOrcamento.setIsZeroKm(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getZeroKm() == "SIM" ? true : false);
					automovelOrcamento.setNroNf(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getNroNf());
					automovelOrcamento.setTipoCombustivel(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getTipoCombustivel());
					automovelOrcamento.setRenavan(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getRenavan());
					automovelOrcamento.setNroPlaca(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getNroPlaca());
					automovelOrcamento.setNroChassis(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getNroChassis());
					automovelOrcamento.setCorPredominante(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getCorPredominante());
					automovelOrcamento.setUsoVeiculo(this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getUsoVeiculo());
					Seguradora seguradora = (Seguradora)Util.cloneBean(this.proposta.getSeguradora(), Seguradora.class);
					automovelOrcamento.setSeguradora(seguradora);
					this.orcamentoSeguro.setAutomovelOrcamentoCollection(new ArrayList<AutomovelOrcamento>());
					this.orcamentoSeguro.getAutomovelOrcamentoCollection().add(automovelOrcamento);
				}
				return Action.SUCCESS;
			}
			this.orcamentoSeguro = new OrcamentoSeguro();
			this.orcamentoSeguro.setDataAgendamento(new Date());
			this.orcamentoSeguro.setDataOrcamento(new Date());
			this.orcamentoSeguro.setInicioVigencia(new Date());
			this.orcamentoSeguro.setDataValidade(Util.somarDiaMesAnoData(this.orcamentoSeguro.getDataOrcamento(), 5, null, null));
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 1);
			this.orcamentoSeguro.setTerminoVigencia(c.getTime());
			this.ramo = (Ramo)this.service.find(this.ramo);
			this.orcamentoSeguro.setRamo(this.ramo);
			this.orcamentoSeguro.setSituacao(new Situacao());
			this.orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_PEDIDO);
			
			this.marca = (Fabricante)this.getFabricanteList().get(0);
			this.itemCorrente = 0;
			this.getModeloVeiculoList();
			setaTemplateMensagem();
			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.ERROR;
	}

	@SkipValidation
	public String editar() {

		try{
			//Alterado por Romero em 05/01/2012 - 
			//	O método find não sobre influência do filter, permitindo que qualquer usuário autenticado 
			//	visualize uma orcamentoSeguro da base, mesmo que não pertença à sua corretora.
			//this.orcamentoSeguro = (OrcamentoSeguro)service.find(OrcamentoSeguro.class, this.pobject.getId());
			this.orcamentoSeguro = (OrcamentoSeguro)service.genericFindFirstResultByNamedQuery("getOrcamentoSeguroById", new Object[] { this.orcamentoSeguro.getId() });
			
			if (this.orcamentoSeguro == null) {
				//Posteriormente fazer a controle através de Exception
				this.pobject = null;
				return Action.SUCCESS;
			}
			
			this.pobject = this.orcamentoSeguro;
			itemCorrente = 0;
			this.setPObjectInstance();

			if(this.getOrcamentoSeguro().getCliente() != null){
				if(HibernateUtil.initializeAndUnproxy(this.getOrcamentoSeguro().getCliente()) instanceof PessoaFisica){
					this.tipoCliente = Constants.CLIENTE_PF;
				}else if(HibernateUtil.initializeAndUnproxy(this.getOrcamentoSeguro().getCliente()) instanceof PessoaJuridica){
					this.tipoCliente = Constants.CLIENTE_PJ;
				}
			}
			setaDadosCliente();
			this.orcamentoCoberturaIsegList = this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection();
			this.orcamentoServicosIsegList = this.orcamentoSeguro.getOrcamentoServicosIsegCollection();
			this.orcamentoSeguradoraList = this.orcamentoSeguro.getOrcamentoSeguradoraCollection();
			
			listaCorretorPorGrupoDeVenda();
			
			this.automovelList = this.orcamentoSeguro.getAutomovelOrcamentoCollection();
			itens = new Integer(this.automovelList.size());

			currentTab = 0;
			setaTemplateMensagem();
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void persistPObjects(){
		try {

			AutomovelOrcamento automovel = null;
			automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From AutomovelOrcamento i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});

			if (this.orcamentoSeguro.getAutomovelOrcamentoCollection() != null && !this.automovelAlterado){
				for(int i=0 ; i<this.orcamentoSeguro.getAutomovelOrcamentoCollection().size() ; i++){
					this.orcamentoSeguro.getAutomovelOrcamentoCollection().remove(i--);
				}
			}

			if(this.orcamentoSeguro.getAutomovelOrcamentoCollection() != null && this.automovelAlterado){
				for(int i=0 ; i<this.orcamentoSeguro.getAutomovelOrcamentoCollection().size() ; i++){
					automovel = this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(i);
					if(automovel == null){
						this.orcamentoSeguro.getAutomovelOrcamentoCollection().remove(i--);
					}else if (automovel.getId()==null && automovel.getOrcamentoSeguro()==null){
						if (automovelList.get(i).getId()!=null){
							this.orcamentoSeguro.getAutomovelOrcamentoCollection().set(i, automovelList.get(i));
						}
					}else{
						automovel.setOrcamentoSeguro(this.orcamentoSeguro);

						if (automovelList.size()==0)
							automovel.setLinhaVazia(true);

						if (automovelAlterado && automovel.getLinhaVazia() || (automovel.getVeiculoModelo()!=null && automovel.getVeiculoModelo().getId()!=null))
							this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(i).setLinhaVazia(false);

					}
				}
			}
		}catch (Exception ge) {
			ge.printStackTrace();
		}
	}
	
	public void setaDadosCliente(){
		if(this.getOrcamentoSeguro().getCliente() == null){
			if(this.orcamentoSeguro.getTipoPessoa() != null)
				this.tipoCliente = this.orcamentoSeguro.getTipoPessoa();
			if(this.tipoCliente != null){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					this.pessoaFisica = new PessoaFisica();
					this.pessoaFisica.setNome(this.orcamentoSeguro.getClienteNome());
					this.pessoaFisica.setCpfOuCnpj(this.orcamentoSeguro.getCpfOuCnpj());
					this.pessoaFisica.setTelefoneAlternativo(this.orcamentoSeguro.getTelefoneAlternativo());
					this.pessoaFisica.setTelefoneCelular(this.orcamentoSeguro.getTelefoneCelular());
					this.pessoaFisica.setTelefonePreferencial(this.orcamentoSeguro.getTelefonePreferencial());
					this.pessoaFisica.setEmail(this.orcamentoSeguro.getEmail());
					this.pessoaFisica.setGrupoDeVenda(this.orcamentoSeguro.getGrupoDeVenda());
					this.pessoaFisica.setReferenciaPessoal(this.orcamentoSeguro.getReferenciaPessoal());
					this.pessoaFisica.setCnh(this.orcamentoSeguro.getCnh());
					this.pessoaFisica.setData1aHabilitacao(this.orcamentoSeguro.getData1aHabilitacao());
					this.pessoaFisica.setDataNascimento(this.orcamentoSeguro.getDataNascimento());
					this.pessoaFisica.setEstadoCivil(this.orcamentoSeguro.getEstadoCivil());
					this.pessoaFisica.setSexo(this.orcamentoSeguro.getSexo());
					this.pessoaFisica.setProfissao(this.orcamentoSeguro.getProfissao());
					this.pessoaFisica.setProfissaoNome(this.orcamentoSeguro.getOutraProfissao());
				}else{
					this.pessoaJuridica = new PessoaJuridica();
					this.pessoaJuridica.setNome(this.orcamentoSeguro.getClienteNome());
					this.pessoaJuridica.setCpfOuCnpj(this.orcamentoSeguro.getCpfOuCnpj());
					this.pessoaJuridica.setTelefoneAlternativo(this.orcamentoSeguro.getTelefoneAlternativo());
					this.pessoaJuridica.setTelefoneCelular(this.orcamentoSeguro.getTelefoneCelular());
					this.pessoaJuridica.setTelefonePreferencial(this.orcamentoSeguro.getTelefonePreferencial());
					this.pessoaJuridica.setEmail(this.orcamentoSeguro.getEmail());
					this.pessoaJuridica.setGrupoDeVenda(this.orcamentoSeguro.getGrupoDeVenda());
				}
			}
		}
	}

	@SkipValidation
	@Override
	public String salvarEditar(){
		try{
			if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
				this.pessoa = this.pessoaFisica;
				this.pessoaFisica.setCorretora(this.corretoraEmUso);
				if (this.pessoaFisica.getGrupoDeVenda()!=null && this.pessoaFisica.getGrupoDeVenda().getId()==null)
					this.pessoaFisica.setGrupoDeVenda(null);
				if(this.pessoaFisica.getProfissao() != null && this.pessoaFisica.getProfissao().getId()==null)
					this.pessoaFisica.setProfissao(null);
				this.pessoa = this.pessoaFisica;
			}else{
				this.pessoaJuridica.setRazaoSocial(this.pessoaJuridica.getNome());
				if (this.pessoaJuridica.getAtividadeComercial() != null && this.pessoaJuridica.getAtividadeComercial().getId() == null)
					this.pessoaJuridica.setAtividadeComercial(null);
				this.pessoa = this.pessoaJuridica; 
				this.pessoaJuridica.setCorretora(this.corretoraEmUso);
				if (this.pessoaJuridica.getGrupoDeVenda()!=null && this.pessoaJuridica.getGrupoDeVenda().getId()==null)
					this.pessoaJuridica.setGrupoDeVenda(null);
				this.pessoa = this.pessoaJuridica;
			}
			if(acessoriosId != null){
				List<AutomovelOrcAcessorios> listaAutomovelOrcAcessorios = new ArrayList<AutomovelOrcAcessorios>();
				for(Long idAcessorio : acessoriosId){
					AutomovelOrcAcessorios automovelOrcAcessorios = new AutomovelOrcAcessorios();
					Acessorios ac = new Acessorios();
					ac.setId(idAcessorio);
					ac.setTipoAcessorio(null);
					automovelOrcAcessorios.setAcessorio(ac);
					automovelOrcAcessorios.setAutomovelOrcamento(this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0));
					listaAutomovelOrcAcessorios.add(automovelOrcAcessorios);
				}
				this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).setAutomovelOrcAcessoriosCollection(listaAutomovelOrcAcessorios);
			}
			if(this.pessoa.getGrupoDeVenda()!=null && this.pessoa.getGrupoDeVenda().getId() == null)
				this.pessoa.setGrupoDeVenda(null);
			
			if(orcamentoSeguro.getGrupoDeVenda()!=null && orcamentoSeguro.getGrupoDeVenda().getId() == null)
				orcamentoSeguro.setGrupoDeVenda(null);
			
			if(orcamentoSeguro.getProdutor()!=null && orcamentoSeguro.getProdutor().getId() == null)
				orcamentoSeguro.setProdutor(null);
			
			orcamentoSeguro.setCliente(this.pessoa);
			orcamentoSeguro.setTipoPessoa(this.tipoCliente);

			if(currentTab == -1){
				currentTab = 0;
			}
			if (this.orcamentoSeguro.getId()==null){
				orcamentoSeguro.setSituacao(new Situacao());
				orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_PEDIDO);
				currentTabSaved = currentTab;
				currentTab = -1;
			}
			this.service.executeNamedQuery("deleteOrcamentoBancosByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
			if(this.bancosRelacionamentoIds != null && this.bancosRelacionamentoIds.length > 0){
				int cont = 0;
				for(int i = 0; i < this.orcamentoSeguro.getOrcamentoBancosCollection().size(); i++){
					OrcamentoBancos orcamentoBancos = this.orcamentoSeguro.getOrcamentoBancosCollection().get(i);
					if(orcamentoBancos == null){
						orcamentoBancos = new OrcamentoBancos();
						orcamentoBancos.setConta("");
						orcamentoBancos.setDigito("");
						orcamentoBancos.setBancoRelacionamento(null);
						orcamentoBancos.setTipoContaRelacionamento(null);
						orcamentoBancos.setOrcamentoSeguro(this.orcamentoSeguro);
						this.orcamentoSeguro.getOrcamentoBancosCollection().set(i, orcamentoBancos); 
					}else{
						if(orcamentoBancos.getTipoContaRelacionamento() != null && orcamentoBancos.getTipoContaRelacionamento().getId() == null){
							orcamentoBancos.setTipoContaRelacionamento(null);
						}
						orcamentoBancos.setOrcamentoSeguro(this.orcamentoSeguro);
						orcamentoBancos.setBancoRelacionamento(new BancoRelacionamento());
						orcamentoBancos.getBancoRelacionamento().setId(this.bancosRelacionamentoIds[cont]);
						cont++;
					}
				}
			}
			
			persisteObject();
			Boolean isCalculado = Boolean.TRUE;
			if(this.orcamentoSeguro.getId() != null){
				for(OrcamentoSeguradora orcamentoSeguradora : this.orcamentoSeguro.getOrcamentoSeguradoraCollection()){
					for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
						if( (orcamentoFranquias.getPremioTotal() == null || orcamentoFranquias.getPremioTotal() == 0.00) && (orcamentoFranquias.getValorFranquia() == null || orcamentoFranquias.getValorFranquia() == 0.00) ){
							isCalculado = Boolean.FALSE;
						}
					}
				}
			}
			if(isCalculado){
				if(this.orcamentoSeguro.getSituacao().getId().equals(Constants.STATUS_ORCA_CALCULANDO)){
					this.orcamentoSeguro.setSituacao(new Situacao());
					this.orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_CALCULADO);
				}
			}else if(this.orcamentoSeguro.getSituacao().getId().equals(Constants.STATUS_ORCA_CALCULADO)){
				this.orcamentoSeguro.setSituacao(new Situacao());
				this.orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_CALCULANDO);
			}
			if(this.orcamentoSeguro.getDataOrcamento() == null){
				this.orcamentoSeguro.setDataOrcamento(new Date());
			}
//			this.orcamentoSeguro.setDataValidade(Util.somarDiaMesAnoData(this.orcamentoSeguro.getDataOrcamento(), 5, null, null));
			this.service.salvarEditar(this.orcamentoSeguro);
			
			if(this.proposta != null && this.proposta.getId() != null){
				this.proposta = (Proposta)this.service.find(this.proposta);
				for(Condutor condutor : this.proposta.getCondutorCollection()){
					this.condutor = (Condutor) Util.cloneBean(condutor, Condutor.class, "id","proposta");
					this.condutor.setOrcamentoSeguro(this.orcamentoSeguro);
					inserirCondutor();
				}
			}
			
			this.orcamentoSeguro = (OrcamentoSeguro)service.find(OrcamentoSeguro.class, this.orcamentoSeguro.getId());
			
//			if (currentTab==-1)
//				this.service.refresh(this.orcamentoSeguro);
			this.orcamentoSeguro.setRamo((Ramo)this.service.find(this.orcamentoSeguro.getRamo()));
			this.orcamentoCoberturaIsegList = this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection();
			this.orcamentoServicosIsegList = this.orcamentoSeguro.getOrcamentoServicosIsegCollection();
			this.orcamentoSeguradoraList = this.orcamentoSeguro.getOrcamentoSeguradoraCollection();
			if(this.orcamentoSeguro.getProdutor() != null && this.orcamentoSeguro.getProdutor().getId() == null){
				this.orcamentoSeguro.setProdutor(null);
			}
			setaDadosCliente();
			getRespostaPerfilList();
			getDispositivoSegurancaList();
			getOpcionaisList();
			listaCorretorPorGrupoDeVenda();
			this.condutor = null;
			this.proposta = null;
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	public void persisteObject() throws Exception{
		if (this.orcamentoSeguro.getId()==null || this.orcamentoSeguro.getOrcamentoServicosIsegCollection().size() == 0){
			List<CorretoraServicosIseg> corretoraServicosIsegList = new ArrayList<CorretoraServicosIseg>();
			Set<OrcamentoServicosIseg> orcamentoServicoIsegList = new HashSet<OrcamentoServicosIseg>();
			if(this.proposta != null && this.proposta.getId() != null){
				this.proposta = (Proposta)this.service.find(this.proposta);
				if(this.proposta.getSeguradora() != null && !this.proposta.getSeguradora().getServicosCollection().isEmpty()){
					for(AutomovelServicos autoServico : this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getAutomovelServicosCollection()){
						OrcamentoServicosIseg orcamentoServicoIseg = new OrcamentoServicosIseg();
						if(autoServico.getServicos() != null){
							if(autoServico.getServicos().getServicosIseg() != null){
								Boolean isPossui = Boolean.FALSE;
								orcamentoServicoIseg.setDescricao(autoServico.getServicos().getServicosIseg().getDescricao());
								orcamentoServicoIseg.setServicosIseg(autoServico.getServicos().getServicosIseg());
								orcamentoServicoIseg.setSequencia(autoServico.getSequencia());
								if(autoServico.getServicoContratado() != null){
									orcamentoServicoIseg.setInformaFranquia(autoServico.getServicoContratado().equals("SIM") ? Boolean.TRUE : Boolean.FALSE);
								}else{
									orcamentoServicoIseg.setInformaFranquia(Boolean.FALSE);
								}
								orcamentoServicoIseg.setOrcamentoSeguro(this.orcamentoSeguro);
								for(OrcamentoServicosIseg orcServIseg : orcamentoServicoIsegList){
									if(orcServIseg.getServicosIseg().equals(autoServico.getServicos().getServicosIseg()))
										isPossui = Boolean.TRUE;
								}
								if(!isPossui){
									orcamentoServicoIsegList.add(orcamentoServicoIseg);
								}
							}
						}
					}
				}
			}else{
				/** adicionando orcamentoServicosIseg na collection **/
				corretoraServicosIsegList = (ArrayList<CorretoraServicosIseg>)this.service.genericFindBySQLQuery("SELECT i FROM CorretoraServicosIseg i WHERE i.corretora.id = ?0", new Object[]{this.corretoraEmUso.getId()});
				for(CorretoraServicosIseg corretoraServicosIseg : corretoraServicosIsegList){
					OrcamentoServicosIseg orcamentoServicoIseg = new OrcamentoServicosIseg();
					orcamentoServicoIseg.setDescricao(corretoraServicosIseg.getServicosIseg().getDescricao());
					orcamentoServicoIseg.setServicosIseg(corretoraServicosIseg.getServicosIseg());
					orcamentoServicoIseg.setSequencia(corretoraServicosIseg.getServicosIseg().getSequencia());
					orcamentoServicoIseg.setInformaFranquia(corretoraServicosIseg.getServicosIseg().getInformaFranquia());
					orcamentoServicoIseg.setOrcamentoSeguro(this.orcamentoSeguro);
					orcamentoServicoIsegList.add(orcamentoServicoIseg);
				}
				/** Fim*/
			}
			this.orcamentoSeguro.setOrcamentoServicosIsegCollection(new ArrayList<OrcamentoServicosIseg>(orcamentoServicoIsegList));
		}
		if (this.orcamentoSeguro.getId()==null || this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection().size() == 0){
			if(this.proposta != null && this.proposta.getId() != null){
				this.proposta = (Proposta)this.service.find(this.proposta);
				if(this.proposta.getSeguradora() != null && !this.proposta.getSeguradora().getCoberturasCollection().isEmpty()){
					this.orcamentoSeguro.setOrcamentoCoberturaIsegCollection(new ArrayList<OrcamentoCoberturaIseg>());
					Long i = 0L;
					for(AutomovelCobertura autoCobertura : this.proposta.getPropostaAutomovelCollection().get(0).getAutomovel().getAutomovelCoberturaCollection()){
						OrcamentoCoberturaIseg orcamentoCoberturaIseg = new OrcamentoCoberturaIseg();
						if(autoCobertura.getCobertura() != null){
							if(autoCobertura.getCobertura().getCoberturasIseg() != null){
								Boolean isPossui = Boolean.FALSE;
								orcamentoCoberturaIseg.setDescricao(autoCobertura.getCobertura().getCoberturasIseg().getDescricao());
								orcamentoCoberturaIseg.setCoberturasIseg(autoCobertura.getCobertura().getCoberturasIseg());
								orcamentoCoberturaIseg.setSequencia(++i);
								orcamentoCoberturaIseg.setInformaFranquia(Boolean.TRUE);
								orcamentoCoberturaIseg.setOrcamentoSeguro(this.orcamentoSeguro);
								orcamentoCoberturaIseg.setLmi(autoCobertura.getLmi());
								for(OrcamentoCoberturaIseg orcCobIseg : this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection()){
									if(orcCobIseg.getCoberturasIseg().equals(orcamentoCoberturaIseg.getCoberturasIseg()))
										isPossui = Boolean.TRUE;
								}
								this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection().add(orcamentoCoberturaIseg);
							}
						}
						
					}
				}
			}else{
				/** adicionando orcamentoCoberturasIseg na collection*/
				List<CorretoraCoberturasIseg> coberturaIsegList = new ArrayList<CorretoraCoberturasIseg>();
				coberturaIsegList = (ArrayList<CorretoraCoberturasIseg>)this.service.genericFindBySQLQuery("SELECT i FROM CorretoraCoberturasIseg i Where i.corretora.id = ?0", new Object[]{this.corretoraEmUso.getId()});
				for (CorretoraCoberturasIseg coberturasIseg : coberturaIsegList) {
					OrcamentoCoberturaIseg orcCobIseg = new OrcamentoCoberturaIseg();
					orcCobIseg.setDescricao(coberturasIseg.getCoberturasIseg().getDescricao());
					orcCobIseg.setCoberturasIseg(coberturasIseg.getCoberturasIseg());
					orcCobIseg.setLmi(coberturasIseg.getLmi());
					orcCobIseg.setSequencia(coberturasIseg.getCoberturasIseg().getSequencia());
					orcCobIseg.setInformaFranquia(coberturasIseg.getCoberturasIseg().getInformaFranquia());
					orcCobIseg.setOrcamentoSeguro(this.orcamentoSeguro);
					this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection().add(orcCobIseg);
				}
				/** Fim*/
			}
		}
		if(this.orcamentoSeguro.getId()==null || this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection().size() == 0){
			List<SeguradorasPreferenciais> listSeguradorasPrefer = (List<SeguradorasPreferenciais>)this.service.genericFindBySQLQuery("SELECT i FROM SeguradorasPreferenciais i WHERE i.corretora.id = ?0 ORDER BY i.id", new Object[]{this.corretoraEmUso.getId()});
			int cont = 0;
			for(SeguradorasPreferenciais seguradorasPrefer : listSeguradorasPrefer){
				cont++;
				OrcamentoSeguradora orcamentoSeguradora = new OrcamentoSeguradora();
				orcamentoSeguradora.setItem(cont);
				orcamentoSeguradora.setDataCalculo(new Date());
				orcamentoSeguradora.setSeguradora(seguradorasPrefer.getSeguradora());
				orcamentoSeguradora.setOrcamentoSeguro(this.orcamentoSeguro);
				String[] franquias = seguradorasPrefer.getFranquias().split("/");
				for(String franquia : franquias){
					if(!franquia.trim().equals("")){
						OrcamentoFranquias orcFran = new OrcamentoFranquias();
						orcFran.setOrcamentoSeguradora(orcamentoSeguradora);
						orcFran.setTipoFranquia((DominioEsp)this.service.find(DominioEsp.class,Long.parseLong(franquia)));
						orcamentoSeguradora.getOrcamentoFranquiasCollection().add(orcFran);
					}
				}
				this.orcamentoSeguro.getOrcamentoSeguradoraCollection().add(orcamentoSeguradora);
			}
		}
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@SkipValidation
	public String inserirCondutor(){
		Long idOrcamento = this.condutor.getOrcamentoSeguro().getId();
		try{
			if(this.condutor.getId() == null && this.condutor.getCpf() != null){
				Condutor condutor = (Condutor)this.service.genericFindFirstResultByNamedQuery("getCondutorByCpfAndOrcamento", new Object[]{this.condutor.getOrcamentoSeguro().getId(),this.condutor.getCpf()});
				if(condutor != null){
					addActionError("Condutor já foi inserido na lista");
					throw new Exception();
				}
			}
			if (this.condutor.getId()==null){
				List<Condutor> cond =this.service.genericFindByNamedQuery("getCondutorByNome", new Object[]{this.condutor.getOrcamentoSeguro().getId(), this.condutor.getNome()});
				if (cond.size()>0){
					this.condutores = (List<Condutor>)this.service.genericFindBySQLQuery("SELECT c FROM Condutor c WHERE c.orcamentoSeguro.id = ?0 ", new Object[]{this.condutor.getOrcamentoSeguro().getId()});
					return Action.SUCCESS;
				}
			}
			this.condutor.setProposta(null);
			if(this.condutor.getIsCondutorPrincipal() != null && this.condutor.getIsCondutorPrincipal())
				this.service.executeNamedQuery("updateCondutorAllNaoPrincipalByOrcamentoSeguro", new Object[]{this.condutor.getOrcamentoSeguro().getId()});
			if(this.condutor.getProfissao() != null && this.condutor.getProfissao().getId() == null)
				this.condutor.setProfissao(null);
			if(this.condutor.getEscolaridade() != null && this.condutor.getEscolaridade().getId() == null){
				this.condutor.setEscolaridade(null);
			}
			if(this.condutor.getRelacaoCondutorSegurado() != null && this.condutor.getRelacaoCondutorSegurado().getId() == null){
				this.condutor.setRelacaoCondutorSegurado(null);
			}
			this.service.save(condutor);
			condutores = (List<Condutor>)this.service.genericFindBySQLQuery("SELECT c FROM Condutor c WHERE c.orcamentoSeguro.id = ?0 ", new Object[]{condutor.getOrcamentoSeguro().getId()});
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			try {
				condutores = (List<Condutor>)this.service.genericFindBySQLQuery("SELECT c FROM Condutor c WHERE c.orcamentoSeguro.id = ?0 ", new Object[]{idOrcamento});
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String pesquisaDadosPessoa(){
		try {
			if(this.condutor != null && (this.condutor.getCpf() != null || this.condutor.getNome() != null)){
				PessoaFisica pessoaFisica = null;
				if(this.condutor.getCpf() != null){
					pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByCpf", new Object[]{this.condutor.getCpf()});
				}
				else if(this.condutor.getNome() != null){
					pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByNome", new Object[]{this.condutor.getNome()});
				}
				if(pessoaFisica != null){
					this.condutor.setCpf(pessoaFisica.getCpfOuCnpj());
					this.condutor.setNome(pessoaFisica.getNome());
					this.condutor.setSexo(pessoaFisica.getSexo());
					this.condutor.setDataNascimento(pessoaFisica.getDataNascimento());
					this.condutor.setEstadoCivil(pessoaFisica.getEstadoCivil());
					this.condutor.setTelefones(pessoaFisica.getTelefonePreferencial());
					this.condutor.setProfissao(pessoaFisica.getProfissao());
					this.condutor.setCnh(pessoaFisica.getCnh());
					this.condutor.setData1aHabilitacao(pessoaFisica.getData1aHabilitacao());
				}
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String editarCondutor(){
		try {

			this.condutor = (Condutor)this.service.find(this.condutor);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirCondutor(){
		try {
			this.service.remove(condutor);
			condutores = (List<Condutor>)this.service.genericFindBySQLQuery("Select c From Condutor c where c.orcamentoSeguro.id = ?0 ", new Object[]{condutor.getOrcamentoSeguro().getId()});
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() throws Exception {
		if(this.orcamentoSeguro.getCliente() != null){
			if (HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaFisica){
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
				this.tipoCliente = Constants.CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaJuridica){
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
				this.tipoCliente = Constants.CLIENTE_PJ;
			}
		}

	}

	@SkipValidation
	public String getModeloVeiculoList(){
		try{
			this.modelos = this.service.genericFindByNamedQuery("findAllModeloByFabricanteId", new Object[]{this.marca.getId()});
			return Action.SUCCESS;
		} catch (Exception e) {
			this.modelos = new ArrayList<VeiculoModelo>();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Automovel> getAutomovelWizCollection(){
		try{
			return (List<Automovel>) this.service.genericFindBySQLQuery("SELECT a FROM Automovel a WHERE  a.orcamentoSeguro.id = ?0 ", new Object[]{orcamentoSeguro.getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Automovel>();
	}

	public List<Fabricante> getFabricanteList(){
		try{
			return this.service.genericFindByNamedQuery("findAllFabricante", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Fabricante>();
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String novoItem(){
		try{
			this.orcamentoSeguro = (OrcamentoSeguro)service.find(this.orcamentoSeguro);
			this.pobject = this.orcamentoSeguro;
			AutomovelOrcamento automovel = null;
			for (int i=0;i<this.orcamentoSeguro.getAutomovelOrcamentoCollection().size();i++){
				automovel = this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(i);
				if (automovel.getLinhaVazia()){
					this.itemCorrente = i;
					automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
					return Action.SUCCESS;
				}
			}
			automovel = new AutomovelOrcamento();
			automovel.setLinhaVazia(true);
			automovel.setOrcamentoSeguro(this.orcamentoSeguro);
			int numeroItem = this.service.getRowCount("getMaxNumeroItemAutoByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
			automovel.setNumeroItem((numeroItem==0 ? 1 : numeroItem));
			this.itemCorrente = new Integer(this.service.getRowCount("getCountAutomovel", new Object[]{this.orcamentoSeguro.getId()}));
			this.orcamentoSeguro.getAutomovelOrcamentoCollection().add(automovel);
			automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String editarAutomovel(){
		try {

			this.orcamentoSeguro = (OrcamentoSeguro)service.find(this.orcamentoSeguro);
			this.pobject = this.orcamentoSeguro;
			automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String removerItem(){
		try {

			this.orcamentoSeguro = (OrcamentoSeguro)service.find(this.orcamentoSeguro);
			this.pobject = this.orcamentoSeguro;
			AutomovelOrcamento automovel = this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(itemCorrente);
			automovel = (AutomovelOrcamento)this.service.find(automovel);
			this.service.remove(automovel);
			automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
			if (automovelList.size()==0){
				AutomovelOrcamento newAutomovel = new AutomovelOrcamento();
				newAutomovel.setOrcamentoSeguro(this.orcamentoSeguro);
				newAutomovel.setLinhaVazia(true);
				int numeroItem = this.service.getRowCount("getMaxNumeroItemAutoByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
				automovel.setNumeroItem((numeroItem==0 ? 1 : numeroItem));
				this.itemCorrente = 0;
				this.service.save(newAutomovel);
				automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
				this.orcamentoSeguro.setAutomovelOrcamentoCollection(automovelList);
			}else{
				this.orcamentoSeguro.setAutomovelOrcamentoCollection(automovelList);
				itemCorrente = 0;
				automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From Automovel i where i.orcamentoSeguro.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
				this.itens = automovelList.size();
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<Condutor> getCondutores() {
		try {
			if(this.orcamentoSeguro != null && this.orcamentoSeguro.getId() != null){
					condutores = this.service.genericFindByNamedQuery("getCondutorByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condutores;
	}

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return orcamentoSeguradora;
	}

	@SuppressWarnings("unchecked")
	public List<RespostaPerfil> getRespostaPerfilList() throws Exception {
		if(this.orcamentoSeguro != null && this.orcamentoSeguro.getId() != null){
			respostaPerfilList = (List<RespostaPerfil>)this.service.genericFindBySQLQuery("SELECT i FROM RespostaPerfil i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.perguntasPerfil.ordem", new Object[]{this.orcamentoSeguro.getId()});
			for(RespostaPerfil r : respostaPerfilList)
				r.setPerguntasPerfil((PerguntasPerfil)this.service.find(PerguntasPerfil.class,r.getPerguntasPerfil().getId()));
		}
		if(respostaPerfilList == null || respostaPerfilList.isEmpty()){
			respostaPerfilList = new ArrayList<RespostaPerfil>();
			List<PerguntasPerfil> perguntasPerfilList = getPerguntasPerfilList();
			for(PerguntasPerfil perguntas: perguntasPerfilList){
				RespostaPerfil resposta = new RespostaPerfil();
				resposta.setOrcamentoSeguro(this.orcamentoSeguro);
				resposta.setPerguntasPerfil(perguntas);
				respostaPerfilList.add(resposta);
			}
		}
		return respostaPerfilList;
	}

	@SkipValidation
	public String inserirOrcamentoCoberturaIseg() throws Exception{
		this.orcamentoCoberturaIsegList = this.service.genericFindByNamedQuery("getOrcamentoCoberturaIsegByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
		for(OrcamentoCoberturaIseg orcamentoCoberturaIseg: this.orcamentoCoberturaIsegList){
			if(this.orcamentoCoberturaIseg.getCoberturasIseg().getId().compareTo(orcamentoCoberturaIseg.getCoberturasIseg().getId())==0){
				this.inputStream = new StringBufferInputStream("ERROR");
				return Action.ERROR;
			}
		}
		if(this.orcamentoCoberturaIseg != null && orcamentoCoberturaIsegList != null){
			this.orcamentoCoberturaIseg.setOrcamentoSeguro(this.orcamentoSeguro);
			this.orcamentoCoberturaIseg.setSequencia(this.orcamentoCoberturaIsegList.size()+1L);
			this.service.save(this.orcamentoCoberturaIseg);
			this.service.refresh(this.orcamentoCoberturaIseg);
			this.orcamentoCoberturaIseg.setCoberturasIseg((CoberturasIseg)this.service.find(CoberturasIseg.class,this.orcamentoCoberturaIseg.getCoberturasIseg().getId()));
			this.orcamentoCoberturaIsegList.add(this.orcamentoCoberturaIseg);
		}
		return Action.SUCCESS;
	}
	
	@SkipValidation
	public String inserirOrcamentoServicosIseg() throws Exception{
		this.orcamentoServicosIsegList = this.service.genericFindByNamedQuery("getOrcamentoServicosIsegByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
		for(OrcamentoServicosIseg orcamentoServicosIseg : this.orcamentoServicosIsegList){
			if(orcamentoServicosIseg.getServicosIseg().getId().compareTo(this.orcamentoServicosIseg.getServicosIseg().getId())==0){
				this.inputStream = new StringBufferInputStream("ERROR");
				return Action.ERROR;
			}
		}
		if(this.orcamentoServicosIseg != null && orcamentoServicosIsegList != null){
			this.orcamentoServicosIseg.setOrcamentoSeguro(this.orcamentoSeguro);
			this.orcamentoServicosIseg.setSequencia(this.orcamentoServicosIsegList.size()+1L);
			this.service.save(this.orcamentoServicosIseg);
			this.orcamentoServicosIseg.setServicosIseg((ServicosIseg)this.service.find(this.orcamentoServicosIseg.getServicosIseg()));
			orcamentoServicosIsegList.add(this.orcamentoServicosIseg);
		}
		return Action.SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String abrirModalCoberturaSeguradora(){
		try{
			this.coberturasList = (List<Coberturas>)this.service.genericFindBySQLQuery("SELECT c FROM Coberturas c WHERE c.seguradora.id = ?0 and c.corretora.id = ?1 and c.ramo.id = ?2 ORDER BY c.ramo.nome, c.sequencia", new Object[]{this.seguradora.getId(), this.corretoraEmUso.getId(), this.ramo.getId()});
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String inserirCoberturaSeguradora(){
		try{
			this.orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(this.orcamentoSeguradora);
			Coberturas coberturas = (Coberturas)this.service.find(this.orcamentoCobertura.getCoberturas());
			this.orcamentoCobertura.setOrcamentoSeguradora(this.orcamentoSeguradora);
			this.orcamentoCobertura.setCoberturasIseg(coberturas.getCoberturasIseg());
			this.orcamentoCobertura.setSequencia(this.orcamentoSeguradora.getOrcamentoCoberturaCollection().size()+1L);
			this.orcamentoSeguradora.getOrcamentoCoberturaCollection().add(this.orcamentoCobertura);
			this.orcamentoCobertura.setCoberturas((Coberturas)this.service.find(Coberturas.class,new Long(this.orcamentoCobertura.getCoberturas().getId())));
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	public String abrirModalServicoSeguradora(){
		try{
			this.servicosList = (List<Servicos>)this.service.genericFindBySQLQuery("SELECT c FROM Servicos c WHERE c.seguradora.id = ?0 and c.corretora.id = ?1 and c.ramo.id = ?2 ORDER BY c.ramo.nome, c.sequencia", new Object[]{this.seguradora.getId(), this.corretoraEmUso.getId(), this.ramo.getId()});
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String inserirServicoSeguradora(){
		try{
			this.orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(this.orcamentoSeguradora);
			Servicos servicos = (Servicos)this.service.find(this.orcamentoServico.getServicos());
			this.orcamentoServico.setOrcamentoSeguradora(this.orcamentoSeguradora);
			this.orcamentoServico.setInformaFranquia(Boolean.TRUE);
			this.orcamentoServico.setServicosIseg(servicos.getServicosIseg());
			this.orcamentoServico.setSequencia(this.orcamentoSeguradora.getOrcamentoServicosCollection().size()+1L);
			this.orcamentoSeguradora.getOrcamentoServicosCollection().add(this.orcamentoServico);
			this.orcamentoServico.setServicos((Servicos)this.service.find(Servicos.class,new Long(this.orcamentoServico.getServicos().getId())));
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirOrcamentoSeguradora(){
		try{
			if(orcamentoSeguro != null && orcamentoSeguro.getId() != null){
				orcamentoSeguradoraList = (List<OrcamentoSeguradora>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoSeguradora i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguro.getId()});
			}
			if(orcamentoSeguradoraList == null){
				orcamentoSeguradoraList = new ArrayList<OrcamentoSeguradora>();
			}
			if(this.orcamentoSeguradoraList != null && orcamentoSeguradora != null){
				orcamentoSeguradora.setSeguradora((Seguradora)this.service.find(Seguradora.class, orcamentoSeguradora.getSeguradora().getId()));
				orcamentoSeguradora.setOrcamentoSeguro(this.orcamentoSeguro);
				orcamentoSeguradora.setDataCalculo(new Date());
				for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
					if(orcamentoFranquias.getTipoFranquia() != null && orcamentoFranquias.getTipoFranquia().getId() == null){
						orcamentoFranquias.setTipoFranquia(null);
					}
					orcamentoFranquias.setOrcamentoSeguradora(orcamentoSeguradora);
				}
				
				if(this.orcamentoSeguradora.getId() != null){
					this.orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(this.orcamentoSeguradora);
					@SuppressWarnings("unused")
					Integer cont = this.service.getRowCount("getOrcamentoSeguradoraByOrcamentoAndItem", new Object[]{this.orcamentoSeguradora.getId()});
				}else
					this.orcamentoSeguradora.setItem(this.orcamentoSeguradoraList.size()+1);
				this.service.save(this.orcamentoSeguradora);
				this.orcamentoSeguradoraList.add(this.orcamentoSeguradora);
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	private void adicionarCoberturasNaSeguradora() throws Exception{
		if(this.orcamentoSeguradora.getOrcamentoCoberturaCollection() == null || this.orcamentoSeguradora.getOrcamentoCoberturaCollection().isEmpty()){
			List<OrcamentoCoberturaIseg> listaOrcamentoCoberturasIseg = this.service.genericFindByNamedQuery("getOrcamentoCoberturaIsegByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
			for(OrcamentoCoberturaIseg orcamentoCoberturasIseg : listaOrcamentoCoberturasIseg){
				OrcamentoCobertura orcamentoCobertura = new OrcamentoCobertura();
				if(orcamentoCoberturasIseg.getCoberturasIseg() != null && orcamentoCoberturasIseg.getCoberturasIseg().getId() != null){
					List<Coberturas> cobList = (ArrayList)this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), this.orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturasIseg.getCoberturasIseg().getId()});
					if(cobList != null && !cobList.isEmpty()){
						orcamentoCobertura.setCoberturasList(cobList);
						orcamentoCobertura.setCoberturas(cobList.get(0));
					}else{
						orcamentoCobertura.getCoberturasIsegList().add(orcamentoCoberturasIseg.getCoberturasIseg());
					}
				}
				
				orcamentoCobertura.setDescricao(orcamentoCoberturasIseg.getDescricao());
				orcamentoCobertura.setFranquia(orcamentoCoberturasIseg.getFranquia());
				orcamentoCobertura.setLmi(orcamentoCoberturasIseg.getLmi());
				orcamentoCobertura.setInformaFranquia(orcamentoCoberturasIseg.getInformaFranquia());
				orcamentoCobertura.setPremio(orcamentoCoberturasIseg.getPremio());
				orcamentoCobertura.setSequencia(orcamentoCoberturasIseg.getSequencia());
				orcamentoCobertura.setOrcamentoSeguradora(this.orcamentoSeguradora);
				orcamentoCobertura.setCoberturasIseg(orcamentoCoberturasIseg.getCoberturasIseg());
				orcamentoCobertura.setTextoFranquia(orcamentoCoberturasIseg.getTextoFranquia());
				orcamentoCobertura.setUsuario(this.usuario);
				this.orcamentoSeguradora.getOrcamentoCoberturaCollection().add(orcamentoCobertura);
			}
		}else{
			for(OrcamentoCobertura orcamentoCobertura: this.orcamentoSeguradora.getOrcamentoCoberturaCollection()){
				if(orcamentoCobertura.getCoberturasIseg() != null && orcamentoCobertura.getCoberturasIseg().getId() != null){
					List<Coberturas> cobList = (ArrayList)this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoCobertura.getOrcamentoSeguradora().getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCobertura.getCoberturasIseg().getId()});
					if(cobList != null && !cobList.isEmpty()){
						orcamentoCobertura.setCoberturasList(cobList);
					}else{
						orcamentoCobertura.getCoberturasIsegList().add(orcamentoCobertura.getCoberturasIseg());
					}
				}
			}
			
		}
	}
	
	@SuppressWarnings("unchecked")
	private void adicionarServicosNaSeguradora() throws Exception{
		if(this.orcamentoSeguradora.getOrcamentoServicosCollection() == null || this.orcamentoSeguradora.getOrcamentoServicosCollection().isEmpty()){
			List<OrcamentoServicosIseg> listaOrcamentoServicosIseg = this.service.genericFindByNamedQuery("getOrcamentoServicosIsegByOrcamentoSeguro", new Object[]{this.orcamentoSeguro.getId()});
			for(OrcamentoServicosIseg orcamentoServicosIseg : listaOrcamentoServicosIseg){
				OrcamentoServicos orcamentoServicos = new OrcamentoServicos();
				if(orcamentoServicosIseg.getServicosIseg() != null && orcamentoServicosIseg.getServicosIseg().getId() != null){
					List<Servicos> servicosList = (ArrayList)this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), this.orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
					if(servicosList != null && !servicosList.isEmpty()){
						orcamentoServicos.setServicosList(servicosList);
					}else{
						orcamentoServicos.getServicoIsegList().add(orcamentoServicosIseg.getServicosIseg());
					}
				}
				orcamentoServicos.setDescricao(orcamentoServicosIseg.getDescricao());
				orcamentoServicos.setFranquia(orcamentoServicosIseg.getFranquia());
				orcamentoServicos.setInformaFranquia(orcamentoServicosIseg.getInformaFranquia());
				orcamentoServicos.setPremio(orcamentoServicosIseg.getPremio());
				orcamentoServicos.setQuantidade(orcamentoServicosIseg.getQuantidade());
				orcamentoServicos.setSequencia(orcamentoServicosIseg.getSequencia());
				if(orcamentoServicosIseg.getInformaFranquia()){
					if(orcamentoServicos.getServicosList() != null && !orcamentoServicos.getServicosList().isEmpty())
						orcamentoServicos.setServicos(orcamentoServicos.getServicosList().get(0));
					else
						orcamentoServicos.setServicosIseg(orcamentoServicosIseg.getServicosIseg());
				}
				orcamentoServicos.setTextoDescricao(orcamentoServicosIseg.getTextoDescricao());
				orcamentoServicos.setTextoFranquia(orcamentoServicosIseg.getTextoFranquia());
				orcamentoServicos.setUsuario(this.usuario);
				orcamentoServicos.setOrcamentoSeguradora(this.orcamentoSeguradora);
				this.orcamentoSeguradora.getOrcamentoServicosCollection().add(orcamentoServicos);
			}
		}else{
			int i = 0;
			for(OrcamentoServicos orcamentoServicos: this.orcamentoSeguradora.getOrcamentoServicosCollection()){
				if(orcamentoServicos.getServicosIseg() != null && orcamentoServicos.getServicosIseg().getId() != null){
					List<Servicos> servList = (ArrayList)this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoServicos.getOrcamentoSeguradora().getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicos.getServicosIseg().getId()});
					if(servList != null && !servList.isEmpty()){
						orcamentoServicos.setServicosList(servList);
					}else{
						orcamentoServicos.getServicoIsegList().add(orcamentoServicos.getServicosIseg());
					}
				}else{
					List<OrcamentoServicosIseg> lst = orcamentoServicos.getOrcamentoSeguradora().getOrcamentoSeguro().getOrcamentoServicosIsegCollection();
					if(orcamentoServicos.getServicoIsegList() != null && !orcamentoServicos.getServicoIsegList().contains(lst.get(i).getServicosIseg())){
						orcamentoServicos.getServicoIsegList().add(lst.get(i).getServicosIseg());
					}
				}
				i++;
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String removeFranquiaOrcamentoSeguradora(){
		try {
			this.service.remove(this.orcamentoFranquias);
			if(orcamentoSeguro != null && orcamentoSeguro.getId() != null){
				orcamentoSeguradoraList = (List<OrcamentoSeguradora>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoSeguradora i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguro.getId()});
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String removeOrcamentoSeguradora(){
		try {
			this.service.remove(this.orcamentoSeguradora);
			if(orcamentoSeguro != null && orcamentoSeguro.getId() != null){
				orcamentoSeguradoraList = (List<OrcamentoSeguradora>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoSeguradora i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.item", new Object[]{this.orcamentoSeguro.getId()});
				if(orcamentoSeguradoraList != null && !orcamentoSeguradoraList.isEmpty()){
					for(int i = 0; i < orcamentoSeguradoraList.size() ; i++){
						orcamentoSeguradoraList.get(i).setItem(i+1);
					}
				}
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String fecharOrcamentoSeguradora(){
		try {
			if(orcamentoSeguro != null && orcamentoSeguro.getId() != null){
				orcamentoSeguradoraList = (List<OrcamentoSeguradora>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoSeguradora i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguro.getId()});
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirFranquiaOrcamentoSeguradora(){
		try{
			if(orcamentoSeguro != null && orcamentoSeguro.getId() != null){
				this.orcamentoSeguradoraList = (List<OrcamentoSeguradora>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoSeguradora i WHERE i.orcamentoSeguro.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguro.getId()});
			}
			if(this.orcamentoSeguradora != null && this.orcamentoSeguradora.getId() != null){
				this.orcamentoFranquiasList = (List<OrcamentoFranquias>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoFranquias i WHERE i.orcamentoSeguradora.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguradora.getId()});
			}
			if(this.orcamentoFranquias != null){
				this.orcamentoFranquias.setOrcamentoSeguradora(this.orcamentoSeguradora);
				this.service.save(orcamentoFranquias);
				this.orcamentoSeguradoraList.get(this.itemCorrente).setOrcamentoFranquiasCollection(orcamentoFranquiasList);
				orcamentoSeguradoraList.get(this.itemCorrente).getOrcamentoFranquiasCollection().add(orcamentoFranquias);
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String inserirTabsOrcamentoSegAuto(){
		try{
			this.orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(orcamentoSeguradora);
	    	this.orcamentoServicosIsegList = new ArrayList<OrcamentoServicosIseg>();
			for(OrcamentoServicosIseg orcamentoServicosIseg : orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoServicosIsegCollection()){
				orcamentoServicosIsegList.add((OrcamentoServicosIseg)Util.cloneBean(orcamentoServicosIseg, "id"));
			}
			this.orcamentoCoberturaIsegList = new ArrayList<OrcamentoCoberturaIseg>();
			for(OrcamentoCoberturaIseg orcamentoCoberturaIseg:orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoCoberturaIsegCollection()){
				orcamentoCoberturaIsegList.add((OrcamentoCoberturaIseg)Util.cloneBean(orcamentoCoberturaIseg, "id"));
			}
			
			List<OrcamentoServicos> listOrcamentoServicos = new ArrayList<OrcamentoServicos>();
			if(orcamentoSeguradora.getOrcamentoServicosCollection() == null || orcamentoSeguradora.getOrcamentoServicosCollection().isEmpty()){
				for(int i = 0 ; i < orcamentoServicosIsegList.size(); i++){
					OrcamentoServicosIseg orcamentoServicosIseg = orcamentoServicosIsegList.get(i);
					OrcamentoServicos orcamentoServicos = new OrcamentoServicos();
					orcamentoServicos.setTextoFranquia(orcamentoServicosIseg.getTextoDescricao());
					servicosList = this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
					if(servicosList != null && !servicosList.isEmpty()){
						orcamentoServicosIseg.setServicosList(servicosList);
						if(orcamentoServicosIseg.getInformaFranquia())
							orcamentoServicos.setServicos(servicosList.get(0));
						
					}else if(orcamentoServicosIseg.getServicosIseg() != null && orcamentoServicosIseg.getServicosIseg().getId() != null){
						orcamentoServicosIseg.getServicosIsegList().add(orcamentoServicosIseg.getServicosIseg());
						if(orcamentoServicosIseg.getInformaFranquia()){
							orcamentoServicos.setServicosIseg(orcamentoServicosIseg.getServicosIseg());
						}
					}
					orcamentoServicos.setOrcamentoSeguradora(orcamentoSeguradora);
					orcamentoServicos.setSequencia(orcamentoServicosIseg.getSequencia());
					listOrcamentoServicos.add(orcamentoServicos);
				}
				orcamentoSeguradora.setOrcamentoServicosCollection(listOrcamentoServicos);
			}else{
				if(orcamentoServicosIsegList.size() < orcamentoSeguradora.getOrcamentoServicosCollection().size()){
					for(int i = orcamentoServicosIsegList.size() ; i < orcamentoSeguradora.getOrcamentoServicosCollection().size(); i++){
						OrcamentoServicosIseg orcamentoServicosIseg = new OrcamentoServicosIseg();
						orcamentoServicosIseg.setServicosIseg(orcamentoSeguradora.getOrcamentoServicosCollection().get(i).getServicosIseg());
						orcamentoServicosIsegList.add(orcamentoServicosIseg);
					}
				}
				for(int i = 0 ; i < orcamentoServicosIsegList.size(); i++){
					OrcamentoServicosIseg orcamentoServicosIseg = orcamentoServicosIsegList.get(i);
					servicosList = this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
					if(servicosList != null && !servicosList.isEmpty()){
						orcamentoServicosIseg.setServicosList(servicosList);
					}else{
						orcamentoServicosIseg.getServicosIsegList().add(orcamentoServicosIseg.getServicosIseg());
					}
				}
			}
			if(orcamentoSeguradora.getOrcamentoCoberturaCollection() == null || orcamentoSeguradora.getOrcamentoCoberturaCollection().isEmpty()){
				for(int j = 0 ; j < orcamentoCoberturaIsegList.size(); j++){
					OrcamentoCoberturaIseg orcamentoCoberturaIseg = orcamentoCoberturaIsegList.get(j);
					coberturasList = this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturaIseg.getCoberturasIseg().getId()});
					OrcamentoCobertura orcamentoCobertura = new OrcamentoCobertura();
					orcamentoCobertura.setFranquia(orcamentoCoberturaIseg.getFranquia());
					orcamentoCobertura.setInformaFranquia(orcamentoCoberturaIseg.getInformaFranquia());
					orcamentoCobertura.setLmi(orcamentoCoberturaIseg.getLmi());
					orcamentoCobertura.setOrcamentoSeguradora(orcamentoSeguradora);
					orcamentoCobertura.setPremio(orcamentoCoberturaIseg.getPremio());
					orcamentoCobertura.setSequencia(orcamentoCoberturaIseg.getSequencia());
					orcamentoCobertura.setTextoFranquia(orcamentoCoberturaIseg.getTextoFranquia());
					orcamentoCobertura.setCoberturasIseg(orcamentoCoberturaIseg.getCoberturasIseg());
					orcamentoCobertura.setUsuario(this.usuario);
					if(coberturasList != null && !coberturasList.isEmpty()){
						orcamentoCoberturaIseg.setCoberturasList(coberturasList);
						orcamentoCobertura.setCoberturas(coberturasList.get(0));
					}else{
						orcamentoCoberturaIseg.getCoberturasIsegList().add(orcamentoCoberturaIseg.getCoberturasIseg());
					}
					orcamentoSeguradora.getOrcamentoCoberturaCollection().add(orcamentoCobertura);
				}
			}else{
				if(orcamentoCoberturaIsegList.size() < orcamentoSeguradora.getOrcamentoCoberturaCollection().size()){
					for(int i = orcamentoCoberturaIsegList.size() ; i < orcamentoSeguradora.getOrcamentoCoberturaCollection().size(); i++){
						OrcamentoCoberturaIseg orcamentoCoberturaIseg = new OrcamentoCoberturaIseg();
						orcamentoCoberturaIseg.setCoberturasIseg(orcamentoSeguradora.getOrcamentoCoberturaCollection().get(i).getCoberturasIseg());
						orcamentoCoberturaIsegList.add(orcamentoCoberturaIseg);
					}
				}
				for(int j = 0 ; j < orcamentoCoberturaIsegList.size(); j++){
					OrcamentoCoberturaIseg orcamentoCoberturaIseg = orcamentoCoberturaIsegList.get(j);
					coberturasList = this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturaIseg.getCoberturasIseg().getId()});
					if(coberturasList != null && !coberturasList.isEmpty()){
						orcamentoCoberturaIseg.setCoberturasList(coberturasList);
					}else{
						orcamentoCoberturaIseg.getCoberturasIsegList().add(orcamentoCoberturaIseg.getCoberturasIseg());
					}
				}
			}	
			this.service.salvarCalculoOrcamentoSegAuto(orcamentoSeguradora);
			this.orcamentoSeguradora.setOrcamentoSeguro(this.orcamentoSeguro);
			this.orcamentoSeguro = (OrcamentoSeguro)this.service.find(this.orcamentoSeguro);
			this.propostaAnexoList = this.orcamentoSeguradora.getPropostaAnexoCollection();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String salvarCalculoOrcamentoSegAuto(){
		try{
			
			this.orcamentoSeguradora = this.service.salvarCalculoOrcamentoSegAuto(this.orcamentoSeguradora);
			
//			this.orcamentoServicosIsegList = this.orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoServicosIsegCollection(); 
//			this.orcamentoCoberturaIsegList = this.orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoCoberturaIsegCollection();
			this.orcamentoServicosIsegList = new ArrayList<OrcamentoServicosIseg>();
			for(OrcamentoServicosIseg orcamentoServicosIseg : this.orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoServicosIsegCollection()){
				this.orcamentoServicosIsegList.add((OrcamentoServicosIseg)Util.cloneBean(orcamentoServicosIseg, "id"));
			}
			this.orcamentoCoberturaIsegList = new ArrayList<OrcamentoCoberturaIseg>();
			for(OrcamentoCoberturaIseg orcamentoCoberturaIseg:this.orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoCoberturaIsegCollection()){
				this.orcamentoCoberturaIsegList.add((OrcamentoCoberturaIseg)Util.cloneBean(orcamentoCoberturaIseg, "id"));
			}
			
			if(this.orcamentoServicosIsegList.size() < this.orcamentoSeguradora.getOrcamentoServicosCollection().size()){
				for(int i = this.orcamentoServicosIsegList.size() ; i < this.orcamentoSeguradora.getOrcamentoServicosCollection().size(); i++){
					OrcamentoServicosIseg orcamentoServicosIseg = new OrcamentoServicosIseg();
					orcamentoServicosIseg.setServicosIseg(this.orcamentoSeguradora.getOrcamentoServicosCollection().get(i).getServicosIseg());
					this.orcamentoServicosIsegList.add(orcamentoServicosIseg);
				}
			}
			for(OrcamentoServicosIseg orcamentoServicosIseg: this.orcamentoServicosIsegList){
				this.servicosList = this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), this.orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
				if(this.servicosList != null && !this.servicosList.isEmpty())
					orcamentoServicosIseg.setServicosList(servicosList);
				else
					orcamentoServicosIseg.getServicosIsegList().add(orcamentoServicosIseg.getServicosIseg());
				
			}
			
			if(this.orcamentoCoberturaIsegList.size() < this.orcamentoSeguradora.getOrcamentoCoberturaCollection().size()){
				for(int i = this.orcamentoCoberturaIsegList.size() ; i < this.orcamentoSeguradora.getOrcamentoCoberturaCollection().size(); i++){
					OrcamentoCoberturaIseg orcamentoCoberturaIseg = new OrcamentoCoberturaIseg();
					orcamentoCoberturaIseg.setCoberturasIseg(this.orcamentoSeguradora.getOrcamentoCoberturaCollection().get(i).getCoberturasIseg());
					this.orcamentoCoberturaIsegList.add(orcamentoCoberturaIseg);
				}
			}
			for(OrcamentoCoberturaIseg orcamentoCoberturaIseg:this.orcamentoCoberturaIsegList){
				this.coberturasList = this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), this.orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturaIseg.getCoberturasIseg().getId()});
				if(this.coberturasList != null && !this.coberturasList.isEmpty()){
					orcamentoCoberturaIseg.setCoberturasList(this.coberturasList);
				}else
					orcamentoCoberturaIseg.getCoberturasIsegList().add(orcamentoCoberturaIseg.getCoberturasIseg());
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	public String gerarParcelasOrcamentoFranquias(){
		try{
			if(this.orcamentoSeguradora != null && this.orcamentoFranquias.getId() != null){
				this.service.executeNamedQuery("deleteParcelasOrcamentoByOrcamentoFranquias", new Object[]{this.orcamentoFranquias.getId()});
			}
			this.parcelasOrcamentoList = new ArrayList<ParcelasOrcamento>();
			for(int i = 0; i < this.qtdeParcelas; i++){
				ParcelasOrcamento p = new ParcelasOrcamento();
				if(this.qtdeParCarne == null || this.qtdeParCarne == 0)
					this.qtdeParCarne = 1;
				if(this.qtdeParDeb == null || this.qtdeParDeb == 0)
					this.qtdeParDeb = 1;
				if(this.qtdeParCred == null || this.qtdeParCred == 0)
					this.qtdeParCred = 1;
				if(this.qtdeParCheq == null || this.qtdeParCheq == 0)
					this.qtdeParCheq = 1;
				
				if(i <= this.qtdeParCarne-1)
					p.setValorParcelaCarne(premioTotal/(i+1));
				if(i <= this.qtdeParDeb-1)
					p.setValorParcelaDebito(premioTotal/(i+1));
				if(i <= this.qtdeParCred-1)
					p.setValorParcelaCredito(premioTotal/(i+1));
				if(i <= this.qtdeParCheq-1)
					p.setValorParcelaCheque(premioTotal/(i+1));
				p.setQtdParcelaCarne(qtdeParCarne);
				p.setQtdParcelaDebito(qtdeParDeb);
				p.setQtdParcelaCredito(qtdeParCred);
				p.setQtdParcelaCheque(qtdeParCheq);
				p.setOrcamentoFranquias(this.orcamentoFranquias);
//				this.service.save(p);
				this.parcelasOrcamentoList.add(p);
			}
			if(this.orcamentoSeguradora != null && this.orcamentoSeguradora.getId() != null){
				this.orcamentoSeguradora.setOrcamentoFranquiasCollection((List<OrcamentoFranquias>)this.service.genericFindBySQLQuery("SELECT i FROM OrcamentoFranquias i WHERE i.orcamentoSeguradora.id = ?0 ORDER BY i.id", new Object[]{this.orcamentoSeguradora.getId()}));
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<PerguntasPerfil> getPerguntasPerfilList() throws Exception{
		return (ArrayList<PerguntasPerfil>)this.service.genericFindBySQLQuery("SELECT i FROM PerguntasPerfil i WHERE i.perfil.id = null ORDER BY i.ordem", null);
	}
	
	/** Domínios **/
	public List<PObject> getUsoVeiculo() {
		return this.getDominioList("UsoVeiculo");
	}
	
	public List<PObject> getTipoCombustivel() {
		return this.getDominioList("TipoCombustivel");
	}
	
	public List<PObject> getRelacaoSeguradoProprietario() {
		return this.getDominioList("RelacaoSeguradoProprietario");
	}
	
	public List<PObject> getTipoFinanciamento() {
		return this.getDominioList("TipoFinanciamento");
	}
	
	public List<PObject> getTipoResidencia() {
		return this.getDominioList("TipoResidencia");
	}
	
	public List<PObject> getTipoGaragem() {
		return this.getDominioList("TipoGaragem");
	}
	
	public List<PObject> getUtilizacaoVeiculo() {
		return this.getDominioList("UtilizacaoVeiculo");
	}
	
	public List<PObject> getTipoFranquias() {
		return this.getDominioList("TipoFranquia");
	} 
	public List<PObject> getTipoCombustivelList(){
		return this.getDominioList("TipoCombustivel");
	}

	public List<PObject> getCategoriaVeiculoList(){
		return this.getDominioList("CategoriaVeiculo");
	}
	/** Fim Domínios*/
	
	public List<PObject> getTipoCobertura() throws Exception{
		return this.service.genericFindByNamedQuery("getTipoCobertura", null);
	}
	
	public List<PObject> getRastreadorIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getRastreadorIseg", null);
	}
	
	public List<PObject> getBloqueadorIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getBloqueadorIseg", null);
	}
	public List<PObject> getCoberturasIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getCoberturasIseg", new Object[]{Boolean.TRUE});
	}
	
	public List<PObject> getServiocosIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getServicosIseg", new Object[]{Boolean.TRUE});
	}
	
	public List<BancoRelacionamento> getBancoRelacionamentoList() throws Exception{
		List<BancoRelacionamento> bancoRelacionamentoList = this.service.genericFindByNamedQuery("getBancoRelacionamento", null);
		if(this.orcamentoSeguro.getId() != null && this.orcamentoSeguro.getOrcamentoBancosCollection() != null && !this.orcamentoSeguro.getOrcamentoBancosCollection().isEmpty()){
			for(BancoRelacionamento bancoRelacionamento: bancoRelacionamentoList){
				for(OrcamentoBancos orcamentoBancos : this.orcamentoSeguro.getOrcamentoBancosCollection()){
					if(orcamentoBancos.getBancoRelacionamento() != null && bancoRelacionamento.getId().compareTo(orcamentoBancos.getBancoRelacionamento().getId())==0){
						bancoRelacionamento.setSelecionado(bancoRelacionamento.getId());
					}
				}
			}
		}
		return bancoRelacionamentoList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Acessorios> getDispositivoSegurancaList() throws Exception{
		List<Acessorios> retorno = (List<Acessorios>)this.service.genericFindBySQLQuery("SELECT i FROM Acessorios i, DominioEsp d WHERE d.id = i.tipoAcessorio.id AND d.valor = 'SEGURANCA' ORDER BY i.descricao ASC",null);
		if(this.orcamentoSeguro != null &&
		   this.orcamentoSeguro.getId() != null &&
		   this.orcamentoSeguro.getAutomovelOrcamentoCollection() != null &&
		   !this.orcamentoSeguro.getAutomovelOrcamentoCollection().isEmpty() &&
		   this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection() != null &&
		   !this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection().isEmpty()){
				for(Acessorios ac : retorno){
					for(AutomovelOrcAcessorios aOa : this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection()){
						if(ac.getId().equals(aOa.getAcessorio().getId())){
							ac.setIdSelecionado(ac.getId());
						}
					}
				}
		}
		return retorno;
	}
	
	@SuppressWarnings("unchecked")
	public List<Acessorios> getOpcionaisList() throws Exception{
		List<Acessorios> retorno = (List<Acessorios>)this.service.genericFindBySQLQuery("SELECT i FROM Acessorios i, DominioEsp d WHERE d.id = i.tipoAcessorio.id AND d.valor = 'OPCIONAIS' ORDER BY i.descricao ASC ",null);
		if(this.orcamentoSeguro != null &&
		   this.orcamentoSeguro.getId() != null &&
		   this.orcamentoSeguro.getAutomovelOrcamentoCollection() != null &&
		   !this.orcamentoSeguro.getAutomovelOrcamentoCollection().isEmpty() &&
		   this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection() != null &&
		   !this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection().isEmpty()){
				for(Acessorios ac : retorno){
					for(AutomovelOrcAcessorios aOa : this.orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection()){
						if(ac.getId().equals(aOa.getAcessorio().getId())){
							ac.setIdSelecionado(ac.getId());
						}
					}
				}
		}
		return retorno;
	}
	
//	@SuppressWarnings("unchecked")
//	public void dePara(Long idSeguradora){
//		try {
//			List<ServicosIseg> servicosIsegList = (List<ServicosIseg>) this.service.genericFindBySQLQuery("SELECT s FROM ServicosIseg s WHERE s.seguradora.id = "+idSeguradora+" AND s.isAtiva = true AND s.ramo.id= 2 AND s.corretora.id = 1",null);
//			for(ServicosIseg servicosIseg : servicosIsegList){
//				ServicosIseg cob = new ServicosIseg();
//				cob.setDescricao(servicosIseg.getDescricao());
//				cob.setInformaFranquia(servicosIseg.getBlnInformaFranquia());
//				cob.setIsAtiva(servicosIseg.getIsAtiva());
//				cob.setRamo(servicosIseg.getRamo());
//				cob.setSequencia(servicosIseg.getSequencia() != null ? servicosIseg.getSequencia().longValue() : null);
//				this.service.save(cob);
//				ServicosCotacao sc = new ServicosCotacao();
//				sc.setServicos(servicosIseg);
//				sc.setServicosIseg(cob);
//				this.service.save(sc);
//			}
//			List<Coberturas> coberturas = (List<Coberturas>) this.service.genericFindBySQLQuery("SELECT s FROM Coberturas s WHERE s.seguradora.id = "+idSeguradora+" AND s.isAtiva = true AND s.ramo.id= 2 AND s.corretora.id = 1",null);
//			for(Coberturas cobertura : coberturas){
//				CoberturasIseg cob = new CoberturasIseg();
//				cob.setDescricao(cobertura.getDescricao());
//				cob.setInformaFranquia(cobertura.getBlnInformaFranquia());
//				cob.setIsAtiva(cobertura.getIsAtiva());
//				cob.setRamo(cobertura.getRamo());
//				cob.setSequencia(cobertura.getSequencia() != null ? cobertura.getSequencia().longValue() : null);
//				this.service.save(cob);
//				CoberturasCotacao sc = new CoberturasCotacao();
//				sc.setCoberturas(cobertura);
//				sc.setCoberturasIseg(cob);
//				this.service.save(sc);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	@SuppressWarnings("unchecked")
	public void salvarCorretoraCoberturasIseg(){
		try {
			List<CoberturasIseg> cobIsegList = (List<CoberturasIseg>)this.service.genericFindBySQLQuery("select c from CoberturasIseg c", null);
			for(CoberturasIseg cob : cobIsegList){
				CorretoraCoberturasIseg corCobIseg = new CorretoraCoberturasIseg();
				corCobIseg.setCoberturasIseg(cob);
				corCobIseg.setLmi(10000.00);
				Corretora cor = new Corretora();
				cor.setId(new Long(374250));
				corCobIseg.setCorretora(cor);
				this.service.save(corCobIseg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void salvarCorretoraServicosIseg(){
		try {
			List<ServicosIseg> servIsegList = (List<ServicosIseg>)this.service.genericFindBySQLQuery("select c from ServicosIseg c", null);
			for(ServicosIseg serv : servIsegList){
				CorretoraServicosIseg corServIseg = new CorretoraServicosIseg();
				corServIseg.setServicosIseg(serv);
				corServIseg.setLmi(10000.00);
				Corretora cor = new Corretora();
				cor.setId(new Long(374250));
				corServIseg.setCorretora(cor);
				this.service.save(corServIseg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void validate() {

		if (this.getFileUpload() != null) {

			if (getFileUpload().length() > 2048000){

				try {
					this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.orcamentoSeguradora.id = ?0 ", new Object[]{propostaAnexo.getOrcamentoSeguradora().getId()});
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				addActionError("ERRO: Arquivo anexo maior que 2048000 bytes (2MB)!");
				
			} else {

				addActionMessage("Upload concluido com sucesso!");

			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirAnexo(){
		try{
			PropostaAnexo propostaAnexo = new PropostaAnexo();
			propostaAnexo.setOrcamentoSeguradora(this.orcamentoSeguradora);
			// os campos this.fileUploadFileName e fileUploadContentType são populados automaticamente no struts 
			// usando o nome do campo no formulario que é fileUpload + FileName ou ContentType
			propostaAnexo.setNome(this.fileUploadFileName.toLowerCase());
			propostaAnexo.setContentType(this.fileUploadContentType.toLowerCase());

			if(fileUpload.length()/1024 > 300 && propostaAnexo.getContentType().indexOf("jpeg")>=0){
				propostaAnexo.setAnexo(Util.compressJpegFile(fileUpload));
			}else{
				propostaAnexo.setAnexo(Util.getBytesFromFile(fileUpload));
			}

			this.service.save(propostaAnexo);

			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.orcamentoSeguradora.id = ?0 ", new Object[]{this.orcamentoSeguradora.getId()});

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			
			try {
				this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.orcamentoSeguradora.id = ?0 ", new Object[]{this.orcamentoSeguradora.getId()});
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirAnexo(){
		try {
			this.service.remove(this.propostaAnexo);
			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.orcamentoSeguradora.id = ?0 ", new Object[]{this.propostaAnexo.getOrcamentoSeguradora().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String mostrarAnexo(){
		try{ 
			//System.out.println("Mostra anexo");
			this.propostaAnexo = (PropostaAnexo)this.service.find(propostaAnexo);

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String preparaMostrarAnexo(){
		try{

			//return Action.SUCCESS;
			return "popup";

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String carregarAnexos(){
		try {
			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.orcamentoSeguradora.id = ?0 ", new Object[]{this.propostaAnexo.getOrcamentoSeguradora().getId()});
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public String popupResumoOrcamento(){
		try {
			this.orcamentoSeguro = (OrcamentoSeguro)this.service.find(this.orcamentoSeguro);
			setaDadosCliente();
			if(HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaFisica){
				this.tipoCliente = Constants.CLIENTE_PF;
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
			}
			else if(HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = Constants.CLIENTE_PJ;
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
			}
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public String gerarPropostaOrcamento() {
		try {
			OrcamentoFranquias orcFran = (OrcamentoFranquias)this.service.find(this.orcamentoFranquias);
			this.orcamentoFranquias = Util.cloneBean(orcFran,OrcamentoFranquias.class);
			this.orcamentoFranquias.getParcelasOrcamentoCollection().add(this.parcelasOrcamento);
			BeanUtils.copyProperties(this.orcamentoSeguradora, this.orcamentoFranquias.getOrcamentoSeguradora());
			this.orcamentoSeguro = Util.cloneBean(this.orcamentoSeguradora.getOrcamentoSeguro(),OrcamentoSeguro.class);
			this.orcamentoSeguro.setTipoPessoa(this.tipoCliente);
			this.menuTrigger = new Menu();
			this.menuTrigger.setId(30460L);
//			adicionarCoberturasNaSeguradora();
//			adicionarServicosNaSeguradora();
			this.proposta = this.service.gerarProposta(this.orcamentoFranquias, this.orcamentoSeguradora);
			return "propostaAuto";
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public String abrirModalGerarProposta(){
		try {
			this.orcamentoFranquias = (OrcamentoFranquias)this.service.find(this.orcamentoFranquias);
			this.orcamentoSeguro = this.orcamentoFranquias.getOrcamentoSeguradora().getOrcamentoSeguro();
			setaDadosCliente();
			if(HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaFisica){
				this.tipoCliente = Constants.CLIENTE_PF;
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
			}
			if(HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = Constants.CLIENTE_PJ;
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.orcamentoSeguro.getCliente());
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public static void main(String[] args) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("punit"); 
			EntityManager em = emf.createEntityManager();
		try{
			
			
//			enviarOrcamentoEmail();
			
		    em.getTransaction().begin();
//		    
//		    Query query = em.createNativeQuery("select null as quantidade, oci.usuario_id, null as orcamento_seguradora_id ,oci.id as id, table1.cobertura_id as coberturas_id, table1.cobertura_id as coberturaId, oci.franquia as franquia, oci.lmi as lmi, oci.premio as premio, oci.informa_franquia, oci.texto_franquia, oci.cobertura_contratada, (case when table1.cobertura_id is null then ci.descricao else table1.cobertura_descricao end) as descricao,  oci.sequencia as sequencia, ci.id as coberturas_iseg_id from orcamento_cobertura_iseg oci inner join coberturas_iseg ci on oci.coberturas_iseg_id = ci.id left join (select c.id as cobertura_id, c.descricao as cobertura_descricao, c.coberturas_iseg_id as coberturas_iseg_id, c.seguradora_id seguradora_id from coberturas c inner join coberturas_iseg cob_iseg on c.coberturas_iseg_id = cob_iseg.id where c.seguradora_id = 17690 and c.ramo_id = 2 and c.corretora_id = 374250) table1 on table1.coberturas_iseg_id = ci.id where oci.orcamento_seguro_id = 662", "OrcamentoCobertura");
//			Object listaCobertura= query.getResultList();
			
//		    BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream("C:/Projetos/david/workspace/iseg/doc/db/profissoes.csv"), "ISO-8859-1"));  
//		    String linha;  
//		    String insert = "";
//		    while ((linha = in.readLine()) != null) {  
//		        insert += "INSERT INTO profissao(id,descricao) VALUES("+linha.replace(";", ",")+"); \n";
//		    }
		    
//		    System.out.println(("teste bla", "bal bla teste bla blabla de nuam sei oq"));
		    
		    
		    System.out.println("-------------------------COBERTURAS--------------------------------");
		    deParaCoberturas(em);
		    System.out.println("--------------------------SERVIÇOS---------------------------------");
		    deParaServicos(em);
		    
		    
//		    Query query = em.createQuery("SELECT s FROM Servicos s WHERE s.isAtiva = true AND s.ramo.id = 2 AND s.seguradora.id <> 19481 AND s.seguradora.id <> 14 AND s.seguradora.id <> 17690 and s.servicosIseg.id is not null");
//			List<Servicos> lista = query.getResultList();
//			for (Servicos servicos : lista) {
//				ServicosCotacao sc = new ServicosCotacao();
//				sc.setServicos(servicos);
//				sc.setServicosIseg(servicos.getServicosIseg());
//				em.persist(sc);
//				em.flush();
//			}
//			
//			Query query2 = em.createQuery("SELECT c FROM Coberturas c WHERE c.isAtiva = true AND c.ramo.id = 2 AND c.seguradora.id <> 19481 AND c.seguradora.id <> 14 AND c.seguradora.id <> 17690 AND c.coberturasIseg.id is not null");
//			List<Coberturas> listaCob = query2.getResultList();
//			for (Coberturas coberturas : listaCob) {
//				CoberturasCotacao cc = new CoberturasCotacao();
//				cc.setCoberturas(coberturas);
//				cc.setCoberturasIseg(coberturas.getCoberturasIseg());
//				em.persist(cc);
//				em.flush();
//			}
			
//			Query query2 = em.createQuery("SELECT c FROM ServicosIseg c");
//			List<ServicosIseg> listaCoberturasIseg = query2.getResultList();
//			for(ServicosIseg cobIseg : listaCoberturasIseg){
//				for(Servicos cob : lista){
//					String iseg = cobIseg.getDescricao().replace("APP", "");
//					iseg = iseg.replace("RCF", "");
//					iseg = iseg.replace("-", "").trim();
//					
//					String coberturas = cob.getDescricao().replace("APP", "");
//					coberturas = coberturas.replace("RCF", "");
//					coberturas = coberturas.replace("-", "").trim();
//					coberturas = coberturas.replace(StringUtils.difference(iseg, coberturas), "");
//					if(StringUtils.getLevenshteinDistance(iseg, coberturas) < 4){
//						cob.setServicosIseg(cobIseg);
//						EntityManager em2 = emf.createEntityManager();
//						em2.getTransaction().begin();
//						em.persist(cob);
//						em.flush();
//						em2.close();
//						System.out.print("cobIseg = "+cobIseg.getDescricao()+" coberturas = "+cob.getDescricao());
//						System.out.println(" igualdade = "+StringUtils.getLevenshteinDistance(coberturas,iseg));
//					}
//					
////					StringTokenizer st = new StringTokenizer(cob.getDescricao());
////					int cont = 0;
////					String[] cobisegDesc = {};
////					System.out.println(cob.getDescricao());
////					while (st.hasMoreTokens()){
////						cobisegDesc = cobIseg.getDescricao().replace("-","").replace(" ", "/").split("/");
////						for (int i = 0; i < cobisegDesc.length; i++) {
////							if(!cobisegDesc[i].trim().equals("")){
////								System.out.println(cobisegDesc[i]);
////								if(st.nextToken().contains(cobisegDesc[i]))
////									cont++;
////								else
////									cont--;
////							}
////						}
////					}
////					if(cont > 0)
//							System.out.println("encontrado: "+cob.getDescricao());
//				}
//			}
			
//		    OrcamentoSeguro orcamentoSeguro = (OrcamentoSeguro) em.find(OrcamentoSeguro.class, 640L);
		    
//			orcamentoSeguro.setOrcamentoSeguradoraCollection(new ArrayList<OrcamentoSeguradora>());
			
//			for(Long orcamentoSeguradora : this.orcamentoSegId){
//				orcamentoSeguro.getOrcamentoSeguradoraCollection().add((OrcamentoSeguradora)this.service.find(OrcamentoSeguradora.class, orcamentoSeguradora));
//			}
		    
//			this.service.salvarOrcamento(orcamentoSeguro);
//		    int cont = 0;
//		    String seguradora = "";
//			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
//				cont++;
//				seguradora = cont+orcamentoSeguradora.getSeguradora().getNome();
//		    	for(OrcamentoCobertura orcamentoCobertura : orcamentoSeguradora.getOrcamentoCoberturaCollection()){
//		    		CrossTabRelatorio oscs = new CrossTabRelatorio();
//		    		if(orcamentoSeguro.getTipoCobertura() != null && !orcamentoSeguro.getTipoCobertura().getId().equals(3L)){
//		    			oscs.setLinha("CASCO "+orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao());
//			    		oscs.setColuna(seguradora);
//			    		if(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao().equals("VR"))
//			    			oscs.setConteudo(new DecimalFormat("##,##0").format(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getValorCasco())+"%");
//			    		else
//			    			oscs.setConteudo(new DecimalFormat("##,##0.00").format(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getValorCasco()));
//			    		
//		    			orcamentoSeguro.getOrcamentoSeguradoraCoberturaCollection().add(oscs);
//		    			oscs.setSequencia(0);
//		    		}
//		    		if(orcamentoCobertura.getPremio() != null && orcamentoCobertura.getPremio() > 0){
//			    		oscs.setLinha(orcamentoCobertura.getDescricao());
//			    		oscs.setColuna(seguradora);
//			    		oscs.setConteudo(new DecimalFormat("##,##0.00").format(orcamentoCobertura.getPremio()));
//			    		oscs.setSequencia(orcamentoCobertura.getSequencia().intValue());
//			    		orcamentoSeguro.getOrcamentoSeguradoraCoberturaCollection().add(oscs);
//		    		}
//		    	}
//		    }
//			cont = 0;
//			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
//				cont++;
//		    	for(OrcamentoServicos orcamentoServicos : orcamentoSeguradora.getOrcamentoServicosCollection()){
//		    		if(orcamentoServicos.getPremio() != null && orcamentoServicos.getPremio() > 0){
//		    			CrossTabRelatorio oscs = new CrossTabRelatorio();
//			    		oscs.setLinha(orcamentoServicos.getDescricao());
//			    		oscs.setColuna(orcamentoServicos.getOrcamentoSeguradora().getSeguradora().getNome());
//			    		if(orcamentoServicos.getInformaFranquia()){
//			    			if(orcamentoServicos.getTextoFranquia() != null && !orcamentoServicos.getTextoFranquia().trim().equals("")){
//			    				oscs.setConteudo(orcamentoServicos.getTextoFranquia());
//			    			}else{
//			    				oscs.setConteudo("SIM");
//			    			}
//			    		}
//			    		oscs.setSequencia(orcamentoServicos.getSequencia().intValue());
//			    		orcamentoSeguro.getOrcamentoSeguradoraServicoCollection().add(oscs);
//		    		}
//		    	}
//		    }
//			cont = 0;
//			HashMap<String, List<CrossTabRelatorio>> hashCusto = new HashMap<String, List<CrossTabRelatorio>>();
//			List<CrossTabRelatorio> list = new ArrayList<CrossTabRelatorio>();
//			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
//				cont++;
//			   	for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
//			   		CrossTabRelatorio premioCross = new CrossTabRelatorio();
//			   		list = hashCusto.get(orcamentoFranquias.getTipoFranquia().getValor());
//			   		if(list == null || list.isEmpty()){
//			   			list = new ArrayList<CrossTabRelatorio>();
//			   		}
//			   		premioCross.setColuna(orcamentoFranquias.getOrcamentoSeguradora().getSeguradora().getNome());
//			   		premioCross.setLinha("CUSTO DO SEGURO");
//			   		premioCross.setConteudo(orcamentoFranquias.getPremioTotal());
//			   		list.add(premioCross);
//			   		
//			   		CrossTabRelatorio franquiaCross = new CrossTabRelatorio();
//			   		hashCusto.get(orcamentoFranquias.getTipoFranquia().getValor());
//			   		franquiaCross.setColuna(orcamentoFranquias.getOrcamentoSeguradora().getSeguradora().getNome());
//			   		franquiaCross.setLinha("VALOR DA FRANQUIA");
//			   		franquiaCross.setConteudo(orcamentoFranquias.getValorFranquia());
//			   		list.add(franquiaCross);
//			   		
//			   		hashCusto.put(orcamentoFranquias.getTipoFranquia().getValor(),list);
//			   	}
//			}
//			
//			List<CrossTabRelatorio> custosList = new ArrayList<CrossTabRelatorio>();
//			for(Entry<String, List<CrossTabRelatorio>> a: hashCusto.entrySet()){
//				CrossTabRelatorio custo = new CrossTabRelatorio();
//				custo.setLinha(a.getKey());
//				custo.setConteudo(a.getValue());
//				custosList.add(custo);
//			}
//			
//			orcamentoSeguro.setFranquiasCollection(custosList);
//			cont = 0;
//		    for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
//		    	cont++;
//		    	for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
//		    		String parcelas = "";
//		    		CrossTabRelatorio formaPagamentoFranquias = new CrossTabRelatorio();
//		    		formaPagamentoFranquias.setLinha(orcamentoFranquias.getTipoFranquia().getValor());
//		    		formaPagamentoFranquias.setColuna(orcamentoFranquias.getOrcamentoSeguradora().getSeguradora().getNome());
//		    		HashMap<String, String> mapParcela = new HashMap<String,String>();
//		    		for(ParcelasOrcamento parcelasOrcamento: orcamentoFranquias.getParcelasOrcamentoCollection()){
//		    			if(parcelasOrcamento.getValorParcelaCarne() != 0){
//		    				parcelas = mapParcela.get("CARNE");
//		    				if(parcelas == null){
//		    					parcelas = "";
//		    				}
//		    				parcelas += "Carnê: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCarne())+"\r";
//		    				mapParcela.put("CARNE", parcelas);
//		    			}
//		    			if(parcelasOrcamento.getValorParcelaDebito() != 0){
//		    				parcelas = mapParcela.get("DEBITO");
//		    				if(parcelas == null){
//		    					parcelas = "";
//		    				}
//		    				parcelas += "Déb Conta: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaDebito())+"\r";
//		    				mapParcela.put("DEBITO", parcelas);
//		    			}
//		    			if(parcelasOrcamento.getValorParcelaCredito() != 0){
//		    				parcelas = mapParcela.get("CREDITO");
//		    				if(parcelas == null){
//		    					parcelas = "";
//		    				}
//		    				parcelas += "Cartão: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCredito())+"\r";
//		    				mapParcela.put("CREDITO", parcelas);
//		    			}
//		    			if(parcelasOrcamento.getValorParcelaCheque() != 0){
//		    				parcelas = mapParcela.get("CHEQUE");
//		    				if(parcelas == null){
//		    					parcelas = "";
//		    				}
//		    				parcelas += "CHEQUE: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCheque())+"\r";
//		    				mapParcela.put("Cheque", parcelas);
//		    			}
//		    		}
//		    		parcelas = mapParcela.get("DEBITO") != null ? mapParcela.get("DEBITO") : "";
//		    		parcelas += mapParcela.get("CREDITO") != null ? mapParcela.get("CREDITO") : "";
//		    		parcelas += mapParcela.get("CARNE") != null ? mapParcela.get("CARNE") : "";
//		    		parcelas += mapParcela.get("CHEQUE") != null ? mapParcela.get("CHEQUE") : "";
//		    		if(parcelas.trim().equals(""))
//		    			parcelas = null;
//		    		formaPagamentoFranquias.setConteudo(parcelas);
//		    		orcamentoSeguro.getFormaPagamentoFranquiasCollection().add(formaPagamentoFranquias);
//		    		CrossTabRelatorio franquiaOrcamento = new CrossTabRelatorio();
//		    		franquiaOrcamento.setLinha(orcamentoFranquias.getTipoFranquia().getValor());
//		    		franquiaOrcamento.setColuna(orcamentoFranquias.getOrcamentoSeguradora().getSeguradora().getNome());
//		    		franquiaOrcamento.setConteudo(orcamentoFranquias.getValorFranquia());
////		    		orcamentoSeguro.getFranquiasCollection().add(franquiaOrcamento);
//		    		
//		    		CrossTabRelatorio premioOrcamento = new CrossTabRelatorio();
//		    		premioOrcamento.setLinha(orcamentoFranquias.getTipoFranquia().getValor());
//		    		premioOrcamento.setColuna(orcamentoFranquias.getOrcamentoSeguradora().getSeguradora().getNome());
//		    		premioOrcamento.setConteudo(new DecimalFormat("#,##0.00").format(orcamentoFranquias.getPremioTotal()));
//		    		orcamentoSeguro.getPremiosCollection().add(premioOrcamento);
//		    	}
//		    }
//		    
//		    for(int i = orcamentoSeguro.getOrcamentoSeguradoraCollection().size(); i < 5; i++){
//		    	CrossTabRelatorio c = new CrossTabRelatorio();
//		    	c.setColuna("  ");
//		    	c.setLinha("  ");
//		    	c.setConteudo("  ");
//		    	orcamentoSeguro.getOrcamentoSeguradoraCoberturaCollection().add(c);
//		    	orcamentoSeguro.getOrcamentoSeguradoraServicoCollection().add(c);
//		    	orcamentoSeguro.getFormaPagamentoFranquiasCollection().add(c);
//		    }
//		    
//		    List<OrcamentoSeguro> orcamentoSeguroList = new ArrayList<OrcamentoSeguro>();
//		    
//		    orcamentoSeguroList.add(orcamentoSeguro);
//		    
////		    HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(StrutsStatics.HTTP_RESPONSE);
////		    response.setContentType("application/pdf");
//		    Map<String,Object> parameters = new HashMap<String, Object>();
//		    String imagemFile = "logo_iSeg.png";
//			parameters.put("IMAGEM_FILE", imagemFile);
//			parameters.put("IMAGEM_DIR", "WebContent/common/images/");
//	    	JasperPrint print = JasperFillManager.fillReport("srcReport/Orcamento.jasper", parameters,new JRBeanCollectionDataSource(orcamentoSeguroList));
//			
////			JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
//			
//			JasperViewer jsv = new JasperViewer(print);
//			
//			jsv.setVisible(true);
//			jsv.setResizable(true);
//		    
		    em.getTransaction().commit();  
		}catch(Exception e){
			em.getTransaction().rollback();
			e.printStackTrace();
		} finally{
//			em.close();
		}

	}
	
	@SuppressWarnings("unchecked")
	public static void deParaServicos(EntityManager em){
		Query query = em.createQuery("SELECT c FROM Servicos c WHERE c.ramo.id = 2");
		List<Servicos> lista = query.getResultList();
		Query query2 = em.createQuery("SELECT c FROM ServicosIseg c");
		List<ServicosIseg> listaCoberturasIseg = query2.getResultList();
		for(Servicos serv : lista){
			for(ServicosIseg servIseg : listaCoberturasIseg){
				String iseg = servIseg.getDescricao().replace("APP", "");
				iseg = iseg.replace("RCF", "");
				iseg = iseg.replace("-", "").trim();
				iseg = iseg.replace("PROTEGIDOS", "").trim();
				iseg = iseg.replace("24 HORAS","");
				
				String servicos = serv.getDescricao().replace("APP", "");
				servicos = servicos.replace("RCF", "");
				servicos = servicos.replace("-", " ").trim();
				servicos = servicos.replace("AUTO","CARRO");
				servicos = servicos.replace("DIA/NOITE","24");
				servicos = servicos.replace("HRS","HORAS");
				servicos = servicos.replace("HR","HORAS");
				servicos = servicos.replace("HORAS","");
				servicos = servicos.replace("ASSIST ","ASSISTÊNCIA");
				servicos = servicos.replace("ASSISTENCIA","ASSISTÊNCIA");
				servicos = servicos.replace("VIP","");
				servicos = servicos.replace("ALFA","");
				servicos = servicos.replace("LIBERTY","");
				servicos = servicos.trim();
				servicos = servicos.replace(StringUtils.difference(iseg, servicos), "");
				servicos = servicos.replace(StringUtils.difference(servicos, iseg), "");
				if(StringUtils.getLevenshteinDistance(iseg, servicos) == 0){
					serv.setServicosIseg(servIseg);
					em.persist(serv);
					em.flush();
					System.out.print("Servicos Iseg = "+servIseg.getDescricao()+" Servicos = "+serv.getDescricao());
					System.out.println(" igualdade = "+StringUtils.getLevenshteinDistance(servicos,iseg));
				}
			}
		}
		
		String s = "ASSIST 24 HRS AUTO VIP I";
		
		System.out.println(s.replace("ASSIST ", "ASSISTENCIA "));
	}
	
	@SuppressWarnings("unchecked")
	public static void deParaCoberturas(EntityManager em){
		Query query = em.createQuery("SELECT c FROM Coberturas c WHERE c.ramo.id = 2");
		List<Coberturas> lista = query.getResultList();
		Query query2 = em.createQuery("SELECT c FROM CoberturasIseg c");
		List<CoberturasIseg> listaCoberturasIseg = query2.getResultList();
		for(CoberturasIseg cobIseg : listaCoberturasIseg){
			for(Coberturas cob : lista){
				String iseg = cobIseg.getDescricao().replace("APP", "");
				iseg = iseg.replace("RCF", "");
				iseg = iseg.replace("-", "").trim();
				
				String coberturas = cob.getDescricao().replace("APP", "");
				coberturas = coberturas.replace("RCF", "");
				coberturas = coberturas.replace("EXTRAS", "EXTRAORDINÁRIAS");
				coberturas = coberturas.replace("EXTRAORDINARIAS", "EXTRAORDINÁRIAS");
				coberturas = coberturas.replace("-", "").trim();
				coberturas = coberturas.replace(StringUtils.difference(iseg, coberturas), "");
				if(StringUtils.getLevenshteinDistance(iseg, coberturas) == 0){
					cob.setCoberturasIseg(cobIseg);
					em.persist(cob);
					em.flush();
					System.out.print("cobIseg = "+cobIseg.getDescricao()+" coberturas = "+cob.getDescricao());
					System.out.println(" igualdade = "+StringUtils.getLevenshteinDistance(coberturas,iseg));
				}
			}
		}
	}
	
	public String gerarOrcamento(){
		try{
			OrcamentoSeguro orcamentoSeguro = Util.cloneBean((OrcamentoSeguro) this.service.find(OrcamentoSeguro.class, this.orcamentoSeguro.getId()),OrcamentoSeguro.class);
			orcamentoSeguro.setOrcamentoSeguradoraCollection(new ArrayList<OrcamentoSeguradora>());
			List<AutomovelOrcamento> automovelOrcamentolist = this.service.genericFindByNamedQuery("getAutomovelOrcamentoByOrcamentoSeguro", new Object[]{orcamentoSeguro.getId()});
			orcamentoSeguro.setAutomovelOrcamentoCollection(automovelOrcamentolist);
			for(Long orcamentoSeguradora : this.orcamentoSegId){
				orcamentoSeguro.getOrcamentoSeguradoraCollection().add((OrcamentoSeguradora)this.service.find(OrcamentoSeguradora.class, orcamentoSeguradora));
			}
		    
			if(orcamentoSeguro.getCliente() == null || orcamentoSeguro.getCliente().getId() == null){
				PessoaFisica pessoa = new PessoaFisica();
				pessoa.setNome(orcamentoSeguro.getClienteNome());
				pessoa.setCnh(orcamentoSeguro.getCnh());
				pessoa.setDataNascimento(orcamentoSeguro.getDataNascimento());
				pessoa.setData1aHabilitacao(orcamentoSeguro.getData1aHabilitacao());
				pessoa.setCpfOuCnpj(orcamentoSeguro.getCpfOuCnpj());
				pessoa.setSexo(orcamentoSeguro.getSexo());
				pessoa.setEstadoCivil(orcamentoSeguro.getEstadoCivil());
				pessoa.setEmail(orcamentoSeguro.getEmail());
				pessoa.setTelefonePreferencial(orcamentoSeguro.getTelefonePreferencial());
				pessoa.setTelefoneAlternativo(orcamentoSeguro.getTelefoneAlternativo());
				pessoa.setTelefoneCelular(orcamentoSeguro.getTelefoneCelular());
				pessoa.setReferenciaPessoal(orcamentoSeguro.getReferenciaPessoal());
				pessoa.setProfissao(orcamentoSeguro.getProfissao());
				pessoa.setProfissaoNome(orcamentoSeguro.getOutraProfissao());
				orcamentoSeguro.setCliente(pessoa);
			}
			
		    int sequenciaImpressao = 0;
		    String seguradora = "";
			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
				sequenciaImpressao++;
				seguradora = sequenciaImpressao+orcamentoSeguradora.getSeguradora().getNome();
		    	for(OrcamentoCobertura orcamentoCobertura : orcamentoSeguradora.getOrcamentoCoberturaCollection()){
		    		CrossTabRelatorio oscs = new CrossTabRelatorio();
		    		if(orcamentoSeguro.getTipoCobertura() != null && !orcamentoSeguro.getTipoCobertura().getId().equals(3L)){
		    			oscs = new CrossTabRelatorio();
		    			oscs.setLinha("CASCO "+orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao());
			    		oscs.setColuna(seguradora);
			    		if(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao().equals("VR"))
			    			oscs.setConteudo(new DecimalFormat("##,##0").format(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getValorCasco())+"%");
			    		else
			    			oscs.setConteudo(new DecimalFormat("##,##0.00").format(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getValorCasco()));
			    		
			    		oscs.setSequencia(0);
		    			orcamentoSeguro.getOrcamentoSeguradoraCoberturaCollection().add(oscs);
		    		}
		    		if(orcamentoCobertura.getLmi() != null && orcamentoCobertura.getLmi() > 0){
		    			oscs = new CrossTabRelatorio();
		    			if(orcamentoCobertura.getCoberturasIseg() != null && orcamentoCobertura.getCoberturasIseg().getDescricao() != null)
		    				oscs.setLinha(orcamentoCobertura.getCoberturasIseg().getDescricao());
		    			else
		    				oscs.setLinha(orcamentoCobertura.getDescricao());
			    		oscs.setColuna(seguradora);
			    		if(orcamentoCobertura.getTextoFranquia() != null && !orcamentoCobertura.getTextoFranquia().trim().equals(""))
			    			oscs.setConteudo(new DecimalFormat("##,##0.00").format(orcamentoCobertura.getLmi()) +" \r "+ orcamentoCobertura.getTextoFranquia());
			    		else
			    			oscs.setConteudo(new DecimalFormat("##,##0.00").format(orcamentoCobertura.getLmi()));
			    		oscs.setSequencia(orcamentoCobertura.getSequencia() != null ? orcamentoCobertura.getSequencia().intValue() : 0);
			    		orcamentoSeguro.getOrcamentoSeguradoraCoberturaCollection().add(oscs);
		    		}
		    	}
		    }
			sequenciaImpressao = 0;
			seguradora = "";
			int cont = 0;
			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
				sequenciaImpressao++;
				seguradora = sequenciaImpressao+orcamentoSeguradora.getSeguradora().getNome();
		    	for(OrcamentoServicos orcamentoServicos : orcamentoSeguradora.getOrcamentoServicosCollection()){
		    		if(orcamentoServicos.getInformaFranquia()!= null && orcamentoServicos.getInformaFranquia()){
		    			CrossTabRelatorio oscs = new CrossTabRelatorio();
		    			if(orcamentoServicos.getServicosIseg() != null && orcamentoServicos.getServicosIseg().getDescricao() != null)
		    				oscs.setLinha(orcamentoServicos.getServicosIseg().getDescricao());
		    			else
		    				oscs.setLinha(orcamentoServicos.getDescricao());
			    		oscs.setColuna(seguradora);
		    			if(orcamentoServicos.getTextoFranquia() != null && !orcamentoServicos.getTextoFranquia().trim().equals("")){
		    				oscs.setConteudo(orcamentoServicos.getTextoFranquia());
		    			}else{
		    				oscs.setConteudo("SIM");
		    			}
		    			if(orcamentoServicos.getSequencia() != null){
		    				oscs.setSequencia(orcamentoServicos.getSequencia().intValue());
		    			}else{
		    				cont += orcamentoSeguradora.getOrcamentoServicosCollection().size();
		    				oscs.setSequencia(cont);
		    			}
			    		orcamentoSeguro.getOrcamentoSeguradoraServicoCollection().add(oscs);
		    		}
		    	}
		    }
			sequenciaImpressao = 0;
			seguradora = "";
			HashMap<String, List<CrossTabRelatorio>> hashCusto = new HashMap<String, List<CrossTabRelatorio>>();
			List<CrossTabRelatorio> list = new ArrayList<CrossTabRelatorio>();
			for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
				sequenciaImpressao++;
				seguradora = sequenciaImpressao+orcamentoSeguradora.getSeguradora().getNome();
			   	for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
			   		CrossTabRelatorio premioCross = new CrossTabRelatorio(); 
			   		list = hashCusto.get(orcamentoFranquias.getTipoFranquia().getValor());
			   		if(list == null || list.isEmpty()){
			   			list = new ArrayList<CrossTabRelatorio>();
			   		}
			   		premioCross.setColuna(seguradora);
			   		premioCross.setLinha("CUSTO DO SEGURO");
			   		premioCross.setConteudo(orcamentoFranquias.getPremioTotal());
			   		list.add(premioCross);
			   		
			   		CrossTabRelatorio franquiaCross = new CrossTabRelatorio();
			   		hashCusto.get(orcamentoFranquias.getTipoFranquia().getValor());
			   		franquiaCross.setColuna(seguradora);
			   		franquiaCross.setLinha("VALOR DA FRANQUIA");
			   		franquiaCross.setConteudo(orcamentoFranquias.getValorFranquia());
			   		list.add(franquiaCross);
			   		
			   		hashCusto.put(orcamentoFranquias.getTipoFranquia().getValor(),list);
			   	}
			}
			
			List<CrossTabRelatorio> custosList = new ArrayList<CrossTabRelatorio>();
			for(Entry<String, List<CrossTabRelatorio>> a: hashCusto.entrySet()){
				CrossTabRelatorio custo = new CrossTabRelatorio();
				custo.setLinha(a.getKey());
				custo.setConteudo(a.getValue());
				custosList.add(custo);
			}
			
			orcamentoSeguro.setFranquiasCollection(custosList);
			sequenciaImpressao = 0;
			seguradora = "";
		    for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
		    	sequenciaImpressao++;
		    	seguradora = sequenciaImpressao+orcamentoSeguradora.getSeguradora().getNome();
		    	for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
		    		String parcelas = "";
		    		CrossTabRelatorio formaPagamentoFranquias = new CrossTabRelatorio();
		    		formaPagamentoFranquias.setLinha(orcamentoFranquias.getTipoFranquia().getValor());
		    		formaPagamentoFranquias.setColuna(seguradora);
		    		HashMap<String, String> mapParcela = new HashMap<String,String>();
		    		for(ParcelasOrcamento parcelasOrcamento: orcamentoFranquias.getParcelasOrcamentoCollection()){
		    			if(parcelasOrcamento.getValorParcelaCarne() != 0){
		    				parcelas = mapParcela.get("CARNE");
		    				if(parcelas == null){
		    					parcelas = "";
		    				}
		    				parcelas += "Carnê: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCarne())+"\r";
		    				mapParcela.put("CARNE", parcelas);
		    			}
		    			if(parcelasOrcamento.getValorParcelaDebito() != 0){
		    				parcelas = mapParcela.get("DEBITO");
		    				if(parcelas == null){
		    					parcelas = "";
		    				}
		    				parcelas += "Déb Conta: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaDebito())+"\r";
		    				mapParcela.put("DEBITO", parcelas);
		    			}
		    			if(parcelasOrcamento.getValorParcelaCredito() != 0){
		    				parcelas = mapParcela.get("CREDITO");
		    				if(parcelas == null){
		    					parcelas = "";
		    				}
		    				parcelas += "Cartão: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCredito())+"\r";
		    				mapParcela.put("CREDITO", parcelas);
		    			}
		    			if(parcelasOrcamento.getValorParcelaCheque() != 0){
		    				parcelas = mapParcela.get("CHEQUE");
		    				if(parcelas == null){
		    					parcelas = "";
		    				}
		    				parcelas += "Cheque: "+parcelasOrcamento.getQtdParcelas() + "x de " + new DecimalFormat("#,##0.00").format(parcelasOrcamento.getValorParcelaCheque())+"\r";
		    				mapParcela.put("CHEQUE", parcelas);
		    			}
		    		}
		    		parcelas = mapParcela.get("DEBITO") != null ? mapParcela.get("DEBITO") : "";
		    		parcelas += mapParcela.get("CREDITO") != null ? mapParcela.get("CREDITO") : "";
		    		parcelas += mapParcela.get("CARNE") != null ? mapParcela.get("CARNE") : "";
		    		parcelas += mapParcela.get("CHEQUE") != null ? mapParcela.get("CHEQUE") : "";
		    		if(parcelas.trim().equals(""))
		    			parcelas = null;
		    		formaPagamentoFranquias.setConteudo(parcelas);
		    		orcamentoSeguro.getFormaPagamentoFranquiasCollection().add(formaPagamentoFranquias);
		    	}
		    }
		    
		    List<OrcamentoSeguro> orcamentoSeguroList = new ArrayList<OrcamentoSeguro>();
		    
		    orcamentoSeguroList.add(orcamentoSeguro);
		    if(notResponse == null || notResponse == false){
		    	ActionInvocation invocation = (ActionInvocation) ActionContext.getContext().getActionInvocation();
			    response = (HttpServletResponse) invocation.getInvocationContext().get(ServletActionContext.HTTP_RESPONSE);
			    response.setContentType("application/pdf");
		    }
		    
		    File file = null;
		    if(orcamentoSeguro.getOrcamentoSeguradoraCollection().size() == 1)
		    	file = new File(getServletContext().getRealPath("//WEB-INF//report//Orcamento1.jasper"));
		    else if(orcamentoSeguro.getOrcamentoSeguradoraCollection().size() == 2)
		    	file = new File(getServletContext().getRealPath("//WEB-INF//report//Orcamento2.jasper"));
		    else if(orcamentoSeguro.getOrcamentoSeguradoraCollection().size() == 3)
		    	file = new File(getServletContext().getRealPath("//WEB-INF//report//Orcamento3.jasper"));
		    else if(orcamentoSeguro.getOrcamentoSeguradoraCollection().size() == 4)
		    	file = new File(getServletContext().getRealPath("//WEB-INF//report//Orcamento4.jasper"));
		    else if(orcamentoSeguro.getOrcamentoSeguradoraCollection().size() == 5)
		    	file = new File(getServletContext().getRealPath("//WEB-INF//report//Orcamento5.jasper"));
		    else{
		    	new Exception();
		    	return Action.ERROR;
		    }
		    if(file.exists()){
		    	Corretora corretora = this.getCorretoraEmUso();
		    	Endereco endereco = (Endereco)this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaETipo", new Object[]{corretora.getId(),"C"});
				String imagemFile = StringUtils.isNotBlank(corretora.getImagemLogo()) ? corretora.getImagemLogo().toLowerCase() : "logo_iSeg.png";
				Map<String,Object> parameters = new HashMap<String, Object>();
				parameters.put("IMAGEM_FILE", imagemFile);
				parameters.put("IMAGEM_DIR", "../../common/images/");
				parameters.put("NOME_CORRETORA", corretora.getNome());
				parameters.put("ENDERECO_CORRETORA", endereco.getEnderecoCompleto());
				parameters.put("EMAIL_CORRETORA", corretora.getEmail());
				parameters.put("NOTES_LINKS_DATASOURCE", orcamentoSeguroList);
				parameters.put("SUBREPORT_DIR", getServletContext().getRealPath("//WEB-INF//report//")+File.separator);
				parameters.put("PRINTAR_COB_SERV", this.possuiCobServ);
				
		    	JasperPrint print = JasperFillManager.fillReport(file.getPath(), parameters,new JRBeanCollectionDataSource(orcamentoSeguroList));
		    	JRExporter exporter = new JRPdfExporter();
		    	byte[] output = exportReportToBytes(print, exporter);
		    	if(response != null){
		    		response.setContentLength(output.length);
		    		writeReport(response, output);
		    	}
		    	inputStream =  new ByteArrayInputStream(output);
		    }
		    return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	  public void setServletRequest(HttpServletRequest request){
		  this.request = request;
	  }

	  public HttpServletRequest getServletRequest(){
		  return request;
	  }
	
	/**
     * Writes report bytes to response output stream.
     *
     * @param response Current response.
     * @param output   Report bytes to write.
     * @throws ServletException on stream IOException.
     */
    private void writeReport(HttpServletResponse response, byte[] output) throws ServletException {
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            outputStream.write(output);
            outputStream.flush();
        } catch (IOException e) {
            LOG.error("Error writing report output", e);
            throw new ServletException(e.getMessage(), e);
        } finally {
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e) {
                LOG.error("Error closing report output stream", e);
                throw new ServletException(e.getMessage(), e);
            }
        }
    }
    
    /**
     * Run a Jasper report to CSV format and put the results in a byte array
     *
     * @param jasperPrint The Print object to render as CSV
     * @param exporter    The exporter to use to export the report
     * @return A CSV formatted report
     * @throws net.sf.jasperreports.engine.JRException
     *          If there is a problem running the report
     */
    private byte[] exportReportToBytes(JasperPrint jasperPrint, JRExporter exporter) throws JRException {
        byte[] output;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);

        exporter.exportReport();

        output = baos.toByteArray();

        return output;
    }
    
    @SuppressWarnings("deprecation")
	public String atualizacaoPolling(){
    	try {
    		Integer i = this.service.getRowCount("getCountOrcamentoSeguro", new Object[]{this.corretoraEmUso.getId()});
    		this.inputStream = new StringBufferInputStream(i.toString());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
    }
    
    public String listaCorretorPorGrupoDeVenda(){
    	try {
    		if(orcamentoSeguro.getGrupoDeVenda() != null && orcamentoSeguro.getGrupoDeVenda().getId() != null){
    			GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(orcamentoSeguro.getGrupoDeVenda());
    			Produtor produtorGerente = (Produtor)Util.cloneBean(grupoDeVenda.getProdutorGerente(), Produtor.class);
    			this.orcamentoSeguro.setProdutor(produtorGerente);
	    		for(GrupoProdutor grupoProdutor:grupoDeVenda.getGrupoProdutorCollection()){
	    			this.corretorList.add(grupoProdutor.getProdutor());
	    		}
	    		Boolean naoContem = Boolean.TRUE;
	    		for(Produtor produtor : this.corretorList){
	    			if(produtor.getId().compareTo(grupoDeVenda.getProdutorGerente().getId())==0){
	    				naoContem = Boolean.FALSE;
	    			}
	    		}
	    		if(naoContem){
	    			this.corretorList.add(produtorGerente);
	    		}
    		}
			return SUCCESS;
    	} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
    }
    @SkipValidation
    public String finalizarCalculo(){
    	try {
    		for(OrcamentoSeguradora orcamentoSeguradora : this.orcamentoSeguro.getOrcamentoSeguradoraCollection()){
    			Boolean hasPremioFranquia = Boolean.FALSE;
    			for(OrcamentoFranquias orcamentoFranquias : orcamentoSeguradora.getOrcamentoFranquiasCollection()){
    				if(orcamentoFranquias.getPremioTotal() > 0 && orcamentoFranquias.getValorFranquia() > 0){
    					hasPremioFranquia = Boolean.TRUE;
    				}else{
    					hasPremioFranquia = Boolean.FALSE;
    				}
    			}
    			if(hasPremioFranquia){
    				gerarCoberturasEServicosNaSeguradora(orcamentoSeguradora);
    			}
    		}
    		salvarEditar();
    		this.orcamentoSeguro = (OrcamentoSeguro)service.find(OrcamentoSeguro.class, this.orcamentoSeguro.getId());
    		this.orcamentoSeguro.setRamo((Ramo)this.service.find(this.orcamentoSeguro.getRamo()));
			this.orcamentoCoberturaIsegList = this.orcamentoSeguro.getOrcamentoCoberturaIsegCollection();
			this.orcamentoServicosIsegList = this.orcamentoSeguro.getOrcamentoServicosIsegCollection();
			this.orcamentoSeguradoraList = this.orcamentoSeguro.getOrcamentoSeguradoraCollection();
			setaDadosCliente();
			getRespostaPerfilList();
			getDispositivoSegurancaList();
			getOpcionaisList();
			listaCorretorPorGrupoDeVenda();
    		return SUCCESS;
    	} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}    
    }
    
    public void gerarCoberturasEServicosNaSeguradora(OrcamentoSeguradora orcamentoSeguradora) throws Exception{
    	orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(orcamentoSeguradora);
    	ArrayList<OrcamentoServicosIseg> orcamentoServicosIsegList = new ArrayList<OrcamentoServicosIseg>();
		for(OrcamentoServicosIseg orcamentoServicosIseg : orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoServicosIsegCollection()){
			orcamentoServicosIsegList.add((OrcamentoServicosIseg)Util.cloneBean(orcamentoServicosIseg, "id"));
		}
		ArrayList<OrcamentoCoberturaIseg> orcamentoCoberturaIsegList = new ArrayList<OrcamentoCoberturaIseg>();
		for(OrcamentoCoberturaIseg orcamentoCoberturaIseg:orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoCoberturaIsegCollection()){
			orcamentoCoberturaIsegList.add((OrcamentoCoberturaIseg)Util.cloneBean(orcamentoCoberturaIseg, "id"));
		}
		
		List<OrcamentoServicos> listOrcamentoServicos = new ArrayList<OrcamentoServicos>();
		if(orcamentoSeguradora.getOrcamentoServicosCollection() == null || orcamentoSeguradora.getOrcamentoServicosCollection().isEmpty()){
			for(int i = 0 ; i < orcamentoServicosIsegList.size(); i++){
				OrcamentoServicosIseg orcamentoServicosIseg = orcamentoServicosIsegList.get(i);
				OrcamentoServicos orcamentoServicos = new OrcamentoServicos();
				orcamentoServicos.setTextoFranquia(orcamentoServicosIseg.getTextoDescricao());
				orcamentoServicos.setInformaFranquia(orcamentoServicosIseg.getInformaFranquia());
				List<Servicos> servicosList = this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
				if(servicosList != null && !servicosList.isEmpty()){
					orcamentoServicosIseg.setServicosList(servicosList);
					if(orcamentoServicosIseg.getInformaFranquia())
						orcamentoServicos.setServicos(servicosList.get(0));
					
				}else if(orcamentoServicosIseg.getServicosIseg() != null && orcamentoServicosIseg.getServicosIseg().getId() != null){
					orcamentoServicosIseg.getServicosIsegList().add(orcamentoServicosIseg.getServicosIseg());
					if(orcamentoServicosIseg.getInformaFranquia()){
						orcamentoServicos.setServicosIseg(orcamentoServicosIseg.getServicosIseg());
					}
				}
				orcamentoServicos.setOrcamentoSeguradora(orcamentoSeguradora);
				orcamentoServicos.setSequencia(orcamentoServicosIseg.getSequencia());
				listOrcamentoServicos.add(orcamentoServicos);
			}
			orcamentoSeguradora.setOrcamentoServicosCollection(listOrcamentoServicos);
		}else{
			if(orcamentoServicosIsegList.size() < orcamentoSeguradora.getOrcamentoServicosCollection().size()){
				for(int i = orcamentoServicosIsegList.size() ; i < orcamentoSeguradora.getOrcamentoServicosCollection().size(); i++){
					OrcamentoServicosIseg orcamentoServicosIseg = new OrcamentoServicosIseg();
					orcamentoServicosIseg.setServicosIseg(orcamentoSeguradora.getOrcamentoServicosCollection().get(i).getServicosIseg());
					orcamentoServicosIsegList.add(orcamentoServicosIseg);
				}
			}
			for(int i = 0 ; i < orcamentoServicosIsegList.size(); i++){
				OrcamentoServicosIseg orcamentoServicosIseg = orcamentoServicosIsegList.get(i);
				List<Servicos> servicosList = this.service.genericFindByNamedQuery("getServicosByServicosIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoServicosIseg.getServicosIseg().getId()});
				if(servicosList != null && !servicosList.isEmpty()){
					orcamentoServicosIseg.setServicosList(servicosList);
				}else{
					orcamentoServicosIseg.getServicosIsegList().add(orcamentoServicosIseg.getServicosIseg());
				}
			}
		}
		if(orcamentoSeguradora.getOrcamentoCoberturaCollection() == null || orcamentoSeguradora.getOrcamentoCoberturaCollection().isEmpty()){
			for(int j = 0 ; j < orcamentoCoberturaIsegList.size(); j++){
				OrcamentoCoberturaIseg orcamentoCoberturaIseg = orcamentoCoberturaIsegList.get(j);
				List<Coberturas> coberturasList = this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturaIseg.getCoberturasIseg().getId()});
				OrcamentoCobertura orcamentoCobertura = new OrcamentoCobertura();
				orcamentoCobertura.setFranquia(orcamentoCoberturaIseg.getFranquia());
				orcamentoCobertura.setInformaFranquia(orcamentoCoberturaIseg.getInformaFranquia());
				orcamentoCobertura.setLmi(orcamentoCoberturaIseg.getLmi());
				orcamentoCobertura.setOrcamentoSeguradora(orcamentoSeguradora);
				orcamentoCobertura.setPremio(orcamentoCoberturaIseg.getPremio());
				orcamentoCobertura.setSequencia(orcamentoCoberturaIseg.getSequencia());
				orcamentoCobertura.setTextoFranquia(orcamentoCoberturaIseg.getTextoFranquia());
				orcamentoCobertura.setCoberturasIseg(orcamentoCoberturaIseg.getCoberturasIseg());
				orcamentoCobertura.setUsuario(this.usuario);
				if(coberturasList != null && !coberturasList.isEmpty()){
					orcamentoCoberturaIseg.setCoberturasList(coberturasList);
					orcamentoCobertura.setCoberturas(coberturasList.get(0));
				}else{
					orcamentoCoberturaIseg.getCoberturasIsegList().add(orcamentoCoberturaIseg.getCoberturasIseg());
				}
				orcamentoSeguradora.getOrcamentoCoberturaCollection().add(orcamentoCobertura);
			}
		}else{
			if(orcamentoCoberturaIsegList.size() < orcamentoSeguradora.getOrcamentoCoberturaCollection().size()){
				for(int i = orcamentoCoberturaIsegList.size() ; i < orcamentoSeguradora.getOrcamentoCoberturaCollection().size(); i++){
					OrcamentoCoberturaIseg orcamentoCoberturaIseg = new OrcamentoCoberturaIseg();
					orcamentoCoberturaIseg.setCoberturasIseg(orcamentoSeguradora.getOrcamentoCoberturaCollection().get(i).getCoberturasIseg());
					orcamentoCoberturaIsegList.add(orcamentoCoberturaIseg);
				}
			}
			for(int j = 0 ; j < orcamentoCoberturaIsegList.size(); j++){
				OrcamentoCoberturaIseg orcamentoCoberturaIseg = orcamentoCoberturaIsegList.get(j);
				List<Coberturas> coberturasList = this.service.genericFindByNamedQuery("getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", new Object[]{this.corretoraEmUso.getId(), orcamentoSeguradora.getSeguradora().getId(), Constants.RAMO_AUTOMOVEL,orcamentoCoberturaIseg.getCoberturasIseg().getId()});
				if(coberturasList != null && !coberturasList.isEmpty()){
					orcamentoCoberturaIseg.setCoberturasList(coberturasList);
				}else{
					orcamentoCoberturaIseg.getCoberturasIsegList().add(orcamentoCoberturaIseg.getCoberturasIseg());
				}
			}
		}	
		this.service.salvarCalculoOrcamentoSegAuto(orcamentoSeguradora);
    }
    
    public String enviarOrcamentoEmail(){
    	try{
	    	JavaMailSenderImpl sender = new JavaMailSenderImpl();
	    	sender.setHost(this.corretoraEmUso.getServicosEmailCollection().get(0).getHost());
	    	sender.setPort(this.corretoraEmUso.getServicosEmailCollection().get(0).getPorta());
	    	sender.setProtocol(this.corretoraEmUso.getServicosEmailCollection().get(0).getProtocolo());
	    	sender.setUsername(this.corretoraEmUso.getServicosEmailCollection().get(0).getEmailServidor());
	    	sender.setPassword(this.corretoraEmUso.getServicosEmailCollection().get(0).getSenhaEmailServidor());
	    	if(this.corretoraEmUso.getServicosEmailCollection().get(0).getIsAutenticacao()){
	    		Properties p = new Properties();
	        	p.setProperty("mail.smtps.auth", "true");
	        	sender.setJavaMailProperties(p);
	    	}
	
	    	MimeMessage message = sender.createMimeMessage();
	    	MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
	    	this.notResponse = true;
	    	this.response = null;
	    	gerarOrcamento();
	    	if(this.inputStream != null){
	    		helper.addAttachment("Orcamento_"+new SimpleDateFormat("dd_mm_yy").format(new Date()).toString()+".pdf",  new ByteArrayResource(IOUtils.toByteArray(this.inputStream)),"application/pdf");
	    		this.inputStream = null;
	    	}
	    	helper.setTo(this.emailTo);
	    	if(this.emailCC != null && !this.emailCC.isEmpty()){
	    		helper.setCc(this.emailCC);
	    	}
	    	helper.setFrom(this.corretoraEmUso.getServicosEmailCollection().get(0).getEmailCorretora());
	    	helper.setSubject(this.assuntoEmail);
	    	helper.setText(this.textoEmail,true);
	    	sender.send(message);
	    	this.inputStream = new StringBufferInputStream("SALVO");
	    	return Action.SUCCESS;
    	}catch(Exception e){
    		this.inputStream = new StringBufferInputStream("ERRO");
    		return Action.ERROR;
    	}
    }
    
    public void setaTemplateMensagem(){
    	if(this.corretoraEmUso.getTemplateMensagemCollection() != null && !this.corretoraEmUso.getTemplateMensagemCollection().isEmpty()){
    		for(TemplateMensagem templateMensagem : this.corretoraEmUso.getTemplateMensagemCollection()){
    			if(templateMensagem.getTipoMensagem().getId().compareTo(Constants.TIPO_MENSAGEM_ORCAMENTO) == 0 && templateMensagem.getInmidia().compareTo(Constants.TEMPLATE_INMIDIA_EMAIL) == 0){
    				this.templateMensagem = templateMensagem; 
    			}else if(templateMensagem.getTipoMensagem().getId().compareTo(Constants.TIPO_MENSAGEM_ORCAMENTO) == 0 && templateMensagem.getInmidia().compareTo(Constants.TEMPLATE_INMIDIA_SMS) == 0){
    				this.templateSms = templateMensagem;
    			}
    		}
    	}
    }
    
	/**
	 * 
	 * @return
	 */
    public String calculoSeguroBradesco(){ 
		AcessoSeguradora acessoSeguradora = null;
		try {
			acessoSeguradora = (AcessoSeguradora)this.service.genericFindByNamedQuery("getAcessoSeguradoraByCorretoraAndSeguradora",new Object[]{this.corretoraEmUso.getId(),this.orcamentoSeguradora.getSeguradora().getId()}).get(0);
		
	    	String cnpjCorretor = this.corretoraEmUso.getCpfOuCnpj().getValor().replaceAll("\\.", "").replaceAll("/", "").replaceAll("-", "");
			CalculoSeguro calculoSeguro = new CalculoSeguro(cnpjCorretor,acessoSeguradora.getSenha());
	
			this.orcamentoSeguradora = (OrcamentoSeguradora)this.service.find(OrcamentoSeguradora.class, this.orcamentoSeguradora.getId());
			OrcamentoSeguro orcamentoSeguro = (OrcamentoSeguro)this.service.find(OrcamentoSeguro.class, this.orcamentoSeguradora.getOrcamentoSeguro().getId());
			
			String dtInicioVigencia=Formatter.getDate(orcamentoSeguro.getInicioVigencia()).replaceAll("/", ""); 
			String dtCalculo=Formatter.getCurrentDate().replaceAll("/", "");
			String cepRisco=orcamentoSeguro.getPerfilOrcamentoCollection().get(0).getCepResidencia().getValor();
			String codFipe = orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getCodigoFipe();
			if (codFipe==null)
				codFipe=""; 
			else 
				codFipe = codFipe.replaceAll("-", "");
			
			String tipoPessoa = this.getTipoCliente().intValue()==0 ? "F" : "J"; 
			String dtNascimentoSegurado="";
			String dtNascimentoProprietario="";

			Integer cdVeiculo=new Integer(tabelaVeiculoBradesco.get(codFipe)==null ? "0" :(String)tabelaVeiculoBradesco.get(codFipe));
			Integer cdUso=new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getUsoVeiculo().getCodBradesco());
			Integer cdSegmento = new Integer("1"); // varejo como padrão
			if (orcamentoSeguro.getOrcamentoBancosCollection().size()>0)
				cdSegmento=orcamentoSeguro.getOrcamentoBancosCollection().get(0).getTipoContaRelacionamento().getCodBradesco();
			Integer cdRegiao=new Integer(0);
			Integer cdCobertura=orcamentoSeguro.getTipoCobertura().getCodBradesco();
			String flBlindagem="N";// orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getIsBlindado() ? "S" : "N";
			String cdRelacaoSegurado = "7"; // o segurado é o proprietario.
			if (!orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getIsSeguradoProprietario() && orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario()!=null)
				cdRelacaoSegurado=orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getRelacaoSeguradoProprietario().getCodBradesco();
			if (this.getTipoCliente().intValue()==0){
				PessoaFisica pessoaFisica = (PessoaFisica)orcamentoSeguro.getCliente();
				dtNascimentoSegurado=Formatter.getDate(pessoaFisica.getDataNascimento()).replaceAll("/", "");
				dtNascimentoProprietario=Formatter.getDate(pessoaFisica.getDataNascimento()).replaceAll("/", "");
			}
			if (!orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getIsSeguradoProprietario() && orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario()!=null)
				dtNascimentoProprietario=Formatter.getDate(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getDataNascimento()).replaceAll("/", "");
			if (!orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getIsSeguradoProprietario() &&
				orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario()!=null)
				dtNascimentoProprietario=Formatter.getDate(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getDataNascimento()).replaceAll("/", "");
			Integer cdUsuario=8000; 
			String flBasica="N"; // Não for frota basica
			String flPacoteEspecial="N"; // não é pacote especial
			Integer cdOperacao=0; // usado no teste, checar opçoes
			String inPropostaGcon="1"; // usado no teste, checar opçoes
			String tipoProposta="1"; // tipo de proposta individual
			String dtFimVigencia=Formatter.getDate(orcamentoSeguro.getTerminoVigencia()).replaceAll("/", ""); 
	
			EPacoteServicoVo ePacoteServicoVo = null;
			try {
			   ePacoteServicoVo = calculoSeguro.buscaPacoteServico(
    			dtInicioVigencia, 
    			dtCalculo,
    			cepRisco,
    			cdVeiculo,
    			cdUso,
    			cdSegmento, 
    			cdRegiao,
    			cdCobertura,
    			flBlindagem,
    			cdRelacaoSegurado,
    			dtNascimentoSegurado,
    			dtNascimentoProprietario,
    			cdUsuario,
    			flBasica,
    			flPacoteEspecial,
    			cdOperacao,
    			inPropostaGcon,
    			tipoPessoa,
    			tipoProposta,
    			dtFimVigencia);
				
			} catch (Exception e) {
				throw new GenericException("Sistema de calculo Bradesco indisponivel!"); 
			}

			BolCalculoAuto bolCalculoAuto = new BolCalculoAuto();
			ECalculoVo eCalculoVo = new ECalculoVo();
			
			EParametroVo eParametroVo;
			EVeiculoVo eVeiculoVo;
			ECoberturaVo eCoberturaVo;
			EPerfilVo ePerfilSeguradoVo;
			EPerfilVo ePerfilProprietarioVo;
			ERenovacaoVo eRenovacaoVo = null;
	
			if (orcamentoSeguro.getTipoProposta().intValue()==Constants.TP_PROP_RENOVACAO_EXTERNA.intValue()){
				eRenovacaoVo = new ERenovacaoVo();
				eRenovacaoVo.setCdCiaRenovacao(new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getSeguradoraAnterior().getCodBradesco()));
				eRenovacaoVo.setCdApoliceAnterior(new Long(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getNroApoliceAnterior()));
				eRenovacaoVo.setCdBonusApoliceAnterior(new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getClasseBonus()));
				eRenovacaoVo.setCdChaveIdentificacao(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getCodigoIdentificacaoAnterior());
				eRenovacaoVo.setNuSinistros(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getQtdSinistro());
			}
			
			ArrayOfEOpcionalVo arrayOfEOpcionalVo = new ArrayOfEOpcionalVo();
			List<EOpcionalVo> eOpcionalVoList = new ArrayList<EOpcionalVo>();
			EOpcionalVo eOpcionalVo = new EOpcionalVo();
			eOpcionalVo.setCdOpcional(10); // Cambio automatico
			eOpcionalVoList.add(eOpcionalVo);
			arrayOfEOpcionalVo.setEOpcionalVo(eOpcionalVoList);
			
			eVeiculoVo = new EVeiculoVo();
			eVeiculoVo.setCdVeiculo(cdVeiculo);
			eVeiculoVo.setCdVeiculoFipe(new Integer(codFipe));
			eVeiculoVo.setCdAntiFurto(128);
			eVeiculoVo.setListaOpcionais(arrayOfEOpcionalVo);
			eVeiculoVo.setCdCombustivel(new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoCombustivel().getCodBradesco()));
			eVeiculoVo.setCdUsoVeiculo(cdUso);
			eVeiculoVo.setCdProduto(cdCobertura);
			eVeiculoVo.setDtSaidaConcessionaria(Formatter.getDate(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getDataSaida()).replaceAll("/", ""));
			eVeiculoVo.setFlChassiRemarcado("N");
			eVeiculoVo.setFlComodato("N");
			eVeiculoVo.setFlIdenticar("N");
			eVeiculoVo.setFlValorMercado(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao().equals("VR") ? "S" : "N");
			eVeiculoVo.setNuAnoFabricacao(new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAnoFabricacao()));
			eVeiculoVo.setNuAnoModelo(new Integer(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getAnoModelo()));
			eVeiculoVo.setNuChassi(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getNroChassis());
			eVeiculoVo.setNuEixo(2);
			eVeiculoVo.setNuPassageiros(5);
			eVeiculoVo.setNuPlaca(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getNroPlaca());
			eVeiculoVo.setNuPortas(4);
			eVeiculoVo.setPcAjusteValorVeiculo(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getValorCasco().intValue());
			
			ePerfilProprietarioVo = new EPerfilVo();
			ePerfilSeguradoVo = new EPerfilVo();
	
			if (!orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getIsSeguradoProprietario()){
				ePerfilProprietarioVo.setDtNascimento(Formatter.getDate(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getDataNascimento()).replaceAll("/", ""));
			}else{
				ePerfilProprietarioVo.setDtNascimento(Formatter.getDate(orcamentoSeguro.getDataNascimento()).replaceAll("/", ""));
			}
			 
			ePerfilProprietarioVo.setCdEstadoCivil("C");  // proprietario não tem estado civil
			ePerfilProprietarioVo.setCdSexo("M");         // proprietario não tem sexo
			ePerfilProprietarioVo.setCdTipoPerfil(2);
			// definindo o perfil tanto pro propreiatario/segurado
			ePerfilProprietarioVo.setFlFilhosAte16Anos(orcamentoSeguro.getRespostaPerfilCollection().get(0).getResposta().equals("SIM") ? "S" : "N");
			ePerfilProprietarioVo.setFlFilhosEntre17E25(orcamentoSeguro.getRespostaPerfilCollection().get(1).getResposta().equals("SIM") ? "S" : "N");
			ePerfilProprietarioVo.setFlHaMaisVeiculoGaragem(orcamentoSeguro.getPerfilOrcamentoCollection().get(0).getQtdOutrosVeiculos().intValue()>1 ? "S":"N");
			ePerfilProprietarioVo.setFlVeiculoPernoiteGaragem(orcamentoSeguro.getPerfilOrcamentoCollection().get(0).getTipoGaragem().getCodBradesco());
	
			if (orcamentoSeguro.getCliente()!=null && orcamentoSeguro.getCliente() instanceof PessoaFisica){
				if (((PessoaFisica)orcamentoSeguro.getCliente()).getEstadoCivil().equals("CASADO") ||
					((PessoaFisica)orcamentoSeguro.getCliente()).getEstadoCivil().equals("UNIÃO ESTÁVEL")){
					ePerfilSeguradoVo.setCdEstadoCivil("C");
				}else{ 
					ePerfilSeguradoVo.setCdEstadoCivil("S");
				}
				ePerfilSeguradoVo.setCdSexo(((PessoaFisica)orcamentoSeguro.getCliente()).getSexo().substring(0, 1));
				ePerfilSeguradoVo.setCdTipoPerfil(1);
				// definindo o perfil tanto pro propreiatario/segurado
				ePerfilSeguradoVo.setDtNascimento(Formatter.getDate(((PessoaFisica)orcamentoSeguro.getCliente()).getDataNascimento()).replaceAll("/", ""));
			}else{
				if (orcamentoSeguro.getEstadoCivil().equals("CASADO") ||
					orcamentoSeguro.getEstadoCivil().equals("UNIÃO ESTÁVEL")){
					ePerfilSeguradoVo.setCdEstadoCivil("C");
				}else{
					ePerfilSeguradoVo.setCdEstadoCivil("S");
				}
				ePerfilSeguradoVo.setCdSexo(orcamentoSeguro.getSexo().substring(0, 1));
				ePerfilSeguradoVo.setCdTipoPerfil(1);
				// definindo o perfil tanto pro propreiatario/segurado
				ePerfilSeguradoVo.setDtNascimento(Formatter.getDate(orcamentoSeguro.getDataNascimento()).replaceAll("/", ""));
			}
			
			ePerfilSeguradoVo.setFlFilhosAte16Anos(orcamentoSeguro.getRespostaPerfilCollection().get(0).getResposta().equals("SIM") ? "S" : "N");
			ePerfilSeguradoVo.setFlFilhosEntre17E25(orcamentoSeguro.getRespostaPerfilCollection().get(1).getResposta().equals("SIM") ? "S" : "N");
			ePerfilSeguradoVo.setFlHaMaisVeiculoGaragem(orcamentoSeguro.getPerfilOrcamentoCollection().get(0).getQtdOutrosVeiculos().intValue()>1 ? "S":"N");
			ePerfilSeguradoVo.setFlVeiculoPernoiteGaragem(orcamentoSeguro.getPerfilOrcamentoCollection().get(0).getTipoGaragem().getCodBradesco());
	
			eCoberturaVo = new ECoberturaVo();
			if (this.orcamentoSeguradora.getOrcamentoServicosCollection().get(0).getServicos()!=null)
				eCoberturaVo.setCdClausulaAssistencia(new Integer(this.orcamentoSeguradora.getOrcamentoServicosCollection().get(0).getServicos().getCodigoNaSeguradora()));
			if (this.orcamentoSeguradora.getOrcamentoServicosCollection().get(1).getServicos()!=null)
				eCoberturaVo.setCdClausulaCarroReserva(new Integer(this.orcamentoSeguradora.getOrcamentoServicosCollection().get(1).getServicos().getCodigoNaSeguradora()));
			if (this.orcamentoSeguradora.getOrcamentoServicosCollection().get(2).getServicos()!=null)
				eCoberturaVo.setCdClausulaVidros(new Integer(this.orcamentoSeguradora.getOrcamentoServicosCollection().get(2).getServicos().getCodigoNaSeguradora()));
			eCoberturaVo.setCdZeroKm(0); // sem opção de cobertura veiculo zero.
			eCoberturaVo.setFlDespesasExtraordinarias("N"); // sem opção de despesas extraordinarias.
			eCoberturaVo.setIsAppInvalidez(orcamentoSeguro.getOrcamentoCoberturaIsegCollection().get(3).getLmi());
			eCoberturaVo.setIsAppMorte(orcamentoSeguro.getOrcamentoCoberturaIsegCollection().get(2).getLmi());
			eCoberturaVo.setIsDanosCorporais(orcamentoSeguro.getOrcamentoCoberturaIsegCollection().get(1).getLmi());
			eCoberturaVo.setIsDanosMateriais(orcamentoSeguro.getOrcamentoCoberturaIsegCollection().get(0).getLmi());
			eCoberturaVo.setIsDanosMorais(orcamentoSeguro.getOrcamentoCoberturaIsegCollection().get(4).getLmi());
			eCoberturaVo.setFlCoberturaSP("N"); // campo não disponivel no orcamento, relativo a trafego em Sao Paulo
	
			eParametroVo = new EParametroVo();
			eParametroVo.setCdCorretor(new Integer(acessoSeguradora.getCodigoCorretor()));
			eParametroVo.setFlAdicionalFracionamento("N");
			eParametroVo.setFlCustoApolice("S");
			eParametroVo.setFlIOF("S");
			eParametroVo.setFlProRata("N");
			eParametroVo.setNuCpfCnpjCorretor(cnpjCorretor);
	
			eCalculoVo.setCdTipoSistema(1); // 1-individual
			eCalculoVo.setCdEmpresa(0000); // campo não obrigatorio para cdtiposistema=1
			eCalculoVo.setCdInspetoria(18); // não achei nada na tabela de dominios, este valor eu peguei do exemplo.
			eCalculoVo.setCdModalidade("N"); // E – Endosso / N – Novo seguro / R – Renovação
			eCalculoVo.setCdProdutoCliente(cdSegmento); // mesmo que cdSegmento
			eCalculoVo.setDtInicioVigencia(dtInicioVigencia);
			eCalculoVo.setDtFinalVigencia(dtFimVigencia);
			eCalculoVo.setDtProcessamento(dtCalculo);
			eCalculoVo.setCdTipoPessoaSegurado(tipoPessoa);
			eCalculoVo.setCdTipoPessoaProprietario(tipoPessoa); // informação não disponivel, necessario checar se cpf ou cnpj
			eCalculoVo.setCdRelacaoSeguradoProprietario(new Integer(cdRelacaoSegurado));
			eCalculoVo.setNuCEP(cepRisco);
			eCalculoVo.setPcDescontoAuto(0.0);
			eCalculoVo.setPcDescontoAPP(0.0);
			eCalculoVo.setPcDescontoRCF(0.0);
			eCalculoVo.setFlNovaTarifa(ePacoteServicoVo.getFlIndicativoNovaTarifa());
			if (orcamentoSeguro.getCliente()!=null && orcamentoSeguro.getCliente() instanceof PessoaFisica){
				eCalculoVo.setNmProponente(orcamentoSeguro.getCliente().getNome());
				eCalculoVo.setNuCpfCnpjProponente(orcamentoSeguro.getCliente().getCpfOuCnpj().getValor().replaceAll("\\.", "").replaceAll("/", "").replaceAll("-", ""));
			}else{
				eCalculoVo.setNmProponente(orcamentoSeguro.getClienteNome());
				eCalculoVo.setNuCpfCnpjProponente(orcamentoSeguro.getCpfOuCnpj().getValor().replaceAll("\\.", "").replaceAll("/", "").replaceAll("-", ""));
			}
			eCalculoVo.setResidencialVo(null); // objeto VO
			// caso proprietario seja diferente e informado.
			if (orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario()!=null && 
				orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getCpfOuCnpj()!=null)
				eCalculoVo.setNuCpfCnpjProprietario(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario().getCpfOuCnpj().replaceAll("\\.", "").replaceAll("/", "").replaceAll("-", ""));
			
			eCalculoVo.setCdCindMesaNegocio(null); 
			eCalculoVo.setCnroContrato(null);
			eCalculoVo.setECoberturaVo(eCoberturaVo); // objeto VO
			eCalculoVo.setEPerfilSeguradoVo(ePerfilSeguradoVo); // objeto VO
			eCalculoVo.setEPerfilProprietarioVo(ePerfilProprietarioVo);  // objeto VO
			eCalculoVo.setERenovacaoVo(eRenovacaoVo);  // objeto VO 
			eCalculoVo.setCdSucursal(new Integer(acessoSeguradora.getCodigoAux1())); // atributo obrigatorio para o calculo.

			for (int i = 0; i < this.orcamentoSeguradora.getOrcamentoFranquiasCollection().size(); i++) {
				// ira calcular para cada opção de franquia
				eVeiculoVo.setCdFranquia(new Integer(this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getTipoFranquia().getCodBradesco()));
				eParametroVo.setFlCcb("S");  // tratar condição de pagto. usando carne para calcular.
/*				if (this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getParcelasOrcamentoCollection().get(0).getFormaPagamento().intValue()==3){
					eParametroVo.setFlCcb("S");  // tratar condição de pagto
				}else if (this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getParcelasOrcamentoCollection().get(0).getFormaPagamento().intValue()==2){
					eParametroVo.setFlCartaoCredito("S");
				}else{
					throw new GenericException("Forma de pagamentos aceitas são Carnê ou Cartão de Crédito!"); 
				}
*/
				eCalculoVo.setEVeiculoVo(eVeiculoVo); // objeto VO
				eCalculoVo.setEParametroVo(eParametroVo); // objeto VO
				
				try {
					calculoVo = calculoSeguro.calcularSeguroBradesco(eCalculoVo);

					if (calculoVo != null && calculoVo.getFlSucesso()!=null && calculoVo.getFlSucesso().equals("S")){
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setPremioTotal(calculoVo.getCoberturaVo().getPrmTotal());
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setValorFranquia(calculoVo.getCoberturaVo().getVlFranquia());
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setPremioLiquido(calculoVo.getCoberturaVo().getPrmLiquidoTotal());
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setCustoApolice(calculoVo.getVlCustoApolice());
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setIof(calculoVo.getListaParcelamento().getParcelamentoVo().get(0).getVlIOF());
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).setNroCalculoSeguradora(String.valueOf(calculoVo.getBuscaCotacaoVo().getNuCotacao()));
						
						// esta rotina deve ser implementada quando houver multicalculo bradesco, dai a forma de pagto e parcelas são diferentes e automatica
						// a forma atual não permite de forma simples a sua implementação.
						/*Integer formaPagamento = this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getParcelasOrcamentoCollection().get(0).getFormaPagamento().intValue();
						this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getParcelasOrcamentoCollection().clear();
						for (ParcelamentoVo parcelamentoVo : calculoVo.getListaParcelamento().getParcelamentoVo()) {
							ParcelasOrcamento parcelasOrcamento = new ParcelasOrcamento();
							parcelasOrcamento.setFormaPagamento(formaPagamento);
							parcelasOrcamento.setOrcamentoFranquias(this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i));
							if (formaPagamento==3){
								parcelasOrcamento.setQtdParcelaCarne(parcelamentoVo.getNuPrestacao());
								if (parcelamentoVo.getNuPrestacao().intValue()==1)
									parcelasOrcamento.setValorParcelaCarne(parcelamentoVo.getVlPrimeiraParcela());
								else
									parcelasOrcamento.setValorParcelaCarne(parcelamentoVo.getVlDemaisParcelas());
							}else{
								parcelasOrcamento.setQtdParcelaCredito(parcelamentoVo.getNuPrestacao());
								if (parcelamentoVo.getNuPrestacao().intValue()==1)
									parcelasOrcamento.setValorParcelaCredito(parcelamentoVo.getVlPrimeiraParcela());
								else
									parcelasOrcamento.setValorParcelaCredito(parcelamentoVo.getVlDemaisParcelas());
							}
							parcelasOrcamento.setIsSelected(true);
							this.orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i).getParcelasOrcamentoCollection().add(parcelasOrcamento);
						}*/
					}else{
						if (calculoVo==null){
							calculoVo = new CalculoVo();
							calculoVo.setListaAlertas(getMensagemWebService());
						}else{
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					calculoVo = new CalculoVo();
					calculoVo.setListaAlertas(getMensagemWebService());
				}
				listOfCalculoVo.add(calculoVo);
			}
			this.salvarCalculoOrcamentoSegAuto();
		
		} catch (Exception e) { 
			// checar pois não ira calcular se não tiver acessoSeguradora criado.
			e.printStackTrace();
			addActionError(e.getMessage());
			return Action.ERROR;
		} 
    	return Action.SUCCESS;
    }
    
    private ArrayOfMensagemAlertaVo getMensagemWebService(){
		MensagemAlertaVo mensagemAlertaVo = new MensagemAlertaVo();
		mensagemAlertaVo.setCdAlerta(0);
		mensagemAlertaVo.setDsAlerta("Web Service Bradesco não disponivel!");
		
		List<MensagemAlertaVo> listOfMensagens = new ArrayList<MensagemAlertaVo>();
		listOfMensagens.add(mensagemAlertaVo);
		ArrayOfMensagemAlertaVo arrayOfMensagemAlertaVo = new ArrayOfMensagemAlertaVo();
		arrayOfMensagemAlertaVo.setMensagemAlertaVo(listOfMensagens);
		return arrayOfMensagemAlertaVo;
    }
    public List<AutomovelOrcamento> getAutomovelList() {
		return automovelList;
	}

	public void setAutomovelList(List<AutomovelOrcamento> automovelList) {
		this.automovelList = automovelList;
	}

	public Integer getItemCorrente() {
		return itemCorrente;
	}

	public void setItemCorrente(Integer itemCorrente) {
		this.itemCorrente = itemCorrente;
	}

	public Integer getItens() {
		return itens;
	}

	public void setItens(Integer itens) {
		this.itens = itens;
	}

	public Boolean getAutomovelAlterado() {
		return automovelAlterado;
	}

	public void setAutomovelAlterado(Boolean automovelAlterado) {
		this.automovelAlterado = automovelAlterado;
	}

	public Fabricante getMarca() {
		return marca;
	}

	public void setMarca(Fabricante marca) {
		this.marca = marca;
	}

	public Long getClienteCondutorId() {
		return clienteCondutorId;
	}

	public void setClienteCondutorId(Long clienteCondutorId) {
		this.clienteCondutorId = clienteCondutorId;
	}
	public void setCondutores(List<Condutor> condutores) {
		this.condutores = condutores;
	}

	public List<VeiculoModelo> getModelos() {
		return modelos != null ? modelos : new ArrayList<VeiculoModelo>();
	}

	public void setModelos(List<VeiculoModelo> modelos) {
		this.modelos = modelos;
	}

	public VeiculoModelo getVeiculoModelo() {
		return veiculoModelo;
	}

	public void setVeiculoModelo(VeiculoModelo veiculoModelo) {
		this.veiculoModelo = veiculoModelo;
	}

	public Boolean getBlnPossuiPerfil() {
		return blnPossuiPerfil;
	}

	public void setBlnPossuiPerfil(Boolean blnPossuiPerfil) {
		this.blnPossuiPerfil = blnPossuiPerfil;
	}

	public List<Perfil> getPerfilList() {
		return perfilList;
	}

	public void setPerfilList(List<Perfil> perfilList) {
		this.perfilList = perfilList;
	}

	public Boolean getPerfilAlterado() {
		return perfilAlterado;
	}

	public void setPerfilAlterado(Boolean perfilAlterado) {
		this.perfilAlterado = perfilAlterado;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public String getApoliceCancelada() {
		return apoliceCancelada;
	}

	public void setApoliceCancelada(String apoliceCancelada) {
		this.apoliceCancelada = apoliceCancelada;
	}

	public String getSeguradoProprietarioVeiculo() {
		return seguradoProprietarioVeiculo;
	}

	public void setSeguradoProprietarioVeiculo(String seguradoProprietarioVeiculo) {
		this.seguradoProprietarioVeiculo = seguradoProprietarioVeiculo;
	}

	public OrcamentoCobertura getOrcamentoCobertura() {
		return orcamentoCobertura;
	}

	public void setOrcamentoCobertura(OrcamentoCobertura orcamentoCobertura) {
		this.orcamentoCobertura = orcamentoCobertura;
	}

	public OrcamentoServicos getOrcamentoServico() {
		return orcamentoServico;
	}

	public void setOrcamentoServico(OrcamentoServicos orcamentoServico) {
		this.orcamentoServico = orcamentoServico;
	}

	public Condutor getCondutor() {
		return condutor;
	}

	public void setCondutor(Condutor condutor) {
		this.condutor = condutor;
	}

	public String getKitGas() {
		return kitGas;
	}

	public void setKitGas(String kitGas) {
		this.kitGas = kitGas;
	}

	public String getFinanciado() {
		return financiado;
	}

	public void setFinanciado(String financiado) {
		this.financiado = financiado;
	}

	public ProprietarioArrendatario getProprietarioArrendatario() {
		return proprietarioArrendatario;
	}

	public void setProprietarioArrendatario(
			ProprietarioArrendatario proprietarioArrendatario) {
		this.proprietarioArrendatario = proprietarioArrendatario;
	}

	public Boolean getIsCondutorPrincipal() {
		return isCondutorPrincipal;
	}

	public void setIsCondutorPrincipal(Boolean isCondutorPrincipal) {
		this.isCondutorPrincipal = isCondutorPrincipal;
	}
	
	public OrcamentoCoberturaIseg getOrcamentoCoberturaIseg() {
		return orcamentoCoberturaIseg;
	}

	public void setOrcamentoCoberturaIseg(
			OrcamentoCoberturaIseg orcamentoCoberturaIseg) {
		this.orcamentoCoberturaIseg = orcamentoCoberturaIseg;
	}

	public OrcamentoServicosIseg getOrcamentoServicosIseg() {
		return orcamentoServicosIseg;
	}

	public void setOrcamentoServicosIseg(OrcamentoServicosIseg orcamentoServicosIseg) {
		this.orcamentoServicosIseg = orcamentoServicosIseg;
	}

	public Long[] getAcessoriosId() {
		return acessoriosId;
	}

	public void setAcessoriosId(Long[] acessoriosId) {
		this.acessoriosId = acessoriosId;
	}
	
	public Double getPremioTotal() {
		return premioTotal;
	}

	public void setPremioTotal(Double premioTotal) {
		this.premioTotal = premioTotal;
	}

	public Integer getQtdeParcelas() {
		return qtdeParcelas;
	}

	public void setQtdeParcelas(Integer qtdeParcelas) {
		this.qtdeParcelas = qtdeParcelas;
	}

	public Integer getQtdeParDeb() {
		return qtdeParDeb;
	}

	public void setQtdeParDeb(Integer qtdeParDeb) {
		this.qtdeParDeb = qtdeParDeb;
	}

	public Integer getQtdeParCarne() {
		return qtdeParCarne;
	}

	public void setQtdeParCarne(Integer qtdeParCarne) {
		this.qtdeParCarne = qtdeParCarne;
	}

	public Integer getQtdeParCred() {
		return qtdeParCred;
	}

	public void setQtdeParCred(Integer qtdeParCred) {
		this.qtdeParCred = qtdeParCred;
	}

	public Integer getQtdeParCheq() {
		return qtdeParCheq;
	}

	public void setQtdeParCheq(Integer qtdeParCheq) {
		this.qtdeParCheq = qtdeParCheq;
	}

	public List<Coberturas> getCoberturasList() {
		return coberturasList;
	}

	public void setCoberturasList(List<Coberturas> coberturasList) {
		this.coberturasList = coberturasList;
	}

	public List<Servicos> getServicosList() {
		return servicosList;
	}

	public void setServicosList(List<Servicos> servicosList) {
		this.servicosList = servicosList;
	}
	
	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}

	public List<OrcamentoSeguradora> getOrcamentoSeguradoraList() throws Exception{
		return orcamentoSeguradoraList;
	}

	public void setOrcamentoSeguradoraList(
			List<OrcamentoSeguradora> orcamentoSeguradoraList) {
		this.orcamentoSeguradoraList = orcamentoSeguradoraList;
	}
	
	public OrcamentoFranquias getOrcamentoFranquias() {
		return orcamentoFranquias;
	}

	public void setOrcamentoFranquias(OrcamentoFranquias orcamentoFranquias) {
		this.orcamentoFranquias = orcamentoFranquias;
	}
	
	public List<OrcamentoFranquias> getOrcamentoFranquiasList() {
		return orcamentoFranquiasList;
	}

	public void setOrcamentoFranquiasList(
			List<OrcamentoFranquias> orcamentoFranquiasList) {
		this.orcamentoFranquiasList = orcamentoFranquiasList;
	}
	
	public List<ParcelasOrcamento> getParcelasOrcamentoList() {
		return parcelasOrcamentoList;
	}

	public void setParcelasOrcamentoList(
			List<ParcelasOrcamento> parcelasOrcamentoList) {
		this.parcelasOrcamentoList = parcelasOrcamentoList;
	}
	
	public List<OrcamentoCoberturaIseg> getOrcamentoCoberturaIsegList() throws Exception {
		return orcamentoCoberturaIsegList;
	}
	
	public void setOrcamentoCoberturaIsegList(
			List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegList) {
		this.orcamentoCoberturaIsegList = orcamentoCoberturaIsegList;
	}

	public List<OrcamentoServicosIseg> getOrcamentoServicosIsegList() throws Exception {
		return orcamentoServicosIsegList;
	}
	
	public void setOrcamentoServicosIsegList(
			List<OrcamentoServicosIseg> orcamentoServicosIsegList) {
		this.orcamentoServicosIsegList = orcamentoServicosIsegList;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

	public PropostaAnexo getPropostaAnexo() {
		return propostaAnexo;
	}

	public void setPropostaAnexo(PropostaAnexo propostaAnexo) {
		this.propostaAnexo = propostaAnexo;
	}

	public List<PropostaAnexo> getPropostaAnexoList() {
		return propostaAnexoList;
	}

	public void setPropostaAnexoList(List<PropostaAnexo> propostaAnexoList) {
		this.propostaAnexoList = propostaAnexoList;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public Integer getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(Integer formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public ParcelasOrcamento getParcelasOrcamento() {
		return parcelasOrcamento;
	}

	public void setParcelasOrcamento(ParcelasOrcamento parcelasOrcamento) {
		this.parcelasOrcamento = parcelasOrcamento;
	}
	
	public void setServletResponse(HttpServletResponse response){
	  this.response = response;
	}

	public HttpServletResponse getServletResponse(){
	  return response;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Long[] getOrcamentoSegId() {
		return orcamentoSegId;
	}

	public void setOrcamentoSegId(Long[] orcamentoSegId) {
		this.orcamentoSegId = orcamentoSegId;
	}

	public Long[] getBancosRelacionamentoIds() {
		return bancosRelacionamentoIds;
	}

	public void setBancosRelacionamentoIds(Long[] bancosRelacionamentoIds) {
		this.bancosRelacionamentoIds = bancosRelacionamentoIds;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public List<Produtor> getCorretorList() {
		return corretorList;
	}

	public void setCorretorList(List<Produtor> corretorList) {
		this.corretorList = corretorList;
	}

	public String getTextoEmail() {
		return textoEmail;
	}

	public void setTextoEmail(String textoEmail) {
		this.textoEmail = textoEmail;
	}

	public String getEmailTo() {
		return emailTo;
	}

	public void setEmailTo(String emailTo) {
		this.emailTo = emailTo;
	}

	public Boolean getPossuiCobServ() {
		return possuiCobServ;
	}

	public void setPossuiCobServ(Boolean possuiCobServ) {
		this.possuiCobServ = possuiCobServ;
	}

	public String getEmailCC() {
		return emailCC;
	}

	public void setEmailCC(String emailCC) {
		this.emailCC = emailCC;
	}

	public TemplateMensagem getTemplateMensagem() {
		return templateMensagem;
	}

	public void setTemplateMensagem(TemplateMensagem templateMensagem) {
		this.templateMensagem = templateMensagem;
	}

	public String getAssuntoEmail() {
		return assuntoEmail;
	}

	public void setAssuntoEmail(String assuntoEmail) {
		this.assuntoEmail = assuntoEmail;
	}

	public TemplateMensagem getTemplateSms() {
		return templateSms;
	}

	public void setTemplateSms(TemplateMensagem templateSms) {
		this.templateSms = templateSms;
	}

	public CalculoVo getCalculoVo() {
		return calculoVo;
	}

	public List<CalculoVo> getListOfCalculoVo() {
		return listOfCalculoVo;
	}

	public void setListOfCalculoVo(List<CalculoVo> listOfCalculoVo) {
		this.listOfCalculoVo = listOfCalculoVo;
	}
	
	
}