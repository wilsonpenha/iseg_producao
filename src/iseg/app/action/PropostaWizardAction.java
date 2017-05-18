package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.business.PropostaWizardService;
import iseg.app.constants.Constants;
import iseg.app.model.Acessorios;
import iseg.app.model.Automovel;
import iseg.app.model.AutomovelCobertura;
import iseg.app.model.AutomovelPropAcessorios;
import iseg.app.model.AutomovelServicos;
import iseg.app.model.BancoRelacionamento;
import iseg.app.model.CargaIseg;
import iseg.app.model.CarroceriaIseg;
import iseg.app.model.Coberturas;
import iseg.app.model.CoberturasIseg;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.Condutor;
import iseg.app.model.DominioEsp;
import iseg.app.model.Fabricante;
import iseg.app.model.Perfil;
import iseg.app.model.PerguntasPerfil;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaAutomovel;
import iseg.app.model.PropostaBancos;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.model.RespostaPerfil;
import iseg.app.model.Seguradora;
import iseg.app.model.SemireboqueIseg;
import iseg.app.model.Servicos;
import iseg.app.model.ServicosIseg;
import iseg.app.model.VeiculoModelo;
import iseg.app.persistence.LogType;
import iseg.app.persistence.PObject;
import iseg.utils.HibernateUtil;

import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaWizardAction extends PropostaAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;

	private Fabricante marca;
	private AutomovelCobertura automovelCobertura;
	private AutomovelServicos automovelServico;
	private VeiculoModelo veiculoModelo;
	private List<Condutor> condutores;
	private List<VeiculoModelo> modelos;
	private List<AutomovelCobertura>automovelCoberturaList;
	private List<AutomovelServicos>automovelServicoList;
	private List<RespostaPerfil> respostaPerfilLista;
	private List<Perfil> perfilList;
	private Condutor condutor;
	private Boolean blnPossuiPerfil;
	private PropostaWizardService service;
	private Long[] acessoriosId; 
	private Long[] bancosRelacionamentoIds = new Long[]{};
	private Automovel automovel;

	private Integer itemCorrente;
	private Integer itens;
//	private Boolean automovelAlterado = false;
	private Boolean perfilAlterado = false;
	private InputStream inputStream;
	
	//@Autowired
	public PropostaWizardAction(PropostaWizardService service, PropostaComissaoService serviceAux) {
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
			this.proposta.setInicioVigencia(null);
			this.proposta.setVersao(Constants.VERSAO_PERFIL_GENERICO);
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 1);
			this.proposta.setTerminoVigencia(null);
			this.seguradora = (Seguradora)this.service.find(this.seguradora);
			this.proposta.setSeguradora(this.seguradora);
			this.proposta.setPerfil(this.seguradora.getPerfilCollection().size()>0 ? this.seguradora.getPerfilCollection().get(0) : null);
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
			this.proposta.setBlnPossuiPerfil(this.blnPossuiPerfil);
			this.proposta.setCalcularIof(true);
			
			this.marca = (Fabricante)this.getFabricanteList().get(0);
			
			this.itemCorrente = 0;
			this.getVistoriadoraBySeguradoraList();
			this.getPerfilListBySeguradora();
			this.getModeloVeiculoList();
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
			if(proposta.getVersao() == null){
				proposta.setVersao(Constants.VERSAO_PERFIL_GENERICO);
			}
			this.pobject = this.proposta;
			itemCorrente = 0;
			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = Constants.CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = Constants.CLIENTE_PJ;
			}
			this.carregaComissionadoPropostaList();
			if(!this.proposta.getPropostaAutomovelCollection().isEmpty()){
				this.automovelCoberturaList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection();
				this.automovelServicoList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection();
				for (PropostaAutomovel propostaAutomovel : this.proposta.getPropostaAutomovelCollection()) {
					this.automovelList.add(propostaAutomovel.getAutomovel());
				}
				itens = new Integer(this.proposta.getPropostaAutomovelCollection().size());

			}
			
			Proposta propostaOriginal = this.proposta.getPropostaInicial();
			
			Long idPropostaOriginal = null;
			
			if (propostaOriginal==null){
				this.historicoList = this.proposta.getEndossoCollection();
				if (this.proposta.getPropostaRenovada()!=null && this.proposta.getPropostaRenovada().getId()!=null)
					this.historicoList.add(0, this.proposta.getPropostaRenovada());
				if (this.proposta.getRenovacaoCollection()!=null && this.proposta.getRenovacaoCollection().size()>0){
					this.historicoList.add(0,this.proposta.getRenovacaoCollection().get(0));
				}
				idPropostaOriginal = this.proposta.getId();
			}else{
				List<Proposta> lista = propostaOriginal.getEndossoCollection();
				lista.add(0,propostaOriginal);
				lista.remove(this.proposta);
				this.historicoList = lista;
				if (this.proposta.getRenovacaoCollection()!=null && this.proposta.getRenovacaoCollection().size()>0){
					this.historicoList.add(0,this.proposta.getRenovacaoCollection().get(0));
				}
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
			
			if(proposta.getId() == null || (proposta.getOrcamentoSeguro() != null && proposta.getOrcamentoSeguro().getId() != null)){
				proposta.setVersao(Constants.VERSAO_PERFIL_GENERICO);
			}

			Automovel automovel = null;
			automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});

			if (this.proposta.getPropostaAutomovelCollection() != null && !this.automovelAlterado){
				for(int i=0 ; i<this.proposta.getPropostaAutomovelCollection().size() ; i++){
					this.proposta.getPropostaAutomovelCollection().remove(i--);
				}
			}

			if(this.proposta.getPropostaAutomovelCollection() != null && this.automovelAlterado){
				for(int i=0 ; i<this.proposta.getPropostaAutomovelCollection().size() ; i++){
					if(this.proposta.getPropostaAutomovelCollection().get(i) == null){
						continue;
					}
					automovel = this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel();
					if(automovel == null){
						this.proposta.getPropostaAutomovelCollection().remove(i--);
					/*}else if (automovel.getId()==null && automovel.getProposta()==null){
						if (automovelList.get(i).getId()!=null){
							this.proposta.getPropostaAutomovelCollection().set(i, automovelList.get(i));
						}*/
					}else{
//						automovel.setProposta(this.proposta);

						/*if (automovelList.size()==0)
							automovel.setLinhaVazia(true);*/

						if (automovelAlterado && automovel.getLinhaVazia() || (automovel.getModeloVeiculo()!=null && automovel.getModeloVeiculo().getId()!=null))
							this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel().setLinhaVazia(false);

						if (automovel.getSeguradora()!=null && automovel.getSeguradora().getId()==null)
							automovel.setSeguradora(null);
						if (automovel.getTipoFranquia()!=null && automovel.getTipoFranquia().getId()==null)
							automovel.setTipoFranquia(null);
						if(automovel.getCategoriaVeiculo() != null && automovel.getCategoriaVeiculo().getId() == null)
							automovel.setCategoriaVeiculo(null);
						if(automovel.getModeloVeiculo() != null && automovel.getModeloVeiculo().getId() == null)
							automovel.setModeloVeiculo(null);
						if(automovel.getTipoCombustivel() != null && automovel.getTipoCombustivel().getId() == null)
							automovel.setTipoCombustivel(null);
						if(automovel.getRastreadorIseg() != null && automovel.getRastreadorIseg().getId() == null)
							automovel.setRastreadorIseg(null);
						if(automovel.getBloqueadorIseg() != null && automovel.getBloqueadorIseg().getId() == null)
							automovel.setBloqueadorIseg(null);
						if(automovel.getCarroceriaIseg() != null && automovel.getCarroceriaIseg().getId() == null)
							automovel.setCarroceriaIseg(null);
						if(automovel.getCargaIseg() != null && automovel.getCargaIseg().getId() == null)
							automovel.setCargaIseg(null);
						if(automovel.getSemireboqueIseg() != null && automovel.getSemireboqueIseg().getId() == null)
							automovel.setSemireboqueIseg(null);
						if(automovel.getTipoVeiculo() != null && automovel.getTipoVeiculo().getId() == null)
							automovel.setTipoVeiculo(null);
						if(automovel.getUsoVeiculo() != null && automovel.getUsoVeiculo().getId() == null)
							automovel.setUsoVeiculo(null);
						if(automovel.getModeloVeiculo() != null && automovel.getModeloVeiculo().getId() != null){
							automovel.setModeloNome(null);
						}
						if(automovel.getFabricante() != null && automovel.getFabricante().getId() == null){
							automovel.setFabricante(null);
						}
						if(automovel.getProprietarioArrendatario() != null&&
						   automovel.getProprietarioArrendatario().getId() == null){
							automovel.setProprietarioArrendatario(null);
						}else{
							if(automovel.getProprietarioArrendatario() != null && automovel.getProprietarioArrendatario().getRelacaoSeguradoProprietario() != null && 
								automovel.getProprietarioArrendatario().getRelacaoSeguradoProprietario().getId() == null){
								automovel.getProprietarioArrendatario().setRelacaoSeguradoProprietario(null);
							}
						}

						AutomovelCobertura automovelCobertura = null;
						if(automovel.getAutomovelCoberturaCollection() != null){
							for(int j=0 ; j<automovel.getAutomovelCoberturaCollection().size() ; j++){
								automovelCobertura = automovel.getAutomovelCoberturaCollection().get(j);
								if(automovelCobertura == null){
									automovel.getAutomovelCoberturaCollection().remove(j--);
									continue;
								}
								if(automovelCobertura.getCoberturasIseg() != null && automovelCobertura.getCoberturasIseg().getId() == null){
									automovelCobertura.setCoberturasIseg(null);
								}
								if(automovelCobertura.getCobertura() != null && automovelCobertura.getCobertura().getId() == null)
									automovelCobertura.setCobertura(null);
								if((automovelCobertura.getCobertura() == null && (automovelCobertura.getDescricao()==null || automovelCobertura.getDescricao().equals("")))){
									if(automovelCobertura.getCoberturasIseg() == null || automovelCobertura.getCoberturasIseg().getId() == null)
										automovel.getAutomovelCoberturaCollection().remove(j--);
								}
								if(automovel.getAutomovelCoberturaCollection().get(j) != null){
									automovel.getAutomovelCoberturaCollection().get(j).setAutomovel(automovel);
								}
								
							}
						}
						AutomovelServicos automovelServicos = null;
						if(automovel.getAutomovelServicosCollection() != null){
							for(int j=0 ; j<automovel.getAutomovelServicosCollection().size() ; j++){
								automovelServicos = automovel.getAutomovelServicosCollection().get(j);
								if(automovelServicos == null){
									automovel.getAutomovelServicosCollection().remove(j--);
									continue;
								}
								if(automovelServicos.getServicosIseg() != null && automovelServicos.getServicosIseg().getId() == null)
									automovelServicos.setServicosIseg(null);
								if(automovelServicos.getServicos() != null && automovelServicos.getServicos().getId() == null)
									automovelServicos.setServicos(null);
								if((automovelServicos.getServicos() == null && (automovelServicos.getDescricao()==null || automovelServicos.getDescricao().equals("")))){
									if(automovelServicos.getServicosIseg() == null || automovelServicos.getServicosIseg().getId() == null)
										automovel.getAutomovelServicosCollection().remove(j--);
								}
								if(automovel.getAutomovelServicosCollection().get(j) != null){
									automovel.getAutomovelServicosCollection().get(j).setAutomovel(automovel);
								}
							}
						}
					}
					if(automovel != null){
						this.service.save(automovel);
					}
				}
			}
			
			
			PropostaEndereco propostaEndereco = null;
			if(this.proposta.getPropostaEnderecoCollection() != null){
				for(int i=0 ; i<this.proposta.getPropostaEnderecoCollection().size() ; i++){
					propostaEndereco = this.proposta.getPropostaEnderecoCollection().get(i);
					if(propostaEndereco == null || 
						((propostaEndereco.getCep()!=null && propostaEndereco.getCep().getValor().isEmpty() || propostaEndereco.getCep()==null) &&
						 propostaEndereco.getLogradouro()!=null && propostaEndereco.getLogradouro().isEmpty() && propostaEndereco.getCidade()!=null && 
						 propostaEndereco.getCidade().isEmpty()) || 
						 (propostaEndereco.getCep()==null && propostaEndereco.getLogradouro()==null && propostaEndereco.getCidade()==null)){
						this.proposta.getPropostaEnderecoCollection().remove(i--);
					}else{
						this.proposta.getPropostaEnderecoCollection().get(i).setProposta(this.proposta);
					}
				}
			}
			
			if (this.proposta.getPerfil() != null && this.proposta.getPerfil().getId()==null)
				this.proposta.setPerfil(null);

			RespostaPerfil respostaPerfil = null;
			if(this.proposta.getRespostaPerfilCollection() != null && this.proposta.getPerfil()!=null){
				for(int i=0 ; i<this.proposta.getRespostaPerfilCollection().size() ; i++){
					respostaPerfil = this.proposta.getRespostaPerfilCollection().get(i);
					if(respostaPerfil == null){
						this.proposta.getRespostaPerfilCollection().remove(i--);
					}else{
						this.proposta.getRespostaPerfilCollection().get(i).setProposta(this.proposta);
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
			if(this.proposta.getTipoProposta() != null &&  (this.proposta.getTipoProposta() == 4 || this.proposta.getTipoProposta() == 6)){
				this.proposta.setVersao(Constants.VERSAO_PERFIL_GENERICO);
			}else{
				this.proposta.setVersao(Constants.VERSAO_PERFIL_GENERICO);
			}
			if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
				this.pessoa = this.pessoaFisica;
			}else{
				this.pessoaJuridica.setRazaoSocial(this.pessoaJuridica.getNome());
				if (this.pessoaJuridica.getAtividadeComercial() != null && this.pessoaJuridica.getAtividadeComercial().getId() == null)
					this.pessoaJuridica.setAtividadeComercial(null);
				this.pessoa = this.pessoaJuridica;
			}

			if (this.pessoa.getGrupoDeVenda()!=null && this.pessoa.getGrupoDeVenda().getId() == null)
				this.pessoa.setGrupoDeVenda(null);
			
			if (proposta.getCliente() == null || proposta.getCliente().getId() == null){
				clonarEndereco();
				if(this.tipoCliente.equals(Constants.CLIENTE_PF)){
					this.pessoaFisica.setCorretora(this.corretoraEmUso);
					if (this.pessoaFisica.getGrupoDeVenda()!=null && this.pessoaFisica.getGrupoDeVenda().getId()==null)
						this.pessoaFisica.setGrupoDeVenda(null);
					if(this.pessoaFisica.getProfissao() != null && this.pessoaFisica.getProfissao().getId() == null)
						this.pessoaFisica.setProfissao(null);
					
					this.service.save(this.pessoaFisica);
					this.pessoa = (PessoaFisica)service.find(this.pessoaFisica);
				}else{
					this.pessoaJuridica.setCorretora(this.corretoraEmUso);
					if (this.pessoaJuridica.getGrupoDeVenda()!=null && this.pessoaJuridica.getGrupoDeVenda().getId()==null)
						this.pessoaJuridica.setGrupoDeVenda(null);
					this.service.save(this.pessoaJuridica);
					this.pessoa = (PessoaJuridica)service.find(this.pessoaJuridica);
				}
			}else{
				this.pessoa.setId(proposta.getCliente().getId());
				this.pessoa = (Pessoa)service.find(pessoa);
			}
			this.service.executeNamedQuery("deletePropostaBancosByProposta", new Object[]{this.proposta.getId()});
			if(this.bancosRelacionamentoIds != null && this.bancosRelacionamentoIds.length > 0){
				int cont = 0;
				for(int i = 0; i < this.proposta.getPropostaBancosCollection().size(); i++){
					PropostaBancos propostaBancos = this.proposta.getPropostaBancosCollection().get(i);
					if(propostaBancos == null){
						propostaBancos = new PropostaBancos();
						propostaBancos.setConta("");
						propostaBancos.setDigito("");
						propostaBancos.setBancoRelacionamento(null);
						propostaBancos.setTipoContaRelacionamento(null);
						propostaBancos.setProposta(this.proposta);
						this.proposta.getPropostaBancosCollection().set(i, propostaBancos); 
					}else{
						propostaBancos.setProposta(this.proposta);
						propostaBancos.setBancoRelacionamento(new BancoRelacionamento());
						propostaBancos.getBancoRelacionamento().setId(this.bancosRelacionamentoIds[cont]);
						if(propostaBancos.getTipoContaRelacionamento() != null && propostaBancos.getTipoContaRelacionamento().getId() == null){
							propostaBancos.setTipoContaRelacionamento(null);
						}
						cont++;
					}
				}
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
			if(this.proposta.getRamo() != null){
				this.proposta.setRamo(HibernateUtil.initializeAndUnproxy(this.proposta.getRamo()));
			}
			if (this.proposta.getOrcamentoSeguro() != null && this.proposta.getOrcamentoSeguro().getId() == null)
				this.proposta.setOrcamentoSeguro(null);
			if (this.proposta.getPerfilPropostaCollection() != null && !this.proposta.getPerfilPropostaCollection().isEmpty()){
				if(this.proposta.getPerfilPropostaCollection().get(0).getTipoGaragem() != null && this.proposta.getPerfilPropostaCollection().get(0).getTipoGaragem().getId() == null)
					this.proposta.getPerfilPropostaCollection().get(0).setTipoGaragem(null);
				if(this.proposta.getPerfilPropostaCollection().get(0).getTipoResidencia() != null && this.proposta.getPerfilPropostaCollection().get(0).getTipoResidencia().getId() == null)
					this.proposta.getPerfilPropostaCollection().get(0).setTipoResidencia(null);
				if(this.proposta.getPerfilPropostaCollection().get(0).getUtilizacaoVeiculo() != null && this.proposta.getPerfilPropostaCollection().get(0).getUtilizacaoVeiculo().getId() == null)
					this.proposta.getPerfilPropostaCollection().get(0).setUtilizacaoVeiculo(null);
				this.proposta.getPerfilPropostaCollection().get(0).setProposta(this.proposta);
			}
			if(this.proposta.getRespostaPerfilCollection() != null && !this.proposta.getRespostaPerfilCollection().isEmpty()){
				for(RespostaPerfil respostaPerfil : this.proposta.getRespostaPerfilCollection()){
					if(respostaPerfil.getOrcamentoSeguro() != null && respostaPerfil.getOrcamentoSeguro().getId() == null)
						respostaPerfil.setOrcamentoSeguro(null);
						respostaPerfil.setProposta(this.proposta);
				}
			}
			if(blnGerarParcelas != null && blnGerarParcelas){
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

			if(condutor != null && condutor.getNome() != null && !condutor.getNome().equals("")){
				if(condutor.getTipoCondutor() == null){
					condutor.setTipoCondutor("NAO");
				}
				this.condutor.setAutomovel(null);
				this.condutor.setProposta(this.proposta);
				inserirCondutor();
			}
			this.condutor = new Condutor();

			if(this.proposta.getTipoProposta() == null || this.proposta.getTipoProposta().equals(new Long(0))){
				this.defineTipoProposta();
			}

			if (this.proposta.getId()==null){
				currentTabSaved = currentTab;
				currentTab = -1;
			}

			if (perfilAlterado){
				this.proposta.setRespostaPerfilCollection(new ArrayList<RespostaPerfil>());
				perfilAlterado = false;
			}
			
			this.salvarChecarParcelas();
			
			this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());

			if (blnRenovacao)
				this.service.refresh(this.proposta);

			carregaComissionadoPropostaList();

			this.setPObjectInstance();

			this.automovelCoberturaList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection();
			this.automovelServicoList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection();
			this.comissionadoPropostaList = this.proposta.getComissionadoPropostaCollection();

			for (PropostaAutomovel propostaAutomovel : this.proposta.getPropostaAutomovelCollection()) {
				this.automovelList.add(propostaAutomovel.getAutomovel());
			}
			
			itens = new Integer(this.proposta.getPropostaAutomovelCollection().size());

			Proposta propostaOriginal = this.proposta.getPropostaOriginal();

			Long idPropostaOriginal = null;
			
			if (propostaOriginal==null){
				this.historicoList = this.proposta.getEndossoCollection();
				if(this.historicoList == null)
					this.historicoList = new ArrayList<Proposta>();
				if (this.proposta.getPropostaRenovada()!=null && this.proposta.getPropostaRenovada().getId()!=null){
					this.historicoList.add(0, this.proposta.getPropostaRenovada());
				}
				if (this.proposta.getRenovacaoCollection()!=null && this.proposta.getRenovacaoCollection().size()>0){
					this.historicoList.add(0,this.proposta.getRenovacaoCollection().get(0));
				}
				idPropostaOriginal = this.proposta.getId();
			}else{
				List<Proposta> lista = propostaOriginal.getEndossoCollection();
				lista.add(0,propostaOriginal);
				lista.remove(this.proposta);
				this.historicoList = lista;
				if (this.proposta.getRenovacaoCollection()!=null && this.proposta.getRenovacaoCollection().size()>0){
					this.historicoList.add(0,this.proposta.getRenovacaoCollection().get(0));
				}
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
				this.currentTab = 3;
				return Action.ERROR;
			}

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	
	@SkipValidation
	public String consultaRenavan() throws Exception{
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirCondutor(){
		try{
			if (condutor.getId()==null){
				List<Condutor> cond =this.service.genericFindByNamedQuery("getCondutorByNome", new Object[]{condutor.getProposta().getId(), condutor.getNome()});
				if (cond.size()>0){
					condutores = (List<Condutor>)this.service.genericFindBySQLQuery("Select c From Condutor c where c.proposta.id = ?0 ", new Object[]{condutor.getProposta().getId()});
					return Action.SUCCESS;
				}
			}
			if(condutor.getIsCondutorPrincipal() != null && condutor.getIsCondutorPrincipal())
				condutor.setTipoCondutor("SIM");
			else
				condutor.setTipoCondutor("NAO");
			
			if(condutor.getTipoCondutor().equals("SIM") || (condutor.getIsCondutorPrincipal() != null && condutor.getIsCondutorPrincipal())){
				this.service.executeNamedQuery("updateCondutorAllNaoPrincipalByProposta", new Object[]{condutor.getProposta().getId()});
			}
			if(condutor.getEscolaridade() != null && condutor.getEscolaridade().getId() == null)
				condutor.setEscolaridade(null);
			if(condutor.getProfissao() != null && condutor.getProfissao().getId() == null)
				condutor.setProfissao(null);
			if(condutor.getRelacaoCondutorSegurado() != null && condutor.getRelacaoCondutorSegurado().getId() == null)
				condutor.setRelacaoCondutorSegurado(null);
			this.service.save(condutor);
			condutores = (List<Condutor>)this.service.genericFindBySQLQuery("Select c From Condutor c where c.proposta.id = ?0 ", new Object[]{condutor.getProposta().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
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
			condutores = (List<Condutor>)this.service.genericFindBySQLQuery("SELECT c FROM Condutor c WHERE c.proposta.id = ?0 ", new Object[]{condutor.getProposta().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirVeiculoModelo(){
		try{

			if (veiculoModelo.getFabricante().getId()==null){
				Fabricante fabricante = veiculoModelo.getFabricante(); 
				this.service.save(fabricante);
				this.veiculoModelo.setFabricante(fabricante);
			}

			this.service.save(veiculoModelo);
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirCobertura(){
		try{
			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			automovelCobertura.setAutomovel(this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel());
			if(automovelCobertura.getCoberturasIseg() != null && automovelCobertura.getCoberturasIseg().getId() == null){
				automovelCobertura.setCoberturasIseg(null);
			}else if(automovelCobertura.getCoberturasIseg() != null){
				automovelCobertura.setCoberturasIseg((CoberturasIseg)this.service.find(automovelCobertura.getCoberturasIseg()));
			}
			this.service.save(automovelCobertura);
			automovelCoberturaList = (List<AutomovelCobertura>)this.service.genericFindBySQLQuery("Select acob From AutomovelCobertura acob where acob.automovel.id = ?0 order by acob.sequencia", new Object[]{this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirServico(){
		try{

			this.pobject = service.find(pobject);
			this.proposta = (Proposta)this.pobject;
			automovelServico.setAutomovel(this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel());
			if(automovelServico.getServicosIseg() != null && automovelServico.getServicosIseg().getId() == null){
				automovelServico.setServicosIseg(null);
			}else if(automovelServico.getServicosIseg() != null){
				automovelServico.setServicosIseg((ServicosIseg)this.service.find(automovelServico.getServicosIseg()));
			}
			this.service.save(automovelServico);

			automovelServicoList = (List<AutomovelServicos>)this.service.genericFindBySQLQuery("Select aserv From AutomovelServicos aserv where aserv.automovel.id = ?0 order by aserv.sequencia", new Object[]{this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() throws Exception {
		//this.proposta = (Proposta)this.pobject;
		if (this.proposta.getDataVencim1aParcela()==null)
			this.proposta.setDataVencim1aParcela(new Date());

		this.seguradora = this.proposta.getSeguradora();

		if(!this.proposta.getPropostaAutomovelCollection().isEmpty() && this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getModeloVeiculo() != null && this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getModeloVeiculo().getFabricante() != null){
			this.marca = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getModeloVeiculo().getFabricante();
			this.getModeloVeiculoList();
		}
		this.getVistoriadoraBySeguradoraList();
		this.getPerfilListBySeguradora();

		boolean salvarDeNovo = false;

		this.respostaPerfilLista = this.proposta.getRespostaPerfilCollection();

		if (this.proposta.getRespostaPerfilCollection().size()==0 && this.proposta.getPerfil()!=null){
			Perfil perfil = this.proposta.getPerfil();
			perfil = this.service.getEntityManager().getReference(Perfil.class, perfil.getId());
			for (int i=0;i<perfil.getPerguntasPerfilCollection().size();i++){
				PerguntasPerfil pergunta = perfil.getPerguntasPerfilCollection().get(i);
				if (pergunta.getIsAtiva() != null && pergunta.getIsAtiva()){
					RespostaPerfil respostaPerfil = new RespostaPerfil();
					respostaPerfil.setProposta(proposta);
					respostaPerfil.setPerguntasPerfil(pergunta);
					respostaPerfil.setOrdem(pergunta.getOrdem());
					this.proposta.getRespostaPerfilCollection().add(respostaPerfil);
					salvarDeNovo = true;
				}
			}
		}

		if (this.proposta.getPropostaAutomovelCollection().size()==0){
			//this.proposta.setPropostaAutomovelCollection(this.automovelList);
			List<Automovel> autoList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			if (autoList.size()==0){
				if (novoItem().equals(Action.ERROR))
					throw new Exception("Erro ao tentar criar automovel vazio!");
				itemCorrente = 0;
				salvarDeNovo = true;
			}
		}

		if (this.proposta.getPropostaAutomovelCollection().size()>0){
			if (this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection().size()==0){
				for (int i=0;i<this.seguradora.getCoberturasCollection().size();i++){
					Coberturas cobertura = this.seguradora.getCoberturasCollection().get(i);
					cobertura = this.service.getEntityManager().getReference(Coberturas.class, cobertura.getId());
					if (cobertura.getRamo().getId().longValue()==this.getRamoAutomovel() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
						AutomovelCobertura automovelCobertura = new AutomovelCobertura();
						automovelCobertura.setAutomovel(this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel());
						if(cobertura != null && cobertura.getId() == null)
							automovelCobertura.setCobertura(null);
						else
							automovelCobertura.setCobertura(cobertura);
						
						automovelCobertura.setSequencia(cobertura.getSequencia());
						this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection().add(automovelCobertura);
						salvarDeNovo = true;
					}
				}
			}

			if (this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection().size()==0){
				for (int i=0;i<this.seguradora.getServicosCollection().size();i++){
					Servicos servico = this.seguradora.getServicosCollection().get(i);
					servico = this.service.getEntityManager().getReference(Servicos.class, servico.getId());
					if (servico.getRamo().getId().longValue()==this.getRamoAutomovel() && servico.getIsAtiva() && usarServicosAssessoria(servico)){
						AutomovelServicos automovelServicos = new AutomovelServicos();
						automovelServicos.setAutomovel(this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel());
						if(servico != null && servico.getId() == null)
							automovelServicos.setServicos(null);
						else
							automovelServicos.setServicos(servico);
						
						automovelServicos.setSequencia(servico.getSequencia());
						this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection().add(automovelServicos);
						salvarDeNovo = true;
					}
				}
			}

		}
		
		if(this.proposta.getComissionadoPropostaCollection().size()==0){
			gerarComissionados();
			salvarDeNovo = true;
		}
		
		if (this.proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE)){
			for (int i=0;i<this.proposta.getPropostaAutomovelCollection().size();i++){
				if (this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel()!=null &&
				   (this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel().getCodigoIdentificacao()==null ||
				    this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel().getCodigoIdentificacao().equals(""))){
					// setar CI da proposta para todos os veiculos na primeira vez.
					this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel().setCodigoIdentificacao(this.proposta.getCodigoIdentificacao());
					salvarDeNovo = true;
				}
			}
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

//		List<Automovel> automoveis = this.proposta.getPropostaAutomovelCollection();

		this.condutores = this.proposta.getCondutorCollection();

		if (HibernateUtil.initializeAndUnproxy(this.proposta.getCliente()) instanceof PessoaFisica)
			this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());
		else
			this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.proposta.getCliente());

	}

	public List<PObject> getTipoCombustivelList(){
		return this.getDominioList("TipoCombustivel");
	}

	public List<PObject> getCategoriaVeiculoList(){
		return this.getDominioList("CategoriaVeiculo");
	}
	
	public String salvarDetalhesAutomovel(){
		try{
			if(this.automovel == null || this.automovel.getId()==null)
				return Action.ERROR;
			this.service.executeNamedQuery("deleteAutomovelPropAcessoriosByAutomovel", new Object[]{this.automovel.getId()});
			Automovel auto = (Automovel)this.service.find(Automovel.class,this.automovel.getId());
			auto.setIsSeguradoProprietario(this.automovel.getIsSeguradoProprietario());
			auto.setProprietarioArrendatario(this.automovel.getProprietarioArrendatario());
			auto.setRastreadorIseg(this.automovel.getRastreadorIseg());
			auto.setBloqueadorIseg(this.automovel.getBloqueadorIseg());
			auto.setOutroRastreador(this.automovel.getOutroRastreador());
			auto.setOutroBloqueador(this.automovel.getOutroBloqueador());
			if(auto.getProprietarioArrendatario() != null && auto.getProprietarioArrendatario().getId() == null){
				auto.setProprietarioArrendatario(null);
			}
			if(auto.getBloqueadorIseg() != null && auto.getBloqueadorIseg().getId() == null){
				auto.setBloqueadorIseg(null);
			}
			if(auto.getRastreadorIseg() != null && auto.getRastreadorIseg().getId() == null){
				auto.setRastreadorIseg(null);
			}
			if(acessoriosId != null){
				List<AutomovelPropAcessorios> listaAutomovelPropAcessorios = new ArrayList<AutomovelPropAcessorios>();
				for(Long idAcessorio : acessoriosId){
					AutomovelPropAcessorios automovelPropAcessorios = new AutomovelPropAcessorios();
					Acessorios ac = new Acessorios();
					ac.setId(idAcessorio);
					ac.setTipoAcessorio(null);
					automovelPropAcessorios.setAcessorio(ac);
					automovelPropAcessorios.setAutomovel(auto);
					listaAutomovelPropAcessorios.add(automovelPropAcessorios);
				}
				auto.setAutomovelPropAcessoriosCollection(listaAutomovelPropAcessorios);
			}
			this.service.save(auto);
			this.inputStream = new StringBufferInputStream("SUCESSO");
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			this.inputStream = new StringBufferInputStream("ERRO");
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPerfilListBySeguradora(){
		try{
			this.perfilList = (List<Perfil>)this.service.genericFindBySQLQuery("Select p From Perfil p where p.seguradora.id = ?0 and p.isAtivo = true Order by p.nome", new Object[]{this.seguradora.getId()});
			Perfil meuPerfil = this.proposta.getPerfil();
			meuPerfil = this.service.getEntityManager().getReference(Perfil.class, meuPerfil.getId());
			if (meuPerfil!=null && !this.perfilList.contains(meuPerfil))
				this.perfilList.add(meuPerfil);
				
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			this.perfilList = new ArrayList<Perfil>();
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
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
	public List<Automovel> getPropostaAutomovelCollection(){
		try{
			return (List<Automovel>) this.service.genericFindBySQLQuery("SELECT a FROM Automovel a WHERE  a.proposta.id = ?0 ", new Object[]{proposta.getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Automovel>();
	}

	@SuppressWarnings("unchecked")
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
			this.proposta = (Proposta)service.find(this.proposta);
			this.pobject = this.proposta;
			Automovel automovel = null;
			for (int i=0;i<this.proposta.getPropostaAutomovelCollection().size();i++){
				automovel = this.proposta.getPropostaAutomovelCollection().get(i).getAutomovel();
				if (automovel.getLinhaVazia()){
					this.itemCorrente = i;
					this.automovelCoberturaList = automovel.getAutomovelCoberturaCollection();
					this.automovelServicoList = automovel.getAutomovelServicosCollection();
					automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
					return Action.SUCCESS;
				}
			}
			automovel = new Automovel();
			automovel.setLinhaVazia(true);
			automovel.setProposta(this.proposta);
			int numeroItem = this.service.getRowCount("getMaxNumeroItemAutoByProposta", new Object[]{this.proposta.getId()});
			automovel.setNumeroItem((numeroItem==0 ? 1 : numeroItem));
			Seguradora seguradora;
			seguradora = (Seguradora)this.service.find(Seguradora.class, this.proposta.getSeguradora().getId());
			for (int i=0;i<seguradora.getCoberturasCollection().size();i++){
				Coberturas cobertura = seguradora.getCoberturasCollection().get(i);
				cobertura = (Coberturas)this.service.find(Coberturas.class, cobertura.getId());
				if (cobertura.getRamo().getId().longValue()==this.getRamoAutomovel() && cobertura.getIsAtiva() && usarCoberturasAssessoria(cobertura)){
					AutomovelCobertura automovelCobertura = new AutomovelCobertura();
					automovelCobertura.setAutomovel(automovel);
					automovelCobertura.setCobertura(seguradora.getCoberturasCollection().get(i)); 
					automovelCobertura.setSequencia(seguradora.getCoberturasCollection().get(i).getSequencia());
					automovel.getAutomovelCoberturaCollection().add(automovelCobertura);
				}
			}
			for (int i=0;i<seguradora.getServicosCollection().size();i++){
				Servicos servico = seguradora.getServicosCollection().get(i);
				servico = this.service.getEntityManager().getReference(Servicos.class, servico.getId());
				if (servico.getRamo().getId().longValue()==this.getRamoAutomovel() && servico.getIsAtiva() && usarServicosAssessoria(servico)){
					AutomovelServicos automovelServicos = new AutomovelServicos();
					automovelServicos.setAutomovel(automovel);
					automovelServicos.setServicos(seguradora.getServicosCollection().get(i));
					automovelServicos.setSequencia(seguradora.getServicosCollection().get(i).getSequencia());
					automovel.getAutomovelServicosCollection().add(automovelServicos);
				}
			}
			this.itemCorrente = new Integer(this.service.getRowCount("getCountAutomovel", new Object[]{this.proposta.getId()}));
			
			this.service.save(automovel);
			
			PropostaAutomovel propostaAutomovel = new PropostaAutomovel();
			propostaAutomovel.setAutomovel(automovel);
			propostaAutomovel.setProposta(proposta);
			propostaAutomovel.setNumeroItem((numeroItem==0 ? 1 : numeroItem));
			propostaAutomovel.setPropostaOriginal(proposta);
			propostaAutomovel.setDataInclusao(new Date());
			propostaAutomovel.setLog(new LogType());
			propostaAutomovel.getLog().setAutor(this.usuario);
			propostaAutomovel.getLog().setEditor(null);
			propostaAutomovel.getLog().setExcluidoPor(null);
			
			
			this.service.save(propostaAutomovel);
			
			this.proposta.getPropostaAutomovelCollection().add(propostaAutomovel);
			
			
			this.automovelCoberturaList = automovel.getAutomovelCoberturaCollection();
			this.automovelServicoList = automovel.getAutomovelServicosCollection();
			automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarAutomovel(){
		try {

			this.proposta = (Proposta)service.find(this.proposta);
			this.pobject = this.proposta;
			this.automovelCoberturaList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection();
			this.automovelServicoList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection();
			automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String listarAutomoveis(){
		try {

			automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by pa.numeroItem", new Object[]{this.proposta.getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String removerItem(){
		try {
			this.proposta = (Proposta)service.find(this.proposta);
			this.pobject = this.proposta;
			PropostaAutomovel propostaAutomovel = this.proposta.getPropostaAutomovelCollection().get(itemCorrente);
			this.service.executeNamedQuery("updateDataExclusao", new Object[]{new Timestamp(new Date().getTime()),propostaAutomovel.getId()});
			this.proposta.getPropostaAutomovelCollection().remove(this.proposta.getPropostaAutomovelCollection().get(itemCorrente));
			this.itemCorrente = this.itemCorrente -1;
			automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by pa.numeroItem", new Object[]{this.proposta.getId()});
			if(this.itemCorrente >=0){
				this.automovelCoberturaList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection();
				this.automovelServicoList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection();
			}else if(this.itemCorrente < 0 && automovelList.size() == 0){
				if(novoItem().equals(Action.ERROR)){
					addActionError("Erro ao criar veículo");
				}
			}else{
				this.itemCorrente = 0;
				this.automovelCoberturaList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelCoberturaCollection();
				this.automovelServicoList = this.proposta.getPropostaAutomovelCollection().get(itemCorrente).getAutomovel().getAutomovelServicosCollection();
			}
			this.itens = automovelList.size();
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public List<BancoRelacionamento> getBancoRelacionamentoList() throws Exception{
		List<BancoRelacionamento> bancoRelacionamentoList = this.service.genericFindByNamedQuery("getBancoRelacionamento", null);
		if(this.proposta.getId() != null && this.proposta.getPropostaBancosCollection() != null && !this.proposta.getPropostaBancosCollection().isEmpty()){
			for(BancoRelacionamento bancoRelacionamento: bancoRelacionamentoList){
				for(PropostaBancos orcamentoBancos : this.proposta.getPropostaBancosCollection()){
					if(orcamentoBancos.getBancoRelacionamento() != null && bancoRelacionamento.getId().compareTo(orcamentoBancos.getBancoRelacionamento().getId())==0){
						bancoRelacionamento.setSelecionado(bancoRelacionamento.getId());
					}
				}
			}
		}
		return bancoRelacionamentoList;
	}
	
	/** Domínios **/
	public List<PObject> getUsoVeiculo() {
		List<PObject> list = this.getDominioList("UsoVeiculo");
		DominioEsp domEsp = new DominioEsp();
		domEsp.setId(999L);
		domEsp.setValor("OUTROS");
		list.add(domEsp);
		return list;
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
	/** Fim Domínios*/
	
	public List<PObject> getTipoCobertura() throws Exception{
		return this.service.genericFindByNamedQuery("getTipoCobertura", null);
	}
	
	public List<PObject> getCarroceriaIsegList() throws Exception{
		List<PObject> list = this.service.genericFindByNamedQuery("getCarroceriaIseg", new Object[]{true});
		CarroceriaIseg carroceriaIseg = new CarroceriaIseg();
		carroceriaIseg.setId(999L);
		carroceriaIseg.setDescricao("OUTROS");
		list.add(carroceriaIseg);
		return list;
	}
	
	public List<PObject> getCargaIsegList() throws Exception{
		List<PObject> list = this.service.genericFindByNamedQuery("getCargaIseg", new Object[]{true}); 
		CargaIseg cargaIseg = new CargaIseg();
		cargaIseg.setId(999L);
		cargaIseg.setDescricao("OUTROS");
		list.add(cargaIseg);
		return list;
	}
	
	public List<PObject> getSemireboqueIsegList() throws Exception{
		List<PObject> list = this.service.genericFindByNamedQuery("getSemireboqueIseg", new Object[]{true});
		SemireboqueIseg semireboqueIseg = new SemireboqueIseg();
		semireboqueIseg.setId(999L);
		semireboqueIseg.setDescricao("OUTROS");
		list.add(semireboqueIseg);
		return list;
	}
	
	public List<PObject> getTipoVeiculoList() throws Exception{
		return this.service.genericFindByNamedQuery("getTipoVeiculo", new Object[]{true});
	}
	public List<PObject> getCoberturasIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getCoberturasIseg", new Object[]{Boolean.TRUE});
	}
	public List<PObject> getServicosIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getServicosIseg", new Object[]{Boolean.TRUE});
	}
	
	public AutomovelCobertura getAutomovelCobertura() {
		return automovelCobertura;
	}

	public List<Automovel> getAutomovelList() {
		return automovelList;
	}

	public void setAutomovelList(List<Automovel> automovelList) {
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

	public List<RespostaPerfil> getRespostaPerfilLista() throws Exception{
		return respostaPerfilLista;
	}

	public void setRespostaPerfilLista(List<RespostaPerfil> respostaPerfilLista) {
		this.respostaPerfilLista = respostaPerfilLista;
	}
	
	public List<RespostaPerfil> getRespostaPerfilList() throws Exception{
		if(this.proposta != null && this.proposta.getId() != null){
			respostaPerfilLista = (List<RespostaPerfil>)this.service.genericFindBySQLQuery("SELECT i FROM RespostaPerfil i WHERE i.proposta.id = ?0 AND i.perguntasPerfil.perfil.id IS NULL ORDER BY i.ordem", new Object[]{this.proposta.getId()});
			for(RespostaPerfil r : respostaPerfilLista){
				PerguntasPerfil perguntaPerfil = (PerguntasPerfil)this.service.find(PerguntasPerfil.class,r.getPerguntasPerfil().getId());
				r.setPerguntasPerfil(perguntaPerfil);
				r.setOrdem(perguntaPerfil.getOrdem());
			}
		}
		if(respostaPerfilLista == null || respostaPerfilLista.isEmpty()){
			respostaPerfilLista = new ArrayList<RespostaPerfil>();
			List<PerguntasPerfil> perguntasPerfilList = getPerguntasPerfilList();
			Integer i = 1;
			for(PerguntasPerfil perguntas: perguntasPerfilList){
				RespostaPerfil resposta = new RespostaPerfil();
				resposta.setProposta(this.proposta);
				resposta.setPerguntasPerfil(perguntas);
				resposta.setOrdem(i);
				respostaPerfilLista.add(resposta);
				i++;
			}
		}
		return respostaPerfilLista;
	}
	
	@SuppressWarnings("unchecked")
	public List<PerguntasPerfil> getPerguntasPerfilList() throws Exception{
		return (ArrayList<PerguntasPerfil>)this.service.genericFindBySQLQuery("SELECT i FROM PerguntasPerfil i WHERE i.perfil.id = null ORDER BY i.ordem", null);
	}
	
	@SuppressWarnings("unchecked")
	public List<Acessorios> getOpcionaisList() throws Exception{
		List<Acessorios> retorno = (List<Acessorios>)this.service.genericFindBySQLQuery("SELECT i FROM Acessorios i, DominioEsp d WHERE d.id = i.tipoAcessorio.id AND d.valor = 'OPCIONAIS' ORDER BY i.descricao ASC ",null);
		if(this.automovel != null && this.automovel.getAutomovelPropAcessoriosCollection() != null && !this.automovel.getAutomovelPropAcessoriosCollection().isEmpty()){
				for(Acessorios ac : retorno){
					for(AutomovelPropAcessorios aOa : this.automovel.getAutomovelPropAcessoriosCollection()){
						if(ac.getId().equals(aOa.getAcessorio().getId())){
							ac.setIdSelecionado(ac.getId());
						}
					}
				}
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public List<Acessorios> getDispositivoSegurancaList() throws Exception{
		List<Acessorios> retorno = (List<Acessorios>)this.service.genericFindBySQLQuery("SELECT i FROM Acessorios i, DominioEsp d WHERE d.id = i.tipoAcessorio.id AND d.valor = 'SEGURANCA' ORDER BY i.descricao ASC",null);
		if(this.automovel != null && this.automovel.getAutomovelPropAcessoriosCollection() != null && !this.automovel.getAutomovelPropAcessoriosCollection().isEmpty()){
			for(Acessorios ac : retorno){
				for(AutomovelPropAcessorios aOa : this.automovel.getAutomovelPropAcessoriosCollection()){
					if(ac.getId().equals(aOa.getAcessorio().getId())){
						ac.setIdSelecionado(ac.getId());
					}
				}
			}
		}
		return retorno;
	}
	
	@SkipValidation
	public String pesquisaDadosPessoa(){
		try {
			if(this.condutor != null){
				PessoaFisica pessoaFisica = null;
				if(this.condutor.getCpf() != null){
					pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaByCpf", new Object[]{this.condutor.getCpf()});
				}
				if(this.condutor.getId() != null){
					pessoaFisica = (PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaById", new Object[]{this.condutor.getId()});
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
	
	public String consultarAutomovel(){
		try{
			if(this.automovel != null && this.automovel.getId() != null){
				this.automovel = (Automovel)this.service.find(this.automovel);
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public List<PObject> getRastreadorIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getRastreadorIseg", null);
	}
	
	public List<PObject> getBloqueadorIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getBloqueadorIseg", null);
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

	public Long[] getBancosRelacionamentoIds() {
		return bancosRelacionamentoIds;
	}

	public void setBancosRelacionamentoIds(Long[] bancosRelacionamentoIds) {
		this.bancosRelacionamentoIds = bancosRelacionamentoIds;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public Long[] getAcessoriosId() {
		return acessoriosId;
	}

	public void setAcessoriosId(Long[] acessoriosId) {
		this.acessoriosId = acessoriosId;
	}
	
}