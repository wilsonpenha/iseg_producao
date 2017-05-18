package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaService;
import iseg.app.constants.Constants;
import iseg.app.model.Automovel;
import iseg.app.model.AutomovelCobertura;
import iseg.app.model.AutomovelServicos;
import iseg.app.model.Condutor;
import iseg.app.model.Corretora;
import iseg.app.model.Endereco;
import iseg.app.model.Fabricante;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaComissao;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.Seguradora;
import iseg.app.model.Sequencia;
import iseg.app.model.Uf;
import iseg.app.model.VeiculoModelo;
import iseg.app.model.VistoriadoraSeguradora;
import iseg.app.persistence.PObject;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PreparaBaixaDeComissaoAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	private Proposta proposta;
	private List<Proposta> propostas;
	protected PropostaService service;
	protected PropostaComissaoService serviceAux;
	List<ParcelasProposta>parcelas;
	private Seguradora seguradora;
	private Ramo ramo;
	private Pessoa pessoa;
	private PessoaFisica pessoaFisica;
	private PessoaJuridica pessoaJuridica;
	private PropostaComissao propostaComissao;
	private Endereco endereco;
	private Fabricante marca;
	private AutomovelCobertura automovelCobertura;
	private AutomovelServicos automovelServico;
	private VeiculoModelo veiculoModelo;
	private List<Condutor> condutores;
	private List<VistoriadoraSeguradora> vistoriadoras;
	private List<VeiculoModelo> modelos;
	private List<AutomovelCobertura>automovelCoberturaList;
	private List<AutomovelServicos>automovelServicoList;
	private List<RepasseComissao> comissionadoPropostaList;
	private Proposta propostaSearch;
	private Condutor condutor;
	private Integer tipoCliente;

	private Long currentTab;

	//@Autowired
	public PreparaBaixaDeComissaoAction(PropostaService service, PropostaComissaoService serviceAux) {
		super(service);
		this.service = service;
		this.serviceAux = serviceAux;
	}

	public void prepare() throws Exception {
		super.prepare();

		if(this.getSession().get("propostaSearch") != null){
			this.propostaSearch = (Proposta) this.getSession().get("propostaSearch");
		}
	}

	@Override
	public String execute() {
		this.proposta = new Proposta();
		this.pessoaFisica = new PessoaFisica();
		this.pessoaJuridica = new PessoaJuridica();
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		if(propostaSearch == null){
			propostaSearch = new Proposta();
		}

		try {

			this.getSession().put("propostaSearch", propostaSearch);
			if(this.propostaSearch != null){
				this.listCount = this.service.getCountPropostasForSearch(propostaSearch).intValue();
				this.propostas = this.service.getPropostasForSearch(propostaSearch, page, pageSize);
			}

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	public List<RepasseComissao> getComissionadoPropostaList() {
		try {
			this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getRepasseComissaoByProposta", new Object[]{this.getProposta().getId(),this.getProposta().getId()});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comissionadoPropostaList;
	}

	public String atualizarRepasse() {
		try {
			this.proposta = this.propostaComissao.getProposta();
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String baixarComissao() {
		try{
			PropostaComissao comissaoAntes = (PropostaComissao)this.service.find(PropostaComissao.class, this.propostaComissao.getId());
			double valorTotal = comissaoAntes.getValorPagamento()==null ? 0 : comissaoAntes.getValorPagamento().doubleValue();
			double valorPago = this.propostaComissao.getValorPagamento().doubleValue();
			this.propostaComissao.setValorPagamento(valorTotal+this.propostaComissao.getValorPagamento().doubleValue());
			if (this.propostaComissao.getValorComissao().doubleValue()<=this.propostaComissao.getValorPagamento().doubleValue())
				this.propostaComissao.setSituacao(2);
			else
				this.propostaComissao.setSituacao(1);
			//this.serviceAux.baixaComissao(propostaComissao,	valorPago);
			this.persistPObjects();
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String estornaComissao() {
		try{
			PropostaComissao comissaoAntes = (PropostaComissao)this.service.find(PropostaComissao.class, this.propostaComissao.getId());
			double valorTotal = comissaoAntes.getValorPagamento()==null ? 0 : comissaoAntes.getValorPagamento().doubleValue();
			this.propostaComissao.setValorPagamento(valorTotal-this.propostaComissao.getValorPagamento().doubleValue());
			if (this.propostaComissao.getValorComissao().doubleValue()<=this.propostaComissao.getValorPagamento().doubleValue())
				this.propostaComissao.setSituacao(2);
			else
				this.propostaComissao.setSituacao(1);
			this.service.save(propostaComissao);
			this.persistPObjects();
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editar() {

		try{

			if (this.pobject.getId()==null){
				if(id==null)//Posteriormente fazer a controle atrav�s de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			this.pobject = service.find(this.pobject);
			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = Constants.CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = Constants.CLIENTE_PJ;
			}
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	protected void persistPObjects(){
		try {
			this.proposta = (Proposta)this.service.find(this.propostaComissao.getProposta());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public String getData1aParcela(){
		return Formatter.getDate(this.proposta.getDataVencim1aParcela());
	}

	protected void setPObjectInstance() throws Exception {
		this.proposta = (Proposta)this.pobject;

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
		this.pobject = this.proposta;
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

	@SkipValidation
	public String getDadosCliente(){
		try {

			if (this.proposta.getCliente() != null && this.proposta.getCliente().getId() != null){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					this.pessoaFisica = new PessoaFisica();
					this.pessoaFisica.setId(this.proposta.getCliente().getId());
					this.pessoaFisica = (PessoaFisica)this.service.find(this.pessoaFisica);
					this.proposta.setCliente(pessoaFisica);
				}else if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
					this.pessoaJuridica = new PessoaJuridica();
					this.pessoaJuridica.setId(this.proposta.getCliente().getId());
					this.pessoaJuridica = (PessoaJuridica)this.service.find(this.pessoaJuridica);
					this.proposta.setCliente(pessoaJuridica);
				}
				//TODO: Alterar para pegar o Endere�o Residencial ou Comercial. Ver como ser� feito.
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

	public Long getSequenciaNumeroProposta() throws Exception {
		Sequencia sequencia = (Sequencia)this.service.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"Proposta",this.getCorretoraEmUso().getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("Proposta");
			sequencia.setCorretora(this.getUsuarioEmUso().getCorretora());
			sequencia.setValor(0L);
			this.service.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.service.save(sequencia);
		return sequencia.getValor();
	}

	public Double getPercentualIOF(){
		return Proposta.IOF_PERCENTUAL;
	}

	public String getTipoComissaoDescricao(Long tipoComissao){
		return Constants.getTipoComissaoDescricao(tipoComissao);
	}

	/***********************************************
	 *    M�todos de acesso a listas de objetos    *
	 ***********************************************/


	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("Select s From Seguradora s", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public Map<Long, String> getStatusOperacionalBaixaList(){
		return Constants.getStatusOperacionalMap();
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfList(){
		try{

			return (List<Uf>)this.service.genericFindBySQLQuery("Select u From Uf u order by u.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Uf>();
	}

	@SuppressWarnings("unchecked")
	public List<GrupoDeVenda> getGrupoDeVendaList(){
		try{
			return (List<GrupoDeVenda>)this.service.genericFindBySQLQuery("Select g From GrupoDeVenda g", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	@SuppressWarnings("unchecked")
	public List<Corretora> getCorretoraList(){
		try{
			return (List<Corretora>)this.service.genericFindBySQLQuery("Select c From Corretora c", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Corretora>();
	}

	@SuppressWarnings("unchecked")
	public List<Ramo> getRamoList(){
		try{
			return (List<Ramo>)this.service.genericFindBySQLQuery("Select r From Ramo r", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Ramo>();
	}

	public List<PObject> getTipoSeguroList(){
		return this.getDominioList("TipoSeguro");
	}

	public List<PObject> getAtividadeComercialList(){
		return this.getDominioList("AtividadeComercial");
	}


	public List<GrupoDeVenda> getGrupoVendaList(){
		try{
			return this.service.genericFindByNamedQuery("getGrupoDeVenda", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	public Map<Long, String> getFormaPagamentoList(){
		return Constants.getFormaPagamentoMap();
	}

	public Map<Long, String> getTipoRecebimentoComissaoList(){
		return Constants.getTipoRecebimentoComissaoMap();
	}

	public Map<Long, String> getTipoComissaoList(){
		return Constants.getTipoComissaoMap();
	}

	public List<PObject> getTipoCombustivelList(){
		return this.getDominioList("TipoCombustivel");
	}

	public List<PObject> getCategoriaVeiculoList(){
		return this.getDominioList("CategoriaVeiculo");
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

	public String getStatusOperacionalDescricao(Long statusOperacional){
		return Constants.getStatusOperacionalDescricao(statusOperacional);
	}

	@SuppressWarnings("unchecked")
	public List<Automovel> getAutomovelWizCollection(){
		try{
			return (List<Automovel>) this.service.genericFindBySQLQuery("SELECT a FROM Automovel a WHERE  a.proposta.id = ?0 ", new Object[]{proposta.getId()});
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

	/*******************************
	 *   M�todos Getters/Setters    *
	 *******************************/
	public AutomovelCobertura getAutomovelCobertura() {
		return automovelCobertura;
	}

	public void setAutomovelCobertura(AutomovelCobertura automovelCobertura) {
		this.automovelCobertura = automovelCobertura;
	}

	public List<AutomovelCobertura> getAutomovelCoberturaList() {
		return automovelCoberturaList;
	}

	public void setAutomovelCoberturaList(List<AutomovelCobertura> automovelCoberturaList) {
		this.automovelCoberturaList = automovelCoberturaList;
	}

	public List<AutomovelServicos> getAutomovelServicoList() {
		return automovelServicoList;
	}

	public void setAutomovelServicoList(List<AutomovelServicos> automovelServicoList) {
		this.automovelServicoList = automovelServicoList;
	}

	public AutomovelServicos getAutomovelServico() {
		return automovelServico;
	}

	public void setAutomovelServico(AutomovelServicos automovelServico) {
		this.automovelServico = automovelServico;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
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

	public PropostaComissao getPropostaComissao() {
		return propostaComissao;
	}

	public void setPropostaComissao(PropostaComissao propostaComissao) {
		this.propostaComissao = propostaComissao;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Fabricante getMarca() {
		return marca;
	}

	public void setMarca(Fabricante marca) {
		this.marca = marca;
	}

	public List<Condutor> getCondutores() {
		return condutores;
	}

	public void setCondutores(List<Condutor> condutores) {
		this.condutores = condutores;
	}

	public Condutor getCondutor() {
		return condutor;
	}

	public void setCondutor(Condutor condutor) {
		this.condutor = condutor;
	}

	public Long getCurrentTab() {
		return currentTab;
	}

	public void setCurrentTab(Long currentTab) {
		this.currentTab = currentTab;
	}

	public Integer getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(Integer tipoCliente) {
		this.tipoCliente = tipoCliente;
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

	public List<VistoriadoraSeguradora> getVistoriadoras() {
		return vistoriadoras != null ? vistoriadoras : new ArrayList<VistoriadoraSeguradora>();
	}

	public void setVistoriadoras(List<VistoriadoraSeguradora> vistoriadoras) {
		this.vistoriadoras = vistoriadoras;
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

	/******
	 * 	  *
	 ******/
	public List<VistoriadoraSeguradora> getVistoriadorasList(){
		if(this.vistoriadoras == null){
			this.vistoriadoras = new ArrayList<VistoriadoraSeguradora>();
		}
		return vistoriadoras;
	}
}