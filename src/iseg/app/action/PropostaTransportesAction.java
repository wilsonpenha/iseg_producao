package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaTransportesService;
import iseg.app.constants.Constants;
import iseg.app.model.Coberturas;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RiscoTransportes;
import iseg.app.model.Seguradora;
import iseg.app.model.TransporteCoberturas;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaTransportesAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	protected PropostaTransportesService service;

	private TransporteCoberturas transporteCobertura;
	private List<TransporteCoberturas>transporteCoberturaList;

	private PessoaJuridica estipulante;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	//@Autowired
	public PropostaTransportesAction(PropostaTransportesService service, PropostaComissaoService serviceAux) {
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
			this.referencia = Formatter.getMonthYear(new Date());
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
			this.proposta.setCalcularIof(true);
			this.proposta.setIsFatura(true);
			this.getVistoriadoraBySeguradoraList();
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
				if(id==null) //Posteriormente fazer a controle através de Exception
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

			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}
			
			if (this.proposta.getEstipulante()!=null && this.proposta.getEstipulante().getId()!=null)
				this.estipulante = (PessoaJuridica)this.proposta.getEstipulante();
			
			this.transporteCoberturaList = this.proposta.getRiscoTransportesCollection().get(0).getTransporteCoberturasCollection();

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

	@SkipValidation
	public String alterarGrupoVenda(){
		try {

			GrupoDeVenda grupoDeVenda = (GrupoDeVenda)this.service.find(this.parcelasProposta.getGrupoDeVenda());

			this.proposta = (Proposta)this.service.find(this.getProposta());
			this.proposta.setGrupoDeVenda(grupoDeVenda);
			this.proposta.setProdutor(grupoDeVenda.getProdutorGerente());

			this.service.save(proposta);

			for (int i = 0; i < this.proposta.getParcelasPropostaCollection().size(); i++) {
				if (this.proposta.getParcelasPropostaCollection().get(i).getGrupoDeVenda()==null || 
					this.proposta.getParcelasPropostaCollection().get(i).getGrupoDeVenda().getId()==null){
					
					this.proposta.getParcelasPropostaCollection().get(i).setGrupoDeVenda(grupoDeVenda);
					this.gerarComissionados(this.proposta.getParcelasPropostaCollection().get(i));
				}else{
					this.gerarComissionados(this.proposta.getParcelasPropostaCollection().get(i));
				}
			}
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	protected void persistPObjects(){
		try {
			RiscoTransportes risco = null;
			if(proposta.getRiscoTransportesCollection() != null){
				for(int i=0 ; i<proposta.getRiscoTransportesCollection().size() ; i++){
					risco = proposta.getRiscoTransportesCollection().get(i);
					if(risco == null){
						proposta.getRiscoTransportesCollection().remove(i--);
					}else{
						risco.setProposta(proposta);
						if (risco.getSeguradora()!=null && risco.getSeguradora().getId()==null){
							risco.setSeguradora(null);
						}
	
						TransporteCoberturas transporteCobertura = null;
						if(risco.getTransporteCoberturasCollection() != null){
							for(int j=0 ; j<risco.getTransporteCoberturasCollection().size() ; j++){
								transporteCobertura = risco.getTransporteCoberturasCollection().get(j);
								if(transporteCobertura == null || (transporteCobertura.getCoberturas() == null && (transporteCobertura.getDescricao()==null || transporteCobertura.getDescricao().equals("")))){
									risco.getTransporteCoberturasCollection().remove(j--);
								}else{
									risco.getTransporteCoberturasCollection().get(j).setRiscoTransportes(risco);
								}
							}
						}
					}
				}
			}
			
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

			if(this.tipoCliente.equals(Constants.CLIENTE_PJ)){
				if (proposta.getEstipulante() == null || proposta.getEstipulante().getId() == null){
					if (this.estipulante != null && this.estipulante.getId() != null){
						this.proposta.setEstipulante(this.estipulante);
					}else if ((this.estipulante.getNome()!=null && !this.estipulante.getNome().equals("")) &&
							(this.estipulante.getCpfOuCnpj()!=null && !this.estipulante.getCpfOuCnpj().getValor().equals(""))){
						if (this.estipulante.getCpfOuCnpj().equals(this.pessoa.getCpfOuCnpj())){
							this.estipulante = (PessoaJuridica) this.pessoa;
						}else{
							this.estipulante.setCorretora(this.corretoraEmUso);
							if (this.estipulante.getGrupoDeVenda()!=null && this.estipulante.getGrupoDeVenda().getId()==null)
								this.estipulante.setGrupoDeVenda(null);
							if (this.estipulante.getAtividadeComercial()!=null && this.estipulante.getAtividadeComercial().getId()==null)
								this.estipulante.setAtividadeComercial(null);
							this.service.save(estipulante);
						}
						this.proposta.setEstipulante(this.estipulante);
					}else if ((this.estipulante.getNome()==null || this.estipulante.getNome().equals("")) &&
							(this.estipulante.getCpfOuCnpj()!=null && !this.estipulante.getCpfOuCnpj().getValor().equals(""))){
						throw new Exception("Necessario informar o Nome do Estipulante quando informar o CNPJ do estipulante!");
					}else if ((this.estipulante.getNome()!=null && !this.estipulante.getNome().equals("")) &&
							(this.estipulante.getCpfOuCnpj()==null || this.estipulante.getCpfOuCnpj().getValor().equals(""))){
						throw new Exception("Necessario informar o CNPJ do Estipulante quando informar o Nome do estipulante!");
					}else
						this.proposta.setEstipulante(null);
				}else{
					this.estipulante.setId(proposta.getEstipulante().getId());
					this.estipulante = (PessoaJuridica)service.find(estipulante);
				}
			}else{
				this.proposta.setEstipulante(null);
			}

			proposta.setCliente(pessoa);
			
			this.setProdutor();

			if(proposta.getNumero() == null){
				proposta.setNumero(this.getSequenciaNumeroProposta());
			}
			
			this.fixTransientError();
			
/*			if(proposta.getSituacaoOperacional().equals(Constants.SITUACAO_CANCELADA)){
				this.cancelarComissoes();
			}
			
			if(this.operacao!=null && this.operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO_CANCELAMENTO)){
				this.recuperarComissoes();
			}
*/
			verificaValorComissao();

			if(this.proposta.getTipoProposta() == null || this.proposta.getTipoProposta().equals(new Long(0))){
				this.defineTipoProposta();
			}

			if (this.proposta.getId()==null){
				currentTabSaved = currentTab;
				currentTab = -1;
			}
			
			if (this.referencia!=null && !this.referencia.isEmpty())
				this.proposta.setReferenciaParcela(new Date(Formatter.getDateLong("01/"+this.referencia)));
			else
				throw new Exception("É Obrigatório informar uma referência válida!");

			this.salvarChecarParcelas();

			//this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());

			if (blnGerarParcelas != null && blnGerarParcelas){
				blnGerarParcelas = false;
				gerarParcelas();
			}

			gerarComissionados();

			if ((proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_VALIDO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_ENDOSSO_VALIDO)) && 
				proposta.getSituacaoOperacional()==Constants.SITUACAO_ATIVA){

				this.gerarComissoes();
				
			}

/*			if (proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO)){

				this.gerarComissoes();
			}
*/
			//if(!blnPreparandoEndosso){
				this.setPObjectInstance();

			//}

			this.transporteCoberturaList = this.proposta.getRiscoTransportesCollection().get(0).getTransporteCoberturasCollection();

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
	
	private void fixTransientError(){
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
			if (pessoa.getGrupoDeVenda()!=null && pessoa.getGrupoDeVenda().getId()==null)
				proposta.setGrupoDeVenda(null);
			else
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
		if (this.proposta.getPropostaInicial()!=null && this.proposta.getPropostaInicial().getId()==null)
			this.proposta.setPropostaInicial(null);
	}

	@SuppressWarnings("unchecked")
	protected void setPObjectInstance() throws Exception {
		//this.proposta = (Proposta)this.pobject;
		if (this.proposta.getDataVencim1aParcela()==null)
			this.proposta.setDataVencim1aParcela(new Date());

		this.seguradora = (Seguradora)this.service.find(HibernateUtil.initializeAndUnproxy(this.proposta.getSeguradora()));

		this.getVistoriadoraBySeguradoraList();

		Double totalPremioSegurados = this.service.getSumResult("getTotalPremioSegurados", new Object[]{this.proposta.getId()});
		
		boolean salvarDeNovo = false;

		if (this.proposta.getRiscoTransportesCollection().get(0).getTransporteCoberturasCollection().size()==0){
			for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
				if (cobertura.getRamo().getId().longValue()==this.proposta.getRamo().getId() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					TransporteCoberturas transporteCoberturas = new TransporteCoberturas();
					transporteCoberturas.setRiscoTransportes(this.proposta.getRiscoTransportesCollection().get(0));
					transporteCoberturas.setCoberturas(cobertura);
					transporteCoberturas.setSequencia(cobertura.getSequencia());
					this.proposta.getRiscoTransportesCollection().get(0).getTransporteCoberturasCollection().add(transporteCoberturas);
					salvarDeNovo = true;
				}
			}
		}

		if (this.proposta.getPremioLiquido()==0){
			this.proposta.setPremioLiquido(totalPremioSegurados);
			salvarDeNovo = true;
		}
		
		if (salvarDeNovo){
			this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
			//this.pobject = service.find(this.proposta);
			//this.proposta = (Proposta)this.pobject;
		}

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	@SkipValidation
	public String getDadosEstipulante(){
		try {

			if ((this.proposta.getEstipulante() == null || this.proposta.getEstipulante().getId() == null)){
				PessoaJuridica estupulante = (PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaByCnpj", new Object[]{this.estipulante.getCpfOuCnpj()});
				if (estupulante != null){
					this.estipulante = estupulante;
					this.proposta.setEstipulante(this.estipulante);
				}
			}else if (this.proposta.getEstipulante() != null && this.proposta.getEstipulante().getId() != null){
				this.estipulante = new PessoaJuridica();
				this.estipulante.setId(this.proposta.getEstipulante().getId());
				this.estipulante = (PessoaJuridica)this.service.find(this.estipulante);
				this.proposta.setCliente(this.estipulante);
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String novoDadosEstipulanteForm(){
		this.estipulante = new PessoaJuridica();
		this.proposta.setEstipulante(new PessoaJuridica());
		return Action.SUCCESS;
	}

	@Override
	public void gerarComissionados(){
		try{

			this.parcelas = this.service.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});
			
			for (ParcelasProposta parcela : this.parcelas) {
				gerarComissionados(parcela);
			}
			
		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@Override
	public String gerarParcelas() throws Exception {

		try{
			this.pobject = this.proposta;
			
			this.gerarParcelas(this.proposta);
			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirCobertura(){
		try{

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			transporteCobertura.setRiscoTransportes(this.proposta.getRiscoTransportesCollection().get(0));
			this.service.save(transporteCobertura);

			transporteCoberturaList = (List<TransporteCoberturas>)this.service.genericFindBySQLQuery("Select rc From TransporteCoberturas rc where rc.riscoTransportes.id = ?0 order by rc.sequencia", new Object[]{transporteCobertura.getRiscoTransportes().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirTransporteCobertura(){
		try {

			this.service.remove(transporteCobertura);
			transporteCoberturaList = (List<TransporteCoberturas>)this.service.genericFindBySQLQuery("Select c From TransporteCoberturas c where c.riscoTransportes.id = ?0 ", new Object[]{transporteCobertura.getRiscoTransportes().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public TransporteCoberturas getTransporteCobertura() {
		return transporteCobertura;
	}

	public void setTransporteCobertura(TransporteCoberturas transporteCobertura) {
		this.transporteCobertura = transporteCobertura;
	}

	public List<TransporteCoberturas> getTransporteCoberturaList() {
		return transporteCoberturaList;
	}

	public void setTransporteCoberturaList(List<TransporteCoberturas> transporteCoberturaList) {
		this.transporteCoberturaList = transporteCoberturaList;
	}

	public void gerarComissoes(){
		try {
			this.serviceAux.gerarComissoesEmpresarial(this.proposta);
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	public PessoaJuridica getEstipulante() {
		return estipulante;
	}

	public void setEstipulante(PessoaJuridica estipulante) {
		this.estipulante = estipulante;
	}
}