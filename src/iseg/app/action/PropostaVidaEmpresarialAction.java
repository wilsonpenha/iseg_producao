package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaVidaEmpresarialService;
import iseg.app.constants.Constants;
import iseg.app.model.Agenciamento;
import iseg.app.model.BeneficiarioEmpresarial;
import iseg.app.model.Coberturas;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ParcelasAgenciamento;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.SeguradoCoberturas;
import iseg.app.model.SeguradoEmpresarial;
import iseg.app.model.Seguradora;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaVidaEmpresarialAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	protected PropostaVidaEmpresarialService service;
	private SeguradoCoberturas seguradoCoberturas;
	private List<SeguradoCoberturas> seguradoCoberturasList;
	private List<SeguradoEmpresarial> seguradoEmpresarialList;
	private SeguradoEmpresarial seguradoEmpresarial;
	private List<BeneficiarioEmpresarial> beneficiarioList;
	private BeneficiarioEmpresarial beneficiarioEmpresarial;
	private Integer itemCorrente;
	private Integer itens;
	private Boolean seguradoAlterado = false;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	//@Autowired
	public PropostaVidaEmpresarialAction(PropostaVidaEmpresarialService service, PropostaComissaoService serviceAux) {
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
			itemCorrente = 0;
			
			this.referencia = Formatter.getMonthYear(this.proposta.getReferenciaParcela());

			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}
			
			if (this.proposta.getEstipulante()!=null && this.proposta.getEstipulante().getId()!=null)
				this.estipulante = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getEstipulante());
			
			this.seguradoCoberturasList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection();
			this.seguradoEmpresarialList = this.proposta.getSeguradoEmpresarialCollection();
			
			itens = new Integer(this.seguradoEmpresarialList.size());

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

	@SkipValidation
	public String alterarGrupoVendaAgenciamento(){
		try {
			// Checar existencia de repasse.
			
			// Carrega o grupo de venda selecionado na alteração.
			GrupoDeVenda grupoDeVendaAtual = (GrupoDeVenda)this.service.find(this.agenciamento.getGrupoDeVenda());
			// Carrega a parcela selecionada com o grupo de venda anterior
			Agenciamento parcelaSelecionada = (Agenciamento)this.service.find(this.agenciamento);
			// seleciona comissionados existentes da parcela selecionada
			List<ComissionadoAgenciamento> comissionados = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{this.agenciamento.getId()});
			
			// verifica existencia de repasse somente para os comissionados da parcela selecionada.
			boolean existeRepasse = false;
			for (ComissionadoAgenciamento comissionadoAgenciamento : comissionados) {
				List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoAgenciamento.getId()});
				if (repasses.size()>0){
					existeRepasse = true;
				}
			}
			
			if (existeRepasse){
				this.service.reprocessarGrupoDeVendaEComissionadosAgenciamento(grupoDeVendaAtual, parcelaSelecionada.getGrupoDeVenda(), parcelaSelecionada);				

			}else{// se nao existem repasse para esta proposta, excluir e incluir o novo grupo de venda.
				//this.service.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{this.proposta.getId()});
				this.service.executeNamedQuery("deleteComissionadoPropostaByParcelaPropostaId", new Object[]{this.parcelasProposta.getId()});

				parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
				this.service.save(parcelaSelecionada);

				this.gerarAgenciados(parcelaSelecionada);
				
			}
			
			this.repassePorParcela();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	protected void persistPObjects(){
		try {
			SeguradoEmpresarial seguradoEmpresarial = null;
			seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			//proposta.setSeguradoEmpresarialCollection(seguradoEmpresarialList);

			if (proposta.getSeguradoEmpresarialCollection() != null && !this.seguradoAlterado){
				for(int i=0 ; i<proposta.getSeguradoEmpresarialCollection().size() ; i++){
					proposta.getSeguradoEmpresarialCollection().remove(i--);
				}
			}

			if(proposta.getSeguradoEmpresarialCollection() != null && this.seguradoAlterado){

				for(int i=0 ; i<proposta.getSeguradoEmpresarialCollection().size() ; i++){
					seguradoEmpresarial = proposta.getSeguradoEmpresarialCollection().get(i);
					if(seguradoEmpresarial == null){
						proposta.getSeguradoEmpresarialCollection().remove(i--);
					}else if (seguradoEmpresarial.getId()==null && seguradoEmpresarial.getProposta()==null){
						if (seguradoEmpresarialList.get(i).getId()!=null){
							proposta.getSeguradoEmpresarialCollection().set(i, seguradoEmpresarialList.get(i));
						}
					}else{
						seguradoEmpresarial.setProposta(proposta);

						if (seguradoEmpresarialList.size()==0)
							seguradoEmpresarial.setLinhaVazia(true);

						if (seguradoAlterado && seguradoEmpresarial.getLinhaVazia() || seguradoEmpresarial.getCpf()!=null)
							proposta.getSeguradoEmpresarialCollection().get(i).setLinhaVazia(false);

						SeguradoCoberturas seguradoCoberturas = null;
						if(seguradoEmpresarial.getSeguradoCoberturasCollection() != null){
							for(int j=0 ; j<seguradoEmpresarial.getSeguradoCoberturasCollection().size() ; j++){
								seguradoCoberturas = seguradoEmpresarial.getSeguradoCoberturasCollection().get(j);
								if(seguradoCoberturas == null || (seguradoCoberturas.getCoberturas() == null && (seguradoCoberturas.getDescricao()==null || seguradoCoberturas.getDescricao().equals("")))){
									seguradoEmpresarial.getSeguradoCoberturasCollection().remove(j--);
								}else{
									seguradoEmpresarial.getSeguradoCoberturasCollection().get(j).setSeguradoEmpresarial(seguradoEmpresarial);
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

			if (pessoa.getGrupoDeVenda()!=null && pessoa.getGrupoDeVenda().getId()==null)
				pessoa.setGrupoDeVenda(null);

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
			
			if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO)){
				this.proposta.setInicio1aVigencia(this.proposta.getInicioVigencia());
				this.proposta.setTermino1aVigencia(this.proposta.getTerminoVigencia());
			}else{
				if (this.proposta.getInicio1aVigencia().getTime()>this.proposta.getInicioVigencia().getTime()){
					this.proposta.setInicio1aVigencia(this.proposta.getInicioVigencia());
					this.proposta.setTermino1aVigencia(this.proposta.getTerminoVigencia());
				}
			}
			
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

			if(beneficiarioEmpresarial != null && beneficiarioEmpresarial.getNome() != null && !beneficiarioEmpresarial.getNome().equals("")){
				if(this.proposta.getSeguradoEmpresarialCollection() != null && !this.proposta.getSeguradoEmpresarialCollection().isEmpty()){
					this.beneficiarioEmpresarial.setSeguradoEmpresarial(this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente));
					inserirBeneficiario();
				}
			}

			this.beneficiarioEmpresarial = new BeneficiarioEmpresarial();

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

			this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());

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

			if(!blnPreparandoEndosso){
				this.setPObjectInstance();

				this.seguradoCoberturasList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection();
			}

			this.seguradoEmpresarialList = this.proposta.getSeguradoEmpresarialCollection();
			
			itens = new Integer(this.seguradoEmpresarialList.size());

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

		this.seguradora = this.proposta.getSeguradora();

		this.getVistoriadoraBySeguradoraList();

		Double totalPremioSegurados = this.service.getSumResult("getTotalPremioSegurados", new Object[]{this.proposta.getId()});
		
		boolean salvarDeNovo = false;

		if (this.proposta.getPremioLiquido()==0){
			this.proposta.setPremioLiquido(totalPremioSegurados);
			salvarDeNovo = true;
		}
		
		if (this.proposta.getSeguradoEmpresarialCollection().size()==0){
			if (novoSegurado().equals(Action.ERROR))
				throw new Exception("Erro ao tentar criar Segurado vazio!");
			salvarDeNovo = true;
		}else{
			if (this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection().size()==0){
				for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
					Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
					if (cobertura.getRamo().getId().longValue()==this.getRamoVidaEmpresarial() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
						SeguradoCoberturas seguradoCoberturas = new SeguradoCoberturas();
						seguradoCoberturas.setSeguradoEmpresarial(this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente));
						seguradoCoberturas.setCoberturas(cobertura);
						seguradoCoberturas.setSequencia(cobertura.getSequencia());
						this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection().add(seguradoCoberturas);
						salvarDeNovo = true;
					}
				}
			}
		}

		if (salvarDeNovo){
			this.proposta = (Proposta)this.service.saveAndReturnPObject(this.proposta);
			//this.pobject = service.find(this.proposta);
			//this.proposta = (Proposta)this.pobject;
		}

		if (this.proposta.getSeguradoEmpresarialCollection().size()>0)
			this.beneficiarioList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getBeneficiarioEmpresarialCollection();

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica =  (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	/**
	 * Metodo para gerar parcelas de fatura para Vida em Grupo, as rotinas são bem similares aos outros ramos com fatura, 
	 * porem a peculiaridade do agenciamento cria algumas pequenas difereças, mais preferi criar um metodo separado.
	 * 
	 * Observar que algumas alterações neste metodo deve ser tbm implementada no mesmo metodo na classe PropostaAction
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
			
			List<Agenciamento> agenciamentos = this.service.genericFindByNamedQuery("getAgenciamentoByPropostaAndParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()});
	
			// Se informar inclusões, significa ter agenciamento para processa.
			if(this.proposta.getValorInclusoes().doubleValue() > 0.00 && this.proposta.getPossuiAgenciamento().booleanValue()){
				// se existir agenciamento gerado, apenas altera os valores, senão cria um novo.
				if (agenciamentos.size()==0){
					Agenciamento novoAgenciamento = new Agenciamento();
					novoAgenciamento.setDataLancamento(new Date());
					novoAgenciamento.setReferenciaParcela(this.proposta.getReferenciaParcela());
					novoAgenciamento.setPercentualAgenciamento(this.proposta.getPercentualAgenciamento());
					novoAgenciamento.setNroInclusoes(this.proposta.getNroInclusoes());
					novoAgenciamento.setQtdeParcelas(this.proposta.getQtdeParcelasAgenciamento());
					novoAgenciamento.setValorAgenciamento(this.proposta.getValorAgenciamento());
					novoAgenciamento.setValorInclusoes(this.proposta.getValorInclusoes());
					novoAgenciamento.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					novoAgenciamento.setProposta(this.proposta);
					

					long parcelaAgenciamento = Math.round((novoAgenciamento.getValorAgenciamento().doubleValue()*100)/novoAgenciamento.getQtdeParcelas().intValue());
					long valorTotal = Math.round(novoAgenciamento.getValorAgenciamento().doubleValue()*100);
					long totalDasParcelas = 0;
					long parcelaDif = 0;
					for(int k=0 ; k<novoAgenciamento.getQtdeParcelas().intValue() ; k++){
						totalDasParcelas += parcelaAgenciamento;
					}
					if (totalDasParcelas<valorTotal){
						parcelaDif = (valorTotal - totalDasParcelas) + parcelaAgenciamento;
					}if (totalDasParcelas>valorTotal){
						parcelaDif = parcelaAgenciamento - (totalDasParcelas - valorTotal);
					}
					
					Calendar cRefAgen = Calendar.getInstance();
					cRefAgen.setTime(this.proposta.getReferenciaParcela());

					for(int k = 0; k < novoAgenciamento.getQtdeParcelas().intValue(); k++){
						ParcelasAgenciamento parcelasAgenciamento = new ParcelasAgenciamento();
						parcelasAgenciamento.setAgenciamento(novoAgenciamento);
						parcelasAgenciamento.setNroParcela(k+1);
						parcelasAgenciamento.setReferenciaParcela(cRefAgen.getTime());
						if (k==0 && parcelaDif >0)
							parcelasAgenciamento.setValorParcela(new Double(parcelaDif/100.00));
						else
							parcelasAgenciamento.setValorParcela(new Double(parcelaAgenciamento/100.00));
						parcelasAgenciamento.setParcelaOriginaria(novoAgenciamento.getReferenciaParcela());
						parcelasAgenciamento.setVencimento(Formatter.addMonth(novoAgenciamento.getDataLancamento(), k+1));
						parcelasAgenciamento.setValorInclusoes(novoAgenciamento.getValorInclusoes());

						novoAgenciamento.getParcelasAgenciamentoCollection().add(parcelasAgenciamento);
						cRefAgen.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());
						//this.service.save(parcelasAgenciamento);
					}
					this.service.save(novoAgenciamento);
				}else{
					// já existe um agenciamento, então apenas atualize os valores.
					Agenciamento novoAgenciamento = agenciamentos.get(0);
					novoAgenciamento.setDataLancamento(new Date());
					novoAgenciamento.setReferenciaParcela(this.proposta.getReferenciaParcela());
					novoAgenciamento.setPercentualAgenciamento(this.proposta.getPercentualAgenciamento());
					novoAgenciamento.setNroInclusoes(this.proposta.getNroInclusoes());
					novoAgenciamento.setQtdeParcelas(this.proposta.getQtdeParcelasAgenciamento());
					novoAgenciamento.setValorAgenciamento(this.proposta.getValorAgenciamento());
					novoAgenciamento.setValorInclusoes(this.proposta.getValorInclusoes());
					novoAgenciamento.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					novoAgenciamento.setProposta(this.proposta);
					

					long parcelaAgenciamento = Math.round((novoAgenciamento.getValorAgenciamento().doubleValue()*100)/novoAgenciamento.getQtdeParcelas().intValue());
					long valorTotal = Math.round(novoAgenciamento.getValorAgenciamento().doubleValue()*100);
					long totalDasParcelas = 0;
					long parcelaDif = 0;
					for(int k=0 ; k<novoAgenciamento.getQtdeParcelas().intValue() ; k++){
						totalDasParcelas += parcelaAgenciamento;
					}
					if (totalDasParcelas<valorTotal){
						parcelaDif = (valorTotal - totalDasParcelas) + parcelaAgenciamento;
					}if (totalDasParcelas>valorTotal){
						parcelaDif = parcelaAgenciamento - (totalDasParcelas - valorTotal);
					}
					
					this.service.executeNamedQuery("deleteParcelasAgenciamentoByAgenciamento", new Object[]{novoAgenciamento.getId()});
					novoAgenciamento.getParcelasAgenciamentoCollection().clear();
					
					Calendar cRefAgen = Calendar.getInstance();
					cRefAgen.setTime(this.proposta.getReferenciaParcela());

					for(int k = 0; k < novoAgenciamento.getQtdeParcelas().intValue(); k++){
						ParcelasAgenciamento parcelasAgenciamento = new ParcelasAgenciamento();
						parcelasAgenciamento.setAgenciamento(novoAgenciamento);
						parcelasAgenciamento.setNroParcela(k+1);
						parcelasAgenciamento.setReferenciaParcela(cRefAgen.getTime());
						if (k==0 && parcelaDif >0)
							parcelasAgenciamento.setValorParcela(new Double(parcelaDif/100.00));
						else
							parcelasAgenciamento.setValorParcela(new Double(parcelaAgenciamento/100.00));
						parcelasAgenciamento.setParcelaOriginaria(novoAgenciamento.getReferenciaParcela());
						parcelasAgenciamento.setVencimento(Formatter.addMonth(novoAgenciamento.getDataLancamento(), k+1));
						parcelasAgenciamento.setValorInclusoes(novoAgenciamento.getValorInclusoes());

						novoAgenciamento.getParcelasAgenciamentoCollection().add(parcelasAgenciamento);
						cRefAgen.add(Calendar.MONTH, this.proposta.getQtdeParcelas().intValue());
						//this.service.save(parcelasAgenciamento);
					}
					this.service.save(novoAgenciamento);
				}
			}else{
				// verifica existencia de repasse somente para os comissionados da parcela selecionada.
				boolean existeRepasse = false;
				
				if (agenciamentos.size()>0){
					List<ComissionadoAgenciamento> comissionadosAtuais = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{agenciamentos.get(0).getId()});
					for (ComissionadoAgenciamento comissionadoAgenciamento : comissionadosAtuais) {
						List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionadoAgenciamento.getId()});
						if (repasses.size()>0){
							existeRepasse = true;
						}
					}
					// por executar o estorno casa haja baixa, mais isto provoca uma inconsistencia devido o fato de existir baixa e o agenciamento
					// estar zerado.
					if (!existeRepasse)
						this.service.remove(agenciamentos.get(0));
				}
			}

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
					Double totalAgenciamento = this.service.getSumResult("getSumOfParcelasAgenciamentoByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),parcelasProposta.getReferenciaParcela()});
					Double valorInclusoes = this.service.getSumResult("getSumOfValorInclusoesByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),parcelasProposta.getReferenciaParcela()});
					
					parcelasProposta.setValorAgenciamento(totalAgenciamento);
					parcelasProposta.setValorParcela(this.proposta.getPremioLiquido());
					if (this.proposta.getAgenciamentoComComissao())
						parcelasProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					else
						parcelasProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido()-valorInclusoes);
					parcelasProposta.setDesconto(this.proposta.getDesconto());
					parcelasProposta.setIof(this.proposta.getIof());
					parcelasProposta.setPremioTotal(this.proposta.getPremioTotal());
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
					parcelasProposta.setValorComissao(parcelasProposta.getBaseCalculoComissao()*(parcelasProposta.getPercentualComissao()/100));
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
						parcelaProposta.setValorAgenciamento(0D);
						parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
						parcelaProposta.setDesconto(this.proposta.getDesconto());
						parcelaProposta.setIof(this.proposta.getIof());
						parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
						parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
						parcelaProposta.setInicioVigencia(this.proposta.getInicioVigencia());
						parcelaProposta.setTerminoVigencia(this.proposta.getTerminoVigencia());
						parcelaProposta.setPercentualComissao(ultimoPercentualComissao);
						parcelaProposta.setValorComissao(parcelaProposta.getBaseCalculoComissao()*(parcelaProposta.getPercentualComissao()/100));

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
					Double totalAgenciamento = this.service.getSumResult("getSumOfParcelasAgenciamentoByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),cRef.getTime()});
					Double valorInclusoes = this.service.getSumResult("getSumOfValorInclusoesByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),cRef.getTime()});

					parcelaProposta = new ParcelasProposta();
					parcelaProposta.setProposta(this.proposta);
					parcelaProposta.setReferenciaParcela(cRef.getTime());
					parcelaProposta.setValorAgenciamento(totalAgenciamento);
					parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
					if (this.proposta.getAgenciamentoComComissao())
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					else
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido()-valorInclusoes);
					parcelaProposta.setDesconto(this.proposta.getDesconto());
					parcelaProposta.setIof(this.proposta.getIof());
					parcelaProposta.setPremioTotal(this.proposta.getPremioTotal());
					parcelaProposta.setVencimento(this.proposta.getDataVencim1aParcela());
					parcelaProposta.setInicioVigencia(this.proposta.getInicioVigencia());
					parcelaProposta.setTerminoVigencia(this.proposta.getTerminoVigencia());
					parcelaProposta.setNroDocumento(this.proposta.getNroFatura());
					parcelaProposta.setPercentualComissao(this.proposta.getFator());
					parcelaProposta.setGrupoDeVenda(this.proposta.getGrupoDeVenda());
					parcelaProposta.setValorComissao(parcelaProposta.getBaseCalculoComissao()*(parcelaProposta.getPercentualComissao()/100));
					
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
					Double totalAgenciamento = this.service.getSumResult("getSumOfParcelasAgenciamentoByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),cRef.getTime()});
					Double valorInclusoes = this.service.getSumResult("getSumOfValorInclusoesByPropostaAndParcelaDaProposta", new Object[]{this.proposta.getId(),cRef.getTime()});

					parcelaProposta = new ParcelasProposta();
					parcelaProposta.setProposta(this.proposta);

					parcelaProposta.setReferenciaParcela(cRef.getTime());
					parcelaProposta.setValorAgenciamento(totalAgenciamento);
					parcelaProposta.setValorParcela(this.proposta.getPremioLiquido());
					if (this.proposta.getAgenciamentoComComissao())
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido());
					else
						parcelaProposta.setBaseCalculoComissao(this.proposta.getPremioLiquido()-valorInclusoes);
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
					parcelaProposta.setValorComissao(parcelaProposta.getBaseCalculoComissao()*(parcelaProposta.getPercentualComissao()/100));
					
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
			
			List<Agenciamento> agenciamentos = this.service.genericFindByNamedQuery("getAgenciamentoByPropostaAndParcelaAtual", new Object[]{this.proposta.getId(),this.proposta.getReferenciaParcela()}); 
			for (Agenciamento parcela : agenciamentos) {
				gerarAgenciados(parcela);
			}

		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	public void gerarAgenciados(){
		try{
			
			List<Agenciamento> todosAgenciamentos = this.service.genericFindByNamedQuery("getAgenciamentoByProposta", new Object[]{this.proposta.getId()});

			List<Agenciamento> agenciamentoParcelaAtual = this.service.genericFindByNamedQuery("getAgenciamentoByPropostaAndParcelaAtual", new Object[]{this.proposta.getId(), this.proposta.getReferenciaParcela()});
			if (agenciamentoParcelaAtual.size()>0){
				List<ComissionadoAgenciamento> comissionadosExistentes = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{agenciamentoParcelaAtual.get(0).getId()});

				if (comissionadosExistentes.size()==0){
					if (todosAgenciamentos.size()==1){
						for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
							ComissionadoAgenciamento comissao = new ComissionadoAgenciamento();
							comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
							comissao.setComissao(grupoProdutor.getComissao());
							comissao.setTipoComissao(grupoProdutor.getTipoComissao());
							comissao.setValorComissao((proposta.getValorAgenciamento()*comissao.getComissao())/100);
							comissao.setSituacao(0);
							comissao.setProposta(proposta);
							comissao.setAgenciamento(agenciamentoParcelaAtual.get(0));
							this.service.save(comissao);
						}
					}else{
						List<ComissionadoAgenciamento> comissionadosAnteriores = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", 
								new Object[]{agenciamentoParcelaAtual.get(todosAgenciamentos.size()-2).getId()});
						for (ComissionadoAgenciamento comissionadoAnterior : comissionadosAnteriores) {
							ComissionadoAgenciamento comissao = new ComissionadoAgenciamento();
							comissao.setPessoa(comissionadoAnterior.getPessoa());
							comissao.setComissao(comissionadoAnterior.getComissao());
							comissao.setTipoComissao(comissionadoAnterior.getTipoComissao());
							comissao.setValorComissao((proposta.getValorAgenciamento()*comissao.getComissao())/100);
							comissao.setSituacao(0);
							comissao.setProposta(proposta);
							comissao.setAgenciamento(agenciamentoParcelaAtual.get(0));
							this.service.save(comissao);
						}
					}
				}
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
			}else{
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
			}
		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	public void gerarAgenciados(Agenciamento parcelaSelecionada){
		try{
			List<ComissionadoAgenciamento> comissionadosExistentes = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaSelecionada.getId()});
				
			if (comissionadosExistentes.size()==0){
				for(GrupoProdutor grupoProdutor : parcelaSelecionada.getGrupoDeVenda().getGrupoProdutorCollection()){
					double valorComissao = 0;
					if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
						valorComissao = (parcelaSelecionada.getValorAgenciamento()*grupoProdutor.getComissao())/100;
					else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
						valorComissao = parcelaSelecionada.getValorInclusoes().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
					else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
						valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
					ComissionadoAgenciamento comissao = new ComissionadoAgenciamento();
					comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
					comissao.setComissao(grupoProdutor.getComissao());
					comissao.setTipoComissao(grupoProdutor.getTipoComissao());
					comissao.setValorComissao(valorComissao);
					comissao.setSituacao(0);
					comissao.setProposta(proposta);
					comissao.setAgenciamento(parcelaSelecionada);
					this.service.save(comissao);
				}
			}else{
				for (ComissionadoAgenciamento comissionadoProposta : comissionadosExistentes) {
					if (parcelaSelecionada.getValorAgenciamento().doubleValue()>0.00){
						double valorComissao = 0;
						if (comissionadoProposta.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
							valorComissao = parcelaSelecionada.getValorAgenciamento().doubleValue() * (comissionadoProposta.getComissao().doubleValue()/100);
						else if (comissionadoProposta.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
							valorComissao = parcelaSelecionada.getValorInclusoes().doubleValue() * (comissionadoProposta.getComissao().doubleValue()/100);
						else if (comissionadoProposta.getTipoComissao().intValue() == 2) // valor de comissao fixa
							valorComissao = comissionadoProposta.getValorComissao().doubleValue();
						comissionadoProposta.setValorComissao(valorComissao);
						this.service.save(comissionadoProposta);
					}else{
						this.service.remove(comissionadoProposta);
					}
				}
			}
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

	public void gerarComissoes(){
		try {
			this.serviceAux.gerarComissoesEmpresarial(this.proposta);
		} catch (Exception ge) {
			ge.printStackTrace();
		}
	}

	@SkipValidation
	public String getDadosSegurado(){
		try {

			if (this.proposta.getCliente() != null && this.proposta.getCliente().getId() != null){
				this.pessoaFisica = new PessoaFisica();
				this.pessoaFisica.setId(this.proposta.getCliente().getId());
				this.pessoaFisica = (PessoaFisica)this.service.find(this.pessoaFisica);
			}else if ((this.proposta.getCliente() == null || this.proposta.getCliente().getId() == null)){
				PessoaFisica setPessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByCpf", new Object[]{this.pessoaFisica.getCpfOuCnpj()});
				if (setPessoaFisica != null){
					this.pessoaFisica = setPessoaFisica;
				}

			}

			this.proposta = (Proposta)this.service.find(this.proposta);
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setCpf(this.pessoaFisica.getCpfOuCnpj());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setNome(this.pessoaFisica.getNome());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setDataNascimento(this.pessoaFisica.getDataNascimento());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setSexo(this.pessoaFisica.getSexo());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setEstadoCivil(this.pessoaFisica.getEstadoCivil());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setRg(this.pessoaFisica.getRg());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setOrgaoEmissor(this.pessoaFisica.getOrgaoEmissor());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setTelefoneRecados(this.pessoaFisica.getTelefonePreferencial());
			this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setTelefoneCelular(this.pessoaFisica.getTelefoneCelular());
			if (!this.pessoaFisica.getEnderecoCollection().isEmpty()){
				int endIndex = -1;
				if (this.pessoaFisica.getEnderecoCollection().get(0).getTipoEndereco().equals("R"))
					endIndex = 0;
				else if (this.pessoaFisica.getEnderecoCollection().size()==2 &&
						 this.pessoaFisica.getEnderecoCollection().get(1).getTipoEndereco().equals("R"))
					endIndex = 1;
				if (endIndex>=0){
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setCep(this.pessoaFisica.getEnderecoCollection().get(endIndex).getCep());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setLogradouro(this.pessoaFisica.getEnderecoCollection().get(endIndex).getLogradouro());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setComplemento(this.pessoaFisica.getEnderecoCollection().get(endIndex).getComplemento());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setNumero(this.pessoaFisica.getEnderecoCollection().get(endIndex).getNumero());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setBairro(this.pessoaFisica.getEnderecoCollection().get(endIndex).getBairro());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setCidade(this.pessoaFisica.getEnderecoCollection().get(endIndex).getCidade());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setUf(this.pessoaFisica.getEnderecoCollection().get(endIndex).getUf());
					this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).setFax(this.pessoaFisica.getEnderecoCollection().get(endIndex).getFax());
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
	public String inserirBeneficiario(){
		try{
			this.service.saveNoRefresh(beneficiarioEmpresarial);
			beneficiarioList = (List<BeneficiarioEmpresarial>)this.service.genericFindBySQLQuery("Select c From BeneficiarioEmpresarial c where c.seguradoEmpresarial.id = ?0 ", new Object[]{beneficiarioEmpresarial.getSeguradoEmpresarial().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarBeneficiario(){
		try {

			this.beneficiarioEmpresarial = (BeneficiarioEmpresarial)this.service.find(this.beneficiarioEmpresarial);
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

			SeguradoEmpresarial seguradoEmpresarial = beneficiarioEmpresarial.getSeguradoEmpresarial();
			this.service.remove(beneficiarioEmpresarial);
			beneficiarioList = (List<BeneficiarioEmpresarial>)this.service.genericFindBySQLQuery("Select c From BeneficiarioEmpresarial c where c.seguradoEmpresarial.id = ?0 ", new Object[]{seguradoEmpresarial.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirSeguradoCoberturas(){
		try{

			this.service.saveNoRefresh(seguradoCoberturas);
			seguradoCoberturasList = (List<SeguradoCoberturas>)this.service.genericFindBySQLQuery("Select rc From SeguradoCoberturas rc where rc.seguradoEmpresarial.id = ?0 ", new Object[]{seguradoCoberturas.getSeguradoEmpresarial().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarSeguradoCoberturas(){
		try {

			this.seguradoCoberturas = (SeguradoCoberturas)this.service.find(this.seguradoCoberturas);
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
			seguradoCoberturas.setSeguradoEmpresarial(this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente));
			this.service.save(seguradoCoberturas);

			seguradoCoberturasList = (List<SeguradoCoberturas>)this.service.genericFindBySQLQuery("Select icob From SeguradoCoberturas icob where icob.seguradoEmpresarial.id = ?0 order by icob.sequencia", new Object[]{this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String novoSegurado(){
		try{
			//if (this.proposta.getSeguradora()==null){
				this.pobject = service.find(pobject);
				this.proposta = (Proposta)this.pobject;
			//}
			SeguradoEmpresarial seguradoEmpresarial = null;
			for (int i=0;i<this.proposta.getSeguradoEmpresarialCollection().size();i++){
				seguradoEmpresarial = this.proposta.getSeguradoEmpresarialCollection().get(i);
				if (seguradoEmpresarial.getLinhaVazia()){
					this.itemCorrente = i;
					this.seguradoCoberturasList = seguradoEmpresarial.getSeguradoCoberturasCollection();
					this.beneficiarioList = seguradoEmpresarial.getBeneficiarioEmpresarialCollection();
					seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
					return Action.SUCCESS;
				}
			}
			seguradoEmpresarial = new SeguradoEmpresarial();
			seguradoEmpresarial.setLinhaVazia(true);
			seguradoEmpresarial.setProposta(this.proposta);
			Seguradora seguradora = this.proposta.getSeguradora();
			seguradora = (Seguradora)this.service.find(Seguradora.class, seguradora.getId());
			for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = seguradora.getCoberturasCollection().get(i);
				if (cobertura.getRamo().getId().longValue()==this.getRamoVidaEmpresarial() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					SeguradoCoberturas seguradoCoberturas = new SeguradoCoberturas();
					seguradoCoberturas.setSeguradoEmpresarial(seguradoEmpresarial);
					seguradoCoberturas.setCoberturas(seguradora.getCoberturasCollection().get(i));
					seguradoCoberturas.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
					seguradoEmpresarial.getSeguradoCoberturasCollection().add(seguradoCoberturas);
				}
			}
			this.itemCorrente = new Integer(this.service.getRowCount("getCountSeguradosEmp", new Object[]{this.proposta.getId()}));
			this.proposta.getSeguradoEmpresarialCollection().add(seguradoEmpresarial);
			this.fixTransientError();
			this.service.save(proposta);
			this.seguradoCoberturasList = seguradoEmpresarial.getSeguradoCoberturasCollection();
			this.beneficiarioList = seguradoEmpresarial.getBeneficiarioEmpresarialCollection();
			seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			itens = new Integer(this.seguradoEmpresarialList.size());
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarSegurado(){
		try {

			if (seguradoAlterado){
				this.salvarEditar();
			}else{
				this.pobject = service.find(pobject);
				this.proposta = (Proposta)this.pobject;
			}
			this.seguradoCoberturasList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection();
			this.beneficiarioList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getBeneficiarioEmpresarialCollection();
			seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String removerSegurado(){
		try {

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			SeguradoEmpresarial seguradoEmpresarial = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente);
			seguradoEmpresarial = (SeguradoEmpresarial)this.service.find(seguradoEmpresarial);
			this.service.remove(seguradoEmpresarial);
			seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			if (seguradoEmpresarialList.size()==0){
				SeguradoEmpresarial newSeguradoEmpresarial = new SeguradoEmpresarial();
				newSeguradoEmpresarial.setProposta(this.proposta);
				newSeguradoEmpresarial.setLinhaVazia(true);
				Seguradora seguradora = this.proposta.getSeguradora();
				seguradora = (Seguradora)this.service.find(Seguradora.class, seguradora.getId());
				for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
					if (seguradora.getCoberturasCollection().get(i).getRamo().getId().longValue()==this.getRamoVidaEmpresarial()){
						SeguradoCoberturas seguradoCoberturas = new SeguradoCoberturas();
						seguradoCoberturas.setSeguradoEmpresarial(newSeguradoEmpresarial);
						seguradoCoberturas.setCoberturas(seguradora.getCoberturasCollection().get(i));
						seguradoCoberturas.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
						newSeguradoEmpresarial.getSeguradoCoberturasCollection().add(seguradoCoberturas);
					}
				}
				this.itemCorrente = 0;
				this.service.save(newSeguradoEmpresarial);
				this.seguradoCoberturasList = newSeguradoEmpresarial.getSeguradoCoberturasCollection();
				this.beneficiarioList = newSeguradoEmpresarial.getBeneficiarioEmpresarialCollection();
				seguradoEmpresarialList = (List<SeguradoEmpresarial>)this.service.genericFindBySQLQuery("Select i From SeguradoEmpresarial i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
				this.proposta.setSeguradoEmpresarialCollection(seguradoEmpresarialList);
			}else{
				this.proposta.setSeguradoEmpresarialCollection(seguradoEmpresarialList);
				itemCorrente = 0;
				this.seguradoCoberturasList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getSeguradoCoberturasCollection();
				this.beneficiarioList = this.proposta.getSeguradoEmpresarialCollection().get(itemCorrente).getBeneficiarioEmpresarialCollection();
				this.itens = seguradoEmpresarialList.size();
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public SeguradoCoberturas getSeguradoCoberturas() {
		return seguradoCoberturas;
	}

	public void setSeguradoCoberturas(SeguradoCoberturas seguradoCoberturas) {
		this.seguradoCoberturas = seguradoCoberturas;
	}

	public List<SeguradoCoberturas> getSeguradoCoberturasList() {
		return seguradoCoberturasList;
	}

	public void setSeguradoCoberturasList(List<SeguradoCoberturas> seguradoCoberturasList) {
		this.seguradoCoberturasList = seguradoCoberturasList;
	}

	public List<SeguradoEmpresarial> getSeguradoEmpresarialList() {
		return seguradoEmpresarialList;
	}

	public void setSeguradoEmpresarialList(List<SeguradoEmpresarial> seguradoEmpresarialList) {
		this.seguradoEmpresarialList = seguradoEmpresarialList;
	}

	public Integer getItemCorrente() {
		return itemCorrente;
	}

	public void setItemCorrente(Integer itemCorrente) {
		this.itemCorrente = itemCorrente;
	}

	public SeguradoEmpresarial getSeguradoEmpresarial() {
		return seguradoEmpresarial;
	}

	public void setSeguradoEmpresarial(SeguradoEmpresarial seguradoEmpresarial) {
		this.seguradoEmpresarial = seguradoEmpresarial;
	}

	public Boolean getSeguradoAlterado() {
		return seguradoAlterado;
	}

	public void setSeguradoAlterado(Boolean seguradoAlterado) {
		this.seguradoAlterado = seguradoAlterado;
	}

	public Integer getItens() {
		return itens;
	}

	public void setItens(Integer itens) {
		this.itens = itens;
	}

	public List<BeneficiarioEmpresarial> getBeneficiarioList() {
		return beneficiarioList;
	}

	public void setBeneficiarioList(List<BeneficiarioEmpresarial> beneficiarioList) {
		this.beneficiarioList = beneficiarioList;
	}

	public BeneficiarioEmpresarial getBeneficiarioEmpresarial() {
		return beneficiarioEmpresarial;
	}

	public void setBeneficiarioEmpresarial(
			BeneficiarioEmpresarial beneficiarioEmpresarial) {
		this.beneficiarioEmpresarial = beneficiarioEmpresarial;
	}

}