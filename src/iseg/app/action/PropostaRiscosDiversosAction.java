package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaRiscosDiversosService;
import iseg.app.constants.Constants;
import iseg.app.model.Coberturas;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.RiscoCoberturas;
import iseg.app.model.RiscoDiversos;
import iseg.app.model.Seguradora;
import iseg.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaRiscosDiversosAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	protected PropostaRiscosDiversosService service;
	List<ParcelasProposta>parcelas;
	private RiscoCoberturas riscoCobertura;
	private List<RiscoCoberturas>riscoCoberturaList;
	private List<RiscoDiversos> riscoDiversosList;
	private RiscoDiversos riscoDiversos;
	private Integer itemCorrente;
	private Integer itens;

	private Boolean riscoAlterado = false;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	//@Autowired
	public PropostaRiscosDiversosAction(PropostaRiscosDiversosService service, PropostaComissaoService serviceAux) {
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

			this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();
			this.riscoCoberturaList = this.proposta.getRiscoDiversosCollection().get(0).getRiscoCoberturasCollection();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}

			carregaComissionadoPropostaList();
			this.riscoCoberturaList = this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection();
			this.riscoDiversosList = this.proposta.getRiscoDiversosCollection();
			itens = new Integer(this.riscoDiversosList.size());
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
	protected void persistPObjects() throws Exception {
		try{
			RiscoDiversos risco = null;
			riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});

			if (proposta.getRiscoDiversosCollection() != null && !this.riscoAlterado){
				for(int i=0 ; i<proposta.getRiscoDiversosCollection().size() ; i++){
					proposta.getRiscoDiversosCollection().remove(i--);
				}
			}

			if(proposta.getRiscoDiversosCollection() != null && this.riscoAlterado){
				for(int i=0 ; i<proposta.getRiscoDiversosCollection().size() ; i++){
					risco = proposta.getRiscoDiversosCollection().get(i);
					if(risco == null){
						proposta.getRiscoDiversosCollection().remove(i--);
					}else{
						risco.setProposta(proposta);
						if (risco.getSeguradora()!=null && risco.getSeguradora().getId()==null){
							risco.setSeguradora(null);
						}
	
						if (riscoDiversosList.size()==0)
							risco.setLinhaVazia(true);

						if (riscoAlterado && risco.getLinhaVazia() || (risco.getDescricaoRisco()!=null))
							proposta.getRiscoDiversosCollection().get(i).setLinhaVazia(false);

						RiscoCoberturas riscoCobertura = null;
						if(risco.getRiscoCoberturasCollection() != null){
							for(int j=0 ; j<risco.getRiscoCoberturasCollection().size() ; j++){
								riscoCobertura = risco.getRiscoCoberturasCollection().get(i);
								if(riscoCobertura == null || (riscoCobertura.getCoberturas() == null && (riscoCobertura.getDescricao()==null || riscoCobertura.getDescricao().equals("")))){
									risco.getRiscoCoberturasCollection().remove(j--);
								}else{
									risco.getRiscoCoberturasCollection().get(j).setRiscoDiversos(risco);
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
			if(proposta.getNroVistoria() == null || proposta.getNroVistoria().equals("")){
				proposta.setVistoriadora(null);
				proposta.setDataVistoria(null);
				proposta.setNomeVistoriador(null);
				proposta.setNomeVistoriadora(null);
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
			if(proposta.getAutorGeracao() != null && proposta.getAutorGeracao().getId() == null){
				proposta.setAutorGeracao(null);
			}
			if(this.proposta.getGrupoDeVenda() == null || this.proposta.getGrupoDeVenda().getId() == null){
				proposta.setGrupoDeVenda(pessoa.getGrupoDeVenda());
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

			if(this.proposta.getTipoProposta() == null || this.proposta.getTipoProposta().equals(new Long(0))){
				this.defineTipoProposta();
			}

			if (this.proposta.getId()==null){
				currentTabSaved = currentTab;
				currentTab = 0;
			}else{
				currentTabSaved = currentTab;
			}

			this.salvarChecarParcelas();

			this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());
			carregaComissionadoPropostaList();

			if(!blnPreparandoEndosso){
				this.setPObjectInstance();
				this.riscoCoberturaList = this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection();
			}

			this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();
			this.riscoDiversosList = this.proposta.getRiscoDiversosCollection();
			itens = new Integer(this.riscoDiversosList.size());

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

	protected void setPObjectInstance() throws Exception {
		//this.proposta = (Proposta)this.pobject;
		if (this.proposta.getDataVencim1aParcela()==null)
			this.proposta.setDataVencim1aParcela(new Date());

		this.seguradora = this.proposta.getSeguradora();
		//this.seguradora = (Seguradora)this.service.find(this.proposta.getSeguradora());

		this.getVistoriadoraBySeguradoraList();

		boolean salvarDeNovo = false;

		if (this.proposta.getRiscoDiversosCollection().size()==0){
			if (novoItem().equals(Action.ERROR))
				throw new Exception("Erro ao tentar criar automovel vazio!");
			salvarDeNovo = true;
		}else{
			List<RiscoDiversos> risco = this.proposta.getRiscoDiversosCollection();
			if (this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection().size()==0){
				for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
					Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
					if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
						RiscoCoberturas riscoCoberturas = new RiscoCoberturas();
						riscoCoberturas.setRiscoDiversos(this.proposta.getRiscoDiversosCollection().get(itemCorrente));
						riscoCoberturas.setCoberturas((Coberturas)this.service.find(cobertura));
						riscoCoberturas.setSequencia(cobertura.getSequencia());
						this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection().add(riscoCoberturas);
						salvarDeNovo = true;
					}
				}
			}
		}

		if(this.proposta.getComissionadoPropostaCollection().isEmpty()){
			gerarComissionados();
			salvarDeNovo = true;
		}else{
			this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.getProposta().getId()});
			preparaListaComissionados();
		}

		if (salvarDeNovo){
			this.service.save(this.proposta);
			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
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

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String novoItem(){
		try{
			this.proposta = (Proposta)service.find(this.proposta);
			this.pobject = this.proposta;
			RiscoDiversos risco = null;
			for (int i=0;i<this.proposta.getRiscoDiversosCollection().size();i++){
				risco = this.proposta.getRiscoDiversosCollection().get(i);
				if (risco.getLinhaVazia()){
					this.itemCorrente = i;
					this.riscoCoberturaList = risco.getRiscoCoberturasCollection();
					riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
					return Action.SUCCESS;
				}
			}
			risco = new RiscoDiversos();
			this.riscoAlterado = true;
			risco.setLinhaVazia(true);
			risco.setProposta(this.proposta);
			Seguradora seguradora;
			seguradora = (Seguradora)this.service.find(Seguradora.class, this.proposta.getSeguradora().getId());
			for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = seguradora.getCoberturasCollection().get(i);
				if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					RiscoCoberturas riscoCoberturas = new RiscoCoberturas();
					riscoCoberturas.setRiscoDiversos(risco);
					riscoCoberturas.setCoberturas(seguradora.getCoberturasCollection().get(i));
					riscoCoberturas.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
					risco.getRiscoCoberturasCollection().add(riscoCoberturas);
				}
			}
			this.itemCorrente = new Integer(this.service.getRowCount("getCountRiscoDiversos", new Object[]{this.proposta.getId()}));
			this.itemCorrente = this.itemCorrente -1;
			if(this.itemCorrente == null || this.itemCorrente < 0){
				this.itemCorrente = 0;
			}
			this.proposta.getRiscoDiversosCollection().add(risco);
			this.riscoCoberturaList = risco.getRiscoCoberturasCollection();
			riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarRisco(){
		try {

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			this.riscoCoberturaList = this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection();
			riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String removerItem(){
		try {

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			RiscoDiversos risco = this.proposta.getRiscoDiversosCollection().get(itemCorrente);
			risco = (RiscoDiversos)this.service.find(risco);
			this.service.remove(risco);
			riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			if (riscoDiversosList.size()==0){
				RiscoDiversos newRisco = new RiscoDiversos();
				newRisco.setProposta(this.proposta);
				newRisco.setLinhaVazia(true);
				Seguradora seguradora = this.proposta.getSeguradora();
				seguradora = (Seguradora)this.service.find(Seguradora.class, seguradora.getId());
				for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
					Coberturas cobertura = seguradora.getCoberturasCollection().get(i);
					if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
						RiscoCoberturas riscoCoberturas = new RiscoCoberturas();
						riscoCoberturas.setRiscoDiversos(newRisco);
						riscoCoberturas.setCoberturas(seguradora.getCoberturasCollection().get(i));
						riscoCoberturas.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
						newRisco.getRiscoCoberturasCollection().add(riscoCoberturas);
					}
				}
				this.itemCorrente = 0;
				this.service.save(newRisco);
				this.riscoCoberturaList = newRisco.getRiscoCoberturasCollection();
				riscoDiversosList = (List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
				this.proposta.setRiscoDiversosCollection(riscoDiversosList);
			}else{
				this.proposta.setRiscoDiversosCollection(riscoDiversosList);
				itemCorrente = 0;
				this.riscoCoberturaList = this.proposta.getRiscoDiversosCollection().get(itemCorrente).getRiscoCoberturasCollection();
				this.itens = riscoDiversosList.size();
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirCobertura(){
		try{

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			riscoCobertura.setRiscoDiversos(this.proposta.getRiscoDiversosCollection().get(itemCorrente));
			this.service.save(riscoCobertura);

			riscoCoberturaList = (List<RiscoCoberturas>)this.service.genericFindBySQLQuery("Select rc From RiscoCoberturas rc where rc.riscoDiversos.id = ?0 order by rc.sequencia", new Object[]{riscoCobertura.getRiscoDiversos().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirRiscoCobertura(){
		try{

			this.service.saveNoRefresh(riscoCobertura);
			riscoCoberturaList = (List<RiscoCoberturas>)this.service.genericFindBySQLQuery("Select rc From RiscoCoberturas rc where rc.riscoDiversos.id = ?0 ", new Object[]{riscoCobertura.getRiscoDiversos().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarRiscoCobertura(){
		try {

			this.riscoCobertura = (RiscoCoberturas)this.service.find(this.riscoCobertura);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirRiscoCobertura(){
		try {

			this.service.remove(riscoCobertura);
			riscoCoberturaList = (List<RiscoCoberturas>)this.service.genericFindBySQLQuery("Select c From RiscoCoberturas c where c.riscoDiversos.id = ?0 ", new Object[]{riscoCobertura.getRiscoDiversos().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public RiscoCoberturas getRiscoCobertura() {
		return riscoCobertura;
	}

	public void setRiscoCobertura(RiscoCoberturas riscoCobertura) {
		this.riscoCobertura = riscoCobertura;
	}

	public List<RiscoCoberturas> getRiscoCoberturaList() {
		return riscoCoberturaList;
	}

	public void setRiscoCoberturaList(List<RiscoCoberturas> riscoCoberturaList) {
		this.riscoCoberturaList = riscoCoberturaList;
	}

	public List<RiscoDiversos> getRiscoDiversosList() {
		return riscoDiversosList;
	}

	public void setRiscoDiversosList(List<RiscoDiversos> riscoDiversosList) {
		this.riscoDiversosList = riscoDiversosList;
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

	public RiscoDiversos getRiscoDiversos() {
		return riscoDiversos;
	}

	public void setRiscoDiversos(RiscoDiversos riscoDiversos) {
		this.riscoDiversos = riscoDiversos;
	}

	public Boolean getRiscoAlterado() {
		return riscoAlterado;
	}

	public void setRiscoAlterado(Boolean riscoAlterado) {
		this.riscoAlterado = riscoAlterado;
	}

}