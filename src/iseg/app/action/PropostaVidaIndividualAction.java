package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaVidaIndividualService;
import iseg.app.constants.Constants;
import iseg.app.model.BeneficiarioIndividual;
import iseg.app.model.Coberturas;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.SegIndividualCoberturas;
import iseg.app.model.SeguradoIndividual;
import iseg.app.model.Seguradora;
import iseg.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaVidaIndividualAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	protected PropostaVidaIndividualService service;
	private SegIndividualCoberturas segIndividualCoberturas;
	private List<SegIndividualCoberturas> segIndividualCoberturasList;
	private List<SeguradoIndividual> seguradoIndividualList;
	private SeguradoIndividual seguradoIndividual;
	private Integer itemCorrente;
	private Integer itens;
	private Boolean seguradoIndividualAlterado = false;
	private List<BeneficiarioIndividual> beneficiarioList;
	private BeneficiarioIndividual beneficiarioIndividual;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	//@Autowired
	public PropostaVidaIndividualAction(PropostaVidaIndividualService service, PropostaComissaoService serviceAux) {
		super(service, serviceAux);
		this.service = service;
		this.serviceAux = serviceAux;
	}

	@SkipValidation
	public String novo() {

		try {
			this.proposta = new Proposta();
			this.proposta.setTipoProposta(this.tipoProposta);
			this.proposta.setDataProposta(new Date());
			this.proposta.setDataVistoria(new Date());
			this.proposta.setInicioVigencia(new Date());
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 1);
			this.proposta.setTerminoVigencia(c.getTime());
			this.seguradora = (Seguradora)this.service.find(this.seguradora);
			this.proposta.setSeguradora(seguradora);
			this.proposta.setCustoApolice(this.seguradora.getCustoApolice());
			this.proposta.setIof(Proposta.IOF_PERCENTUAL);
			this.proposta.setChequeNominal(this.seguradora.getNome());
			if (this.ramo!=null && this.ramo.getId()==null){
				this.ramo = this.ramo.getSubRamo();
			}
			this.proposta.setRamo((Ramo)this.service.find(ramo));
			this.proposta.setDataVencim1aParcela(new Date());
			this.proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO);
			this.proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
			this.getVistoriadoraBySeguradoraList();
			this.itemCorrente = 0;
			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.ERROR;
	}

	@SkipValidation
	public String editar() {

		try{

			if (this.pobject.getId()==null){
				if(id==null)//Posteriormente fazer a controle através de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			//Alterado por Romero em 05/01/2012 - 
			//	O método find não sobre influência do filter, permitindo que qualquer usuário autenticado 
			//	visualize uma proposta da base, mesmo que não pertença à sua corretora.
			//this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());
			this.proposta = (Proposta)service.genericFindFirstResultByNamedQuery("getPropostaById", new Object[] { this.pobject.getId() });
			if (this.proposta == null) {
				//Posteriormente fazer a controle através de Exception
				this.pobject = null;
				return Action.SUCCESS;
			}
			
			this.pobject = this.proposta;
			itemCorrente = 0;
			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}
			carregaComissionadoPropostaList();
			this.segIndividualCoberturasList = this.proposta.getSeguradoIndividualCollection().get(itemCorrente).getSegIndividualCoberturasCollection();
			this.seguradoIndividualList = this.proposta.getSeguradoIndividualCollection();
			itens = new Integer(this.seguradoIndividualList.size());

			Proposta propostaOriginal = this.proposta.getPropostaOriginal();
			
			Long idPropostaOriginal = null;
			
			if (propostaOriginal==null){
				this.historicoList = this.proposta.getEndossoCollection();
				if (this.proposta.getPropostaRenovada()!=null && this.proposta.getPropostaRenovada().getId()!=null)
					this.historicoList.add(0, this.proposta.getPropostaRenovada());
				idPropostaOriginal = this.proposta.getId();
			}else{
				List<Proposta> lista = propostaOriginal.getEndossoCollection();
				lista.add(0,propostaOriginal);
				lista.remove(this.proposta);
				this.historicoList = lista;
				idPropostaOriginal = propostaOriginal.getId();
			}

			int pedidoDeEnsosso = this.service.getRowCount("getCountPedidoDeEndosso", new Object[]{idPropostaOriginal});
			
			if (pedidoDeEnsosso>0)
				this.setTemPedidoDeEndosso(true);
			else
				this.setTemPedidoDeEndosso(false);

			currentTab = 0;
			
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	protected void persistPObjects(){
		try {
			SeguradoIndividual seguradoIndividual = null;
			seguradoIndividualList = (List<SeguradoIndividual>)this.service.genericFindBySQLQuery("Select i From SeguradoIndividual i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			//proposta.setSeguradoIndividualCollection(seguradoIndividualList);
			if(proposta.getSeguradoIndividualCollection() != null){

				for(int i=0 ; i<proposta.getSeguradoIndividualCollection().size() ; i++){
					seguradoIndividual = proposta.getSeguradoIndividualCollection().get(i);
					if(seguradoIndividual == null){
						proposta.getSeguradoIndividualCollection().remove(i--);
					}else if (seguradoIndividual.getId()==null && seguradoIndividual.getProposta()==null){
						if (seguradoIndividualList.get(i).getId()!=null){
							proposta.getSeguradoIndividualCollection().set(i, seguradoIndividualList.get(i));
						}
					}else{
						seguradoIndividual.setProposta(proposta);

						if (seguradoIndividual.getSeguradora()!=null && seguradoIndividual.getSeguradora().getId()==null)
							seguradoIndividual.setSeguradora(null);

						SegIndividualCoberturas segIndividualCoberturas = null;
						if(seguradoIndividual.getSegIndividualCoberturasCollection() != null){
							for(int j=0 ; j<seguradoIndividual.getSegIndividualCoberturasCollection().size() ; j++){
								segIndividualCoberturas = seguradoIndividual.getSegIndividualCoberturasCollection().get(j);
								if(segIndividualCoberturas == null || (segIndividualCoberturas.getCoberturas() == null && (segIndividualCoberturas.getDescricao()==null || segIndividualCoberturas.getDescricao().equals("")))){
									seguradoIndividual.getSegIndividualCoberturasCollection().remove(j--);
								}else{
									seguradoIndividual.getSegIndividualCoberturasCollection().get(j).setSeguradoIndividual(seguradoIndividual);
								}
							}
						}
					}
				}
			}
			PropostaEndereco propostaEndereco = null;
			if(proposta.getPropostaEnderecoCollection() != null){
				for(int i=0 ; i<proposta.getPropostaEnderecoCollection().size() ; i++){
					propostaEndereco = proposta.getPropostaEnderecoCollection().get(i);
					if(propostaEndereco == null){
						proposta.getPropostaEnderecoCollection().remove(i--);
					}else{
						proposta.getPropostaEnderecoCollection().get(i).setProposta(proposta);
					}
				}
			}
		}catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	@SkipValidation
	@Override
	public String salvarEditar(){

		try{

			this.persistPObjects();

			if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
				this.pessoa = this.pessoaFisica;
			}else{
				this.pessoaJuridica.setRazaoSocial(this.pessoaJuridica.getNome());
				if (this.pessoaJuridica.getAtividadeComercial() != null &&
					this.pessoaJuridica.getAtividadeComercial().getId() == null)
					this.pessoaJuridica.setAtividadeComercial(null);
				this.pessoa = this.pessoaJuridica;
			}

			if (this.pessoa.getGrupoDeVenda()!=null && this.pessoa.getGrupoDeVenda().getId() == null)
				this.pessoa.setGrupoDeVenda(null);
			
			if (proposta.getCliente() == null || proposta.getCliente().getId() == null){
				clonarEndereco();
				this.pessoa.setCorretora(this.corretoraEmUso);
				this.service.save(pessoa);
			}else{
				this.pessoa.setId(proposta.getCliente().getId());
				this.pessoa = (Pessoa)service.find(pessoa);
			}

			proposta.setCliente(pessoa);

			this.setProdutor();

			if(proposta.getNumero() == null){
				proposta.setNumero(this.getSequenciaNumeroProposta());
			}
			if(proposta.getVistoriadora() != null && proposta.getVistoriadora().getId() == null){
				proposta.setVistoriadora(null);
			}
			if(proposta.getCondicaoPagamento() != null && proposta.getCondicaoPagamento().getId() == null){
				proposta.setCondicaoPagamento(null);
			}
			if(this.proposta.getGrupoDeVenda() == null || this.proposta.getGrupoDeVenda().getId() == null){
				proposta.setGrupoDeVenda(pessoa.getGrupoDeVenda());
			}
			if(proposta.getAutorGeracao() != null && proposta.getAutorGeracao().getId() == null){
				proposta.setAutorGeracao(null);
			}
			if(this.proposta.getPropostaEndossada() == null || this.proposta.getPropostaEndossada().getId() == null){
				proposta.setPropostaEndossada(null);
			}
			if(this.proposta.getPropostaOriginal() == null || this.proposta.getPropostaOriginal().getId() == null){
				proposta.setPropostaOriginal(null);
			}
			if(this.proposta.getTipoEndosso() == null || this.proposta.getTipoEndosso().getId() == null){
				proposta.setTipoEndosso(null);
			}

			if (blnGerarParcelas != null && blnGerarParcelas){
				blnGerarParcelas = false;
				gerarParcelas();
			}

			verificaValorComissao();

			if ((proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_VALIDO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_ENDOSSO_VALIDO)) && 
				proposta.getSituacaoOperacional()==Constants.SITUACAO_ATIVA){
				int existeBaixa = this.service.getRowCount("checarBaixaExistente", new Object[]{this.proposta.getId()});
				if (existeBaixa==0){
					this.service.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{this.proposta.getId()});
					this.gerarComissoes();
				}
			}

/*			if(proposta.getSituacaoOperacional().equals(Constants.SITUACAO_CANCELADA)){
				this.cancelarComissoes();
			}
			if(this.operacao!=null && this.operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO_CANCELAMENTO)){
				this.recuperarComissoes();
			}
*/
			if(beneficiarioIndividual != null && beneficiarioIndividual.getNome() != null && !beneficiarioIndividual.getNome().equals("")){
				if(this.proposta.getSeguradoIndividualCollection() != null && !this.proposta.getSeguradoIndividualCollection().isEmpty()){
					this.beneficiarioIndividual.setSeguradoIndividual(this.proposta.getSeguradoIndividualCollection().get(itemCorrente));
					inserirBeneficiario();
				}
			}
			this.beneficiarioIndividual = new BeneficiarioIndividual();

			if(this.proposta.getTipoProposta() == null || this.proposta.getTipoProposta().equals(new Long(0))){
				this.defineTipoProposta();
			}

			if (this.proposta.getId()==null){
				currentTabSaved = currentTab;
				currentTab = -1;
			}

			this.salvarChecarParcelas();

			this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());

			carregaComissionadoPropostaList();

			if(!blnPreparandoEndosso){
				this.setPObjectInstance();

				this.segIndividualCoberturasList = this.proposta.getSeguradoIndividualCollection().get(itemCorrente).getSegIndividualCoberturasCollection();
			}

			this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();
			this.seguradoIndividualList = this.proposta.getSeguradoIndividualCollection();
			itens = new Integer(this.seguradoIndividualList.size());

			Proposta propostaOriginal = this.proposta.getPropostaOriginal();

			Long idPropostaOriginal = null;
			
			if (propostaOriginal==null){
				this.historicoList = this.proposta.getEndossoCollection();
				idPropostaOriginal = this.proposta.getId();
			}else{
				List<Proposta> lista = propostaOriginal.getEndossoCollection();
				lista.add(0,propostaOriginal);
				lista.remove(this.proposta);
				this.historicoList = lista;
				idPropostaOriginal = propostaOriginal.getId();
			}

			int pedidoDeEnsosso = this.service.getRowCount("getCountPedidoDeEndosso", new Object[]{idPropostaOriginal});
			
			if (pedidoDeEnsosso>0)
				this.setTemPedidoDeEndosso(true);
			else
				this.setTemPedidoDeEndosso(false);

			if (parcelasAndPremioOK){
				return Action.SUCCESS;
			}else{
				this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());
				this.pobject = this.proposta;
				this.setPObjectInstance();
				this.currentTab = 2;
				return Action.ERROR;
			}

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}

	}

	@SuppressWarnings("unchecked")
	protected void setPObjectInstance() throws Exception {
		//this.proposta = (Proposta)this.pobject;
		if (this.proposta.getDataVencim1aParcela()==null)
			this.proposta.setDataVencim1aParcela(new Date());

		this.seguradora = this.proposta.getSeguradora();

		this.getVistoriadoraBySeguradoraList();

		boolean salvarDeNovo = false;

		if (this.proposta.getSeguradoIndividualCollection().get(itemCorrente).getSegIndividualCoberturasCollection().size()==0){
			for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
				if (cobertura.getRamo().getId().longValue()==this.getRamoVidaIndividual() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					SegIndividualCoberturas segIndividualCoberturas = new SegIndividualCoberturas();
					segIndividualCoberturas.setSeguradoIndividual(this.proposta.getSeguradoIndividualCollection().get(itemCorrente));
					segIndividualCoberturas.setCoberturas(cobertura);
					segIndividualCoberturas.setSequencia(cobertura.getSequencia());
					this.proposta.getSeguradoIndividualCollection().get(itemCorrente).getSegIndividualCoberturasCollection().add(segIndividualCoberturas);
					salvarDeNovo = true;
				}
			}
		}

		if(this.proposta.getComissionadoPropostaCollection().isEmpty()){
			gerarComissionados();
			salvarDeNovo = true;
		}

		if (salvarDeNovo){
			this.service.save(this.proposta);
			//this.pobject = service.find(this.proposta);
			//this.proposta = (Proposta)this.pobject;
		}

		// se proposta ativa, checar a não existencia de repasse e então tentar corrigir.
		if ((proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO)) && 
				proposta.getSituacaoOperacional()==Constants.SITUACAO_ATIVA){
				
			List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByProposta", new Object[]{this.proposta.getId(),this.proposta.getId()});
			
			// não existe repasse, erro provavel de grupo de venda sem comissionado, no momento da baixa da comissão. Irá tentar corrigir.
			if (repasses.size()==0){
				for (ComissionadoProposta comissionadoProposta : this.proposta.getComissionadoPropostaCollection()) {
					this.service.processarRepasseNovoComissionado(comissionadoProposta);
				}
			}
		}

		if (this.proposta.getSeguradoIndividualCollection().size()>0)
			this.beneficiarioList = this.proposta.getSeguradoIndividualCollection().get(itemCorrente).getBeneficiarioIndividualCollection();

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirBeneficiario(){
		try{
			this.service.saveNoRefresh(beneficiarioIndividual);
			beneficiarioList = (List<BeneficiarioIndividual>)this.service.genericFindBySQLQuery("Select c From BeneficiarioIndividual c where c.seguradoIndividual.id = ?0 ", new Object[]{beneficiarioIndividual.getSeguradoIndividual().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarBeneficiario(){
		try {

			this.beneficiarioIndividual = (BeneficiarioIndividual)this.service.find(this.beneficiarioIndividual);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirBeneficiario(){
		try {

			SeguradoIndividual seguradoIndividual = beneficiarioIndividual.getSeguradoIndividual();
			this.service.remove(beneficiarioIndividual);
			this.beneficiarioList = (List<BeneficiarioIndividual>)this.service.genericFindBySQLQuery("Select c From BeneficiarioIndividual c where c.seguradoIndividual.id = ?0 ", new Object[]{seguradoIndividual.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirCobertura(){
		try{

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			segIndividualCoberturas.setSeguradoIndividual(this.proposta.getSeguradoIndividualCollection().get(itemCorrente));
			this.service.save(segIndividualCoberturas);

			segIndividualCoberturasList = (List<SegIndividualCoberturas>)this.service.genericFindBySQLQuery("Select rc From SegIndividualCoberturas rc where rc.seguradoIndividual.id = ?0 ", new Object[]{segIndividualCoberturas.getSeguradoIndividual().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarSeguradoCoberturas(){
		try {

			this.segIndividualCoberturas = (SegIndividualCoberturas)this.service.find(this.segIndividualCoberturas);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public SegIndividualCoberturas getSegIndividualCoberturas() {
		return segIndividualCoberturas;
	}

	public void setSegIndividualCoberturas(SegIndividualCoberturas segIndividualCoberturas) {
		this.segIndividualCoberturas = segIndividualCoberturas;
	}

	public List<SegIndividualCoberturas> getSegIndividualCoberturasList() {
		return segIndividualCoberturasList;
	}

	public void setSegIndividualCoberturasList(List<SegIndividualCoberturas> segIndividualCoberturasList) {
		this.segIndividualCoberturasList = segIndividualCoberturasList;
	}

	public List<SeguradoIndividual> getSeguradoIndividualList() {
		return seguradoIndividualList;
	}

	public void setSeguradoIndividualList(List<SeguradoIndividual> seguradoIndividualList) {
		this.seguradoIndividualList = seguradoIndividualList;
	}

	public Integer getItemCorrente() {
		return itemCorrente;
	}

	public void setItemCorrente(Integer itemCorrente) {
		this.itemCorrente = itemCorrente;
	}

	public SeguradoIndividual getSeguradoIndividual() {
		return seguradoIndividual;
	}

	public void setSeguradoIndividual(SeguradoIndividual seguradoIndividual) {
		this.seguradoIndividual = seguradoIndividual;
	}

	public Boolean getSeguradoIndividualAlterado() {
		return seguradoIndividualAlterado;
	}

	public void setSeguradoIndividualAlterado(Boolean seguradoIndividualAlterado) {
		this.seguradoIndividualAlterado = seguradoIndividualAlterado;
	}

	public Integer getItens() {
		return itens;
	}

	public void setItens(Integer itens) {
		this.itens = itens;
	}

	public List<BeneficiarioIndividual> getBeneficiarioList() {
		return beneficiarioList;
	}

	public void setBeneficiarioList(List<BeneficiarioIndividual> beneficiarioList) {
		this.beneficiarioList = beneficiarioList;
	}

	public BeneficiarioIndividual getBeneficiarioIndividual() {
		return beneficiarioIndividual;
	}

	public void setBeneficiarioIndividual(
			BeneficiarioIndividual beneficiarioIndividual) {
		this.beneficiarioIndividual = beneficiarioIndividual;
	}
}