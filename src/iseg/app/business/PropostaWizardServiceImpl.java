package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Automovel;
import iseg.app.model.Condutor;
import iseg.app.model.Corretora;
import iseg.app.model.Endereco;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.PerfilProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaAutomovel;
import iseg.app.model.PropostaBancos;
import iseg.app.model.PropostaEndereco;
import iseg.app.model.RespostaPerfil;
import iseg.app.model.Sequencia;
import iseg.app.persistence.LogType;
import iseg.app.persistence.PObject;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.RollbackException;

import org.hibernate.TransientObjectException;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.transaction.TransactionSystemException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.Action;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PropostaWizardServiceImpl extends PropostaServiceImpl implements PropostaWizardService {

	public List<PObject> findAll(int page, int pageSize) throws Exception {

		return genericFindByNamedQuery("getProposta", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getProposta", null);
	}

	public void saveProposta(PObject pobject, Pessoa pessoa, Boolean blnGerarParcelas, PropostaComissaoService serviceAux,
			Condutor condutor, Boolean blnEndosso, Boolean blnPropria, Boolean blnRenovacao) throws Exception {
		try{
			this.setCorretora(pobject);

			Proposta proposta = (Proposta)pobject;

			if (proposta.getCliente() == null || proposta.getCliente().getId() == null){
				pessoa = clonarEndereco(proposta, pessoa);
				this.save(pessoa);
			}else{
				pessoa.setId(proposta.getCliente().getId());
				pessoa = (Pessoa)this.getEntityManager().find(pessoa.getClass(), pessoa.getId());
			}

			proposta.setCliente(pessoa);

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
			if(proposta.getGrupoDeVenda() == null || proposta.getGrupoDeVenda().getId() == null){
				proposta.setGrupoDeVenda(pessoa.getGrupoDeVenda());
			}
			if(proposta.getPropostaEndossada() == null || proposta.getPropostaEndossada().getId() == null){
				proposta.setPropostaEndossada(null);
			}
			if(blnGerarParcelas != null && blnGerarParcelas){
				gerarParcelas(proposta);
			}

			if(proposta.getValorComissao() == null || proposta.getValorComissao().equals(new Double(0))){
				proposta.setValorComissao((proposta.getFator()*proposta.getPremioLiquido())/100);
			}

			if (proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_APOLICE) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PROPOSTA_ENDOSSO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_ENDOSSO) ||
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_VALIDO) || 
				proposta.getStatusOperacional().equals(Constants.STATUS_OPER_PEDIDO_ENDOSSO_VALIDO)){
				int existeBaixa = this.getRowCount("checarBaixaExistente", new Object[]{proposta.getId()});
				if (existeBaixa==0){
					this.executeNamedQuery("deletePropostaComissaoByPropostaId", new Object[]{proposta.getId()});
					serviceAux.gerarComissoes(proposta);
				}
			}

			if(condutor != null && condutor.getNome() != null && !condutor.getNome().equals("")){
				if(condutor.getTipoCondutor() == null){
					condutor.setTipoCondutor("NAO");
				}
				if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
					condutor.setAutomovel(proposta.getAutomovelWizCollection().get(0));
					inserirCondutor(condutor);
				}
			}
			condutor = new Condutor();

			if(proposta.getTipoProposta() == null || proposta.getTipoProposta().equals(new Long(0))){
				if(blnEndosso){
					proposta.setTipoProposta(blnPropria ? Constants.TP_PROP_ENDOSSO_PROPRIO : Constants.TP_PROP_ENDOSSO_CONGENERE);
				}else if(blnRenovacao){
					proposta.setTipoProposta(blnPropria ? Constants.TP_PROP_RENOVACAO_PROPRIA : Constants.TP_PROP_RENOVACAO_CONGENERE);
				}else{
					proposta.setTipoProposta(Constants.TP_PROP_COMUM);
				}
			}

			this.saveNoRefresh(proposta);

			this.getEntityManager().flush();
			this.getEntityManager().close();
		}catch (ConstraintViolationException cve) {
			throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", cve);
		}catch (EntityNotFoundException enf) {
			throw new GenericException("Entidade não encontrada ("+enf.getMessage()+").", enf);
		}catch (TransientObjectException toe) {
			throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).", toe);
		}catch (RollbackException e) {
			throw new GenericException("Falha ao fazer Commit.", e);
		}catch (IllegalStateException ise) {
			if(ise.getCause() instanceof TransientObjectException){
				throw new GenericException("Existem referências não salvas no objeto (TransientObjectException).");
			}
			throw new GenericException("Não foi possível realizar a operação requisitada.", ise);
		}catch (TransactionSystemException tse) {
			throw new GenericException("Ocorreu uma falha no sistema.", tse);
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	public Pessoa clonarEndereco(Proposta proposta, Pessoa pessoa){
		for (int i=0;i<proposta.getPropostaEnderecoCollection().size();i++){
			PropostaEndereco propostaEndereco = proposta.getPropostaEnderecoCollection().get(i); 
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
			endereco.setPessoa(pessoa);
			pessoa.getEnderecoCollection().add(endereco);
		}
		return pessoa;
	}

	public Long getSequenciaNumeroProposta() throws Exception {
		Corretora corretoraEmUso = (Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso");
		Sequencia sequencia = (Sequencia)this.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"Proposta", corretoraEmUso.getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("Proposta");
			sequencia.setCorretora(corretoraEmUso);
			sequencia.setValor(0L);
			this.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.save(sequencia);
		return sequencia.getValor();
	}

	public String gerarParcelas(Proposta proposta) throws Exception {

		try{
			ParcelasProposta parcelaProposta = null;
			proposta.getParcelasPropostaCollection().clear();
			this.executeNamedQuery("deleteParcelasByPropostaId", new Object[]{proposta.getId()});

			int i = 1;
			if(proposta.getValor1aParcela() != null && proposta.getValor1aParcela() != 0.0){
				parcelaProposta = new ParcelasProposta();
				parcelaProposta.setProposta(proposta);
				parcelaProposta.setNroParcela(1);
				parcelaProposta.setValorParcela(proposta.getValor1aParcela());
				parcelaProposta.setVencimento(proposta.getDataVencim1aParcela());
				proposta.getParcelasPropostaCollection().add(parcelaProposta);
				this.save(parcelaProposta);
				i++;
			}

			String nroBanco = proposta.getNroBanco() == null ? "" : proposta.getNroBanco().toString();
			String contaCorrente = proposta.getContaCorrente() == null ? "" : proposta.getContaCorrente().toString();

			for(; i<=proposta.getQtdeParcelas() ; i++){
				parcelaProposta = new ParcelasProposta();
				parcelaProposta.setProposta(proposta);
				parcelaProposta.setNroParcela(i);
				parcelaProposta.setValorParcela(proposta.getValorDemaisParcelas());
				parcelaProposta.setVencimento(Formatter.addMonth(proposta.getDataVencim1aParcela(), i-1));
				if(proposta.getFormaPagamento().equals(Constants.FORMA_PAG_DEBITO_CONTA)){
					parcelaProposta.setNroBanco(nroBanco);
					parcelaProposta.setCodigoAgencia(proposta.getCodigoAgencia());
					parcelaProposta.setContaCorrente(contaCorrente);
				}
				proposta.getParcelasPropostaCollection().add(parcelaProposta);
				this.save(parcelaProposta);
			}

			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	public void inserirCondutor(Condutor condutor){
		try{
			if(condutor.getTipoCondutor().equals("SIM")){
				this.executeNamedQuery("updateCondutorAllNaoPrincipalByAutomovel", new Object[]{condutor.getAutomovel()});
			}
			this.saveNoRefresh(condutor);

		} catch (Exception e) {
		}
	}

	public void saveNoRefresh(PObject pobject) throws Exception {
		try{
			if (pobject.getId() == null) {
				// new
				this.save(pobject);
			} else {
				// update
				this.save(pobject);
			}
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
	
	@Override
	public void copyDadosProposta(Proposta propostaEndossada, Proposta proposta) throws Exception{
		if(propostaEndossada.getPropostaEnderecoCollection() != null){
			PropostaEndereco propostaEnderecoTmp = null;
			for(PropostaEndereco propostaEndereco : propostaEndossada.getPropostaEnderecoCollection()){
				propostaEnderecoTmp = (PropostaEndereco)Util.cloneBean(propostaEndereco, "id", "proposta");
				propostaEnderecoTmp.setProposta(proposta);
				this.save(propostaEnderecoTmp);
				proposta.getPropostaEnderecoCollection().add(propostaEnderecoTmp);
			}
		}

		if (proposta.getSeguradora().getId().equals(propostaEndossada.getSeguradora().getId())){
			if(propostaEndossada.getRespostaPerfilCollection() != null){
				RespostaPerfil respostaPerfilTmp = null;
				for(RespostaPerfil respostaPerfil : propostaEndossada.getRespostaPerfilCollection()){
					if(respostaPerfil.getPerguntasPerfil().getPerfil() == null){
						respostaPerfilTmp = (RespostaPerfil)Util.cloneBean(respostaPerfil, "id", "proposta");
						respostaPerfilTmp.setProposta(proposta);
						respostaPerfilTmp.setOrdem(respostaPerfil.getOrdem());
						proposta.getRespostaPerfilCollection().add(respostaPerfilTmp);
					}
				}
			}
		}

		if(propostaEndossada.getCondutorCollection() != null){
			Condutor condutorTmp = null;
			for(Condutor condutor : propostaEndossada.getCondutorCollection()){
				condutorTmp = (Condutor)Util.cloneBean(condutor, "id", "produtor");
				condutorTmp.setProposta(proposta);
				this.save(condutorTmp);
				proposta.getCondutorCollection().add(condutorTmp);
			}
		}
		
		if(propostaEndossada.getPerfilPropostaCollection() != null){
			PerfilProposta perfilPropostaTemp = new PerfilProposta();
			if(propostaEndossada.getPerfilPropostaCollection() != null && !propostaEndossada.getPerfilPropostaCollection().isEmpty()){
				perfilPropostaTemp.setCepPernoite(propostaEndossada.getPerfilPropostaCollection().get(0).getCepPernoite());
				perfilPropostaTemp.setCepResidencia(propostaEndossada.getPerfilPropostaCollection().get(0).getCepResidencia());
				perfilPropostaTemp.setCepTrabalho(propostaEndossada.getPerfilPropostaCollection().get(0).getCepTrabalho());
				perfilPropostaTemp.setQtdOutrosVeiculos(propostaEndossada.getPerfilPropostaCollection().get(0).getQtdOutrosVeiculos());
				perfilPropostaTemp.setQuilometragem(propostaEndossada.getPerfilPropostaCollection().get(0).getQuilometragem());
				perfilPropostaTemp.setTipoGaragem(propostaEndossada.getPerfilPropostaCollection().get(0).getTipoGaragem());
				perfilPropostaTemp.setTipoResidencia(propostaEndossada.getPerfilPropostaCollection().get(0).getTipoResidencia());
				perfilPropostaTemp.setUtilizacaoVeiculo(propostaEndossada.getPerfilPropostaCollection().get(0).getUtilizacaoVeiculo());
				perfilPropostaTemp.setProposta(proposta);
				proposta.getPerfilPropostaCollection().add(perfilPropostaTemp);
			}
		}
		
		if(propostaEndossada.getPropostaBancosCollection() != null){
			PropostaBancos propostaBancosTemp = null;
			for(PropostaBancos propostaBancos : propostaEndossada.getPropostaBancosCollection()){
				propostaBancosTemp = (PropostaBancos)Util.cloneBean(propostaBancos, "id", "proposta");
				propostaBancosTemp.setProposta(proposta);
				proposta.getPropostaBancosCollection().add(propostaBancosTemp);
			}
		}
		
		if(propostaEndossada.getPropostaAutomovelCollection() != null){
			for(PropostaAutomovel propostaAutomovel : propostaEndossada.getPropostaAutomovelCollection()){
				if(propostaAutomovel.getDataExclusao() == null){
					PropostaAutomovel propostaAutomovelTmp = new PropostaAutomovel();
					propostaAutomovelTmp.setProposta(proposta);
					if(propostaAutomovel.getPropostaOriginal() != null){
						propostaAutomovelTmp.setPropostaOriginal(propostaAutomovel.getPropostaOriginal());	
					}else{
						propostaAutomovelTmp.setPropostaOriginal(propostaAutomovel.getProposta());
					}
					Automovel automovel = HibernateUtil.initializeAndUnproxy(propostaAutomovel.getAutomovel());
					propostaAutomovelTmp.setAutomovel(automovel);
					propostaAutomovelTmp.setNumeroItem(automovel.getNumeroItem());
					propostaAutomovelTmp.setLog(new LogType());
					propostaAutomovelTmp.getLog().setAutor(proposta.getUsuario());
					propostaAutomovelTmp.getLog().setEditor(null);
					propostaAutomovelTmp.getLog().setExcluidoPor(null);
					propostaAutomovelTmp.setDataInclusao(propostaAutomovel.getDataInclusao());
					this.save(propostaAutomovelTmp);
					proposta.getPropostaAutomovelCollection().add(propostaAutomovelTmp);
				}
			}
		}
		
//		if(propostaEndossada.getAutomovelWizCollection() != null){
//			Automovel automovelTmp = null;
//			for(Automovel automovel : propostaEndossada.getAutomovelWizCollection()){
//				if (!automovel.getLinhaVazia()){
//					automovelTmp = (Automovel)Util.cloneBean(automovel, "id", "proposta");
//					automovelTmp.setSeguradora(propostaEndossada.getSeguradora());
//					automovelTmp.setNroApoliceAnterior(propostaEndossada.getNroApolice());
//					automovelTmp.setCodigoIdentificacaoAnterior(propostaEndossada.getCodigoIdentificacao());
//					automovelTmp.setCodigoIdentificacao(null);
//					automovelTmp.setFranquia(0.00);
//					automovelTmp.setProposta(proposta);
//					this.save(automovelTmp);
//					proposta.getAutomovelWizCollection().add(automovelTmp);
//
//					if (proposta.getSeguradora().getId().equals(propostaEndossada.getSeguradora().getId())){
//						if(automovel.getAutomovelCoberturaCollection() != null){
//							AutomovelCobertura automovelCoberturaTmp = null;
//							for(AutomovelCobertura automovelCobertura : automovel.getAutomovelCoberturaCollection()){
//								automovelCoberturaTmp = (AutomovelCobertura)Util.cloneBean(automovelCobertura, "id", "automovel","sequencia");
//								automovelCoberturaTmp.setAutomovel(automovelTmp);
//								this.save(automovelCoberturaTmp);
//								automovelTmp.getAutomovelCoberturaCollection().add(automovelCoberturaTmp);
//							}
//						}
//
//						if(automovel.getAutomovelServicosCollection() != null){
//							AutomovelServicos automovelServicoTmp = null;
//							for(AutomovelServicos automovelServico : automovel.getAutomovelServicosCollection()){
//								automovelServicoTmp = (AutomovelServicos)Util.cloneBean(automovelServico, "id", "automovel","sequencia");
//								automovelServicoTmp.setAutomovel(automovelTmp);
//								this.save(automovelServicoTmp);
//								automovelTmp.getAutomovelServicosCollection().add(automovelServicoTmp);
//							}
//						}
//					}
//				}
//			}
//		}
	}
}