package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaImoveisService;
import iseg.app.constants.Constants;
import iseg.app.model.Coberturas;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.Imovel;
import iseg.app.model.ImovelCobertura;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.Seguradora;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaImoveisAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	protected PropostaImoveisService service;
	private ImovelCobertura imovelCobertura;
	private List<ImovelCobertura> imovelCoberturaList;
	private List<Imovel> imovelList;
	private Imovel imovel;
	private Integer itemCorrente;
	private Integer itens;
	private Boolean imovelAlterado = false;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	//@Autowired
	public PropostaImoveisAction(PropostaImoveisService service, PropostaComissaoService serviceAux) {
		super(service, serviceAux);
		this.service = service;
		this.serviceAux = serviceAux;
	}

	@SkipValidation
	public String novo() {

		try {
			this.proposta = new Proposta();
			//this.proposta.setTipoProposta(this.tipoProposta);
			this.proposta.setDataProposta(new Date());
			this.proposta.setDataVistoria(new Date());
			this.proposta.setInicioVigencia(new Date());
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 1);
			this.proposta.setTerminoVigencia(c.getTime());
			this.seguradora = (Seguradora)this.service.find(this.seguradora);
			this.proposta.setSeguradora(seguradora);
			this.proposta.setCustoApolice(this.seguradora.getCustoApolice());
			this.referencia = Formatter.getMonthYear(new Date());
			this.proposta.setIof(Proposta.IOF_PERCENTUAL);
			this.proposta.setChequeNominal(this.seguradora.getNome());
			if (this.ramo!=null && this.ramo.getId()==null){
				this.ramo = this.ramo.getSubRamo();
			}
			this.proposta.setRamo((Ramo)this.service.find(ramo));
			this.proposta.setDataVencim1aParcela(new Date());
			this.proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO);
			this.proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
			this.proposta.setIsFatura(this.getIsFatura());
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
			
			this.referencia = Formatter.getMonthYear(this.proposta.getReferenciaParcela());
			
			itemCorrente = 0;
			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}
			carregaComissionadoPropostaList();
			this.imovelCoberturaList = this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection();
			this.imovelList = this.proposta.getImovelCollection();
			itens = new Integer(this.imovelList.size());

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
			Imovel imovel = null;
			//imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});

			if (proposta.getImovelCollection() != null && !this.imovelAlterado){
				for(int i=0 ; i<proposta.getImovelCollection().size() ; i++){
					proposta.getImovelCollection().remove(i--);
				}
			}

			if(proposta.getImovelCollection() != null && this.imovelAlterado){

				for(int i=0 ; i<proposta.getImovelCollection().size() ; i++){
					imovel = proposta.getImovelCollection().get(i);
					if(imovel == null || imovel.getLinhaVazia() == null){
						proposta.getImovelCollection().remove(i--);
					/*}else if (imovel.getId()==null && imovel.getProposta()==null){
						if (imovelList.get(i).getId()!=null){
							proposta.getImovelCollection().set(i, imovelList.get(i));
						}*/
					}else{
						imovel.setProposta(proposta);

						/*if (getLinhaVazia.size()==0)
							imovel.setLinhaVazia(true);*/

						if (imovelAlterado && imovel.getLinhaVazia() || (imovel.getCep()!=null && !imovel.getCep().getValor().isEmpty()))
							proposta.getImovelCollection().get(i).setLinhaVazia(false);

						ImovelCobertura imovelCobertura = null;
						if(imovel.getImovelCoberturaCollection() != null){
							for(int j=0 ; j<imovel.getImovelCoberturaCollection().size() ; j++){
								imovelCobertura = imovel.getImovelCoberturaCollection().get(j);
								if(imovelCobertura == null || (imovelCobertura.getCobertura() == null && (imovelCobertura.getDescricao()==null || imovelCobertura.getDescricao().equals("")))){
									imovel.getImovelCoberturaCollection().remove(j--);
								}else{
									imovel.getImovelCoberturaCollection().get(j).setImovel(imovel);
								}
							}
						}
					}
				}
			}

			if (this.proposta.getIsFatura()){
				List<ParcelasProposta> parcelasVidaEmpresarial = null;
				parcelasVidaEmpresarial = (List<ParcelasProposta>)this.service.genericFindBySQLQuery("Select p From ParcelasProposta p where p.proposta.id = ?0 and p.referenciaParcela < ?1 order by p.referenciaParcela", new Object[]{this.proposta.getId(), this.proposta.getReferenciaParcela()});

				for (ParcelasProposta parcelasProposta : parcelasVidaEmpresarial) {
					this.proposta.getParcelasPropostaCollection().add(parcelasProposta);
				}
			
				ParcelasProposta parcelasProposta = null;
				if(proposta.getParcelasPropostaCollection() != null){
					for(int i=0 ; i<proposta.getParcelasPropostaCollection().size() ; i++){
						parcelasProposta = proposta.getParcelasPropostaCollection().get(i);
						if(parcelasProposta == null){
							proposta.getParcelasPropostaCollection().remove(i--);
						}else{
							if (parcelasProposta.getGrupoDeVenda() != null &&  parcelasProposta.getGrupoDeVenda().getId()==null)
								proposta.getParcelasPropostaCollection().get(i).setGrupoDeVenda(null);
							proposta.getParcelasPropostaCollection().get(i).setProposta(proposta);
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
				if(this.pessoaFisica.getProfissao() != null && this.pessoaFisica.getProfissao().getId() == null){
					this.pessoaFisica.setProfissao(null);
				}
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

			if(this.proposta.getGrupoDeVenda() == null || this.proposta.getGrupoDeVenda().getId() == null){
				if (pessoa.getGrupoDeVenda()!=null && pessoa.getGrupoDeVenda().getId()==null)
					proposta.setGrupoDeVenda(null);
				else
					proposta.setGrupoDeVenda(pessoa.getGrupoDeVenda());
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
				currentTab = -1;
			}

			if (this.proposta.getIsFatura()){
				if(this.referencia!=null && !this.referencia.isEmpty())
					this.proposta.setReferenciaParcela(new Date(Formatter.getDateLong("01/"+this.referencia)));
				else
					throw new Exception("É Obrigatório informar uma referência válida!");
			}

			this.salvarChecarParcelas();

			this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());

			if (blnRenovacao)
				this.service.refresh(this.proposta);

			carregaComissionadoPropostaList();

			this.setPObjectInstance();

			this.imovelCoberturaList = this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection();

			this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();
			this.imovelList = this.proposta.getImovelCollection();
			itens = new Integer(this.imovelList.size());

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
			ge.printStackTrace();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}

	}

	@Override
	public String gerarParcelas() throws Exception {

		try{
			this.pobject = this.proposta;
			
			if (this.proposta.getIsFatura())
				this.gerarParcelas(this.proposta);
			else
				super.gerarParcelas();
			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	protected void setPObjectInstance() throws Exception {
		try{
			//this.proposta = (Proposta)this.pobject;
			if (this.proposta.getDataVencim1aParcela()==null)
				this.proposta.setDataVencim1aParcela(new Date());
	
			this.seguradora = this.proposta.getSeguradora();
			this.seguradora = this.service.getEntityManager().getReference(Seguradora.class, this.seguradora.getId());
	
			this.getVistoriadoraBySeguradoraList();
	
			boolean salvarDeNovo = false;
	
			if (this.proposta.getImovelCollection().size()==0){
				//this.proposta.setAutomovelWizCollection(this.automovelList);
				List<Imovel> imovList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
				if (imovList.size()==0){
					if (novoItem().equals(Action.ERROR))
						throw new Exception("Erro ao tentar criar automovel vazio!");
					itemCorrente = 0;
					salvarDeNovo = true;
				}
			}

			if (this.proposta.getImovelCollection().size()>0){
				if (this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection().size()==0){
					for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
						Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
						if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
							ImovelCobertura imovelCobertura = new ImovelCobertura();
							imovelCobertura.setImovel(this.proposta.getImovelCollection().get(itemCorrente));
							imovelCobertura.setCobertura(cobertura);
							imovelCobertura.setSequencia(cobertura.getSequencia());
							this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection().add(imovelCobertura);
							salvarDeNovo = true;
						}
					}
				}
			}
	
			if(this.proposta.getComissionadoPropostaCollection().isEmpty()){
				gerarComissionados();
				salvarDeNovo = true;
			}
	
			if (salvarDeNovo){
				this.service.save(this.proposta);
				this.service.refresh(this.proposta);
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

			//List<Imovel> imoveis = this.proposta.getImovelCollection();
			
			if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
				this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
			else
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirImovelCobertura(){
		try{

			this.service.saveNoRefresh(imovelCobertura);
			imovelCoberturaList = (List<ImovelCobertura>)this.service.genericFindBySQLQuery("Select rc From ImovelCobertura rc where rc.imovel.id = ?0 ", new Object[]{imovelCobertura.getImovel().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarImovelCobertura(){
		try {

			this.imovelCobertura = (ImovelCobertura)this.service.find(this.imovelCobertura);
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
			imovelCobertura.setImovel(this.proposta.getImovelCollection().get(itemCorrente));
			this.service.save(imovelCobertura);

			imovelCoberturaList = (List<ImovelCobertura>)this.service.genericFindBySQLQuery("Select icob From ImovelCobertura icob where icob.imovel.id = ?0 order by icob.sequencia", new Object[]{this.proposta.getImovelCollection().get(itemCorrente).getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	public void gerarComissionados(){
		try{

			if (this.proposta.getIsFatura()){
				this.parcelas = this.service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});
				
				for (ParcelasProposta parcela : this.parcelas) {
					gerarComissionados(parcela);
				}
			}else{
				super.gerarComissionados();
			}
		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	public void gerarComissionados(ParcelasProposta parcelaSelecionada){
		try{
			List<ComissionadoProposta> comissionadosExistentes = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
				
			GrupoDeVenda grupoDeVendaParcela = parcelaSelecionada.getGrupoDeVenda();
			
			if (grupoDeVendaParcela.getGrupoProdutorCollection().size()==0 && 
				parcelaSelecionada.getProposta().getGrupoDeVenda().getId().compareTo(grupoDeVendaParcela.getId())!=0){
				parcelaSelecionada.setGrupoDeVenda(parcelaSelecionada.getProposta().getGrupoDeVenda());
				this.service.save(parcelaSelecionada);
			}
				
			if (comissionadosExistentes.size()==0){
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

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String novoItem(){
		try{
			this.proposta = (Proposta)service.find(this.proposta);
			this.pobject = this.proposta;
			Imovel imovel = null;
			for (int i=0;i<this.proposta.getImovelCollection().size();i++){
				imovel = this.proposta.getImovelCollection().get(i);
				if (imovel.getLinhaVazia()){
					this.itemCorrente = i;
					this.imovelCoberturaList = imovel.getImovelCoberturaCollection();
					imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
					return Action.SUCCESS;
				}
			}
			imovel = new Imovel();
			this.imovelAlterado = true;
			imovel.setLinhaVazia(true);
			imovel.setProposta(this.proposta);
			Seguradora seguradora;
			seguradora = (Seguradora)this.service.find(Seguradora.class, this.proposta.getSeguradora().getId());
			for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = seguradora.getCoberturasCollection().get(i);
				if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					ImovelCobertura imovelCobertura = new ImovelCobertura();
					imovelCobertura.setImovel(imovel);
					imovelCobertura.setCobertura(seguradora.getCoberturasCollection().get(i));
					imovelCobertura.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
					imovel.getImovelCoberturaCollection().add(imovelCobertura);
				}
			}
			this.itemCorrente = new Integer(this.service.getRowCount("getCountImoveis", new Object[]{this.proposta.getId()}));
			this.proposta.getImovelCollection().add(imovel);
			this.imovelCoberturaList = imovel.getImovelCoberturaCollection();
			//imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarImovel(){
		try {

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			this.imovelCoberturaList = this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection();
			imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
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
			Imovel imovel = this.proposta.getImovelCollection().get(itemCorrente);
			imovel = (Imovel)this.service.find(imovel);
			this.service.remove(imovel);
			imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			if (imovelList.size()==0){
				Imovel newImovel = new Imovel();
				newImovel.setProposta(this.proposta);
				newImovel.setLinhaVazia(true);
				Seguradora seguradora = this.proposta.getSeguradora();
				seguradora = (Seguradora)this.service.find(Seguradora.class, seguradora.getId());
				for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
					Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
					if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId().longValue() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
						ImovelCobertura imovelCobertura = new ImovelCobertura();
						imovelCobertura.setImovel(newImovel);
						imovelCobertura.setCobertura(seguradora.getCoberturasCollection().get(i));
						imovelCobertura.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
						newImovel.getImovelCoberturaCollection().add(imovelCobertura);
					}
				}
				this.itemCorrente = 0;
				this.service.save(newImovel);
				this.imovelCoberturaList = newImovel.getImovelCoberturaCollection();
				imovelList = (List<Imovel>)this.service.genericFindBySQLQuery("Select i From Imovel i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
				this.proposta.setImovelCollection(imovelList);
			}else{
				this.proposta.setImovelCollection(imovelList);
				itemCorrente = 0;
				this.imovelCoberturaList = this.proposta.getImovelCollection().get(itemCorrente).getImovelCoberturaCollection();
				this.itens = imovelList.size();
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public ImovelCobertura getImovelCobertura() {
		return imovelCobertura;
	}

	public void setImovelCobertura(ImovelCobertura imovelCobertura) {
		this.imovelCobertura = imovelCobertura;
	}

	public List<ImovelCobertura> getImovelCoberturaList() {
		return imovelCoberturaList;
	}

	public void setImovelCoberturaList(List<ImovelCobertura> imovelCoberturaList) {
		this.imovelCoberturaList = imovelCoberturaList;
	}

	public List<Imovel> getImovelList() {
		return imovelList;
	}

	public void setImovelList(List<Imovel> imovelList) {
		this.imovelList = imovelList;
	}

	public Integer getItemCorrente() {
		return itemCorrente;
	}

	public void setItemCorrente(Integer itemCorrente) {
		this.itemCorrente = itemCorrente;
	}

	public Imovel getImovel() {
		return imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

	public Boolean getImovelAlterado() {
		return imovelAlterado;
	}

	public void setImovelAlterado(Boolean imovelAlterado) {
		this.imovelAlterado = imovelAlterado;
	}

	public Integer getItens() {
		return itens;
	}

	public void setItens(Integer itens) {
		this.itens = itens;
	}

}