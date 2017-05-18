package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaService;
import iseg.app.constants.Constants;
import iseg.app.conversion.CEP;
import iseg.app.conversion.CpfCnpj;
import iseg.app.model.Agenciamento;
import iseg.app.model.Automovel;
import iseg.app.model.Coberturas;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.Endereco;
import iseg.app.model.Endosso;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.PosVenda;
import iseg.app.model.Produtor;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaAnexo;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.QuestionarioPosVenda;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.RespostaPosVenda;
import iseg.app.model.RiscoDiversos;
import iseg.app.model.Seguradora;
import iseg.app.model.Sequencia;
import iseg.app.model.Servicos;
import iseg.app.model.SmsEventosCorretora;
import iseg.app.model.SmsserverOut;
import iseg.app.model.TipoDeQuebraDeRelatorio;
import iseg.app.model.Vistoriadora;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;

	protected PropostaService service;
	protected PropostaComissaoService serviceAux;

	protected Proposta proposta;
	protected Proposta propostaSearch;
	protected Proposta propostaSearchRenovacao;
	protected Seguradora seguradora;
	protected Ramo ramo;
	protected Endosso endosso;  
	protected String idRelatorio;
	protected Integer natureza;
	protected String ordem;
	protected String titulo;
	protected List<Proposta> propostas;
	protected Pessoa pessoa;
	protected PessoaFisica pessoaFisica;
	protected PessoaJuridica pessoaJuridica;
	protected Endereco endereco;
	protected List<ParcelasProposta>parcelas;
	protected List<Vistoriadora> vistoriadoras;
	protected List<ComissionadoProposta> comissionadoPropostaList = new ArrayList<ComissionadoProposta>();
	protected List<ComissionadoAgenciamento> comissionadoAgenciamentoList = new ArrayList<ComissionadoAgenciamento>();
	protected List<Automovel> automovelList = new ArrayList<Automovel>();
	protected List<RepasseComissao> repassePropostaList;
	protected List<Seguradora> seguradoras;
	protected Boolean automovelAlterado;

	protected PropostaAnexo propostaAnexo;
	protected List<PropostaAnexo>propostaAnexoList = new ArrayList<PropostaAnexo>();
	protected File fileUpload;
	protected String fileUploadFileName;
	protected Boolean isFatura;
	protected String demaisParcelas;
	protected String parcelaSelecionada;
	protected ParcelasProposta parcelasProposta;
	protected String referencia;
	protected boolean atualizarDemaisParcelas = false;
	protected int comissionadoPropostaCount;
	protected int comissionadoAgenciamentoCount;
	protected ComissionadoProposta comissionadoProposta;
	protected ComissionadoAgenciamento comissionadoAgenciamento;
	protected List<Agenciamento> agenciamentoList;
	protected Agenciamento agenciamento;
	protected PessoaJuridica estipulante;
	protected Long tipoProposta;

	protected Long propostaId;
	
	private String fileUploadContentType;
	private InputStream imageStream;

	protected Boolean blnReloaded = new Boolean(true);

	protected Integer tipoCliente;
	protected Boolean blnPropria = new Boolean(true);
	protected Boolean blnEndosso = new Boolean(false);
	protected Boolean blnRenovacao = new Boolean(false);
	protected Boolean blnGerarParcelas;
	protected Boolean blnPreparandoEndosso = new Boolean(false);
	protected boolean parcelasAndPremioOK = true;
	private Boolean blnOrcamento = Boolean.FALSE;

	protected Integer currentTab = -1;
	protected Integer currentTabSaved;
	protected Long operacao;
	protected Long tipoEndosso;

	protected Boolean mostraUltimaLista = new Boolean(false);

	protected Boolean temPedidoDeEndosso;
	protected List<Proposta> historicoList = new ArrayList<Proposta>();

	//Dados para criar endosso
	protected String[] dados; 

	//@Autowired
	public PropostaAction(PropostaService propostaService, PropostaComissaoService propostaComissaoService) {
		super(propostaService);
		this.service = propostaService;
		this.serviceAux = propostaComissaoService;
	}

	public void prepare() throws Exception {
		super.prepare();
		if(this.getSession().get("propostaSearch") != null){
			this.propostaSearch = (Proposta) this.getSession().get("propostaSearch");
			if (this.getSession().get("page")!=null)
				this.page = (Integer)this.getSession().get("page");
			if (this.getSession().get("pageSize")!=null)
				this.pageSize = (Integer)this.getSession().get("pageSize");
		}else{
			if (this.propostaSearch==null)
				this.propostaSearch = new Proposta();
			this.propostaSearch.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
		}
	}

	public void validate() {

		if (this.getFileUpload() != null) {

			if (getFileUpload().length() > 2048000){

				try {
					this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.proposta.id = ?0 ", new Object[]{getProposta().getId()});
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
	
	@Override
	public String execute() {
		this.proposta = new Proposta();
		this.pessoaFisica = new PessoaFisica();
		this.pessoaJuridica = new PessoaJuridica();
		return Action.SUCCESS;
	}

	@Override
	@SkipValidation
	public String novo() {
		try {

			if (this.ramo.getId()==null){
				this.ramo = this.ramo.getSubRamo();
			}

			if (this.getIsFatura()==null)
				this.setIsFatura(false);
			
			if(this.ramo.getSubRamo()!=null && this.ramo.getSubRamo().getId()!=null && 
			   this.ramo.getSubRamo().getId().equals(Constants.RAMO_TRANSPORTES) && this.getIsFatura()){
				return "propostaTransportes";
			}else if(this.ramo.getId().equals(Constants.RAMO_AUTOMOVEL)){
				return "propostaAuto";
			}else if(this.ramo.getId().equals(Constants.RAMO_EMPRESARIAL) && this.getIsFatura()){
				return "propostaImoveisFatura";
			}else if(this.ramo.getId().equals(Constants.RAMO_IMOVEL)){
				return "propostaImoveis";
			}else if(!this.ramo.getId().equals(Constants.RAMO_TRANSPORTES) && this.getIsFatura()){
				return "propostaEmpresarial";
			}else if(this.ramo.getId().equals(Constants.RAMO_VIDA_INDIVIDUAL)){
				return "propostaIndividual";
			}else if(this.ramo.getId().equals(Constants.RAMO_RESIDENCIAL)){
				return "propostaImoveis";
			}else if(this.ramo.getId().equals(Constants.RAMO_EMPRESARIAL)){
				return "propostaImoveis";
			}else if(this.ramo.getId().equals(Constants.RAMO_CONDOMINIO)){
				return "propostaImoveis";
			}else{
				//if(this.ramo.getId().equals(Constants.RAMO_RISCO_DIVERSOS)){
				return "propostaRiscosDiversos";

			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	public String inserirAnexo(){
		try{
			MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
			Enumeration fileParameterNames = multiWrapper.getFileParameterNames();
			Enumeration parameterNames = multiWrapper.getParameterNames();

			if(fileParameterNames.hasMoreElements()){
			    String inputValue = (String) fileParameterNames.nextElement();

			    File[] files = multiWrapper.getFiles(inputValue);

				PropostaAnexo propostaAnexo = new PropostaAnexo();
				propostaAnexo.setProposta(this.proposta);
				// os campos this.fileUploadFileName e fileUploadContentType so populados automaticamente no struts 
				// usando o nome do campo no formulario que  fileUpload + FileName ou ContentType
				MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();

				// only by file name
				String mimeType = mimeTypesMap.getContentType(((String[])multiWrapper.getParameterMap().get("name"))[0]);
				
				propostaAnexo.setNome(((String[])multiWrapper.getParameterMap().get("name"))[0]);
				propostaAnexo.setContentType(mimeType.toLowerCase());

				if(files[0].length()/1024 > 300 && propostaAnexo.getContentType().indexOf("jpeg")>=0){
					propostaAnexo.setAnexo(Util.compressJpegFile(files[0]));
				}else{
					propostaAnexo.setAnexo(Util.getBytesFromFile(files[0]));
				}

				this.service.save(propostaAnexo);

			}
			
			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.proposta.id = ?0 ", new Object[]{propostaAnexo.getProposta().getId()});

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			
			try {
				this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.proposta.id = ?0 ", new Object[]{getProposta().getId()});
			} catch (Exception e1) {
				// TODO Auto-generated catch block
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
			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.proposta.id = ?0 ", new Object[]{getProposta().getId()});
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

			this.propostaAnexoList = (List<PropostaAnexo>)this.service.genericFindBySQLQuery("Select san From PropostaAnexo san where san.proposta.id = ?0 ", new Object[]{getProposta().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String alterarSeguradora(){
		try{
			this.proposta = (Proposta)service.genericFindFirstResultByNamedQuery("getPropostaById", new Object[] { this.proposta.getId() });
			this.proposta.setSeguradora(this.seguradora);
			this.service.save(this.proposta);
			this.service.refresh(this.proposta);
			this.seguradora = null;
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public List<Seguradora> getSeguradoras(){
		try{

			this.seguradoras = (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0 and isAtiva = true) Order by s.nome", new Object[]{this.proposta.getRamo().getId()});
			if (this.seguradoras==null)
				this.seguradoras = new ArrayList<Seguradora>();

			return this.seguradoras;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	@SkipValidation
	public String find() {

		try{

			if(this.pobject.getId()==null){
				if(id==null)//Posteriormente fazer a controle através de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			
			//Alterado por Romero em 05/01/2012 - 
			//	O método find não sobre influência do filter, permitindo que qualquer usuário autenticado 
			//	visualize uma proposta da base, mesmo que não pertença à sua corretora.
			//this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());
			this.proposta = (Proposta)service.genericFindFirstResultByNamedQuery("getPropostaById", new Object[] { this.pobject.getId() });
			
			if (proposta != null) {
				if (this.proposta.getRamo().getId().longValue()==this.getRamoAutomovel()){
					this.automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
					this.proposta.setAutomovelWizCollection(this.automovelList);
				}
				if (this.proposta.getRamo().getId().longValue()==this.getRamoRiscoDiversos()){
					this.proposta.setRiscoDiversosCollection((List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()}));
				}
			}
			
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}


	public long getRamoAutomovel(){
    	return Constants.RAMO_AUTOMOVEL.longValue();
    }

    public long getRamoVidaEmpresarial(){
    	return Constants.RAMO_VIDA_EMPRESARIAL.longValue();
    }

    public long getRamoImovel(){
    	return Constants.RAMO_IMOVEL.longValue();
    }

    public long getRamoRiscoDiversos(){
    	return Constants.RAMO_RISCO_DIVERSOS.longValue();
    }

    public long getRamoVidaIndividual(){
    	return Constants.RAMO_VIDA_INDIVIDUAL.longValue();
    }

    public long getRamoResidencial(){
    	return Constants.RAMO_RESIDENCIAL.longValue();
    }

    public long getRamoEmpresarial(){
    	return Constants.RAMO_EMPRESARIAL.longValue();
    }

    public long getRamoCondominio(){
    	return Constants.RAMO_CONDOMINIO.longValue();
    }

	@Override
	@SkipValidation
	public String editar() {
		try {

			this.proposta = (Proposta)this.service.find(this.proposta);

			if (this.proposta.getIsFatura()==null)
				this.proposta.setIsFatura(false);

			if(this.proposta.getRamo().getSubRamo()!=null && this.proposta.getRamo().getSubRamo().getId()!=null && 
				this.proposta.getRamo().getSubRamo().getId().equals(Constants.RAMO_TRANSPORTES) && this.proposta.getIsFatura()){
				return "propostaTransportes";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_AUTOMOVEL)){
				return "propostaAuto";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_EMPRESARIAL) && this.proposta.getIsFatura()){
				return "propostaImoveisFatura";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_IMOVEL)){
				return "propostaImoveis";
			}else if(!this.proposta.getRamo().getId().equals(Constants.RAMO_TRANSPORTES) && this.proposta.getIsFatura()){
				return "propostaEmpresarial";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_VIDA_INDIVIDUAL)){
				return "propostaIndividual";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_RESIDENCIAL)){
				return "propostaImoveis";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_EMPRESARIAL)){
				return "propostaImoveis";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_CONDOMINIO)){
				return "propostaImoveis";
			}else{
				//if(this.ramo.getId().equals(Constants.RAMO_RISCO_DIVERSOS)){
				return "propostaRiscosDiversos";
			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@SkipValidation
	public String endosso() {
		try {

			if(this.proposta.getId() != null){
				this.proposta = (Proposta)this.service.find(this.proposta);
			}

			if (this.proposta.getIsFatura()==null)
				this.proposta.setIsFatura(false);

			if(this.proposta.getRamo().getSubRamo()!=null && this.proposta.getRamo().getSubRamo().getId()!=null && 
				this.proposta.getRamo().getSubRamo().getId().equals(Constants.RAMO_TRANSPORTES) && this.proposta.getIsFatura()){
				return "propostaTransportes";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_AUTOMOVEL)){
				return "propostaAuto";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_EMPRESARIAL) && this.proposta.getIsFatura()){
				return "propostaImoveisFatura";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_IMOVEL)){
				return "propostaImoveis";
			}else if(!this.proposta.getRamo().getId().equals(Constants.RAMO_TRANSPORTES) && this.proposta.getIsFatura()){
				return "propostaEmpresarial";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_VIDA_INDIVIDUAL)){
				return "propostaIndividual";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_RESIDENCIAL)){
				return "propostaImoveis";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_EMPRESARIAL)){
				return "propostaImoveis";
			}else if(this.proposta.getRamo().getId().equals(Constants.RAMO_CONDOMINIO)){
				return "propostaImoveis";
			}else{
				//if(this.ramo.getId().equals(Constants.RAMO_RISCO_DIVERSOS)){
				return "propostaRiscosDiversos";
			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		if(blnEndosso){
			if(propostaSearch == null){
				propostaSearch = new Proposta();
			}
			propostaSearch.setStatusOperacional(Constants.STATUS_OPER_APOLICE);
		}
		if (blnOrcamento){
			if(propostaSearch == null){
				propostaSearch = new Proposta();
			}
			Ramo ramo = new Ramo();
			ramo.setId(Constants.RAMO_AUTOMOVEL);
			propostaSearch.setRamo(ramo);
		}
		if (blnRenovacao){
			if(this.propostaSearchRenovacao == null){
				this.propostaSearchRenovacao = new Proposta();
			}
			if (this.ramo.getId()==null && this.ramo.getSubRamo().getId()!=null){
				this.ramo = this.ramo.getSubRamo();
			}
			this.propostaSearchRenovacao.setRamo(this.ramo);
			/*Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.DATE, -15);
			//adiciona um ano ao inicio da vigencia
			propostaSearch.setInicioVigencia(new Date(calendar.getTimeInMillis()));
			calendar.add(Calendar.DATE, 30);
			propostaSearch.setTerminoVigencia(new Date(calendar.getTimeInMillis()));*/
		}else{
			if(propostaSearch != null){
				propostaSearch.setInicioVigencia(null);
				propostaSearch.setTerminoVigencia(null);
			}
		}
		
		try {

			this.getSession().put("propostaSearch", propostaSearch);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			if(this.propostaSearch != null){
				this.listCount = this.service.getCountPropostasForSearch(propostaSearch).intValue();
				this.propostas = this.service.getPropostasForSearch(propostaSearch, page, pageSize);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String listaRenovacao() {

		if(this.propostaSearchRenovacao == null){
			this.propostaSearchRenovacao = new Proposta();
		}

		try {

			this.getSession().put("propostaSearchRenovacao", propostaSearchRenovacao);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			propostaSearchRenovacao.setRenovacaoAutomatica(true);
			this.listCount = this.service.getCountPropostasForSearch(propostaSearchRenovacao).intValue();
			this.propostas = this.service.getPropostasForSearch(propostaSearchRenovacao, page, pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String firstR() {
		this.page = 0;
		this.listaRenovacao();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String nextR() {
		if (!getIsLastPage()) {
			this.page++;
		}
		this.listaRenovacao();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String lastR() {
		if (!getIsLastPage()) {
			this.page = this.listCount / this.pageSize;
		}
		this.listaRenovacao();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String previousR() {
		if (!getIsFirstPage()) {
			this.page--;
		}
		this.listaRenovacao();
		return Action.SUCCESS;
	}

	public List<RepasseComissao> getRepassePropostaList() {
		try {
			this.repassePropostaList = this.service.genericFindByNamedQuery("getRepasseComissaoByProposta", new Object[]{this.getProposta().getId(),this.getProposta().getId()});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return repassePropostaList;
	}
	
	

	public void salvarChecarParcelas() throws Exception{ 
		
		if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
			this.pessoa = this.pessoaFisica;
		}else{
			this.pessoaJuridica.setRazaoSocial(this.pessoaJuridica.getNome());
			if (this.pessoaJuridica.getAtividadeComercial() != null && this.pessoaJuridica.getAtividadeComercial().getId() == null)
				this.pessoaJuridica.setAtividadeComercial(null);
			this.pessoa = this.pessoaJuridica;
		}

		if(proposta.getUsuarioLanctoApolice() != null && proposta.getUsuarioLanctoApolice().getId() == null){
			proposta.setUsuarioLanctoApolice(null);
		}
		if(proposta.getUsuarioBaixaApolice() != null && proposta.getUsuarioBaixaApolice().getId() == null){
			proposta.setUsuarioBaixaApolice(null);
		}
		if(proposta.getUsuarioRecebApolice() != null && proposta.getUsuarioRecebApolice().getId() == null){
			proposta.setUsuarioRecebApolice(null);
		}
		if(proposta.getUsuarioLanctoEndosso() != null && proposta.getUsuarioLanctoEndosso().getId() == null){
			proposta.setUsuarioLanctoEndosso(null);
		}
		if(proposta.getUsuarioBaixaEndosso() != null && proposta.getUsuarioBaixaEndosso().getId() == null){
			proposta.setUsuarioBaixaEndosso(null);
		}
		if(proposta.getUsuarioRecebEndosso() != null && proposta.getUsuarioRecebEndosso().getId() == null){
			proposta.setUsuarioRecebEndosso(null);
		}
		if(proposta.getPropostaRenovada() != null && proposta.getPropostaRenovada().getId() == null){
			proposta.setPropostaRenovada(null);
		}
		if (HibernateUtil.initializeAndUnproxy(this.pessoa) instanceof PessoaFisica){
			if(this.pessoaFisica.getProfissao() != null && this.pessoaFisica.getProfissao().getId() == null){
				this.pessoaFisica.setProfissao(null);
			}
		}

		for (Endereco endereco : this.proposta.getCliente().getEnderecoCollection()) {
			if (endereco.getLogradouro()==null || endereco.getLogradouro().isEmpty()){
				for (int i=0;i<this.proposta.getPropostaEnderecoCollection().size();i++){
					PropostaEndereco propostaEndereco = this.proposta.getPropostaEnderecoCollection().get(i);
					if (endereco.getTipoEndereco().equals(propostaEndereco.getTipoEndereco())){
						endereco.setCep(propostaEndereco.getCep());
						endereco.setLogradouro(propostaEndereco.getLogradouro());
						endereco.setNumero(propostaEndereco.getNumero());
						endereco.setComplemento(propostaEndereco.getComplemento());
						endereco.setBairro(propostaEndereco.getBairro());
						endereco.setCidade(propostaEndereco.getCidade());
						endereco.setUf(propostaEndereco.getUf());
						endereco.setTipoEndereco(propostaEndereco.getTipoEndereco());
						endereco.setTelefone(propostaEndereco.getTelefone());
						endereco.setCorrespondencia(propostaEndereco.getCorrespondencia());
						this.service.save(endereco);
					}
				}
			}
		}
		
		if (this.proposta.getInicioVigencia()!=null && this.proposta.getTerminoVigencia()!= null){
			if (this.proposta.getInicioVigencia().compareTo(this.proposta.getTerminoVigencia())>=0)
				throw new Exception("A data de início da vigência deve ser menor que a data de têrmino da vigência!");
		}

		if (this.proposta.getInicio1aVigencia()==null && (this.proposta.getRamo().getId().equals(Constants.RAMO_VIDA_EMPRESARIAL) && this.proposta.getIsFatura())){
			this.proposta.setInicio1aVigencia(this.proposta.getInicioVigencia());
			this.proposta.setTermino1aVigencia(this.proposta.getTerminoVigencia());
		}
		
		if (this.proposta.getGrupoDeVenda()!=null && this.proposta.getGrupoDeVenda().getId()!=null){
			if(this.proposta.getId() == null){
				GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.proposta.getGrupoDeVenda()); 
				this.proposta.setProdutor(HibernateUtil.initializeAndUnproxy(grupoDeVenda.getProdutorGerente()));
			}
		}
		
		Ramo propostaRamo = (Ramo)this.service.find(HibernateUtil.initializeAndUnproxy(this.proposta.getRamo()));
		// esta alteração ter por motivo voltar o status de apolice/endosso para proposta quando o usuario limpar o campo nro da apolice
		if ((this.proposta.getNroApolice()==null || this.proposta.getNroApolice().isEmpty())){
			if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE)){
				this.proposta.setStatusOperacional(Constants.STATUS_OPER_PROPOSTA);
			}
		}
		if ((this.proposta.getNroEndosso()==null || this.proposta.getNroEndosso().isEmpty())){
			if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO)){
				this.proposta.setStatusOperacional(Constants.STATUS_OPER_PROPOSTA_ENDOSSO);
			}
			if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO_CANCELAMENTO)){
				this.proposta.setStatusOperacional(Constants.STATUS_OPER_PROPOSTA_ENDOSSO_CANCELAMENTO);
			}
		}
		
		if (this.proposta.getSmsEncaminhado()==null || this.proposta.getSmsEncaminhado().isEmpty())
			this.proposta.setSmsEncaminhado("N");
		if (this.proposta.getPropostaInicial()!=null && this.proposta.getPropostaInicial().getId()==null)
			this.proposta.setPropostaInicial(null);
		
		if ((proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO) ||
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_VALIDO) || 
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_ENDOSSO_VALIDO)) &&
			!proposta.getIsFatura() &&
			!proposta.getRamo().getId().equals(Constants.RAMO_VIDA_INDIVIDUAL)){ // Nao checa total pois o valor do premio é mensal

			long premioTotal = Math.round(this.proposta.getPremioTotal().doubleValue()*100);
			long totalDasParcelas = 0;
			for(int i=0 ; i<this.proposta.getParcelasPropostaCollection().size() ; i++){
				totalDasParcelas += Math.round(this.proposta.getParcelasPropostaCollection().get(i).getValorParcela()*100);
			}
			if (totalDasParcelas!=premioTotal && this.proposta.getSituacaoOperacional()==Constants.SITUACAO_ATIVA){
				parcelasAndPremioOK = false;
				addActionError("Valor total das parcelas é diferente do Premio Total!");
			}else if (Math.abs(this.proposta.getValorComissao().doubleValue()) > Math.abs(this.proposta.getPremioLiquido().doubleValue())){
				parcelasAndPremioOK = false;
				addActionError("Valor da comissao não poder ser maior que o premio liquido!");
			}else if (this.proposta.getTerminoVigencia()==null){
				parcelasAndPremioOK = false;
				addActionError("O término de vigência deve ser informado!");
			}else{
				
				this.proposta.setIsGeneric(false);
				this.proposta.setUsuario(this.getUsuarioEmUso());
				this.proposta.setCorretora(this.proposta.getCliente().getCorretora());
				this.proposta.setClienteNome(this.proposta.getCliente().getNome());
				this.proposta.setCpfOuCnpj(this.proposta.getCliente().getCpfOuCnpj());
				this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
				if (currentTab<0)
					this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
				/*if(!Util.isProxy(this.proposta.getSeguradora())){
					this.service.refresh(this.proposta);
				}*/
			}
		}else{
			this.proposta.setUsuario(this.getUsuarioEmUso());
			this.proposta.setCorretora(this.proposta.getCliente().getCorretora());
			this.proposta.setClienteNome(this.proposta.getCliente().getNome());
			this.proposta.setCpfOuCnpj(this.proposta.getCliente().getCpfOuCnpj());
			this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
			//if (currentTab<0)
				//this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
			/*if(!Util.isProxy(this.proposta.getSeguradora())){
				this.service.refresh(this.proposta);
			}*/
		}
		
		if ((proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
			 proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE))){
			
			List<SmsEventosCorretora> eventos = this.service.genericFindByNamedQuery("getSmsEventosCorretoraByEventoAndCorretora", new Object[]{Constants.SMS_EVT_PROPOSTA_EFETIVADA, this.corretoraEmUso.getId()});
			if (eventos.size()>0){
				SmsEventosCorretora eventoCorretora = eventos.get(0);
				if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) &&
					"N".equals(this.proposta.getSmsEncaminhado()) && this.corretoraEmUso.getSmsPropostaEfetivada()){
					String cellNumber = this.proposta.getCliente().getTelefoneCelular();
					if (cellNumber!=null && !cellNumber.isEmpty()){
						cellNumber = cellNumber.replace("(", "").replace(")", "").replace("-", "").replace(" ", "").replaceAll("_", "");
						if (cellNumber.length()>8){
							cellNumber = "55"+cellNumber;
							SmsserverOut smsserverOut = new SmsserverOut();
							smsserverOut.setType("O");
							smsserverOut.setRecipient(cellNumber);
							String pnome = proposta.getClienteNome();
							String nroCelular = proposta.getCliente().getTelefoneCelular(); 
							nroCelular = String.format("(%s) %s-%s", new String[]{nroCelular.substring(0, 2), nroCelular.substring(2, 6), nroCelular.substring(6)});
							
							String textoInforma = this.corretoraEmUso.getSmsTextoInforma();
							String textoMensagem = eventoCorretora.getMensagem();
							if (textoInforma==null || textoInforma.isEmpty()){
								if (this.corretoraEmUso.getNome().length()>14)
									textoInforma = this.corretoraEmUso.getNome().substring(0,14)+", informa: ";
								else
									textoInforma = this.corretoraEmUso.getNome()+", informa: ";
							}               
							String emissaoApolice = Formatter.getDate(proposta.getDataEmissaoApolice());
							if (textoMensagem==null || textoMensagem.trim().isEmpty()){
								textoMensagem = "CARO SR.(A) <PNAME>, INFORMAMOS QUE SUA PROPOSTA DE SEGURO FOI TRANSMITIDA COM SUCESSO, OBRIGADO POR ESCOLHER A <CORRETORANOME>.";
							}
							textoMensagem = textoMensagem.replaceAll("<PNOME>", pnome).replaceAll("<CORRETORANOME>", this.corretoraEmUso.getNome());
							smsserverOut.setText(textoInforma + textoMensagem);
							smsserverOut.setCreateDate(new Date());
							smsserverOut.setOriginator("556281578672");
							smsserverOut.setEncoding("7");
							smsserverOut.setStatusReport(0);
							smsserverOut.setFlashSms(0);
							smsserverOut.setPriority(0);
							smsserverOut.setStatus("U");
							smsserverOut.setGatewayId("modem1");
							this.service.save(smsserverOut);
							this.proposta.setSmsEncaminhado("S");
							this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
						}
					}
				}
			}
			eventos = this.service.genericFindByNamedQuery("getSmsEventosCorretoraByEventoAndCorretora", new Object[]{Constants.SMS_EVT_APOLICE_EMITIDA, this.corretoraEmUso.getId()});
			if (eventos.size()>0){
				SmsEventosCorretora eventoCorretora = eventos.get(0);
				if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) &&
					"N".equals(this.proposta.getSmsEncaminhado()) && this.corretoraEmUso.getSmsPropostaEfetivada()){
					String cellNumber = this.proposta.getCliente().getTelefoneCelular();
					if (cellNumber!=null && !cellNumber.isEmpty()){
						cellNumber = cellNumber.replace("(", "").replace(")", "").replace("-", "").replace(" ", "").replaceAll("_", "");
						if (cellNumber.length()>8){
							cellNumber = "55"+cellNumber;
							SmsserverOut smsserverOut = new SmsserverOut();
							smsserverOut.setType("O");
							smsserverOut.setRecipient(cellNumber);

							String pnome = proposta.getClienteNome();
							String nroApolice = proposta.getNroApolice();
							String nroCelular = proposta.getCliente().getTelefoneCelular(); 
							nroCelular = String.format("(%s) %s-%s", new String[]{nroCelular.substring(0, 2), nroCelular.substring(2, 6), nroCelular.substring(6)});
							
							String textoInforma = this.corretoraEmUso.getSmsTextoInforma();
							if (textoInforma==null || textoInforma.isEmpty()){
								if (this.corretoraEmUso.getNome().length()>14)
									textoInforma = this.corretoraEmUso.getNome().substring(0,14)+", informa: ";
								else
									textoInforma = this.corretoraEmUso.getNome()+", informa: ";
							}               
							String emissaoApolice = Formatter.getDate(proposta.getDataEmissaoApolice());
							String textoMensagem = eventoCorretora.getMensagem();
							if (textoMensagem==null || textoMensagem.trim().isEmpty()){
								textoMensagem = "CARO SR.(A) <PNAME>, INFORMAMOS QUE SUA APOLICE DE NRO <NROAPOLICE>, FOI EMITIDA NO DIA <DTEMISSAOAPOLICE>, OBRIGADO POR ESCOLHER A <CORRETORANOME>.";
							}
							textoMensagem = textoMensagem.replaceAll("<PNOME>", pnome).replaceAll("<NROAPOLICE>", nroApolice).replaceAll("<DTEMISSAOAPOLICE>", emissaoApolice).replaceAll("<CORRETORANOME>", this.corretoraEmUso.getNome());
							smsserverOut.setText(textoInforma + textoMensagem);
							smsserverOut.setCreateDate(new Date());
							smsserverOut.setOriginator("556281578672");
							smsserverOut.setEncoding("7");
							smsserverOut.setStatusReport(0);
							smsserverOut.setFlashSms(0);
							smsserverOut.setPriority(0);
							smsserverOut.setStatus("U");
							smsserverOut.setGatewayId("modem1");
							this.service.save(smsserverOut);
							this.proposta.setSmsEncaminhado("S");
							this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
						}
					}
				}
			}
		}

		if (this.corretoraEmUso.getUsarPosVenda()!= null && this.corretoraEmUso.getUsarPosVenda()){
			List<PosVenda> posVendaList = this.service.genericFindByNamedQuery("getPosVendaByProposta", new Object[]{this.proposta.getId()});
			
			if (posVendaList.size()==0){
				PosVenda posVenda = new PosVenda();
				posVenda = new PosVenda();
				posVenda.setDataAbertura(new Date());
				posVenda.setDataAlteracao(new Date());
				posVenda.setIsAtivo(true);
				posVenda.setUsuario(this.getUsuarioEmUso());
				posVenda.setCorretora(this.getCorretoraEmUso());
				
				List<QuestionarioPosVenda> questionario = this.service.genericFindByNamedQuery("getQuestionarioPosVenda", new Object[]{});

				if (posVenda.getRespostaPosVendaCollection().size()==0){
					for (int i=0;i<questionario.size();i++){
						QuestionarioPosVenda pergunta = questionario.get(i);
						if (pergunta.getIsAtivo()){
							RespostaPosVenda respostaPosVenda = new RespostaPosVenda();
							respostaPosVenda.setPosVenda(posVenda);
							respostaPosVenda.setQuestionario(pergunta);
							respostaPosVenda.setIsRespondido(false);
							respostaPosVenda.setUsuario(this.usuario);
							posVenda.getRespostaPosVendaCollection().add(respostaPosVenda);
						}
					}
				}
				posVenda.setProposta(this.proposta);
				this.service.save(posVenda);
			}
		}
	}
	
	public void setProdutor(){
		try{
			if (this.proposta.getProdutor()==null || this.proposta.getProdutor().getId()==null){
				if ((this.proposta.getGrupoDeVenda()==null || this.proposta.getGrupoDeVenda().getId()==null) &&
					this.proposta.getCliente().getGrupoDeVenda()!=null){
					this.proposta.setGrupoDeVenda(this.proposta.getCliente().getGrupoDeVenda());
					GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.proposta.getGrupoDeVenda());
					this.proposta.setProdutor(grupoDeVenda.getProdutorGerente());
				}else{
					this.proposta.setProdutor(null);
					this.proposta.setGrupoDeVenda(null);
				}
					
			}
		}catch (Exception e) {
			this.proposta.setProdutor(null);
			this.proposta.setGrupoDeVenda(null);
		}
	}
	
	public boolean usarCoberturasAssessoria(Coberturas cobertura){
		return (cobertura.getCorretora().getId().longValue()==corretoraEmUso.getId().longValue() && !corretoraEmUso.getUsarCoberturasAssessoria()) || 
			   (cobertura.getCorretora().getId().longValue()==corretoraEmUso.getAssessoria().getId().longValue() && corretoraEmUso.getUsarCoberturasAssessoria());
	}
	
	public boolean usarServicosAssessoria(Servicos servico){
		return (servico.getCorretora().getId().longValue()==corretoraEmUso.getId().longValue() && !corretoraEmUso.getUsarCoberturasAssessoria()) || 
		       (servico.getCorretora().getId().longValue()==corretoraEmUso.getAssessoria().getId().longValue() && corretoraEmUso.getUsarCoberturasAssessoria());
	}
	
	public void verificaValorComissao(){
		try {
			//if(this.proposta.getValorComissao() == null || this.proposta.getValorComissao().equals(new Double(0))){
				this.proposta.setValorComissao((this.proposta.getFator()*this.proposta.getPremioLiquido())/100);
			//}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0) Order by s.nome", new Object[]{this.proposta.getRamo().getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradorasList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public List<Endosso> getEndossoList(){
		try{

			return this.service.genericFindByNamedQuery("getEndossoByRamo", new Object[] {this.proposta.getRamo().getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Endosso>();
	}

	public String getData1aParcela(){
		return Formatter.getDate(this.proposta.getDataVencim1aParcela());
	}

	public String getStatusOperacionalDescricao(Long statusOperacional){
		return Constants.getStatusOperacionalDescricao(statusOperacional);
	}

	public String getSituacaoOperacionalDescricao(Long situacaoOperacional, Date terminoVigencia){
		if (terminoVigencia.getTime() < (new Date()).getTime() && situacaoOperacional.equals(Constants.SITUACAO_ATIVA))
			return "VENCIDA";
		else
			return Constants.getSituacaoOperacionalDescricao(situacaoOperacional);
	}

	protected void setPObjectInstance() throws Exception {
		this.proposta = (Proposta)this.pobject;
	}

	public Map<Long, String> getStatusOperacionalList(){
		return Constants.getStatusOperacionalMap();
	}

	public Map<Long, String> getSituacaoOperacionalList(){
		
		if (proposta != null && proposta.getTerminoVigencia()!=null && proposta.getTerminoVigencia().getTime() < (new Date()).getTime())
			return Constants.getSituacaoOperacionalVencida();
		else
			return Constants.getSituacaoOperacionalMap();
	}

	public Map<Long, String> getSituacaoOperacionalListForSearch(){
		return Constants.getSituacaoOperacionalMap();
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String relatorio(){
		if (this.idRelatorio.equals("6")){
			ordem = "termino_vigencia";
			return "apoliceParaRenovacao";
		}
		return Action.SUCCESS;
	}

	public String getIdRelatorio() {
		return idRelatorio;
	}

	public void setIdRelatorio(String idRelatorio) {
		this.idRelatorio = idRelatorio;
	}

	public String getTitulo() {
		if (this.idRelatorio.equals("1"))
			titulo = "Relatório de Vendas Detalhado";
		else if (this.idRelatorio.equals("2"))
			titulo = "Relatório Ranking de Vendas";
		else if (this.idRelatorio.equals("3"))
			titulo = "Relatório Propostas sem Apólices";
		else if (this.idRelatorio.equals("4"))
			titulo = "Relatório Produção";
		else if (this.idRelatorio.equals("5"))
			titulo = "Relatório Clientes com Proposta Vigente";
		else if (this.idRelatorio.equals("6"))
			titulo = "Relatório Apólice para Renovação";
		else if (this.idRelatorio.equals("7"))
			titulo = "Relatório Listagem de Comissões";
		else if (this.idRelatorio.equals("8"))
			titulo = "Relatório Repasse de Comissões";
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getListResultPage(){
		return blnEndosso || blnRenovacao || blnOrcamento ? "/WEB-INF/jsp/proposta/displayListResultSelecao.jsp" : "/WEB-INF/jsp/proposta/displayListResult.jsp";
	}

	public String getListPage(){
		return blnEndosso || blnRenovacao || blnOrcamento ? "/WEB-INF/jsp/proposta/displayListSelecao.jsp" : "/WEB-INF/jsp/proposta/displayList.jsp";
	}

/*******
 * Todos as funcionalidades comuns a todas as propostas.
 */
	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
		this.pobject = this.proposta;
	}

	public void clonarEndereco(){
		for (int i=0;i<this.proposta.getPropostaEnderecoCollection().size();i++){
			PropostaEndereco propostaEndereco = this.proposta.getPropostaEnderecoCollection().get(i);
			Endereco endereco = new Endereco();
			endereco.setCep(propostaEndereco.getCep());
			endereco.setLogradouro(propostaEndereco.getLogradouro());
			endereco.setNumero(propostaEndereco.getNumero());
			endereco.setComplemento(propostaEndereco.getComplemento());
			endereco.setBairro(propostaEndereco.getBairro());
			endereco.setCidade(propostaEndereco.getCidade());
			endereco.setUf(propostaEndereco.getUf());
			endereco.setTipoEndereco(propostaEndereco.getTipoEndereco());
			endereco.setTelefone(propostaEndereco.getTelefone());
			endereco.setPessoa(this.pessoa);
			endereco.setCorrespondencia(propostaEndereco.getCorrespondencia());
			this.pessoa.getEnderecoCollection().add(endereco);
		}
	}

	public void gerarComissionados(){
		try{
			ComissionadoProposta comissao = null;
			proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());

			for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
				double valorComissao = 0;
				if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
					valorComissao = this.proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
					valorComissao = this.proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
					valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
				comissao = new ComissionadoProposta();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setValorComissao(valorComissao);
				comissao.setSituacao(0);
				comissao.setProposta(this.proposta);
				this.service.save(comissao);
				this.proposta.getComissionadoPropostaCollection().add(comissao);
				// verificar se existem baixas e dai gerar repasses.
				this.service.processarRepasseNovoComissionado(comissao);
			}

			//this.comissionadoPropostaList = (List<ComissionadoProposta>)this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.getProposta().getId()});

			//preparaListaComissionados();

		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	/**
	 * Metodo endossoRenovacao()
	 * procedera com o endosso de acordo com a operacao
	 * operacao=0 -> Editar proposta
	 * operacao=1 -> Cancelar proposta
	 * operacao=2 -> Endosso de Cancelamento
	 * operacao=3 -> Endosso Alteração
	 * operacao=4 -> Cancelar um Endosso
	 * operacao=5 -> Cancelar um Endosso de Cancelamento
	 * 
	 */
	@SkipValidation
	public String endossoRenovacao(){
		try{

			Seguradora novaSeguradora = new Seguradora();
			if (blnRenovacao){
				novaSeguradora.setId(this.seguradora.getId());
			}
			this.editar();
			
			if(this.proposta.getRamo() != null && this.proposta.getRamo().getId().compareTo(Constants.RAMO_AUTOMOVEL) == 0){
				this.automovelAlterado = true;
			}
			
			if (blnRenovacao){
				this.seguradora = (Seguradora)this.service.find(Seguradora.class, novaSeguradora.getId());
				this.proposta = this.service.renovacaoPropria(this.proposta, this.seguradora);
				this.pobject = this.proposta;
				this.salvarEditar();
			}else{
				if (this.operacao.equals(Constants.OPERACAO_CANCELAR_VALIDACAO_PEDIDO)){
					this.proposta = (Proposta)this.service.find(this.proposta);
					if (this.proposta.getStatusOperacional().longValue()==Constants.STATUS_OPER_PEDIDO_VALIDO)
						this.proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO);
					else if (this.proposta.getStatusOperacional().longValue()==Constants.STATUS_OPER_PEDIDO_ENDOSSO_VALIDO)
						this.proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO_ENDOSSO);
					else if (this.proposta.getStatusOperacional().longValue()==Constants.STATUS_OPER_PEDIDO_ENDOSSO_CANCEL_VALIDO)
						this.proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO_ENDOSSO_CANCELAMENTO);

					this.pobject = this.proposta;
					this.blnRenovacao = true;
					this.salvarEditar();
					this.blnRenovacao = false;
					return Action.SUCCESS;
				}
				
				if (this.operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO_CANCELAMENTO)){
					this.proposta = this.service.aplicaEndosso(proposta, this.operacao, this.tipoEndosso);
					this.pobject = this.proposta;
					this.salvarEditar();
				}else if (this.operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO)){
					this.proposta = this.service.aplicaEndosso(proposta, this.operacao, this.tipoEndosso);
					this.pobject = this.proposta;
					salvarEditar();
				}else{
					if (this.operacao.equals(Constants.OPERACAO_ENDOSSO_CANCELAMENTO)){
						this.proposta = this.service.aplicaEndosso(proposta, this.operacao, this.tipoEndosso);
						this.pobject = this.proposta;
						this.salvarEditar();
					}else{
						this.proposta = this.service.aplicaEndosso(proposta, this.operacao, this.tipoEndosso);
	
						if(HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica){
							this.pessoaFisica = (PessoaFisica) this.proposta.getCliente();
							tipoCliente = Constants.CLIENTE_PF;
						}else if(HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaJuridica){
							this.pessoaJuridica = (PessoaJuridica) this.proposta.getCliente();
							tipoCliente = Constants.CLIENTE_PJ;
						}
			
						this.blnPreparandoEndosso = true;
						this.pobject = this.proposta;
						this.salvarEditar();
			
						this.getVistoriadoraBySeguradoraList();
					}
				}
			}

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	public int getCountEndosso(){
		return this.proposta.getEndossoCollection().size();
	}
	
	public List<Proposta> getPropostas(){
		return propostas;
	}

	public List<ParcelasProposta> getParcelas() {
		if(this.parcelas == null){
			this.parcelas = new ArrayList<ParcelasProposta>();
		}
		return parcelas;
	}

	public void setParcelas(List<ParcelasProposta> parcelas) {
		this.parcelas = parcelas;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountProposta", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	public Integer getCurrentTabSaved() {
		return currentTabSaved;
	}

	public void setCurrentTabSaved(Integer currentTabSaved) {
		this.currentTabSaved = currentTabSaved;
	}

	@SkipValidation
	public String getDadosCliente(){
		try {

			if ((this.proposta.getCliente() == null || this.proposta.getCliente().getId() == null)){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					PessoaFisica setPessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByCpf", new Object[]{this.pessoaFisica.getCpfOuCnpj()});
					if (setPessoaFisica != null){
						this.pessoaFisica = setPessoaFisica;
						this.proposta.setCliente(pessoaFisica);
						this.proposta.setPropostaEnderecoCollection(this.createPropostaEnderecoList(proposta, this.pessoaFisica.getEnderecoCollection(), 2));
					}
				}else if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
					PessoaJuridica setPessoaJuridica = (PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaByCnpj", new Object[]{this.pessoaJuridica.getCpfOuCnpj()});
					if (setPessoaJuridica != null){
						this.pessoaJuridica = setPessoaJuridica;
						this.proposta.setCliente(pessoaJuridica);
						this.proposta.setPropostaEnderecoCollection(this.createPropostaEnderecoList(proposta, this.pessoaJuridica.getEnderecoCollection(), 2));
					}
				}

			}else if (this.proposta.getCliente() != null && this.proposta.getCliente().getId() != null){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					this.pessoaFisica = new PessoaFisica();
					this.pessoaFisica.setId(this.proposta.getCliente().getId());
					this.pessoaFisica = (PessoaFisica)this.service.find(this.pessoaFisica);
					this.proposta.setCliente(pessoaFisica);
					this.proposta.setPropostaEnderecoCollection(this.createPropostaEnderecoList(proposta, this.pessoaFisica.getEnderecoCollection(), 2));
				}else if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
					this.pessoaJuridica = new PessoaJuridica();
					this.pessoaJuridica.setId(this.proposta.getCliente().getId());
					this.pessoaJuridica = (PessoaJuridica)this.service.find(this.pessoaJuridica);
					this.proposta.setCliente(pessoaJuridica);
					this.proposta.setPropostaEnderecoCollection(this.createPropostaEnderecoList(proposta, this.pessoaJuridica.getEnderecoCollection(), 2));
				}
				//TODO: Alterar para pegar o Endereço Residencial ou Comercial. Ver como será feito.
				//			Endereco endereco = (Endereco)this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaId", new Object[] { this.proposta.getCliente().getId() });
				//			PessoaFisica pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaById", new Object[] { this.proposta.getCliente().getId() });
				//			PessoaJuridica pessoaJuridica = (PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaById", new Object[] { this.proposta.getCliente().getId() });
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	// Verificar essa função depois. Caso a pessoa tenha mais de 2 endereços, quais endereços deverão ser considerados?
	public List<PropostaEndereco> createPropostaEnderecoList(Proposta proposta, List<Endereco>enderecos, Integer quantidadeEnderecos){
		List<PropostaEndereco>propostaEnderecos = new ArrayList<PropostaEndereco>();
		PropostaEndereco propostaEndereco = null;

		try{
			for(int i=0 ; i<quantidadeEnderecos ; i++){
				propostaEndereco = new PropostaEndereco();
				propostaEndereco.setBairro(enderecos.get(i).getBairro());
				propostaEndereco.setCep(enderecos.get(i).getCep());
				propostaEndereco.setCidade(enderecos.get(i).getCidade());
				propostaEndereco.setComplemento(enderecos.get(i).getComplemento());
				propostaEndereco.setFax(enderecos.get(i).getFax());
				propostaEndereco.setLogradouro(enderecos.get(i).getLogradouro());
				propostaEndereco.setNumero(enderecos.get(i).getNumero());
				propostaEndereco.setProposta(proposta);
				propostaEndereco.setTelefone(enderecos.get(i).getTelefone());
				propostaEndereco.setTipoEndereco(enderecos.get(i).getTipoEndereco());
				propostaEndereco.setUf(enderecos.get(i).getUf());
				propostaEndereco.setCorrespondencia(enderecos.get(i).getCorrespondencia());
				propostaEnderecos.add(propostaEndereco);
			}
		}catch (Exception e) {}

		return propostaEnderecos;
	}

	public Long getSequenciaNumeroProposta() throws Exception {
		Sequencia sequencia = (Sequencia)this.service.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"Proposta",this.getCorretoraEmUso().getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("Proposta");
			sequencia.setCorretora(this.getCorretoraEmUso());
			sequencia.setValor(0L);
			this.service.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.service.save(sequencia);
		return sequencia.getValor();
	}

	@SkipValidation
	public String novoDadosClienteForm(){
		if (tipoCliente==Constants.CLIENTE_PF){
			this.pessoaFisica = new PessoaFisica();
			this.proposta.setCliente(new PessoaFisica());
		}else{
			this.pessoaJuridica = new PessoaJuridica();
			this.proposta.setCliente(new PessoaJuridica());
		}
		return Action.SUCCESS;
	}

	@SkipValidation
	public String alterarGrupoVenda(){
		try {
			// Checar existencia de repasse.
			List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByProposta", new Object[]{this.proposta.getId(),this.proposta.getId()});
			
			if (repasses.size()>0){ 
				GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.getProposta().getGrupoDeVenda());
				this.proposta = (Proposta)this.service.find(this.getProposta());
				this.proposta.setGrupoDeVenda(grupoDeVenda);
				this.proposta.setProdutor(grupoDeVenda.getProdutorGerente());
				this.service.reprocessarGrupoDeVendaEComissionados(this.proposta);				
				this.proposta = (Proposta)this.service.find(this.proposta);
			}else{// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
				//this.service.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{this.proposta.getId()});
				this.service.executeNamedQuery("deleteComissionadoPropostaByPropostaId", new Object[]{this.proposta.getId()});
				this.service.executeNamedQuery("deleteComissionadoAgenciamentoByPropostaId", new Object[]{this.proposta.getId()});

				GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.getProposta().getGrupoDeVenda());

				this.proposta = (Proposta)this.service.find(this.getProposta());
				this.proposta.setGrupoDeVenda(grupoDeVenda);
				this.proposta.setProdutor(grupoDeVenda.getProdutorGerente());

				this.service.save(proposta);

				this.gerarComissionados();
				
				/*ComissionadoProposta comissao = null;
				proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());

				for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
					comissao = new ComissionadoProposta();
					comissao.setPessoa(grupoProdutor.getPessoa());
					comissao.setComissao(grupoProdutor.getComissao());
					comissao.setTipoComissao(grupoProdutor.getTipoComissao());
					comissao.setSituacao(0);
					comissao.setProposta(proposta);
					this.service.save(comissao);

					proposta.getComissionadoPropostaCollection().add(comissao);
				}*/

			}
			this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.getProposta().getId()});

			preparaListaComissionados();

			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String cancelarProposta() {
		try {

			this.proposta.setSituacaoOperacional(Constants.SITUACAO_CANCELADA);
			this.salvarEditar();

			this.blnEndosso = false;
			this.blnRenovacao = false;

			this.mostraUltimaLista = true;

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String excluir() {
		try {
			if(this.proposta.getId() == null){
				throw new Exception("Essa Proposta não foi salva no sistema, favor contactar ao administrador do sistema");
			}
			this.proposta = (Proposta)this.service.find(proposta);
			//this.proposta.setStatusOperacional(Constants.STATUS_OPER_PROPOSTA_EXCLUIDA);
			this.service.excluirProposta(this.proposta);

			this.blnEndosso = false;
			this.blnRenovacao = false;

			this.mostraUltimaLista = true;

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String gerarParcelas() throws Exception {

		try{
			ParcelasProposta parcelaProposta = null;
			if (this.proposta.getRamo()==null)
				this.proposta = (Proposta)this.service.find(this.proposta);
			
			this.proposta.getParcelasPropostaCollection().clear();
			this.service.executeNamedQuery("deleteParcelasByPropostaId", new Object[]{this.proposta.getId()});

			String nroBanco = this.proposta.getNroBanco() == null ? "" : this.proposta.getNroBanco().toString();
			String contaCorrente = this.proposta.getContaCorrente() == null ? "" : this.proposta.getContaCorrente().toString()+"-"+this.proposta.getContaDigito().toString().trim();

			int i = 1;
			if(this.proposta.getValor1aParcela() != null && this.proposta.getValor1aParcela() != 0.0){
				parcelaProposta = new ParcelasProposta();
				parcelaProposta.setProposta(this.proposta);
				parcelaProposta.setNroParcela(1);
				parcelaProposta.setValorParcela(this.proposta.getValor1aParcela());
				parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
				if(this.proposta.getFormaPagamento1aParcela().equals(Constants.FORMA_PAG_DEBITO_CONTA)){
					parcelaProposta.setNroBanco(nroBanco);
					parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
					parcelaProposta.setContaCorrente(contaCorrente);
				}
				this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
				this.service.save(parcelaProposta);
				i++;
			}

			Double valorTotal = this.proposta.getValor1aParcela();
			for(; i<=this.proposta.getQtdeParcelas() ; i++){
				parcelaProposta = new ParcelasProposta();
				parcelaProposta.setProposta(this.proposta);
				parcelaProposta.setNroParcela(i);
				parcelaProposta.setValorParcela(this.proposta.getValorDemaisParcelas());
				parcelaProposta.setVencimento(Formatter.addMonth(this.proposta.getDataVencim1aParcela(), i-1));
				valorTotal = valorTotal + this.proposta.getValorDemaisParcelas();
				 
				// Ramo individual usa o premio como parcela, então não altera a ultima parcela com valor de diferença.
				if (i==this.proposta.getQtdeParcelas() && !this.proposta.getRamo().getId().equals(Constants.RAMO_VIDA_INDIVIDUAL)){
					Double valorDiferenca = this.proposta.getPremioTotal() - valorTotal;
					
					if (valorDiferenca>0){
						parcelaProposta.setValorParcela(this.proposta.getValorDemaisParcelas()+valorDiferenca);
					}else if (valorDiferenca<0){
						parcelaProposta.setValorParcela(this.proposta.getValorDemaisParcelas()+valorDiferenca);
					}
				}
				if(this.proposta.getFormaPagamento().equals(Constants.FORMA_PAG_DEBITO_CONTA)){
					parcelaProposta.setNroBanco(nroBanco);
					parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
					parcelaProposta.setContaCorrente(contaCorrente);
				}
				this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
				this.service.save(parcelaProposta);
			}

			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	/**
	 * Metodo para gerar parcelas de fatura para todos os ramos exceto Vida em Grupo, as rotinas são bem similares ao Vida em Grupo, 
	 * porem a peculiaridade do agenciamento no Vida em Grupo cria algumas pequenas difereças, mais preferi criar um metodos separados.
	 * 
	 * Observar que algumas alterações neste metodo deve ser tbm implementada no mesmo metodo na classe PropostaVidaEmpresarialAction
	 * 
	 * Este metodo será movido para a classe PropostaServiceImpl muito em breve.
	 *  
	 */
	public void gerarParcelas(Proposta proposta) throws Exception {
		try{

			ParcelasProposta parcelaProposta = null;

			if (this.proposta.getSeguradora()==null){
				this.proposta = (Proposta)this.service.find(Proposta.class, this.proposta.getId());
				this.pobject = this.proposta;
			}
			
			if (this.proposta.getReferenciaParcela()==null || this.proposta.getReferenciaParcela().equals(""))
				this.proposta.setReferenciaParcela(this.proposta.getInicioVigencia());

			List<ParcelasProposta> parcelasAtuais = service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});
			
			Proposta propostaCorrente = (Proposta)this.service.find(Proposta.class, proposta.getId());
			this.proposta.setParcelasPropostaCollection(propostaCorrente.getParcelasPropostaCollection());
			
			String nroBanco = this.proposta.getNroBanco() == null ? "" : this.proposta.getNroBanco().toString();
			String contaCorrente = this.proposta.getContaCorrente() == null ? "" : this.proposta.getContaCorrente().toString();
			
			Calendar cRef = Calendar.getInstance();
			cRef.setTime(this.proposta.getReferenciaParcela());
			
			GrupoDeVenda grupoDeVendaUltimaParcela = null;
			
			int i = 1;
			
			if (parcelasAtuais.size()>0){
				// esta rotina ira somente atualizar os valor vigente da fatura atual.
				Double ultimoPercentualComissao = 0.00;
				Calendar cRefAdicional = Calendar.getInstance();
				cRefAdicional.setTime(this.proposta.getReferenciaParcela());
				
				for (ParcelasProposta parcelasProposta : parcelasAtuais) {
					parcelasProposta.setValorParcela(this.proposta.getPremioLiquido());
					parcelasProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					parcelasProposta.setDesconto(this.proposta.getDesconto());
					parcelasProposta.setIof(this.proposta.getIof());
					parcelasProposta.setPremioTotal(this.proposta.getPremioTotal());
					parcelasProposta.setCustoApolice(this.proposta.getCustoApolice());
					parcelasProposta.setValorTransportado(this.proposta.getValorTransportado());
					parcelasProposta.setTaxaFaturaAtual(this.proposta.getTaxaFaturaAtual());
					parcelasProposta.setVencimento(Formatter.addMonth(this.proposta.getDataVencim1aParcela(), i-1));
					parcelasProposta.setInicioVigencia(Formatter.addMonth(this.proposta.getInicioVigencia(), i-1));
					
					// checar se o grupo de venda esta nulo, que significa que as parcelas foram geradas sem o grupo de venda,
					// é bom verificar se parcelas anteriores estão sem o grupo de venda.
					if (parcelasProposta.getGrupoDeVenda()==null || parcelasProposta.getGrupoDeVenda().getId()==null){
						parcelasProposta.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					}
					// não atualizar os percentuais de comissão quando alterar o fator e as parcelas já existirem.
					// para alterar o fator nas demais parcelas, deve editar diretamente na parcela.
					if (atualizarDemaisParcelas)
						parcelasProposta.setPercentualComissao(this.proposta.getFator());

					Calendar c = Calendar.getInstance();
					c.setTime(parcelasProposta.getInicioVigencia());
					c.add(Calendar.DATE, c.getActualMaximum(Calendar.DAY_OF_MONTH)-1);
					
					parcelasProposta.setTerminoVigencia(c.getTime());
					parcelasProposta.setReferenciaParcela(cRefAdicional.getTime());

					if (parcelasProposta.getReferenciaParcela().equals(this.proposta.getReferenciaParcela()))
						parcelasProposta.setNroDocumento(this.proposta.getNroFatura());
					parcelasProposta.setValorComissao(parcelasProposta.getValorParcela()*(parcelasProposta.getPercentualComissao()/100));
					ultimoPercentualComissao = parcelasProposta.getPercentualComissao();
					this.service.save(parcelasProposta);
					grupoDeVendaUltimaParcela = parcelasProposta.getGrupoDeVenda();
					cRef.setTime(parcelasProposta.getReferenciaParcela());
					cRefAdicional.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());
					i++;
				}

				// se a referencia informada for menor que a referencia da 1a parcela gerada anteriormente, ira gerar as parcelas
				// entre a referencia informada e a referencia da 1a parcela gerada anteriormente.
				if (this.proposta.getReferenciaParcela().getTime()<parcelasAtuais.get(0).getReferenciaParcela().getTime() && 
					this.proposta.getQtdeParcelas().intValue()==Constants.FREQUENCIA_PAGTO_MENSAL.intValue()){
					cRefAdicional = Calendar.getInstance();
					cRefAdicional.setTime(this.proposta.getReferenciaParcela());

					while (cRefAdicional.getTimeInMillis()<parcelasAtuais.get(0).getReferenciaParcela().getTime()){
						parcelaProposta = new ParcelasProposta();
						parcelaProposta.setProposta(this.proposta);
						parcelaProposta.setReferenciaParcela(cRefAdicional.getTime());
						parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
						parcelaProposta.setCustoApolice(this.proposta.getCustoApolice());
						parcelaProposta.setValorTransportado(this.proposta.getValorTransportado());
						parcelaProposta.setTaxaFaturaAtual(this.proposta.getTaxaFaturaAtual());
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
						parcelaProposta.setDesconto(this.proposta.getDesconto());
						parcelaProposta.setIof(this.proposta.getIof());
						parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
						parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
						parcelaProposta.setInicioVigencia(this.proposta.getInicioVigencia());
						parcelaProposta.setTerminoVigencia(this.proposta.getTerminoVigencia());
						parcelaProposta.setPercentualComissao(ultimoPercentualComissao);
						parcelaProposta.setValorComissao(parcelaProposta.getValorParcela()*(parcelaProposta.getPercentualComissao()/100));
						
						// checar se o grupo de venda esta nulo, que significa que as parcelas foram geradas sem o grupo de venda,
						// é bom verificar se parcelas anteriores estão sem o grupo de venda.
						if (parcelasProposta.getGrupoDeVenda()==null || parcelasProposta.getGrupoDeVenda().getId()==null){
							parcelasProposta.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
						}else{
							parcelasProposta.setGrupoDeVenda(grupoDeVendaUltimaParcela);
						}

						if(this.proposta.getFormaPagamento1aParcela() == Constants.FORMA_PAG_DEBITO_CONTA){
							parcelaProposta.setNroBanco(nroBanco);
							parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
							parcelaProposta.setContaCorrente(contaCorrente);
						}
						cRefAdicional.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());

						this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
						this.service.save(parcelaProposta);
					}
					// como foram geradas novas parcelas, então pesquisa novamente para atualizar as qtde de parcelas geradas.
					parcelasAtuais = service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});
				}
				
				if (parcelasAtuais.size()<(12/this.proposta.getQtdeParcelas().intValue()) && parcelasAtuais.size() > 0){
					// gerar parcelas no final, para sempre manter a qtde maxima disponivel.
					int count = (12/this.proposta.getQtdeParcelas().intValue()) - parcelasAtuais.size();
					cRefAdicional = Calendar.getInstance();
					cRefAdicional.setTime(parcelasAtuais.get(parcelasAtuais.size()-1).getReferenciaParcela());
					cRefAdicional.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());

					for (;count > 0;count--){
						parcelaProposta = new ParcelasProposta();
						parcelaProposta.setProposta(this.proposta);
						parcelaProposta.setGrupoDeVenda(grupoDeVendaUltimaParcela);
						parcelaProposta.setReferenciaParcela(cRefAdicional.getTime());
						parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
						parcelaProposta.setCustoApolice(this.proposta.getCustoApolice());
						parcelaProposta.setValorTransportado(this.proposta.getValorTransportado());
						parcelaProposta.setTaxaFaturaAtual(this.proposta.getTaxaFaturaAtual());
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
						parcelaProposta.setDesconto(this.proposta.getDesconto());
						parcelaProposta.setIof(this.proposta.getIof());
						parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
						parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
						parcelaProposta.setInicioVigencia(this.proposta.getInicioVigencia());
						parcelaProposta.setTerminoVigencia(this.proposta.getTerminoVigencia());
						parcelaProposta.setPercentualComissao(ultimoPercentualComissao);
						parcelaProposta.setValorComissao(parcelaProposta.getValorParcela()*(parcelaProposta.getPercentualComissao()/100));
						
						if(this.proposta.getFormaPagamento1aParcela() == Constants.FORMA_PAG_DEBITO_CONTA){
							parcelaProposta.setNroBanco(nroBanco);
							parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
							parcelaProposta.setContaCorrente(contaCorrente);
						}
						cRefAdicional.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());

						this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
						this.service.save(parcelaProposta);
					}
					// como foram geradas novas parcelas, então pesquisa novamente para atualizar as qtde de parcelas geradas.
					parcelasAtuais = service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});

				}

			}else {
				if(this.proposta.getPremioLiquido() != null && this.proposta.getPremioLiquido() != 0.0){
					parcelaProposta = new ParcelasProposta();
					parcelaProposta.setProposta(this.proposta);
					parcelaProposta.setReferenciaParcela(cRef.getTime());
					parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
					parcelaProposta.setCustoApolice(this.proposta.getCustoApolice());
					parcelaProposta.setValorTransportado(this.proposta.getValorTransportado());
					parcelaProposta.setTaxaFaturaAtual(this.proposta.getTaxaFaturaAtual());
					parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					parcelaProposta.setDesconto(this.proposta.getDesconto());
					parcelaProposta.setIof(this.proposta.getIof());
					parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
					parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
					parcelaProposta.setInicioVigencia(this.proposta.getInicioVigencia());
					parcelaProposta.setTerminoVigencia(this.proposta.getTerminoVigencia());
					parcelaProposta.setNroDocumento(this.proposta.getNroFatura());
					parcelaProposta.setPercentualComissao(this.proposta.getFator());
					parcelaProposta.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					parcelaProposta.setValorComissao(parcelaProposta.getValorParcela()*(parcelaProposta.getPercentualComissao()/100));
					
					if(this.proposta.getFormaPagamento1aParcela() == Constants.FORMA_PAG_DEBITO_CONTA){
						parcelaProposta.setNroBanco(nroBanco);
						parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
						parcelaProposta.setContaCorrente(contaCorrente);
					}
					this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
					this.service.save(parcelaProposta);
					i++;
				}
		
				int novasParcelas = 12/this.proposta.getQtdeParcelas().intValue();
				
				for(int k = 2; k <= novasParcelas; k++){
					cRef.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());

					parcelaProposta = new ParcelasProposta();
					parcelaProposta.setProposta(this.proposta);

					parcelaProposta.setReferenciaParcela(cRef.getTime());
					parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
					parcelaProposta.setCustoApolice(this.proposta.getCustoApolice());
					parcelaProposta.setValorTransportado(this.proposta.getValorTransportado());
					parcelaProposta.setTaxaFaturaAtual(this.proposta.getTaxaFaturaAtual());
					parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					parcelaProposta.setDesconto(this.proposta.getDesconto());
					parcelaProposta.setIof(this.proposta.getIof());
					parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
					parcelaProposta.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					parcelaProposta.setVencimento(Formatter.addMonth(this.proposta.getDataVencim1aParcela(), i-1));
					parcelaProposta.setInicioVigencia(Formatter.addMonth(this.proposta.getInicioVigencia(), i-1));

					Calendar c = Calendar.getInstance();
					c.setTime(parcelaProposta.getInicioVigencia());
					c.add(Calendar.DATE, c.getActualMaximum(Calendar.DAY_OF_MONTH)-1);
					
					parcelaProposta.setTerminoVigencia(c.getTime());
					parcelaProposta.setPercentualComissao(this.proposta.getFator());
					parcelaProposta.setValorComissao(parcelaProposta.getValorParcela()*(parcelaProposta.getPercentualComissao()/100));
					
					if(proposta.getFormaPagamento() == Constants.FORMA_PAG_DEBITO_CONTA){
						parcelaProposta.setNroBanco(nroBanco);
						parcelaProposta.setCodigoAgencia(this.proposta.getCodigoAgencia());
						parcelaProposta.setContaCorrente(contaCorrente);
					}
					this.proposta.getParcelasPropostaCollection().add(parcelaProposta);
					this.service.save(parcelaProposta);
					i++;
				}
			}
			
			gerarComissionados();
			
		}catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@SkipValidation
	public String alterarGrupoVendaComissao(){
		try {
			
			// Carrega o grupo de venda selecionado na alteração.
			GrupoDeVenda grupoDeVendaAtual = (GrupoDeVenda)this.service.find(this.parcelasProposta.getGrupoDeVenda());
			// Carrega a parcela selecionada com o grupo de venda anterior
			ParcelasProposta parcelaSelecionada = (ParcelasProposta)this.service.find(this.parcelasProposta);

			if (this.getDemaisParcelas().equals("NAO")){
				// seleciona comissionados existentes da parcela selecionada
				List<ComissionadoProposta> comissionados = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{this.parcelasProposta.getId()});
				
				// verifica existencia de repasse somente para os comissionados da parcela selecionada.
				boolean existeRepasse = false;
				for (ComissionadoProposta comissionadoProposta : comissionados) {
					List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
					if (repasses.size()>0){
						existeRepasse = true;
					}
				}
				
				if (existeRepasse){
					this.service.reprocessarGrupoDeVendaEComissionados(grupoDeVendaAtual, parcelaSelecionada.getGrupoDeVenda(), parcelaSelecionada);				

				}else{// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
					//this.service.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{this.proposta.getId()});
					this.service.executeNamedQuery("deleteComissionadoPropostaByParcelaPropostaId", new Object[]{this.parcelasProposta.getId()});

					parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
					this.service.save(parcelaSelecionada);

					this.gerarComissionados(parcelaSelecionada);
					
				}
				
			}if (this.getDemaisParcelas().equals("SIM")){
				List<ParcelasProposta> parcelas = this.service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{parcelaSelecionada.getProposta().getId(), parcelaSelecionada.getReferenciaParcela()});
				for (ParcelasProposta parcelasProposta : parcelas) {
					// seleciona comissionados existentes da parcela selecionada
					List<ComissionadoProposta> comissionados = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelasProposta.getId()});
					
					// verifica existencia de repasse somente para os comissionados da parcela selecionada.
					boolean existeRepasse = false;
					for (ComissionadoProposta comissionadoProposta : comissionados) {
						List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
						if (repasses.size()>0){
							existeRepasse = true;
						}
					}
					
					if (existeRepasse){
						this.service.reprocessarGrupoDeVendaEComissionados(grupoDeVendaAtual, parcelaSelecionada.getGrupoDeVenda(), parcelasProposta);				

					}else{// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
						//this.service.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{this.proposta.getId()});
						this.service.executeNamedQuery("deleteComissionadoPropostaByParcelaPropostaId", new Object[]{parcelasProposta.getId()});

						parcelasProposta.setGrupoDeVenda(grupoDeVendaAtual);
						this.service.save(parcelasProposta);

						this.gerarComissionados(parcelasProposta);
						
					}
				}
				
			}

			this.repassePorParcela();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	//@SkipValidation
	public String salvarRepasse(){
		try {
			
			// Carrega o grupo de venda selecionado na alteração.
			GrupoDeVenda grupoDeVendaAtual = null;
			if (this.parcelasProposta.getGrupoDeVenda()!=null && this.parcelasProposta.getGrupoDeVenda().getId()!=null)
				grupoDeVendaAtual = (GrupoDeVenda)this.service.find(this.parcelasProposta.getGrupoDeVenda());
			
			// Carrega a parcela selecionada com o grupo de venda anterior
			ParcelasProposta parcelaSelecionada = (ParcelasProposta)this.service.find(this.parcelasProposta);

			if (this.getDemaisParcelas().equals("NAO")){
				// seleciona comissionados existentes da parcela selecionada
				List<ComissionadoProposta> comissionados = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{this.parcelasProposta.getId()});
				
				// verifica existencia de repasse somente para os comissionados da parcela selecionada.
				boolean existeRepasse = false;
				for (ComissionadoProposta comissionadoProposta : comissionados) {
					List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
					if (repasses.size()>0){
						existeRepasse = true;
					}
				}
				
				if (existeRepasse){
					this.service.reprocessarGrupoDeVendaEComissionados(comissionadoPropostaList, parcelaSelecionada, grupoDeVendaAtual);				

				}else{
					// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
					this.service.atualizarGrupoDeVendaEComissionados(comissionadoPropostaList, parcelaSelecionada, grupoDeVendaAtual);				
					
				}
				
			}if (this.getDemaisParcelas().equals("SIM")){
				List<ParcelasProposta> parcelas = this.service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{parcelaSelecionada.getProposta().getId(), parcelaSelecionada.getReferenciaParcela()});
				for (ParcelasProposta parcelasProposta : parcelas) {
					// seleciona comissionados existentes da parcela selecionada
					List<ComissionadoProposta> comissionados = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelasProposta.getId()});
					
					// verifica existencia de repasse somente para os comissionados da parcela selecionada.
					boolean existeRepasse = false;
					for (ComissionadoProposta comissionadoProposta : comissionados) {
						List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
						if (repasses.size()>0){
							existeRepasse = true;
						}
					}
					
					if (existeRepasse){
						this.service.reprocessarGrupoDeVendaEComissionados(comissionadoPropostaList, parcelasProposta, grupoDeVendaAtual);				

					}else{
						// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
						this.service.atualizarGrupoDeVendaEComissionados(comissionadoPropostaList, parcelasProposta, grupoDeVendaAtual);				
						
					}
				}
				
			}

			if (this.agenciamento != null && this.agenciamento.getId()!=null){
				// Carrega o grupo de venda selecionado na alteração.
				this.agenciamento = (Agenciamento)this.service.find(this.agenciamento);
				GrupoDeVenda grupoDeVendaAagenciamento = this.agenciamento.getGrupoDeVenda();
				// Carrega a parcela selecionada com o grupo de venda anterior
				Agenciamento agenciamento = (Agenciamento)this.service.find(this.agenciamento);
				// seleciona comissionados existentes da parcela selecionada
				List<ComissionadoAgenciamento> comissionados = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{this.agenciamento.getId()});
				
				// verifica existencia de repasse somente para os comissionados da parcela selecionada.
				boolean existeRepasse = false;
				for (ComissionadoAgenciamento comissionadoAgenciamento : comissionados) {
					List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionadoAgenciamento.getId()});
					if (repasses.size()>0){
						existeRepasse = true;
					}
				}

				if (existeRepasse){
					this.service.reprocessarGrupoDeVendaEComissionadosAgenciamento(comissionadoAgenciamentoList, agenciamento, grupoDeVendaAagenciamento);				

				}else{
					// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
					this.service.atualizarGrupoDeVendaEComissionadosAgenciamento(comissionadoAgenciamentoList, agenciamento, grupoDeVendaAagenciamento);				
					
				}
			}
			
			this.repassePorParcela();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String alterarGrupoDeVendaSemSalvar(){
		try {
			
			// Carrega o grupo de venda selecionado na alteração.
			GrupoDeVenda grupoDeVendaAtual = (GrupoDeVenda)this.service.find(this.parcelasProposta.getGrupoDeVenda());
			// Carrega a parcela selecionada com o grupo de venda anterior
			parcelasProposta.setGrupoDeVenda(grupoDeVendaAtual);
			ParcelasProposta parcelaSelecionada = (ParcelasProposta)this.service.find(this.parcelasProposta);

			comissionadoPropostaList = new ArrayList<ComissionadoProposta>();
			
			for(GrupoProdutor grupoProdutor : grupoDeVendaAtual.getGrupoProdutorCollection()){
				double valorComissao = 0;
				if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
					valorComissao = parcelaSelecionada.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
					valorComissao = parcelaSelecionada.getValorParcela().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
					valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
				ComissionadoProposta comissao = new ComissionadoProposta();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setValorComissao(valorComissao);
				comissao.setSituacao(0);
				comissao.setParcelasProposta(parcelaSelecionada);
				comissao.setProposta(parcelaSelecionada.getProposta());
				comissionadoPropostaList.add(comissao);
			}
			this.comissionadoPropostaCount = this.comissionadoPropostaList.size();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String alterarGrupoVendaAgenciamentoSemSalvar(){
		try {
			
			// Carrega o grupo de venda selecionado na alteração.
			GrupoDeVenda grupoDeVendaAtual = (GrupoDeVenda)this.service.find(this.agenciamento.getGrupoDeVenda());
			// Carrega a parcela selecionada com o grupo de venda anterior
			agenciamento.setGrupoDeVenda(grupoDeVendaAtual);
			Agenciamento parcelaSelecionada = (Agenciamento)this.service.find(this.agenciamento);

			comissionadoAgenciamentoList = new ArrayList<ComissionadoAgenciamento>();
			
			for(GrupoProdutor grupoProdutor : grupoDeVendaAtual.getGrupoProdutorCollection()){
				double valorComissao = 0;
				if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
					valorComissao = parcelaSelecionada.getValorAgenciamento().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
					valorComissao = parcelaSelecionada.getValorAgenciamento().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
					valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
				ComissionadoAgenciamento comissao = new ComissionadoAgenciamento();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setValorComissao(valorComissao);
				comissao.setSituacao(0);
				comissao.setAgenciamento(parcelaSelecionada);
				comissao.setProposta(parcelaSelecionada.getProposta());
				comissionadoAgenciamentoList.add(comissao);
			}
			this.comissionadoAgenciamentoCount = this.comissionadoAgenciamentoList.size();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirComissionadoSemSalvar(){
		try {
			

			comissionadoPropostaList = new ArrayList<ComissionadoProposta>();
			
			this.comissionadoPropostaCount++;
			comissionadoProposta.setProposta(this.proposta);
			Pessoa pessoa = (Pessoa)this.service.find(comissionadoProposta.getPessoa());
			comissionadoProposta.setPessoa(pessoa);
			comissionadoPropostaList.add(comissionadoProposta);
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirComissionadoAgenciamentoSemSalvar(){
		try {
			

			comissionadoAgenciamentoList = new ArrayList<ComissionadoAgenciamento>();
			
			this.comissionadoAgenciamentoCount++;
			comissionadoAgenciamento.setProposta(this.proposta);
			Pessoa pessoa = (Pessoa)this.service.find(comissionadoAgenciamento.getPessoa());
			comissionadoAgenciamento.setPessoa(pessoa);
			comissionadoAgenciamentoList.add(comissionadoAgenciamento);
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	public String repassePorParcela(){
		try{
			this.proposta = (Proposta)this.service.find(Proposta.class, proposta.getId());
			this.parcelasProposta = (ParcelasProposta)this.service.find(this.parcelasProposta);
			this.agenciamentoList = (List<Agenciamento>)this.service.genericFindBySQLQuery("Select a From Agenciamento a where a.proposta.id = ?0 and referenciaParcela = ?1 ", new Object[]{proposta.getId(), parcelasProposta.getReferenciaParcela()});
			if (this.agenciamentoList.size()>0){
				this.agenciamento = (Agenciamento)this.service.find(this.agenciamentoList.get(0));
			}
			this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{this.getParcelasProposta().getId()});
			this.comissionadoPropostaCount = this.comissionadoPropostaList.size();

/*			for(ComissionadoProposta comissionadoProposta : this.comissionadoPropostaList){
				if(Constants.TP_COM_VALOR.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao(comissionadoProposta.getValorComissao());
					comissionadoProposta.setComissao((comissionadoProposta.getComissao()*100)/proposta.getPremioLiquido());
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getPremioLiquido()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((this.parcelasProposta.getValorComissao()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}
			}
*/
			if (this.agenciamentoList.size()>0){
				this.comissionadoAgenciamentoList = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{agenciamentoList.get(0).getId()});
				this.comissionadoAgenciamentoCount = this.comissionadoAgenciamentoList.size();
				
				for(ComissionadoAgenciamento comissionadoAgenciamento : this.comissionadoAgenciamentoList){
					comissionadoAgenciamento.setValorComissao((proposta.getValorAgenciamento()*comissionadoAgenciamento.getComissao())/100);
					comissionadoAgenciamento.setComissao(comissionadoAgenciamento.getComissao());
				}
			}
			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}
	
	public void gerarComissionados(ParcelasProposta parcelaSelecionada){
		try{
			List<ComissionadoProposta> comissionadosExistentes = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
				
			GrupoDeVenda grupoDeVendaParcela = parcelaSelecionada.getGrupoDeVenda();
			
			if (grupoDeVendaParcela != null && grupoDeVendaParcela.getGrupoProdutorCollection().size()==0 && 
				parcelaSelecionada.getProposta().getGrupoDeVenda().getId().compareTo(grupoDeVendaParcela.getId())!=0){
				parcelaSelecionada.setGrupoDeVenda(parcelaSelecionada.getProposta().getGrupoDeVenda());
				this.service.save(parcelaSelecionada);
			}
				
			if (comissionadosExistentes.size()==0 && grupoDeVendaParcela!=null){
				for(GrupoProdutor grupoProdutor : parcelaSelecionada.getGrupoDeVenda().getGrupoProdutorCollection()){
					double valorComissao = 0;
					if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
						valorComissao = parcelaSelecionada.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
					else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
						valorComissao = parcelaSelecionada.getValorParcela().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
					else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
						valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
					ComissionadoProposta comissao = new ComissionadoProposta();
					comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
					comissao.setComissao(grupoProdutor.getComissao());
					comissao.setTipoComissao(grupoProdutor.getTipoComissao());
					comissao.setValorComissao(valorComissao);
					comissao.setSituacao(0);
					comissao.setParcelasProposta(parcelaSelecionada);
					comissao.setProposta(parcelaSelecionada.getProposta());
					this.service.save(comissao);
				}
			}/*else{
				for (ComissionadoProposta comissionadoProposta : comissionadosExistentes) {
					double valorComissao = 0;
					if (comissionadoProposta.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
						valorComissao = parcelaSelecionada.getValorComissao().doubleValue() * (comissionadoProposta.getComissao().doubleValue()/100);
					else if (comissionadoProposta.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
						valorComissao = parcelaSelecionada.getValorParcela().doubleValue() * (comissionadoProposta.getComissao().doubleValue()/100);
					else if (comissionadoProposta.getTipoComissao().intValue() == 2) // valor de comissao fixa
						valorComissao = comissionadoProposta.getValorComissao().doubleValue();
					comissionadoProposta.setValorComissao(valorComissao);
					this.service.save(comissionadoProposta);
				}
			}*/
		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	public void preparaListaComissionadosParcelaSelecionada(ParcelasProposta parcelasProposta){

		try{

			for(ComissionadoProposta comissionadoProposta : parcelasProposta.getComissionadoPropostaCollection()){
				if(Constants.TP_COM_VALOR.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao(comissionadoProposta.getValorComissao());
					comissionadoProposta.setComissao(new Double(0));
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getPremioLiquido()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getValorComissao()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<ComissionadoProposta> carregaComissionadoPropostaList() {
		try {
			//this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();
			this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.getProposta().getId()});
			preparaListaComissionados();
			if (this.comissionadoPropostaList.size()>0)
				this.proposta.setComissionadoPropostaCollection(this.comissionadoPropostaList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comissionadoPropostaList;
	}

	public void preparaListaComissionados(){

		try{

			for(ComissionadoProposta comissionadoProposta : this.comissionadoPropostaList){
				if(Constants.TP_COM_VALOR.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao(comissionadoProposta.getValorComissao());
					comissionadoProposta.setComissao((comissionadoProposta.getComissao()*100)/proposta.getPremioLiquido());
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getPremioLiquido()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getValorComissao()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String carregarParcelas() throws Exception {

		try{
			this.proposta = (Proposta)this.service.find(this.proposta);
			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	public void CorrigirRepasse(){
		try {
			this.serviceAux.gerarRepassesFaltantes();
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	public void gerarComissoes(){
		try {
			this.serviceAux.gerarComissoes(this.proposta);
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	public void cancelarComissoes(){
		try {
			this.serviceAux.cancelarComissoes(this.proposta);
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	public void recuperarComissoes(){
		try {
			this.serviceAux.recuperarComissoes(this.proposta);
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	public void defineTipoProposta(){
		if(blnEndosso){
			proposta.setTipoProposta(blnPropria ? Constants.TP_PROP_ENDOSSO_PROPRIO : Constants.TP_PROP_ENDOSSO_CONGENERE);
		}else if(blnRenovacao){
			proposta.setTipoProposta(blnPropria ? Constants.TP_PROP_RENOVACAO_PROPRIA : Constants.TP_PROP_RENOVACAO_CONGENERE);
		}else{
			proposta.setTipoProposta(Constants.TP_PROP_COMUM);
		}
	}

	public Double calculaValorComissao(ComissionadoProposta comissionadoProposta, Double premioLiquido, Double valorComissao){
		try{
			if(comissionadoProposta.getTipoComissao().equals(Constants.TP_COM_VALOR)){
				return comissionadoProposta.getComissao();
			}else if(comissionadoProposta.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ)){
				return premioLiquido*comissionadoProposta.getComissao()/100;
			}else if(comissionadoProposta.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)){
				return valorComissao*comissionadoProposta.getComissao()/100;
			}
		} catch (Exception ge) {
			ge.printStackTrace();
		}
		return 0.0;
	}

	public Double getPercentualIOF(){
		return Proposta.IOF_PERCENTUAL;
	}

	public String getTipoComissaoDescricao(Long tipoComissao){
		return Constants.getTipoComissaoDescricao(tipoComissao);
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getVistoriadoraBySeguradoraList(){
		try{
			this.vistoriadoras = (List<Vistoriadora>)this.service.genericFindBySQLQuery("Select v From Vistoriadora v Order by v.nome", new Object[]{});
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			this.vistoriadoras = new ArrayList<Vistoriadora>();
			return Action.ERROR;
		}
	}

	public Map<Long, String> getFormaPagamentoList(){
		return Constants.getFormaPagamentoMap();
	}

	public Map<Long, String> getFrequenciaPagamentoList(){
		return Constants.getFrequenciaPagamentoMap();
	}

	public Map<Long, String> getTipoRecebimentoComissaoList(){
		return Constants.getTipoRecebimentoComissaoMap();
	}

	public Map<Long, String> getTipoComissaoList(){
		return Constants.getTipoComissaoMap();
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Integer getCurrentTab() {
		return currentTab;
	}

	public void setCurrentTab(Integer currentTab) {
		this.currentTab = currentTab;
	}

	public Integer getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(Integer tipoCliente) {
		this.tipoCliente = tipoCliente;
	}

	public List<ComissionadoProposta> getComissionadoPropostaList() {
		return comissionadoPropostaList;
	}

	public void setComissionadoPropostaList(List<ComissionadoProposta> comissionadoPropostaList) {
		this.comissionadoPropostaList = comissionadoPropostaList;
	}

	public Proposta getPropostaSearch() {
		return propostaSearch;
	}

	public void setPropostaSearch(Proposta propostaSearch) {
		this.propostaSearch = propostaSearch;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public List<Vistoriadora> getVistoriadoras() {
		return vistoriadoras != null ? vistoriadoras : new ArrayList<Vistoriadora>();
	}

	public void setVistoriadoras(List<Vistoriadora> vistoriadoras) {
		this.vistoriadoras = vistoriadoras;
	}

	public Boolean getBlnGerarParcelas() {
		return blnGerarParcelas;
	}

	public void setBlnGerarParcelas(Boolean blnGerarParcelas) {
		this.blnGerarParcelas = blnGerarParcelas;
	}

	public List<Vistoriadora> getVistoriadorasList(){
		if(this.vistoriadoras == null){
			this.vistoriadoras = new ArrayList<Vistoriadora>();
		}
		return vistoriadoras;
	}

	public Boolean getBlnEndosso() {
		return blnEndosso;
	}

	public void setBlnEndosso(Boolean blnEndosso) {
		this.blnEndosso = blnEndosso;
	}

	public Boolean getBlnRenovacao() {
		return blnRenovacao;
	}

	public void setBlnRenovacao(Boolean blnRenovacao) {
		this.blnRenovacao = blnRenovacao;
	}

	public Boolean getBlnPropria() {
		return blnPropria;
	}

	public void setBlnPropria(Boolean blnPropria) {
		this.blnPropria = blnPropria;
	}

	public Boolean getMostraUltimaLista() {
		return mostraUltimaLista;
	}

	public void setMostraUltimaLista(Boolean mostraUltimaLista) {
		this.mostraUltimaLista = mostraUltimaLista;
	}

	public Endosso getEndosso() {
		return endosso;
	}

	public void setEndosso(Endosso endosso) {
		this.endosso = endosso;
	}

	public String[] getDados() {
		return dados;
	}

	public void setDados(String[] dados) {
		this.dados = dados;
	}

	public Long getOperacao() {
		return operacao;
	}

	public void setOperacao(Long operacao) {
		this.operacao = operacao;
	}

	public Long getTipoEndosso() {
		return tipoEndosso;
	}

	public void setTipoEndosso(Long tipoEndosso) {
		this.tipoEndosso = tipoEndosso;
	}

	public Boolean getTemPedidoDeEndosso() {
		return temPedidoDeEndosso;
	}

	public void setTemPedidoDeEndosso(Boolean temPedidoDeEndosso) {
		this.temPedidoDeEndosso = temPedidoDeEndosso;
	}

	public List<Proposta> getHistoricoList() {
		return historicoList;
	}

	public void setHistoricoList(List<Proposta> historicoList) {
		this.historicoList = historicoList;
	}

	public Boolean getBlnReloaded() {
		return blnReloaded;
	}

	public void setBlnReloaded(Boolean blnReloaded) {
		this.blnReloaded = blnReloaded;
	}

	public List<ComissionadoAgenciamento> getComissionadoAgenciamentoList() {
		return comissionadoAgenciamentoList;
	}

	public void setComissionadoAgenciamentoList(
			List<ComissionadoAgenciamento> comissionadoAgenciamentoList) {
		this.comissionadoAgenciamentoList = comissionadoAgenciamentoList;
	}
	
	public TipoDeQuebraDeRelatorio[] getOpcoesDeQuebraDoRelatorio(){
		return TipoDeQuebraDeRelatorio.values();
	}

	public String getOrdem() {
		return ordem;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

	public File getFileUpload() {
		return this.fileUpload;
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

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public Boolean getBlnOrcamento() {
		return blnOrcamento;
	}

	public void setBlnOrcamento(Boolean blnOrcamento) {
		this.blnOrcamento = blnOrcamento;
	}

	public Boolean getIsFatura() {
		return isFatura;
	}

	public void setIsFatura(Boolean isFatura) {
		this.isFatura = isFatura;
	}
	public String getDemaisParcelas() {
		return demaisParcelas;
	}

	public void setDemaisParcelas(String demaisParcelas) {
		this.demaisParcelas = demaisParcelas;
	}

	public String getParcelaSelecionada() {
		return parcelaSelecionada;
	}

	public void setParcelaSelecionada(String parcelaSelecionada) {
		this.parcelaSelecionada = parcelaSelecionada;
	}

	public ParcelasProposta getParcelasProposta() {
		return parcelasProposta;
	}

	public void setParcelasProposta(ParcelasProposta parcelasProposta) {
		this.parcelasProposta = parcelasProposta;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public boolean isAtualizarDemaisParcelas() {
		return atualizarDemaisParcelas;
	}

	public void setAtualizarDemaisParcelas(boolean atualizarDemaisParcelas) {
		this.atualizarDemaisParcelas = atualizarDemaisParcelas;
	}

	public int getComissionadoPropostaCount() {
		return comissionadoPropostaCount;
	}

	public void setComissionadoPropostaCount(int comissionadoPropostaCount) {
		this.comissionadoPropostaCount = comissionadoPropostaCount;
	}

	public ComissionadoProposta getComissionadoProposta() {
		return comissionadoProposta;
	}

	public void setComissionadoProposta(ComissionadoProposta comissionadoProposta) {
		this.comissionadoProposta = comissionadoProposta;
	}

	public List<Agenciamento> getAgenciamentoList() {
		return agenciamentoList;
	}

	public void setAgenciamentoList(List<Agenciamento> agenciamentoList) {
		this.agenciamentoList = agenciamentoList;
	}

	public Agenciamento getAgenciamento() {
		return agenciamento;
	}

	public void setAgenciamento(Agenciamento agenciamento) {
		this.agenciamento = agenciamento;
	}

	public PessoaJuridica getEstipulante() {
		return estipulante;
	}

	public void setEstipulante(PessoaJuridica estipulante) {
		this.estipulante = estipulante;
	}

	public Long getPropostaId() {
		return propostaId;
	}

	public void setPropostaId(Long propostaId) {
		this.propostaId = propostaId;
	}

	public int getComissionadoAgenciamentoCount() {
		return comissionadoAgenciamentoCount;
	}

	public void setComissionadoAgenciamentoCount(int comissionadoAgenciamentoCount) {
		this.comissionadoAgenciamentoCount = comissionadoAgenciamentoCount;
	}

	public ComissionadoAgenciamento getComissionadoAgenciamento() {
		return comissionadoAgenciamento;
	}

	public void setComissionadoAgenciamento(
			ComissionadoAgenciamento comissionadoAgenciamento) {
		this.comissionadoAgenciamento = comissionadoAgenciamento;
	}

	public Long getTipoProposta() {
		return tipoProposta;
	}

	public void setTipoProposta(Long tipoProposta) {
		this.tipoProposta = tipoProposta;
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

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

	public Boolean getBlnPreparandoEndosso() {
		return blnPreparandoEndosso;
	}

	public void setBlnPreparandoEndosso(Boolean blnPreparandoEndosso) {
		this.blnPreparandoEndosso = blnPreparandoEndosso;
	}

	public Proposta getPropostaSearchRenovacao() {
		return propostaSearchRenovacao;
	}

	public void setPropostaSearchRenovacao(Proposta propostaSearchRenovacao) {
		this.propostaSearchRenovacao = propostaSearchRenovacao;
	}

	public List<Produtor> getProdutorList() {
		try {
			return this.service.genericFindByNamedQuery("getProdutorByCorretora", new Object[]{this.corretoraEmUso.getId()});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Integer getNatureza() {
		return natureza;
	}

	public void setNatureza(Integer natureza) {
		this.natureza = natureza;
	}

	public Boolean getAutomovelAlterado() {
		return automovelAlterado;
	}

	public void setAutomovelAlterado(Boolean automovelAlterado) {
		this.automovelAlterado = automovelAlterado;
	}
	
}