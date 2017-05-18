package iseg.app.action;

import iseg.app.business.OrcamentoSeguroService;
import iseg.app.constants.Constants;
import iseg.app.model.AutomovelOrcamento;
import iseg.app.model.Coberturas;
import iseg.app.model.Endereco;
import iseg.app.model.Endosso;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.Servicos;
import iseg.app.model.ServicosIseg;
import iseg.app.model.Situacao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class OrcamentoSeguroAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;

	protected OrcamentoSeguroService service;

	protected OrcamentoSeguro orcamentoSeguro;
	protected OrcamentoSeguro orcamentoSearch;
	protected Seguradora seguradora;
	protected Ramo ramo;
	protected Endosso endosso;
	protected String idRelatorio;
	protected String ordem;
	protected String titulo;
	protected List<OrcamentoSeguro> orcamentos;
	protected Pessoa pessoa;
	protected PessoaFisica pessoaFisica;
	protected PessoaJuridica pessoaJuridica;
	protected Endereco endereco;
	protected List<AutomovelOrcamento> automovelList = new ArrayList<AutomovelOrcamento>();
	protected Proposta proposta;
	
	private Boolean isOrcamentoRenovacao;

	protected Integer tipoCliente;
	protected Boolean blnPropria = new Boolean(true);
	protected Boolean blnEndosso = new Boolean(false);
	protected Boolean blnRenovacao = new Boolean(false);
	protected Boolean blnGerarParcelas;
	protected Boolean blnPreparandoEndosso = new Boolean(false);
	protected boolean parcelasAndPremioOK = true;

	protected Integer currentTab = -1;
	protected Integer currentTabSaved;
	protected Long operacao;
	protected Long tipoEndosso;
	protected Long tipoProposta;

	protected Boolean mostraUltimaLista = new Boolean(false);

	protected Boolean temPedidoDeEndosso;
	protected List<OrcamentoSeguro> historicoList = new ArrayList<OrcamentoSeguro>();

	//Dados para criar endosso
	protected String[] dados; 

	//@Autowired
	public OrcamentoSeguroAction(OrcamentoSeguroService orcamentoService) {
		super(orcamentoService);
		this.service = orcamentoService;
	}

	public void prepare() throws Exception {
		super.prepare();
		if(this.getSession().get("orcamentoSearch") != null){
			this.orcamentoSearch = (OrcamentoSeguro) this.getSession().get("orcamentoSearch");
			if (this.getSession().get("page")!=null)
				this.page = (Integer)this.getSession().get("page");
			if (this.getSession().get("pageSize")!=null)
				this.pageSize = (Integer)this.getSession().get("pageSize");
		}else{
			if (this.orcamentoSearch==null)
				this.orcamentoSearch = new OrcamentoSeguro();
			this.orcamentoSearch.setSituacao(new Situacao());
			this.orcamentoSearch.getSituacao().setId(Constants.STATUS_ORCA_PEDIDO);
		}
	}

	@Override
	public String execute() {
		this.orcamentoSeguro = new OrcamentoSeguro();
		this.pessoaFisica = new PessoaFisica();
		this.pessoaJuridica = new PessoaJuridica();
		return Action.SUCCESS;
	}
	
	@Override
	@SkipValidation
	public String novo() {
		try {
			this.ramo = new Ramo();
			this.ramo.setId(Constants.RAMO_AUTOMOVEL);
			return "orcamentoSeguroAuto";
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}
	
	public String gerarPropostaOrcamento() {
		try {
			return "orcamentoSeguroAuto";
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}
	
	public String propostaRenovacao(){
		try {
			this.proposta = (Proposta)this.service.find(Proposta.class,proposta.getId());
			if(this.proposta != null && this.proposta.getRamo().getId().equals(Constants.RAMO_AUTOMOVEL)){
				return "orcamentoSeguroAuto";
			}
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
		return Action.ERROR;
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
			//	visualize uma orcamento da base, mesmo que não pertença à sua corretora.
			//this.orcamento = (Orcamento)service.find(Orcamento.class, this.pobject.getId());
			this.orcamentoSeguro = (OrcamentoSeguro)service.genericFindFirstResultByNamedQuery("getOrcamentoSeguroById", new Object[] { this.pobject.getId() });
			
//			if (orcamentoSeguro != null) {
//				if (this.orcamentoSeguro.getRamo().getId().longValue()==this.getRamoAutomovel()){
//					this.automovelList = (List<AutomovelOrcamento>)this.service.genericFindBySQLQuery("Select i From AutomovelOrcamento i where i.orcamento.id = ?0 order by i.id", new Object[]{this.orcamentoSeguro.getId()});
//					this.orcamentoSeguro.setAutomovelCollection(this.automovelList);
//				}
//			}
			
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public Endosso getEndosso() {
		return endosso;
	}

	public void setEndosso(Endosso endosso) {
		this.endosso = endosso;
	}

	public List<AutomovelOrcamento> getAutomovelList() {
		return automovelList;
	}

	public void setAutomovelList(List<AutomovelOrcamento> automovelList) {
		this.automovelList = automovelList;
	}

	public Boolean getBlnEndosso() {
		return blnEndosso;
	}

	public void setBlnEndosso(Boolean blnEndosso) {
		this.blnEndosso = blnEndosso;
	}

	public Boolean getBlnGerarParcelas() {
		return blnGerarParcelas;
	}

	public void setBlnGerarParcelas(Boolean blnGerarParcelas) {
		this.blnGerarParcelas = blnGerarParcelas;
	}

	public Boolean getBlnPreparandoEndosso() {
		return blnPreparandoEndosso;
	}

	public void setBlnPreparandoEndosso(Boolean blnPreparandoEndosso) {
		this.blnPreparandoEndosso = blnPreparandoEndosso;
	}

	public boolean isParcelasAndPremioOK() {
		return parcelasAndPremioOK;
	}

	public void setParcelasAndPremioOK(boolean parcelasAndPremioOK) {
		this.parcelasAndPremioOK = parcelasAndPremioOK;
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

	public List<OrcamentoSeguro> getHistoricoList() {
		return historicoList;
	}

	public void setHistoricoList(List<OrcamentoSeguro> historicoList) {
		this.historicoList = historicoList;
	}

	public String[] getDados() {
		return dados;
	}

	public void setDados(String[] dados) {
		this.dados = dados;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setOrcamentos(List<OrcamentoSeguro> orcamentos) {
		this.orcamentos = orcamentos;
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
			return "orcamentoSeguroAuto";
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		try {

			this.getSession().put("orcamentoSearch", orcamentoSearch);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			if(this.orcamentoSearch != null){
				this.listCount = this.service.getCountOrcamentoSeguroForSearch(orcamentoSearch).intValue();
				this.orcamentos = this.service.getOrcamentoSeguroForSearch(orcamentoSearch, page, pageSize);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	public void setProdutor(){
		try{
			if (this.orcamentoSeguro.getProdutor()==null || this.orcamentoSeguro.getProdutor().getId()==null){
				if ((this.orcamentoSeguro.getGrupoDeVenda()==null || this.orcamentoSeguro.getGrupoDeVenda().getId()==null) &&
					this.orcamentoSeguro.getCliente().getGrupoDeVenda()!=null){
					this.orcamentoSeguro.setGrupoDeVenda(this.orcamentoSeguro.getCliente().getGrupoDeVenda());
					GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.orcamentoSeguro.getGrupoDeVenda());
					this.orcamentoSeguro.setProdutor(grupoDeVenda.getProdutorGerente());
				}else{
					this.orcamentoSeguro.setProdutor(null);
					this.orcamentoSeguro.setGrupoDeVenda(null);
				}
					
			}
		}catch (Exception e) {
			this.orcamentoSeguro.setProdutor(null);
			this.orcamentoSeguro.setGrupoDeVenda(null);
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
	
	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0) Order by s.nome", new Object[]{this.orcamentoSeguro.getRamo().getId()});

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

			return this.service.genericFindByNamedQuery("getEndossoByRamo", new Object[] {this.orcamentoSeguro.getRamo().getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Endosso>();
	}

	public String getData1aParcela(){
		return "";
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
		this.orcamentoSeguro = (OrcamentoSeguro)this.pobject;
	}

	public List<Situacao> getStatusOrcamentoList() throws Exception {
		return this.service.genericFindByNamedQuery("getSituacaoByIsAtivo", new Object[]{true});
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

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getListResultPage(){
		return blnEndosso || blnRenovacao ? "/WEB-INF/jsp/orcamento/displayListResultSelecao.jsp" : "/WEB-INF/jsp/orcamento/displayListResult.jsp";
	}

	public String getListPage(){
		return blnEndosso || blnRenovacao ? "/WEB-INF/jsp/orcamento/displayListSelecao.jsp" : "/WEB-INF/jsp/orcamento/displayList.jsp";
	}

/*******
 * Todos as funcionalidades comuns a todas as orcamentos.
 */
	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
		this.pobject = this.orcamentoSeguro;
	}

	public List<OrcamentoSeguro> getOrcamentos(){
		return orcamentos;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountOrcamento", new Object[]{});
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

			if ((this.orcamentoSeguro.getCliente() == null || this.orcamentoSeguro.getCliente().getId() == null)){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					PessoaFisica setPessoaFisica;
					if(this.pessoaFisica.getId() != null){
						setPessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaById", new Object[]{this.pessoaFisica.getId()});
					}else
						setPessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByCpf", new Object[]{this.pessoaFisica.getCpfOuCnpj()});
					if (setPessoaFisica != null){
						this.pessoaFisica = setPessoaFisica;
						this.orcamentoSeguro.setCliente(pessoaFisica);
					}
				}else if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
					PessoaJuridica setPessoaJuridica = (PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaByCnpj", new Object[]{this.pessoaJuridica.getCpfOuCnpj()});
					if (setPessoaJuridica != null){
						this.pessoaJuridica = setPessoaJuridica;
						this.orcamentoSeguro.setCliente(pessoaJuridica);
					}
				}

			}else if (this.orcamentoSeguro.getCliente() != null && this.orcamentoSeguro.getCliente().getId() != null){
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					this.pessoaFisica = new PessoaFisica();
					this.pessoaFisica.setId(this.orcamentoSeguro.getCliente().getId());
					this.pessoaFisica = (PessoaFisica)this.service.find(this.pessoaFisica);
					this.orcamentoSeguro.setCliente(pessoaFisica);
				}else if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
					this.pessoaJuridica = new PessoaJuridica();
					this.pessoaJuridica.setId(this.orcamentoSeguro.getCliente().getId());
					this.pessoaJuridica = (PessoaJuridica)this.service.find(this.pessoaJuridica);
					this.orcamentoSeguro.setCliente(pessoaJuridica);
				}
				//TODO: Alterar para pegar o Endereço Residencial ou Comercial. Ver como será feito.
				//			Endereco endereco = (Endereco)this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaId", new Object[] { this.orcamentoSeguro.getCliente().getId() });
				//			PessoaFisica pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaById", new Object[] { this.orcamentoSeguro.getCliente().getId() });
				//			PessoaJuridica pessoaJuridica = (PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaById", new Object[] { this.orcamentoSeguro.getCliente().getId() });
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String novoDadosClienteForm(){
		if (tipoCliente==Constants.CLIENTE_PF){
			this.pessoaFisica = new PessoaFisica();
			this.orcamentoSeguro.setCliente(new PessoaFisica());
		}else{
			this.pessoaJuridica = new PessoaJuridica();
			this.orcamentoSeguro.setCliente(new PessoaJuridica());
		}
		return Action.SUCCESS;
	}

	@SkipValidation
	public String cancelarOrcamento() {
		try {
			this.orcamentoSeguro.setSituacao(new Situacao());
			this.orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_CANCELADO);
			this.salvarEditar();

			this.mostraUltimaLista = true;

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String excluir() {
		try {

			this.orcamentoSeguro = (OrcamentoSeguro)this.service.find(orcamentoSeguro);
			//this.orcamentoSeguro.setStatusOperacional(Constants.STATUS_OPER_PROPOSTA_EXCLUIDA);
			this.service.remove(this.orcamentoSeguro);

			this.blnEndosso = false;
			this.blnRenovacao = false;

			this.mostraUltimaLista = true;

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String getStatusOrcamentoDescricao(Long situacao) throws Exception{
		return ((Situacao)this.service.find(Situacao.class,situacao)).getDescricao();
	}
	
	public Double getPercentualIOF(){
		return Proposta.IOF_PERCENTUAL;
	}

	public String getTipoComissaoDescricao(Long tipoComissao){
		return Constants.getTipoComissaoDescricao(tipoComissao);
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

	public OrcamentoSeguro getOrcamentoSearch() {
		return orcamentoSearch;
	}

	public void setOrcamentoSearch(OrcamentoSeguro orcamentoSearch) {
		this.orcamentoSearch = orcamentoSearch;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
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
	public Long getOperacao() {
		return operacao;
	}

	public void setOperacao(Long operacao) {
		this.operacao = operacao;
	}

	public String getOrdem() {
		return ordem;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

	public Boolean getIsOrcamentoRenovacao() {
		return isOrcamentoRenovacao;
	}

	public void setIsOrcamentoRenovacao(Boolean isOrcamentoRenovacao) {
		this.isOrcamentoRenovacao = isOrcamentoRenovacao;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Long getTipoProposta() {
		return tipoProposta;
	}

	public void setTipoProposta(Long tipoProposta) {
		this.tipoProposta = tipoProposta;
	}
	
}