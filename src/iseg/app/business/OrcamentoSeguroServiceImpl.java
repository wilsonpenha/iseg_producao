package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Coberturas;
import iseg.app.model.Corretora;
import iseg.app.model.Endereco;
import iseg.app.model.OrcamentoCobertura;
import iseg.app.model.OrcamentoFranquias;
import iseg.app.model.OrcamentoSeguradora;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.model.OrcamentoServicos;
import iseg.app.model.ParcelasOrcamento;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.RespostaPerfil;
import iseg.app.model.Sequencia;
import iseg.app.model.Servicos;
import iseg.app.model.Situacao;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import org.hibernate.TransientObjectException;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



//@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class OrcamentoSeguroServiceImpl extends PObjectServiceImpl implements OrcamentoSeguroService {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getOrcamentoSeguro", null, page, pageSize);
	}

	public List<PObject> findAll() throws Exception {
		return genericFindByNamedQuery("getOrcamentoSeguro", null);
	}

	@SuppressWarnings("unchecked")
	public List<OrcamentoSeguro> getOrcamentoSeguroForSearch(OrcamentoSeguro orcamentoSeguro, Integer page, Integer pageSize) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = "from OrcamentoSeguro as p where(1=1) ";

			if(orcamentoSeguro.getDataOrcamento() != null){
				strQuery += "and p.dataOrcamento = :dataOrcamento ";
			}
			if(orcamentoSeguro.getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia ";
			}
			if(orcamentoSeguro.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getNome() != null && !orcamentoSeguro.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getCpfOuCnpj() != null && !orcamentoSeguro.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(orcamentoSeguro.getSituacao() != null && (orcamentoSeguro.getSituacao().getId() != null && orcamentoSeguro.getSituacao().getId().longValue()>=0)){
				strQuery += "and p.situacao.id = :situacaoId ";
			}	
			if(orcamentoSeguro.getRamo() != null && orcamentoSeguro.getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
//			if(orcamentoSeguro.getAutomovelCollection() != null && !orcamentoSeguro.getAutomovelCollection().isEmpty()){
//				AutomovelOrcamento automovel = orcamentoSeguro.getAutomovelCollection().get(0);
//				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
//					strQuery += "and a.nroPlaca = :nroPlaca ";
//				}
//				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
//					strQuery += "and a.nroChassis = :nroChassis ";
//				}
//			}

			strQuery += " ORDER BY p.numero desc ";

			Query query = localEM.createQuery("select p "+strQuery);

			if(orcamentoSeguro.getDataOrcamento() != null){
				query.setParameter("dataOrcamento", orcamentoSeguro.getDataOrcamento());
			}
			if(orcamentoSeguro.getTerminoVigencia() != null){
				query.setParameter("inicioVigencia", orcamentoSeguro.getInicioVigencia());
				query.setParameter("terminoVigencia", orcamentoSeguro.getTerminoVigencia());
			}
			if(orcamentoSeguro.getNumero() != null){
				query.setParameter("numero", orcamentoSeguro.getNumero());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getId() != null){
				query.setParameter("clienteId", orcamentoSeguro.getCliente().getId());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getNome() != null && !orcamentoSeguro.getCliente().getNome().equals("")){
				query.setParameter("clienteNome", orcamentoSeguro.getCliente().getNome().trim());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getCpfOuCnpj() != null && !orcamentoSeguro.getCliente().getCpfOuCnpj().equals("")){
				query.setParameter("clienteCpfOuCnpj", orcamentoSeguro.getCliente().getCpfOuCnpj());
			}
			if(orcamentoSeguro.getSituacao() != null && (orcamentoSeguro.getSituacao().getId() != null && orcamentoSeguro.getSituacao().getId().longValue()>=0)){
				query.setParameter("situacaoId", orcamentoSeguro.getSituacao().getId());
			}
			if(orcamentoSeguro.getRamo() != null && orcamentoSeguro.getRamo().getId() != null){
				query.setParameter("ramoId", orcamentoSeguro.getRamo().getId());
			}
//			if(orcamentoSeguro.getAutomovelCollection() != null && !orcamentoSeguro.getAutomovelCollection().isEmpty()){
//				AutomovelOrcamento automovel = orcamentoSeguro.getAutomovelCollection().get(0);
//				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
//					query.setParameter("nroPlaca", automovel.getNroPlaca());
//				}
//				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
//					query.setParameter("nroChassis", automovel.getNroChassis());
//				}
//			}

			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);

			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountOrcamentoSeguroForSearch(OrcamentoSeguro orcamentoSeguro) throws Exception {

		try{

			this.applyFilter();
			String strQuery = "from OrcamentoSeguro p where(1=1) ";

			if(orcamentoSeguro.getDataOrcamento() != null){
				strQuery += "and p.dataOrcamento = :dataOrcamento ";
			}
			if(orcamentoSeguro.getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia ";
			}
			if(orcamentoSeguro.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getNome() != null && !orcamentoSeguro.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getCpfOuCnpj() != null && !orcamentoSeguro.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(orcamentoSeguro.getSituacao() != null && (orcamentoSeguro.getSituacao().getId()!= null && orcamentoSeguro.getSituacao().getId().longValue()>=0)){
				strQuery += "and p.situacao.id = :situacaoId ";
			}	
			if(orcamentoSeguro.getRamo() != null && orcamentoSeguro.getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
//			if(orcamentoSeguro.getAutomovelCollection() != null && !orcamentoSeguro.getAutomovelCollection().isEmpty()){
//				AutomovelOrcamento automovel = orcamentoSeguro.getAutomovelCollection().get(0);
//				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
//					strQuery += "and a.nroPlaca = :nroPlaca ";
//				}
//				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
//					strQuery += "and a.nroChassis = :nroChassis ";
//				}
//			}
			Query queryCount = localEM.createQuery("select count(distinct p.id) "+strQuery);

			if(orcamentoSeguro.getDataOrcamento() != null){
				queryCount.setParameter("dataOrcamento", orcamentoSeguro.getDataOrcamento());
			}
			if(orcamentoSeguro.getTerminoVigencia() != null){
				queryCount.setParameter("inicioVigencia", orcamentoSeguro.getInicioVigencia());
				queryCount.setParameter("terminoVigencia", orcamentoSeguro.getTerminoVigencia());
			}
			if(orcamentoSeguro.getNumero() != null){
				queryCount.setParameter("numero", orcamentoSeguro.getNumero());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getId() != null){
				queryCount.setParameter("clienteId", orcamentoSeguro.getCliente().getId());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getNome() != null && !orcamentoSeguro.getCliente().getNome().equals("")){
				queryCount.setParameter("clienteNome", orcamentoSeguro.getCliente().getNome());
			}
			if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getCpfOuCnpj() != null && !orcamentoSeguro.getCliente().getCpfOuCnpj().equals("")){
				queryCount.setParameter("clienteCpfOuCnpj", orcamentoSeguro.getCliente().getCpfOuCnpj());
			}
			if(orcamentoSeguro.getSituacao() != null && orcamentoSeguro.getSituacao().getId() != null){
				queryCount.setParameter("situacaoId", orcamentoSeguro.getSituacao().getId());
			}
			if(orcamentoSeguro.getRamo() != null && orcamentoSeguro.getRamo().getId() != null){
				queryCount.setParameter("ramoId", orcamentoSeguro.getRamo().getId());
			}
//			if(orcamentoSeguro.getAutomovelCollection() != null && !orcamentoSeguro.getAutomovelCollection().isEmpty()){
//				AutomovelOrcamento automovel = orcamentoSeguro.getAutomovelCollection().get(0);
//				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
//					queryCount.setParameter("nroPlaca", automovel.getNroPlaca());
//				}
//				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
//					queryCount.setParameter("nroChassis", automovel.getNroChassis());
//				}
//			}
			
			localEM.clear();
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	public void excluirOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) throws Exception{
		try {

			this.getEntityManager().remove(orcamentoSeguro);

			this.getEntityManager().flush();
			this.getEntityManager().close();
		}catch (ConstraintViolationException cve) {
			throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", cve);
		}catch (EntityNotFoundException enf) {
			throw new GenericException("Entidade não encontrada ("+enf.getMessage()+").", enf);
		}catch (TransientObjectException toe) {
			throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).", toe);
		}catch (IllegalStateException ise) {
			if(ise.getCause() instanceof TransientObjectException){
				throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).", ise.getCause());
			}
			throw new GenericException("Não foi possível realizar a operação requisitada.", ise);
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
	
	/* metodos utilizados para Gerar a proposta */
	
	public Long getSequenciaNumeroOrcamentoSeguro() throws Exception {
		Corretora corretoraCorrente = (Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso");
		Sequencia sequencia = (Sequencia)this.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"OrcamentoSeguro",corretoraCorrente.getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("OrcamentoSeguro");
			sequencia.setCorretora(corretoraCorrente);
			sequencia.setValor(0L);
			this.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.save(sequencia);
		return sequencia.getValor();
	}
	
	public void copyDadosProposta(OrcamentoFranquias orcamentoFranquias,Proposta proposta) throws Exception{};
	public void setNullObject(Object object) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{}
	public void setNullObjectCollection(Object obj) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{}
	
	@SuppressWarnings("finally")
	public Proposta gerarProposta(OrcamentoFranquias orcamentoFranquias, OrcamentoSeguradora orcamentoSeguradora) throws Exception{
		Proposta proposta = new Proposta();
		try {
			proposta.setSeguradora(orcamentoSeguradora.getSeguradora());
			proposta.setDataProposta(new Date(new java.util.Date().getTime()));
			proposta.setPremioLiquido(orcamentoFranquias.getPremioLiquido());
			proposta.setCustoApolice(orcamentoFranquias.getCustoApolice());
			proposta.setDesconto(new Double(0));
			proposta.setIof(orcamentoFranquias.getIof());
			proposta.setPremioTotal(orcamentoFranquias.getPremioTotal());
			proposta.setFator(orcamentoSeguradora.getFator());
			if(orcamentoFranquias.getParcelasOrcamentoCollection() != null && !orcamentoFranquias.getParcelasOrcamentoCollection().isEmpty()){
				ParcelasOrcamento parcelasOrcamento = Util.cloneBean((ParcelasOrcamento) find(ParcelasOrcamento.class,orcamentoFranquias.getParcelasOrcamentoCollection().get(0).getId()), ParcelasOrcamento.class);
				parcelasOrcamento.setFormaPagamento(orcamentoFranquias.getParcelasOrcamentoCollection().get(0).getFormaPagamento());
				if(parcelasOrcamento.getFormaPagamento().equals(Constants.FORMA_PAG_DEBITO_CONTA.intValue())){
					proposta.setQtdeParcelas(new Long(parcelasOrcamento.getQtdParcelas()));
					proposta.setValor1aParcela(parcelasOrcamento.getValorParcelaDebito());
					proposta.setValorDemaisParcelas(parcelasOrcamento.getValorParcelaDebito());
				}
				if(parcelasOrcamento.getFormaPagamento().equals(Constants.FORMA_PAG_CHEQUE.intValue())){
					proposta.setQtdeParcelas(new Long(parcelasOrcamento.getQtdParcelas()));
					proposta.setValor1aParcela(parcelasOrcamento.getValorParcelaCheque());
					proposta.setValorDemaisParcelas(parcelasOrcamento.getValorParcelaCheque());
				}
				if(parcelasOrcamento.getFormaPagamento().equals(Constants.FORMA_PAG_CARTAO_CREDITO.intValue())){
					proposta.setQtdeParcelas(new Long(parcelasOrcamento.getQtdParcelas()));
					proposta.setValor1aParcela(parcelasOrcamento.getValorParcelaCheque());
					proposta.setValorDemaisParcelas(parcelasOrcamento.getValorParcelaCheque());
				}
				if(parcelasOrcamento.getFormaPagamento().equals(Constants.FORMA_PAG_CARNET.intValue())){
					proposta.setQtdeParcelas(new Long(parcelasOrcamento.getQtdParcelas()));
					proposta.setValor1aParcela(parcelasOrcamento.getValorParcelaCarne());
					proposta.setValorDemaisParcelas(parcelasOrcamento.getValorParcelaCarne());
				}
				proposta.setFormaPagamento(new Long(parcelasOrcamento.getFormaPagamento()));
				proposta.setFormaPagamento1aParcela(new Long(parcelasOrcamento.getFormaPagamento()));
			}
			
			proposta.setCodigoIdentificacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCodigoIdentificacao());
			proposta.setOrcamentoSeguro(orcamentoSeguradora.getOrcamentoSeguro());
			proposta.setNumero(this.getSequenciaNumeroProposta());
			
			if(orcamentoSeguradora.getOrcamentoSeguro().getCliente() != null && orcamentoSeguradora.getOrcamentoSeguro().getCliente().getId() != null){
				PropostaEndereco propostaEndereco = null;
				
				if(HibernateUtil.initializeAndUnproxy(orcamentoSeguradora.getOrcamentoSeguro().getCliente()) instanceof PessoaFisica){
					PessoaFisica pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(orcamentoSeguradora.getOrcamentoSeguro().getCliente());
					for(Endereco endereco : pessoaFisica.getEnderecoCollection()){
						propostaEndereco = new PropostaEndereco();
						propostaEndereco.setBairro(endereco.getBairro());
						propostaEndereco.setCep(endereco.getCep());
						propostaEndereco.setCidade(endereco.getCidade());
						propostaEndereco.setComplemento(endereco.getComplemento());
						propostaEndereco.setCorrespondencia(endereco.getCorrespondencia());
						propostaEndereco.setFax(endereco.getFax());
						propostaEndereco.setLogradouro(endereco.getLogradouro());
						propostaEndereco.setNumero(endereco.getNumero());
						propostaEndereco.setProposta(proposta);
						propostaEndereco.setTelefone(endereco.getTelefone());
						propostaEndereco.setTipoEndereco(endereco.getTipoEndereco());
						propostaEndereco.setUf(endereco.getUf());
						proposta.getPropostaEnderecoCollection().add(propostaEndereco);
					}
				}else if(HibernateUtil.initializeAndUnproxy(orcamentoSeguradora.getOrcamentoSeguro().getCliente()) instanceof PessoaJuridica){
					PessoaJuridica pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(orcamentoSeguradora.getOrcamentoSeguro().getCliente());
					for(Endereco endereco : pessoaJuridica.getEnderecoCollection()){
						propostaEndereco = new PropostaEndereco();
						propostaEndereco.setBairro(endereco.getBairro());
						propostaEndereco.setCep(endereco.getCep());
						propostaEndereco.setCidade(endereco.getCidade());
						propostaEndereco.setComplemento(endereco.getComplemento());
						propostaEndereco.setCorrespondencia(endereco.getCorrespondencia());
						propostaEndereco.setFax(endereco.getFax());
						propostaEndereco.setLogradouro(endereco.getLogradouro());
						propostaEndereco.setNumero(endereco.getNumero());
						propostaEndereco.setProposta(proposta);
						propostaEndereco.setTelefone(endereco.getTelefone());
						propostaEndereco.setTipoEndereco(endereco.getTipoEndereco());
						propostaEndereco.setUf(endereco.getUf());
						proposta.getPropostaEnderecoCollection().add(propostaEndereco);
					}
				}
			}
			if(orcamentoSeguradora.getOrcamentoSeguro().getCliente() != null && orcamentoSeguradora.getOrcamentoSeguro().getCliente().getId() != null){
				proposta.setCliente(orcamentoSeguradora.getOrcamentoSeguro().getCliente());
				proposta.setClienteNome(orcamentoSeguradora.getOrcamentoSeguro().getCliente().getNome());
				proposta.setCpfOuCnpj(orcamentoSeguradora.getOrcamentoSeguro().getCliente().getCpfOuCnpj());
			}else{
				if(orcamentoSeguradora.getOrcamentoSeguro().getTipoPessoa().equals(Constants.CLIENTE_PF)){
					PessoaFisica pessoaFisica = new PessoaFisica();
					pessoaFisica.setNome(orcamentoSeguradora.getOrcamentoSeguro().getClienteNome());
					pessoaFisica.setCpfOuCnpj(orcamentoSeguradora.getOrcamentoSeguro().getCpfOuCnpj());
					pessoaFisica.setTelefoneAlternativo(orcamentoSeguradora.getOrcamentoSeguro().getTelefoneAlternativo());
					pessoaFisica.setTelefoneCelular(orcamentoSeguradora.getOrcamentoSeguro().getTelefoneCelular());
					pessoaFisica.setTelefonePreferencial(orcamentoSeguradora.getOrcamentoSeguro().getTelefonePreferencial());
					pessoaFisica.setEmail(orcamentoSeguradora.getOrcamentoSeguro().getEmail());
					pessoaFisica.setGrupoDeVenda(orcamentoSeguradora.getOrcamentoSeguro().getGrupoDeVenda());
					pessoaFisica.setReferenciaPessoal(orcamentoSeguradora.getOrcamentoSeguro().getReferenciaPessoal());
					pessoaFisica.setCnh(orcamentoSeguradora.getOrcamentoSeguro().getCnh());
					pessoaFisica.setData1aHabilitacao(orcamentoSeguradora.getOrcamentoSeguro().getData1aHabilitacao());
					pessoaFisica.setDataNascimento(orcamentoSeguradora.getOrcamentoSeguro().getDataNascimento());
					pessoaFisica.setEstadoCivil(orcamentoSeguradora.getOrcamentoSeguro().getEstadoCivil());
					pessoaFisica.setSexo(orcamentoSeguradora.getOrcamentoSeguro().getSexo());
					pessoaFisica.setProfissao(orcamentoSeguradora.getOrcamentoSeguro().getProfissao());
					pessoaFisica.setProfissaoNome(orcamentoSeguradora.getOrcamentoSeguro().getOutraProfissao());
					pessoaFisica.setAutomovelCollection(null);
					pessoaFisica.setContaCorrenteCollection(null);
					pessoaFisica.setCorretoraClienteCollection(null);
					pessoaFisica.setDependentesCollection(null);
					pessoaFisica.setDossieCollection(null);
					pessoaFisica.setEnderecoCollection(null);
					pessoaFisica.setPessoaatuacaoList(null);
					pessoaFisica.setPropostaCollection(null);
					pessoaFisica.setUsuarioCollection(null);
					this.save(pessoaFisica);
					proposta.setCliente(pessoaFisica);
				}else{
					PessoaJuridica pessoaJuridica = new PessoaJuridica();
					pessoaJuridica.setNome(orcamentoSeguradora.getOrcamentoSeguro().getClienteNome());
					pessoaJuridica.setCpfOuCnpj(orcamentoSeguradora.getOrcamentoSeguro().getCpfOuCnpj());
					pessoaJuridica.setTelefoneAlternativo(orcamentoSeguradora.getOrcamentoSeguro().getTelefoneAlternativo());
					pessoaJuridica.setTelefoneCelular(orcamentoSeguradora.getOrcamentoSeguro().getTelefoneCelular());
					pessoaJuridica.setTelefonePreferencial(orcamentoSeguradora.getOrcamentoSeguro().getTelefonePreferencial());
					pessoaJuridica.setEmail(orcamentoSeguradora.getOrcamentoSeguro().getEmail());
					pessoaJuridica.setGrupoDeVenda(orcamentoSeguradora.getOrcamentoSeguro().getGrupoDeVenda());
					pessoaJuridica.setAutomovelCollection(null);
					pessoaJuridica.setContaCorrenteCollection(null);
					pessoaJuridica.setCorretoraClienteCollection(null);
					pessoaJuridica.setDependentesCollection(null);
					pessoaJuridica.setDossieCollection(null);
					pessoaJuridica.setEnderecoCollection(null);
					pessoaJuridica.setPessoaatuacaoList(null);
					pessoaJuridica.setPropostaCollection(null);
					pessoaJuridica.setUsuarioCollection(null);
					this.save(pessoaJuridica);
					proposta.setCliente(pessoaJuridica);
				}
				proposta.setClienteNome(orcamentoSeguradora.getOrcamentoSeguro().getClienteNome());
				proposta.setCpfOuCnpj(orcamentoSeguradora.getOrcamentoSeguro().getCpfOuCnpj());
			}
			proposta.setFator(orcamentoSeguradora.getFator());
			proposta.setContaCorrente(orcamentoSeguradora.getOrcamentoSeguro().getContaCorrente());
			proposta.setCodigoAgencia(orcamentoSeguradora.getOrcamentoSeguro().getCodigoAgencia());
			proposta.setRespostaPerfilCollection(new ArrayList<RespostaPerfil>());
			for (RespostaPerfil respostaPerfil: orcamentoSeguradora.getOrcamentoSeguro().getRespostaPerfilCollection()) {
				RespostaPerfil resposta = (RespostaPerfil)Util.cloneBean(respostaPerfil, "id","orcamentoSeguro");
				resposta.setProposta(proposta);
				proposta.getRespostaPerfilCollection().add(resposta);
			}
			proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO);
			proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
			proposta.setRamo(orcamentoSeguradora.getOrcamentoSeguro().getRamo());
			proposta.setInicioVigencia(new Date());
			proposta.setTerminoVigencia(Util.somarDiaMesAnoData(new Date(), null, null, 1));
			proposta.setTipoProposta(Constants.TP_PROP_COMUM);
			
			proposta.setIsFatura(Boolean.FALSE);
			proposta.setBlnPossuiPerfil(Boolean.TRUE);
			
			orcamentoFranquias.setOrcamentoSeguradora(orcamentoSeguradora);
			
			this.save(proposta);
			this.copyDadosProposta(orcamentoFranquias, proposta);
			this.salvarCalculoOrcamentoSegAuto(orcamentoSeguradora);
			
			OrcamentoSeguro orcamentoSeguro = orcamentoSeguradora.getOrcamentoSeguro();
			orcamentoSeguro.setSituacao(new Situacao());
			orcamentoSeguro.getSituacao().setId(Constants.STATUS_ORCA_EFETIVADO);
			this.save(orcamentoSeguro);

		}catch (ConstraintViolationException cve) {
			throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", cve);
		}catch (EntityNotFoundException enf) {
			throw new GenericException("Entidade não encontrada ("+enf.getMessage()+").", enf);
		}catch (TransientObjectException toe) {
			throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).", toe);
		}catch (IllegalStateException ise) {
			if(ise.getCause() instanceof TransientObjectException){
				throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).", ise.getCause());
			}
			throw new GenericException("Não foi possível realizar a operação requisitada.", ise);
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}finally{
			orcamentoSeguradora = new OrcamentoSeguradora();
			Proposta p = new Proposta();
			p.setId(proposta.getId());
			return p;
		}
	}
	private ParcelasOrcamento parcelaSelecionada(List<ParcelasOrcamento> parcelasOrcamentoList){
		for(ParcelasOrcamento parcelasOrcamento : parcelasOrcamentoList){
			if(parcelasOrcamento.getIsSelected() != null && parcelasOrcamento.getIsSelected()){
				return parcelasOrcamento; 
			}
		}
		return null;
	}
	public OrcamentoSeguradora salvarCalculoOrcamentoSegAuto(OrcamentoSeguradora orcamentoSeguradora) throws Exception{
		if(orcamentoSeguradora != null && orcamentoSeguradora.getId() != null){
			if(orcamentoSeguradora.getOrcamentoCoberturaCollection() != null && orcamentoSeguradora.getOrcamentoCoberturaCollection().isEmpty())
				orcamentoSeguradora.setOrcamentoCoberturaCollection(null);
			else{
				for (OrcamentoCobertura orcamentoCobertura : orcamentoSeguradora.getOrcamentoCoberturaCollection()) {
					if(orcamentoCobertura.getCoberturas() != null && orcamentoCobertura.getCoberturas().getId() == null){
						orcamentoCobertura.setCoberturas(null);
					}else{
						if(orcamentoCobertura.getCoberturas() != null){
							orcamentoCobertura.setCoberturas((Coberturas)this.find(orcamentoCobertura.getCoberturas()));
							if(orcamentoCobertura.getCoberturasIseg() == null || (orcamentoCobertura.getCoberturasIseg()!= null && orcamentoCobertura.getCoberturasIseg().getId() == null)){
								orcamentoCobertura.setCoberturasIseg(orcamentoCobertura.getCoberturas().getCoberturasIseg());
							}
							orcamentoCobertura.setInformaFranquia(Boolean.TRUE);
						}
					}
					if(orcamentoCobertura.getCoberturasIseg() != null && orcamentoCobertura.getCoberturasIseg().getId() == null){
						orcamentoCobertura.setCoberturasIseg(null);
						orcamentoCobertura.setInformaFranquia(Boolean.FALSE);
					}
				}
			}
			if(orcamentoSeguradora.getOrcamentoServicosCollection() != null && orcamentoSeguradora.getOrcamentoServicosCollection().isEmpty())
				orcamentoSeguradora.setOrcamentoServicosCollection(null);
			else{
				for (OrcamentoServicos orcamentoServicos : orcamentoSeguradora.getOrcamentoServicosCollection()) {
					if(orcamentoServicos.getServicos() != null && orcamentoServicos.getServicos().getId() == null){
						orcamentoServicos.setServicos(null);
					}else{
						if(orcamentoServicos.getServicos() != null){
							orcamentoServicos.setServicos((Servicos)this.find(orcamentoServicos.getServicos()));
							if(orcamentoServicos.getServicosIseg() == null || (orcamentoServicos.getServicosIseg() != null && orcamentoServicos.getServicosIseg().getId() == null)){
								orcamentoServicos.setServicosIseg(orcamentoServicos.getServicos().getServicosIseg());
							}
							orcamentoServicos.setInformaFranquia(Boolean.TRUE);
						}
					}
					if(orcamentoServicos.getServicosIseg() != null && orcamentoServicos.getServicosIseg().getId() != null){
						orcamentoServicos.setInformaFranquia(Boolean.TRUE);
					}
					if(orcamentoServicos.getServicosIseg() != null && orcamentoServicos.getServicosIseg().getId() == null){
						orcamentoServicos.setServicosIseg(null);
						orcamentoServicos.setInformaFranquia(Boolean.FALSE);
					}
				}
			}
			for(int i = 0; i < orcamentoSeguradora.getOrcamentoFranquiasCollection().size() ; i++){
				OrcamentoFranquias orcamentoFranquias = orcamentoSeguradora.getOrcamentoFranquiasCollection().get(i); 
				for(int j = 0 ; j < orcamentoFranquias.getParcelasOrcamentoCollection().size(); j++){
					ParcelasOrcamento parcelasOrcamento = orcamentoFranquias.getParcelasOrcamentoCollection().get(j);
					if(parcelasOrcamento != null && 
				       parcelasOrcamento.getFormaPagamento()== null &&
				       parcelasOrcamento.getId()== null &&
				       parcelasOrcamento.getIsSelected()== null &&
				       parcelasOrcamento.getQtdParcelaCarne()== null &&
				       parcelasOrcamento.getQtdParcelaCheque()== null &&
				       parcelasOrcamento.getQtdParcelaCredito()== null &&
				       parcelasOrcamento.getQtdParcelaDebito()== null &&
				       parcelasOrcamento.getQtdParcelas()== null &&
				       parcelasOrcamento.getValorParcelaCarne()== null &&
				       parcelasOrcamento.getValorParcelaDebito()== null &&
				       parcelasOrcamento.getValorParcelaCheque()== null &&
				       parcelasOrcamento.getValorParcelaCredito()== null &&
					   parcelasOrcamento.getFormaPagamento() == null){
						orcamentoFranquias.getParcelasOrcamentoCollection().remove(j);
					}
				}
			}
			save(orcamentoSeguradora);
		}
		return (OrcamentoSeguradora)find(OrcamentoSeguradora.class,orcamentoSeguradora.getId());
	}
	
	public Long getSequenciaNumeroProposta() throws Exception {
		Corretora corretoraCorrente = (Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso");
		Sequencia sequencia = (Sequencia)this.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"Proposta",corretoraCorrente.getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("Proposta");
			sequencia.setCorretora(corretoraCorrente);
			sequencia.setValor(0L);
			this.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.save(sequencia);
		return sequencia.getValor();
	}
}