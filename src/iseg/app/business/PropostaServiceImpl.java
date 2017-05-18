package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Agenciamento;
import iseg.app.model.Automovel;
import iseg.app.model.BorderoLancamento;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.Corretora;
import iseg.app.model.CorretoraTipoLancamento;
import iseg.app.model.Endosso;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Proposta;
import iseg.app.model.RepasseComissao;
import iseg.app.model.Seguradora;
import iseg.app.model.Sequencia;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.Calendar;
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
public class PropostaServiceImpl extends PObjectServiceImpl implements PropostaService {

	private String demaisParcelas = "NAO";
	
	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getProposta", null, page, pageSize);
	}

	public List<PObject> findAll() throws Exception {
		return genericFindByNamedQuery("getProposta", null);
	}

	@SuppressWarnings("unchecked")
	public List<Proposta> getPropostasForSearch(Proposta proposta, Integer page, Integer pageSize) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = "from Proposta as p left join p.propostaAutomovelCollection a where 1=1 ";

			if (proposta.getRenovacaoAutomatica()!=null && proposta.getRenovacaoAutomatica()){
				strQuery += "and p.statusOperacional in (2,4,6,7,9,10) and p.situacaoOperacional=0 ";
			}
			if(proposta.getDataProposta() != null){
				strQuery += "and p.dataProposta = :dataProposta ";
			}
			if(proposta.getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia ";
			}
			if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
				strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
			}
			if(proposta.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}	
			if(proposta.getSituacaoOperacional() != null && (proposta.getSituacaoOperacional().longValue()>=0)){
				strQuery += "and p.situacaoOperacional = :situacaoOperacional ";
			}	
			if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.automovel.nroPlaca = :nroPlaca ";
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					strQuery += "and a.automovel.nroChassis = :nroChassis ";
				}
			}

			strQuery += " ORDER BY p.numero desc ";

			Query query = localEM.createQuery("select distinct p "+strQuery);

			if(proposta.getDataProposta() != null){
				query.setParameter("dataProposta", proposta.getDataProposta());
			}
			if(proposta.getTerminoVigencia() != null){
				query.setParameter("inicioVigencia", proposta.getInicioVigencia());
				query.setParameter("terminoVigencia", proposta.getTerminoVigencia());
			}
			if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
				query.setParameter("nroPropostaSeg", proposta.getNroPropostaSeg());
			}
			if(proposta.getNumero() != null){
				query.setParameter("numero", proposta.getNumero());
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				query.setParameter("nroApolice", proposta.getNroApolice());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				query.setParameter("clienteId", proposta.getCliente().getId());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				query.setParameter("clienteNome", proposta.getCliente().getNome().trim());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				query.setParameter("clienteCpfOuCnpj", proposta.getCliente().getCpfOuCnpj());
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				query.setParameter("seguradoraId", proposta.getSeguradora().getId());
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				query.setParameter("statusOperacional", proposta.getStatusOperacional());
			}
			if(proposta.getSituacaoOperacional() != null && (proposta.getSituacaoOperacional().longValue()>=0)){
				query.setParameter("situacaoOperacional", proposta.getSituacaoOperacional());
			}
			if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
				query.setParameter("ramoId", proposta.getRamo().getId());
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					query.setParameter("nroPlaca", automovel.getNroPlaca());
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					query.setParameter("nroChassis", automovel.getNroChassis());
				}
			}

			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);

			List<Proposta> propostaList = query.getResultList(); 
			
			return propostaList;

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountPropostasForSearch(Proposta proposta) throws Exception {

		try{

			this.applyFilter();
			String strQuery = "from Proposta p left join p.propostaAutomovelCollection a where 1=1 ";

			if (proposta.getRenovacaoAutomatica()!=null && proposta.getRenovacaoAutomatica()){
				strQuery += "and p.statusOperacional in (2,4,6,7,9,10) and p.situacaoOperacional=0 ";
			}
			if(proposta.getDataProposta() != null){
				strQuery += "and p.dataProposta = :dataProposta ";
			}
			if(proposta.getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia ";
			}
			if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
				strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
			}
			if(proposta.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}
			if(proposta.getSituacaoOperacional() != null && (proposta.getSituacaoOperacional().longValue()>=0)){
				strQuery += "and p.situacaoOperacional = :situacaoOperacional ";
			}	
			if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.automovel.nroPlaca = :nroPlaca ";
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					strQuery += "and a.automovel.nroChassis = :nroChassis ";
				}
			}

			Query queryCount = localEM.createQuery("select count(distinct p.id) "+strQuery);

			if(proposta.getDataProposta() != null){
				queryCount.setParameter("dataProposta", proposta.getDataProposta());
			}
			if(proposta.getTerminoVigencia() != null){
				queryCount.setParameter("inicioVigencia", proposta.getInicioVigencia());
				queryCount.setParameter("terminoVigencia", proposta.getTerminoVigencia());
			}
			if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
				queryCount.setParameter("nroPropostaSeg", proposta.getNroPropostaSeg());
			}
			if(proposta.getNumero() != null){
				queryCount.setParameter("numero", proposta.getNumero());
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				queryCount.setParameter("nroApolice", proposta.getNroApolice());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				queryCount.setParameter("clienteId", proposta.getCliente().getId());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				queryCount.setParameter("clienteNome", proposta.getCliente().getNome());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				queryCount.setParameter("clienteCpfOuCnpj", proposta.getCliente().getCpfOuCnpj());
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				queryCount.setParameter("seguradoraId", proposta.getSeguradora().getId());
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				queryCount.setParameter("statusOperacional", proposta.getStatusOperacional());
			}
			if(proposta.getSituacaoOperacional() != null && (proposta.getSituacaoOperacional().longValue()>=0)){
				queryCount.setParameter("situacaoOperacional", proposta.getSituacaoOperacional());
			}
			if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
				queryCount.setParameter("ramoId", proposta.getRamo().getId());
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					queryCount.setParameter("nroPlaca", automovel.getNroPlaca());
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					queryCount.setParameter("nroChassis", automovel.getNroChassis());
				}
			}
			
			localEM.clear();
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void reprocessarGrupoDeVendaEComissionados(Proposta proposta) throws Exception{
		List<ComissionadoProposta> comissionadosAtivos = this.genericFindByNamedQuery("getComissionadosAtivosByPropostaId", new Object[]{proposta.getId()});

		for (ComissionadoProposta comissionadoProposta : comissionadosAtivos) {
		// Somete irei estornar os comissionados caso hajam baixas efetuadas
			List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
			for (RepasseComissao repasseComissao : repasse) {
				RepasseComissao repasseParaEstorno = new RepasseComissao();
				repasseParaEstorno.setComissionado(comissionadoProposta);
				repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseParaEstorno.setNroDaParcela(repasseComissao.getNroDaParcela());
				repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
				repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
				repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
				repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
				repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
				repasseParaEstorno.setRepasseOrigem(repasseComissao);
				repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(repasseParaEstorno);
			}
			comissionadoProposta.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
			this.save(comissionadoProposta);
		}
		
		ComissionadoProposta comissao = null;

		proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());
		for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
			double valorComissao = 0;
			if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
				valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
				valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
				valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
			comissao = new ComissionadoProposta();
			comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissao.setComissao(grupoProdutor.getComissao());
			comissao.setTipoComissao(grupoProdutor.getTipoComissao());
			comissao.setValorComissao(valorComissao);
			comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
			comissao.setProposta(proposta);
			this.save(comissao);

			proposta.getComissionadoPropostaCollection().add(comissao);
		}

		this.save(proposta); // efetiva alteração do grupo de venda e comissionados

		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByProposta", new Object[]{proposta.getId()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
			double premioLiquido = proposta.getPremioLiquido().doubleValue();
			for (int i=0;i<comissionadoProposta.size();i++){
				ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
				double valorRepasseIndividual = 0;
				if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
				}
				double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
				comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
				
				if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
				else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
				
				this.save(comissionado);
				RepasseComissao repasseComissao = new RepasseComissao();
				repasseComissao.setComissionado(comissionado);
				repasseComissao.setValorPago(valorRepasseIndividual);
				repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
				repasseComissao.setValorBase(valorPago);
				repasseComissao.setPercentualRepasse(comissionado.getComissao());
				repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
				repasseComissao.setBorderoLancamento(borderoLancamento);
				repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(repasseComissao);
			}
		}
	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void reprocessarGrupoDeVendaEComissionados(GrupoDeVenda grupoDeVendaAtual, GrupoDeVenda grupoDeVendaAnterior, ParcelasProposta parcelaSelecionada) throws Exception{
		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoProposta> comissionados = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
		
		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoProposta comissionadoProposta : comissionados) {
			List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
			for (RepasseComissao repasseComissao : repasses) {
				RepasseComissao repasseParaEstorno = new RepasseComissao();
				repasseParaEstorno.setComissionado(comissionadoProposta);
				repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
				repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
				repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
				repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
				repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
				repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
				repasseParaEstorno.setRepasseOrigem(repasseComissao);
				repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(repasseParaEstorno);
			}
			comissionadoProposta.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
			this.save(comissionadoProposta);
		}
		

		ComissionadoProposta comissao = null;
		Proposta proposta = (Proposta)this.find(parcelaSelecionada.getProposta());

		for(GrupoProdutor grupoProdutor : grupoDeVendaAtual.getGrupoProdutorCollection()){
			double valorComissao = 0;
			if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
				valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
				valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
				valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
			comissao = new ComissionadoProposta();
			comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissao.setComissao(grupoProdutor.getComissao());
			comissao.setTipoComissao(grupoProdutor.getTipoComissao());
			comissao.setValorComissao(valorComissao);
			comissao.setParcelasProposta(parcelaSelecionada);
			comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
			comissao.setProposta(proposta);
			this.save(comissao);
		}

		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 

		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaAndReferencia", new Object[]{proposta.getId(),parcelaSelecionada.getReferenciaParcela()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			List<ComissionadoProposta> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
			double premioLiquido = proposta.getPremioLiquido().doubleValue();
			for (int i=0;i<comissionadosAtuais.size();i++){
				ComissionadoProposta comissionado = (ComissionadoProposta)comissionadosAtuais.get(i);
				double valorRepasseIndividual = 0;
				if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
				}
				double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
				comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
				
				if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
				else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
				this.save(comissionado);
				RepasseComissao repasseComissao = new RepasseComissao();
				repasseComissao.setComissionado(comissionado);
				repasseComissao.setValorPago(valorRepasseIndividual);
				repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseComissao.setReferenciaParcela(borderoLancamento.getReferenciaParcela());
				repasseComissao.setValorBase(valorPago);
				repasseComissao.setPercentualRepasse(comissionado.getComissao());
				repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
				repasseComissao.setBorderoLancamento(borderoLancamento);
				repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(repasseComissao);
			}
		}
	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void reprocessarGrupoDeVendaEComissionados(List<ComissionadoProposta> comissionadosNovos, ParcelasProposta parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception{
		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoProposta> comissionadosAnteriores = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
		
		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoProposta comissionadoProposta : comissionadosAnteriores) {
			boolean comissionadoExistente = false;
			for (ComissionadoProposta comissionadoNovo : comissionadosNovos) {
				if (comissionadoNovo!=null){
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoProposta.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
			}

			if (!comissionadoExistente){
				List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
				for (RepasseComissao repasseComissao : repasses) {
					RepasseComissao repasseParaEstorno = new RepasseComissao();
					repasseParaEstorno.setComissionado(comissionadoProposta);
					repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
					repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
					repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
					repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
					repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
					repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
					repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseParaEstorno);
				}
				comissionadoProposta.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
				this.save(comissionadoProposta);
			}
		}
		

		for(ComissionadoProposta comissionadoNovo : comissionadosNovos){
			boolean comissionadoExistente = false;
			if (comissionadoNovo!=null){
				for (ComissionadoProposta comissionadoAnterior : comissionadosAnteriores) {
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoAnterior.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
				if (!comissionadoExistente){
					comissionadoNovo.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
					this.gerarNovoComissionado(comissionadoNovo, parcelaSelecionada);
				}
			}
		}

		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 
		
		// verifica se existem baixas de comissao na referencia modificada e gera os repasses para comissionados novos
		gerarRepasseLancamentosExistentes(parcelaSelecionada);

	}

	public void reprocessarGrupoDeVendaEComissionadosAgenciamento(List<ComissionadoAgenciamento> comissionadosNovos, Agenciamento parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception{
		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoAgenciamento> comissionadosAnteriores = this.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaSelecionada.getId()});
		
		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoAgenciamento comissionadoProposta : comissionadosAnteriores) {
			boolean comissionadoExistente = false;
			for (ComissionadoAgenciamento comissionadoNovo : comissionadosNovos) {
				if (comissionadoNovo!=null){
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoProposta.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
			}

			if (!comissionadoExistente){
				List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionadoProposta.getId()});
				for (RepasseComissao repasseComissao : repasses) {
					RepasseComissao repasseParaEstorno = new RepasseComissao();
					repasseParaEstorno.setAgenciado(comissionadoProposta);
					repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
					repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
					repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
					repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
					repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
					repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
					repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseParaEstorno);
				}
				comissionadoProposta.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
				this.save(comissionadoProposta);
			}
		}
		

		for(ComissionadoAgenciamento comissionadoNovo : comissionadosNovos){
			boolean comissionadoExistente = false;
			if (comissionadoNovo!=null){
				for (ComissionadoAgenciamento comissionadoAnterior : comissionadosAnteriores) {
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoAnterior.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
				if (!comissionadoExistente){
					comissionadoNovo.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
					this.gerarNovoComissionadoAgenciamento(comissionadoNovo, parcelaSelecionada);
				}
			}
		}

		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 
		
		// verifica se existem baixas de comissao na referencia modificada e gera os repasses para comissionados novos
		gerarRepasseAgenciamentoLancamentosExistentes(parcelaSelecionada);

	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void atualizarGrupoDeVendaEComissionados(List<ComissionadoProposta> comissionadosNovos, ParcelasProposta parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception{

		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoProposta> comissionadosAnteriores = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
		
		// adiciona os novos comissionados.
		for(ComissionadoProposta comissionadoNovo : comissionadosNovos){
			boolean comissionadoExistente = false;
			if (comissionadoNovo!=null){
				for (ComissionadoProposta comissionadoAnterior : comissionadosAnteriores) {
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoAnterior.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
				if (!comissionadoExistente){
					comissionadoNovo.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
					this.gerarNovoComissionado(comissionadoNovo, parcelaSelecionada);
				}
			}
		}

		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoProposta comissionadoProposta : comissionadosAnteriores) {
			boolean comissionadoExistente = false;
			for (ComissionadoProposta comissionadoNovo : comissionadosNovos) {
				if (comissionadoNovo!=null){
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoProposta.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
			}

			if (!comissionadoExistente){
				this.remove(comissionadoProposta);
			}
		}
		
		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 
		
		// verifica se existem baixas de comissao na referencia modificada e gera os repasses para comissionados novos
		gerarRepasseLancamentosExistentes(parcelaSelecionada);
	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void atualizarGrupoDeVendaEComissionadosAgenciamento(List<ComissionadoAgenciamento> comissionadosNovos, Agenciamento parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception{

		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoAgenciamento> comissionadosAnteriores = this.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaSelecionada.getId()});
		
		// adiciona os novos comissionados.
		for(ComissionadoAgenciamento comissionadoNovo : comissionadosNovos){
			boolean comissionadoExistente = false;
			if (comissionadoNovo!=null){
				for (ComissionadoAgenciamento comissionadoAnterior : comissionadosAnteriores) {
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoAnterior.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
				if (!comissionadoExistente){
					comissionadoNovo.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
					this.gerarNovoComissionadoAgenciamento(comissionadoNovo, parcelaSelecionada);
				}
			}
		}

		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoAgenciamento comissionadoProposta : comissionadosAnteriores) {
			boolean comissionadoExistente = false;
			for (ComissionadoAgenciamento comissionadoNovo : comissionadosNovos) {
				if (comissionadoNovo!=null){
					if (comissionadoNovo.getId()!=null && comissionadoNovo.getId().longValue()==comissionadoProposta.getId().longValue()){
						comissionadoExistente = true;
						break;
					}
				}
			}

			if (!comissionadoExistente){
				this.remove(comissionadoProposta);
			}
		}
		
		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 
		
		// verifica se existem baixas de comissao na referencia modificada e gera os repasses para comissionados novos
		gerarRepasseAgenciamentoLancamentosExistentes(parcelaSelecionada);
	}

	public void gerarNovoComissionado(ComissionadoProposta comissionadoNovo, ParcelasProposta parcelaSelecionada)throws Exception{
		ComissionadoProposta comissionadoProposta = new ComissionadoProposta();
		comissionadoProposta.setPessoa(comissionadoNovo.getPessoa());
		comissionadoProposta.setComissao(comissionadoNovo.getComissao());
		comissionadoProposta.setTipoComissao(comissionadoNovo.getTipoComissao());
		comissionadoProposta.setValorComissao(comissionadoNovo.getValorComissao());
		comissionadoProposta.setSituacao(comissionadoNovo.getSituacao());
		comissionadoProposta.setParcelasProposta(parcelaSelecionada);
		comissionadoProposta.setProposta(parcelaSelecionada.getProposta());
		this.save(comissionadoProposta);
		this.refresh(comissionadoProposta);
	}

	public void gerarNovoComissionadoAgenciamento(ComissionadoAgenciamento comissionadoNovo, Agenciamento agenciamento)throws Exception{
		ComissionadoAgenciamento comissionadoAgenciamento = new ComissionadoAgenciamento();
		comissionadoAgenciamento.setPessoa(comissionadoNovo.getPessoa());
		comissionadoAgenciamento.setComissao(comissionadoNovo.getComissao());
		comissionadoAgenciamento.setTipoComissao(comissionadoNovo.getTipoComissao());
		comissionadoAgenciamento.setValorComissao(comissionadoNovo.getValorComissao());
		comissionadoAgenciamento.setSituacao(comissionadoNovo.getSituacao());
		comissionadoAgenciamento.setAgenciamento(agenciamento);
		comissionadoAgenciamento.setProposta(agenciamento.getProposta());
		this.save(comissionadoAgenciamento);
		this.refresh(comissionadoAgenciamento);
	}

	public void gerarRepasseLancamentosExistentes(ParcelasProposta parcelaSelecionada) throws Exception{
		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaAndReferencia", new Object[]{parcelaSelecionada.getProposta().getId(),parcelaSelecionada.getReferenciaParcela()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			List<ComissionadoProposta> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
			double premioLiquido = parcelaSelecionada.getValorParcela().doubleValue();
			for (int i=0;i<comissionadosAtuais.size();i++){
				ComissionadoProposta comissionado = (ComissionadoProposta)comissionadosAtuais.get(i);
				boolean existeRepasse = false;

				List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionado.getId()});
				if (repasses.size()>0){
					existeRepasse = true;
				}
				if (!existeRepasse){
					double valorRepasseIndividual = 0;
					if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
					comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
					if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
					else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
					this.save(comissionado);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseComissao.setReferenciaParcela(borderoLancamento.getReferenciaParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					repasseComissao.setBorderoLancamento(borderoLancamento);
					repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseComissao);
				}
			}
		}
	}

	public void gerarRepasseAgenciamentoLancamentosExistentes(Agenciamento parcelaSelecionada) throws Exception{
		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaAndReferencia", new Object[]{parcelaSelecionada.getProposta().getId(),parcelaSelecionada.getReferenciaParcela()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			List<ComissionadoAgenciamento> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaSelecionada.getId()});
			double premioLiquido = parcelaSelecionada.getValorAgenciamento().doubleValue();
			for (int i=0;i<comissionadosAtuais.size();i++){
				ComissionadoAgenciamento comissionado = (ComissionadoAgenciamento)comissionadosAtuais.get(i);
				boolean existeRepasse = false;

				List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionado.getId()});
				if (repasses.size()>0){
					existeRepasse = true;
				}
				if (!existeRepasse){
					double valorRepasseIndividual = 0;
					if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
					comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
					if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
					else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
					this.save(comissionado);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setAgenciado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseComissao.setReferenciaParcela(borderoLancamento.getReferenciaParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					repasseComissao.setBorderoLancamento(borderoLancamento);
					repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseComissao);
				}
			}
		}
	}

	/**
	 * Metodo para gerar repasses para novo comissionado de proposta de vida empresarial ativa com baxias de comissões realizada
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	public void processarRepasseNovoComissionado(ComissionadoProposta comissionado, ParcelasProposta parcelaSelecionada) throws Exception{
		parcelaSelecionada = (ParcelasProposta)this.find(parcelaSelecionada);
		Proposta proposta = (Proposta)this.find(parcelaSelecionada.getProposta());
		double valorRepasseIndividual = 0;

		List<BorderoLancamento> comissoesBaixadasParcelaAtual = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaAndReferencia", new Object[]{proposta.getId(),parcelaSelecionada.getReferenciaParcela()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadasParcelaAtual) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			double premioLiquido = parcelaSelecionada.getValorParcela().doubleValue();

			valorRepasseIndividual = 0;
			if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
				valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
			}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
				valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
			}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
				valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
			}
			double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
			comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
			
			if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
				comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
			else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
				comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
			
			this.save(comissionado);
			RepasseComissao repasseComissao = new RepasseComissao();
			repasseComissao.setComissionado(comissionado);
			repasseComissao.setValorPago(valorRepasseIndividual);
			repasseComissao.setDataLancamento(borderoLancamento.getBorderoComissao().getDataDocumento());
			repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
			repasseComissao.setValorBase(valorPago);
			repasseComissao.setPercentualRepasse(comissionado.getComissao());
			repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
			repasseComissao.setBorderoLancamento(borderoLancamento);
			this.save(repasseComissao);
		}
		// se for p/ demais parcelas, ira gerar o comissionado pra demais parcelas e aplicar os repasses de acordo e ira verificar se existem 
		// baixas existentes, mesmo que seja parcelas futuras, pois pode se tratar de um ajuste passado.
		if(this.demaisParcelas.equals("SIM")){
			// Irá adicionar a qtde de meses relativa a frequencia de parcelas contratada
			Calendar c = Calendar.getInstance();
			c.setTime(parcelaSelecionada.getReferenciaParcela());
			c.add(Calendar.MONTH, proposta.getQtdeParcelas().intValue());

			List<ParcelasProposta> demaisParcelas = this.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{comissionado.getProposta().getId(),c.getTime()});
			for (ParcelasProposta parcelasProposta : demaisParcelas) {
				valorRepasseIndividual = 0;

				// calcula o valor do repasse com base nos percentuais do produtor incluido e nos valores das demais parcelas.
				if (comissionado.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_COMISSAO){
					valorRepasseIndividual = parcelasProposta.getValorComissao() * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ){
					valorRepasseIndividual = parcelasProposta.getValorParcela() * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==Constants.TP_COM_VALOR){
					valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
				}
				
				ComissionadoProposta comissionadosDemaisParcelas = new ComissionadoProposta();
				comissionadosDemaisParcelas.setComissao(comissionado.getComissao());
				comissionadosDemaisParcelas.setParcelasProposta(parcelasProposta);
				comissionadosDemaisParcelas.setPessoa(comissionado.getPessoa());
				comissionadosDemaisParcelas.setProposta(comissionado.getProposta());
				// como será verificado se houve baixas nos lotes, setar em aberto
				comissionadosDemaisParcelas.setSituacao(Constants.ST_EM_ABERTO);
				comissionadosDemaisParcelas.setTipoComissao(comissionado.getTipoComissao());
				comissionadosDemaisParcelas.setValorComissao(valorRepasseIndividual);
				comissionadosDemaisParcelas.setValorPago(new Double(0));
				this.save(comissionadosDemaisParcelas);

				// buscar comissoes baixadas para reaplicar a baixa no comissionado e gerar repasse.
				List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaAndReferencia", new Object[]{proposta.getId(),parcelasProposta.getReferenciaParcela()});
				for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
					double valorPago = borderoLancamento.getValorComissao().doubleValue();
					double premioLiquido = parcelasProposta.getValorParcela().doubleValue();

					if (comissionadosDemaisParcelas.getTipoComissao().intValue()==0  && comissionadosDemaisParcelas.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionadosDemaisParcelas.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionadosDemaisParcelas.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionadosDemaisParcelas.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionadosDemaisParcelas.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionadosDemaisParcelas.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionadosDemaisParcelas.getValorPago()==null ? 0 : comissionadosDemaisParcelas.getValorPago().doubleValue();
					comissionadosDemaisParcelas.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
					// 
					if (comissionadosDemaisParcelas.getValorPago().doubleValue()>=comissionadosDemaisParcelas.getValorComissao().doubleValue())
						comissionadosDemaisParcelas.setSituacao(Constants.ST_BAIXADO); // pago total
					else if (comissionadosDemaisParcelas.getValorPago().doubleValue()<comissionadosDemaisParcelas.getValorComissao().doubleValue())
						comissionadosDemaisParcelas.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
					
					this.save(comissionadosDemaisParcelas);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionadosDemaisParcelas);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(borderoLancamento.getBorderoComissao().getDataDocumento());
					repasseComissao.setReferenciaParcela(borderoLancamento.getReferenciaParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionadosDemaisParcelas.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					repasseComissao.setBorderoLancamento(borderoLancamento);
					this.save(repasseComissao);
				}
			}
		}
		
	}
	 */

	/**
	 * Metodo para gerar repasses para novo comissionado de proposta de vida empresarial ativa com baxias de comissões realizada
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void processarRepasseNovoComissionado(ComissionadoProposta comissionado) throws Exception{
		comissionado = (ComissionadoProposta)this.find(comissionado);
		Proposta proposta = (Proposta)this.find(Proposta.class,comissionado.getProposta().getId());

		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByProposta", new Object[]{proposta.getId()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			CorretoraTipoLancamento corretoraTipoLancamento = (CorretoraTipoLancamento)this.genericFindByNamedQuery("getCorretoraTipoLancamentoByTipoLancamentoAndCorretora", new Object[]{borderoLancamento.getTipoLancamento().getId(), borderoLancamento.getBorderoComissao().getCorretora().getId()}).get(0);
			if (corretoraTipoLancamento.getIsRepasse()){
				double valorPago = borderoLancamento.getValorComissao().doubleValue();
				double premioLiquido = proposta.getPremioLiquido().doubleValue();

				double valorRepasseIndividual = 0;
				if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
				}
				double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
				comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
				
				if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_BAIXADO); // pago total
				else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(Constants.ST_EM_ABERTO); // pago parcial
				
				this.save(comissionado);
				RepasseComissao repasseComissao = new RepasseComissao();
				repasseComissao.setComissionado(comissionado);
				repasseComissao.setValorPago(valorRepasseIndividual);
				repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
				repasseComissao.setValorBase(valorPago);
				repasseComissao.setPercentualRepasse(comissionado.getComissao());
				repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
				repasseComissao.setBorderoLancamento(borderoLancamento);
				repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(repasseComissao);
			}
		}
	}

	/**
	 * Metodo para processar troca de grupo de venda onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void reprocessarGrupoDeVendaEComissionadosAgenciamento(GrupoDeVenda grupoDeVendaAtual, GrupoDeVenda grupoDeVendaAnterior, Agenciamento parcelaSelecionada) throws Exception{
		// seleciona comissionados existentes da parcela selecionada
		List<ComissionadoAgenciamento> comissionados = this.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaSelecionada.getId()});
		
		// Estornar os comissionados do grupo de venda anterior
		for (ComissionadoAgenciamento comissionadoAgenciamento : comissionados) {
			List<RepasseComissao> repasses = this.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionadoAgenciamento.getId()});
			for (RepasseComissao repasseComissao : repasses) {
				RepasseComissao repasseParaEstorno = new RepasseComissao();
				repasseParaEstorno.setAgenciado(comissionadoAgenciamento);
				repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
				repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
				repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
				repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
				repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
				repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
				repasseParaEstorno.setRepasseOrigem(repasseComissao);
				repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				
				this.save(repasseParaEstorno);
			}
			comissionadoAgenciamento.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
			this.save(comissionadoAgenciamento);
		}
		

		ComissionadoAgenciamento comissao = null;
		Proposta proposta = (Proposta)this.find(parcelaSelecionada.getProposta());

		for(GrupoProdutor grupoProdutor : grupoDeVendaAtual.getGrupoProdutorCollection()){
			double valorComissao = 0;
			if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
				valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
				valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
				valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
			comissao = new ComissionadoAgenciamento();
			comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissao.setComissao(grupoProdutor.getComissao());
			comissao.setTipoComissao(grupoProdutor.getTipoComissao());
			comissao.setValorComissao(valorComissao);
			comissao.setAgenciamento(parcelaSelecionada);
			comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
			comissao.setProposta(proposta);
			this.save(comissao);
		}

		// efetiva alteração do grupo de venda e comissionados
		parcelaSelecionada.setGrupoDeVenda(grupoDeVendaAtual);
		this.save(parcelaSelecionada); 

		List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByPropostaTipoAgenciamento", new Object[]{proposta.getId(), parcelaSelecionada.getReferenciaParcela()});
		for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
			double valorPago = borderoLancamento.getValorComissao().doubleValue();
			List<ComissionadoAgenciamento> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadosAgenciamentoAtivosByPropostaId", new Object[]{parcelaSelecionada.getId()});
			double premioLiquido = proposta.getPremioLiquido().doubleValue();
			for (int i=0;i<comissionadosAtuais.size();i++){
				ComissionadoAgenciamento comissionado = (ComissionadoAgenciamento)comissionadosAtuais.get(i);
				double valorRepasseIndividual = 0;
				if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
					valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
				}
				double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
				comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
				
				if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(2); // pago total
				else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(1); // pago parcial
				this.save(comissionado);
				RepasseComissao repasseComissao = new RepasseComissao();
				repasseComissao.setAgenciado(comissionado);
				repasseComissao.setValorPago(valorRepasseIndividual);
				repasseComissao.setDataLancamento(new Date(new java.util.Date().getTime()));
				repasseComissao.setReferenciaParcela(borderoLancamento.getReferenciaParcela());
				repasseComissao.setValorBase(valorPago);
				repasseComissao.setPercentualRepasse(comissionado.getComissao());
				repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
				repasseComissao.setBorderoLancamento(borderoLancamento);
				this.save(repasseComissao);
			}
		}
	}

	/**
	 * Metodo para processar exclusao de um comissionado onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void estornarComissionado(ComissionadoProposta comissionadoRemovido, Proposta proposta, String demaisParcelas) throws Exception{
		this.demaisParcelas = demaisParcelas;
		this.estornarComissionado(comissionadoRemovido,proposta);
	}
	
	public void estornarComissionado(ComissionadoProposta comissionadoRemovido, Proposta proposta) throws Exception{
		// quando comissionado tiver relacionamento com a parcela, significa ramo Vida Emrpesarial, onde o processo é diferente.
		if (comissionadoRemovido.getParcelasProposta()!=null && comissionadoRemovido.getParcelasProposta().getId()!=null){
			// se for remover comissionado para demais parcelas
			if(this.demaisParcelas.equals("SIM")){
				List<ParcelasProposta> demaisParcelas = this.genericFindByNamedQuery("getParcelasVidaEmpresarialApartirParcelaAtual", new Object[]{comissionadoRemovido.getProposta().getId(),comissionadoRemovido.getParcelasProposta().getReferenciaParcela()});
				for (ParcelasProposta parcelasProposta : demaisParcelas) {
					List<ComissionadoProposta> comissionadosDemaisParcelas = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelasProposta.getId()});
					for (ComissionadoProposta comissionado : comissionadosDemaisParcelas) {
						if (comissionadoRemovido.getPessoa().getId().longValue()==comissionado.getPessoa().getId().longValue()){
							List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionado.getId()});
							if (repasse.size()>0){ // existe repasse para o comissionado removido, então reprocessar as baixas
								for (RepasseComissao repasseComissao : repasse) {
									RepasseComissao repasseParaEstorno = new RepasseComissao();
									repasseParaEstorno.setComissionado(comissionado);
									repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
									repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
									repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
									repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
									repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
									repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
									repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
									repasseParaEstorno.setRepasseOrigem(repasseComissao);
									repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
									this.save(repasseParaEstorno);
								}
								comissionado.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
								this.save(comissionado);
							}else{
								this.remove(comissionado);
							}
						}
					}
				}
			}else{
				List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoRemovido.getId()});
				if (repasse.size()>0){ // existe repasse para o comissionado removido, então reprocessar as baixas
					//this.propostaService.estornarComissionado(comissionadoRemovido, this.proposta);
					for (RepasseComissao repasseComissao : repasse) {
						RepasseComissao repasseParaEstorno = new RepasseComissao();
						repasseParaEstorno.setComissionado(comissionadoRemovido);
						repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
						repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
						repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
						repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
						repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
						repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
						repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
						repasseParaEstorno.setRepasseOrigem(repasseComissao);
						repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
						this.save(repasseParaEstorno);
					}
					comissionadoRemovido.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
					this.save(comissionadoRemovido);
				}else{
					this.remove(comissionadoRemovido);
				}
			}
		}else{
			List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoRemovido.getId()});
			if (repasse.size()>0){ // existe repasse para o comissionado removido, então somente estornar as baixas e o comissionado. 
				for (RepasseComissao repasseComissao : repasse) {
					RepasseComissao repasseParaEstorno = new RepasseComissao();
					repasseParaEstorno.setComissionado(comissionadoRemovido);
					repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseParaEstorno.setNroDaParcela(repasseComissao.getNroDaParcela());
					repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
					repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
					repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
					repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
					repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
					repasseParaEstorno.setRepasseOrigem(repasseComissao);
					repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseParaEstorno);
				}
				comissionadoRemovido.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
				this.save(comissionadoRemovido);
			}else{
				this.remove(comissionadoRemovido);
			}
		}

		// Removi esta parte do codigo porque comissionado removido com repasse, gera somente os estornos e seta o 
		// comissionado como estornado e mais nada a fazer.
		
/*		// set parcela do vida emrpesarial se houver, senão são outros ramos.
		ParcelasProposta parcelaVidaEmpesarial = comissionadoRemovido.getParcelasProposta();
		GrupoDeVenda grupoDeVendaParcelaVidaEmpresarial = null;
		
		List<ComissionadoProposta> comissionadosAtivos = null;

		// se for uma parcela do vida empresarial, ira carregar somente comissionados referente a parcela em questao.
		if (parcelaVidaEmpesarial!=null && parcelaVidaEmpesarial.getId()!=null){
			grupoDeVendaParcelaVidaEmpresarial = (GrupoDeVenda)this.find(parcelaVidaEmpesarial.getGrupoDeVenda());
			comissionadosAtivos = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaVidaEmpesarial.getId()});
		}else{
			comissionadosAtivos = this.genericFindByNamedQuery("getComissionadosAtivosByPropostaId", new Object[]{proposta.getId()});
		}

		if (comissionadosAtivos.size()==0 && grupoDeVendaParcelaVidaEmpresarial == null){ // nao existem comissionados ativos, devera carregar comissionados do grupo de venda corrente
			ComissionadoProposta comissao = null;

			proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());
			for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
				comissao = new ComissionadoProposta();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
				comissao.setProposta(proposta);
				this.save(comissao);

				proposta.getComissionadoPropostaCollection().add(comissao);
			}

			this.save(proposta); 

			List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByProposta", new Object[]{proposta.getId()});
			for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
				double valorPago = borderoLancamento.getValorComissao().doubleValue();
				List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
				double premioLiquido = proposta.getPremioLiquido().doubleValue();
				for (int i=0;i<comissionadoProposta.size();i++){
					ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
					double valorRepasseIndividual = 0;
					if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
					comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
					if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(2); // pago total
					else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(1); // pago parcial
					this.save(comissionado);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(borderoLancamento.getBorderoComissao().getDataDocumento());
					repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					this.save(repasseComissao);
				}
			}
		}else if (comissionadosAtivos.size()==0 && grupoDeVendaParcelaVidaEmpresarial != null){
			 // nao existem comissionados ativos, devera carregar comissionados do grupo de venda da parcela de vida empresarial corrente
			ComissionadoProposta comissao = null;

			proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());
			for(GrupoProdutor grupoProdutor : grupoDeVendaParcelaVidaEmpresarial.getGrupoProdutorCollection()){
				comissao = new ComissionadoProposta();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setParcelasProposta(parcelaVidaEmpesarial);
				comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
				comissao.setProposta(proposta);
				this.save(comissao);
			}

			List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByProposta", new Object[]{proposta.getId()});
			for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
				double valorPago = borderoLancamento.getValorComissao().doubleValue();
				List<ComissionadoProposta> comissionadoProposta = this.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{parcelaVidaEmpesarial.getId()});

				double premioLiquido = proposta.getPremioLiquido().doubleValue();
				for (int i=0;i<comissionadoProposta.size();i++){
					ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
					double valorRepasseIndividual = 0;
					if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() < Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
					comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
					if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(2); // pago total
					else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(1); // pago parcial
					this.save(comissionado);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(borderoLancamento.getBorderoComissao().getDataDocumento());
					repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					this.save(repasseComissao);
				}
			}
		}
*/	}

	/**
	 * Metodo para processar exclusao de um comissionadoAgenciamento onde havera Estorno de repasse, estorno de comissionado e geracao de repasse
	 * baseado em comissoes pagas anteriormente.
	 * 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public void reprocessarComissionadoAgenciamento(ComissionadoAgenciamento comissionadoRemovido, Proposta proposta) throws Exception{
		List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByAgenciado", new Object[]{comissionadoRemovido.getId()});
		for (RepasseComissao repasseComissao : repasse) {
			RepasseComissao repasseParaEstorno = new RepasseComissao();
			repasseParaEstorno.setAgenciado(comissionadoRemovido);
			repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
			repasseParaEstorno.setReferenciaParcela(repasseComissao.getReferenciaParcela());
			repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
			repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
			repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
			repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
			repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
			repasseParaEstorno.setRepasseOrigem(repasseComissao);
			repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
			this.save(repasseParaEstorno);
		}
		comissionadoRemovido.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
		this.save(comissionadoRemovido);
	}

	public void excluirProposta(Proposta proposta) throws Exception{
		try {

			Proposta propostaEndossada = proposta.getPropostaEndossada();
			Proposta propostaRenovada = proposta.getPropostaRenovada();
			
			this.executeNamedQuery("deleteComissionadoPropostaByPropostaId", new Object[]{proposta.getId()});
			this.executeNamedQuery("deletePropostaAutomovelByProposta", new Object[]{proposta.getId()});
			
			this.getEntityManager().remove(proposta);
			if (propostaEndossada!=null && propostaEndossada.getId()!=null)
				this.executeNamedQuery("updateSituacaoOperacionalProposta", new Object[]{Constants.SITUACAO_ATIVA, propostaEndossada.getId()});
			if (propostaRenovada!=null && propostaRenovada.getId()!=null)
				this.executeNamedQuery("updateSituacaoOperacionalProposta", new Object[]{Constants.SITUACAO_ATIVA, propostaRenovada.getId()});
			
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

	@SuppressWarnings("finally")
	public Proposta aplicaEndosso(Proposta proposta, Long operacao, Long tipoEndosso) throws Exception{
		try {
			// Se for cancelamento de endosso de cancelamento, irar reativar todas as propostas no historico.
			if (operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO_CANCELAMENTO)){
				// Checa se a proposta selecionada na reativação é a principal ou Não
				// Se Não for a principal o campo propostaOriginal será valido.
				if (proposta.getPropostaOriginal()!=null){
					proposta = (Proposta)this.find(Proposta.class, proposta.getPropostaOriginal().getId());
					proposta.setSituacaoOperacional(Constants.SITUACAO_ENDOSSADA);
					this.save(proposta);
					List<Proposta> propostas = this.genericFindByNamedQuery("getPropostaByPropostaOriginal", new Object[]{proposta.getId()});
					for (int i=0;i<propostas.size();i++){
						Proposta propostaEndossada = propostas.get(i);
						if (i==0){
							propostaEndossada.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
							this.save(propostaEndossada);
						}else{
							propostaEndossada.setSituacaoOperacional(Constants.SITUACAO_ENDOSSADA);
							this.save(propostaEndossada);
						}
							
					}
				}else{
					// Se o campo propostaOriginal tiver nulo, a proposta selecionada é a proposta principal.
					List<Proposta> propostas = this.genericFindByNamedQuery("getPropostaByPropostaOriginal", new Object[]{proposta.getId()});
					if (propostas.size()==0){
						proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
						this.save(proposta);
					}else{
						proposta.setSituacaoOperacional(Constants.SITUACAO_ENDOSSADA);
						this.save(proposta);
						for (int i=0;i<propostas.size();i++){
							Proposta propostaEndossada = propostas.get(i);
							if (i==0){
								proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);
								this.save(propostaEndossada);
							}else{
								proposta.setSituacaoOperacional(Constants.SITUACAO_ENDOSSADA);
								this.save(propostaEndossada);
							}
								
						}
					}
				}
			// Opcao de cancelar um endosso especifico, esta operacao Não pode ser revertida.
			}else if (operacao.equals(Constants.OPERACAO_CANCELAR_ENDOSSO)){
				proposta.setSituacaoOperacional(Constants.SITUACAO_CANCELADA);
				Proposta propostaEndossada = proposta.getPropostaEndossada();
				if (propostaEndossada!=null && propostaEndossada.getId()!=null){
					propostaEndossada = (Proposta)this.find(Proposta.class, propostaEndossada.getId());
					this.executeNamedQuery("updateSituacaoOperacionalProposta", new Object[]{Constants.SITUACAO_ATIVA, propostaEndossada.getId()});
				}
				proposta.setPropostaEndossada(null);
				// Opcao de cancelar uma proposta ou apolice, esta operacao Não pode ser revertida.
			}else if (operacao.equals(Constants.OPERACAO_CANCELAR_PROPOSTA)){
				proposta.setSituacaoOperacional(Constants.SITUACAO_CANCELADA);
				if (proposta.getPropostaRenovada()!=null && proposta.getPropostaRenovada().getId()!=null){
					proposta.getPropostaRenovada().setSituacaoOperacional(Constants.SITUACAO_ATIVA);
					this.save(proposta.getPropostaRenovada());
				}
				this.save(proposta);
			// demais opcoes de endosso de alteracao e de endosso de cancelamento.
			}else{

				Proposta propostaDB = (Proposta)this.find(Proposta.class, proposta.getId());
				if (propostaDB.getSituacaoOperacional().equals(Constants.SITUACAO_ENDOSSADA)){
					proposta = propostaDB;
					throw new Exception("Esta proposta já se encontra endossada por outro usuario, cheque ou tente outra vez.");
				}
				/*if (proposta.getSituacaoOperacional().equals(Constants.SITUACAO_ENDOSSADA)){
					if (proposta.getPropostaOriginal()!=null)
						proposta = (Proposta)this.find(Proposta.class, proposta.getPropostaOriginal().getId());
					List<Proposta> propostas = this.genericFindByNamedQuery("getPropostaByPropostaOriginal", new Object[]{proposta.getId()});

					for (int i=0;i<propostas.size();i++){
						Proposta iProposta = propostas.get(i);
						if (iProposta.getSituacaoOperacional().equals(Constants.SITUACAO_ATIVA)){
							proposta = iProposta;
							break;
						}
					}
				}*/

				Proposta propostaEndossada = proposta;
				
				proposta = (Proposta)Util.cloneBean(propostaEndossada);
				proposta.setVistoriadora(propostaEndossada.getVistoriadora());
				proposta.setAutorGeracao(null);
				proposta.setDataGeracao(null);
				proposta.setDataProposta(new Date(new java.util.Date().getTime()));
				proposta.setDataTransmissao(null);
				proposta.setPremioLiquido(new Double(0));
				proposta.setCustoApolice(new Double(0));
				proposta.setDesconto(new Double(0));
				proposta.setIof(Proposta.IOF_PERCENTUAL);
				proposta.setPremioTotal(new Double(0));
				proposta.setFator(propostaEndossada.getFator());
				proposta.setQtdeParcelas(0L);
				proposta.setValor1aParcela(new Double(0));
				proposta.setValorDemaisParcelas(new Double(0));
				proposta.setId(null);
				proposta.setInicioVigencia(new Date(new java.util.Date().getTime()));
				proposta.setNroPropostaSeg(null);
				proposta.setNroEndosso("");
				proposta.setDataEndosso(null);
				proposta.setNumero(this.getSequenciaNumeroProposta());

				if (tipoEndosso!=null){
					Endosso endosso = (Endosso)this.find(Endosso.class,tipoEndosso);
					proposta.setTipoEndosso(endosso);
				}
				proposta.setPropostaEndossada(propostaEndossada);
				propostaEndossada.setSituacaoOperacional(Constants.SITUACAO_ENDOSSADA);
				if (propostaEndossada.getPropostaOriginal()==null || propostaEndossada.getPropostaOriginal().getId()==null){
					proposta.setPropostaOriginal(propostaEndossada);
				}else
					proposta.setPropostaOriginal(propostaEndossada.getPropostaOriginal());
					
				if (propostaEndossada.getPropostaInicial()==null || propostaEndossada.getPropostaInicial().getId()==null){
					proposta.setPropostaInicial(propostaEndossada);
				}else
					proposta.setPropostaInicial(propostaEndossada.getPropostaInicial());

				if (operacao.equals(Constants.OPERACAO_ENDOSSO_CANCELAMENTO))
					proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO_ENDOSSO_CANCELAMENTO);
				else
					proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO_ENDOSSO);

				proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);

				this.persisteProposta(propostaEndossada);
				this.save(propostaEndossada);
				this.persisteProposta(proposta);
				this.save(proposta);
				
				proposta = (Proposta)this.find(proposta);

				/*if (operacao.equals(Constants.OPERACAO_ENDOSSO_CANCELAMENTO)){
					if (proposta.getPropostaOriginal()!=null && proposta.getPropostaOriginal().getId()!=null){
						//this.executeNamedQuery("updateSituacaoOperacionalProposta", new Object[]{Constants.SITUACAO_ENDOSSADA, proposta.getPropostaOriginal().getId()});
						//this.executeNamedQuery("updateSituacaoOperacionalPropostaPrincipal", new Object[]{Constants.SITUACAO_CANCELADA, proposta.getPropostaOriginal().getId(), proposta.getId()});
					}
				}*/
				
				this.copyDadosProposta(propostaEndossada, proposta);
			}
			
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
			return proposta;
		}
	}
	
	@SuppressWarnings("finally")
	public Proposta renovacaoPropria(Proposta proposta, Seguradora seguradora) throws Exception{
		try {

			Proposta propostaDB = (Proposta)this.find(Proposta.class, proposta.getId());
			if (propostaDB.getSituacaoOperacional().equals(Constants.SITUACAO_RENOVADA)){
				proposta = propostaDB;
				throw new Exception("Esta proposta já se encontra renovada por outro usuario, cheque ou tente outra vez.");
			}
			/*if (proposta.getSituacaoOperacional().equals(Constants.SITUACAO_ENDOSSADA)){
				// Set a proposta endossada como sendo a proposta original quando houve.
				if (proposta.getPropostaOriginal()!=null)
					proposta = (Proposta)this.find(Proposta.class, proposta.getPropostaOriginal().getId());
				List<Proposta> propostas = this.genericFindByNamedQuery("getPropostaByPropostaOriginal", new Object[]{proposta.getId()});

				for (int i=0;i<propostas.size();i++){
					Proposta iProposta = propostas.get(i);
					if (iProposta.getSituacaoOperacional().equals(Constants.SITUACAO_ATIVA)){
						proposta = iProposta;
						break;
					}
				}
			}*/

			Proposta propostaRenovada = proposta;
			
			proposta = (Proposta)Util.cloneBean(propostaRenovada);
			proposta.setSeguradora(seguradora);
			proposta.setVistoriadora(propostaRenovada.getVistoriadora());
			proposta.setAutorGeracao(null);
			proposta.setDataGeracao(null);
			proposta.setDataProposta(new Date(new java.util.Date().getTime()));
			proposta.setDataTransmissao(null);
			proposta.setPremioLiquido(new Double(0));
			proposta.setCustoApolice(new Double(0));
			proposta.setDesconto(new Double(0));
			proposta.setIof(Proposta.IOF_PERCENTUAL);
			proposta.setPremioTotal(new Double(0));
			proposta.setFator(0.0);
			proposta.setQtdeParcelas(0L);
			proposta.setValor1aParcela(new Double(0));
			proposta.setValorDemaisParcelas(new Double(0));
			proposta.setClausulaSeguro("");
			proposta.setNroApolice("");
			proposta.setNroEndosso("");
			proposta.setTipoEndosso(null);
			proposta.setDataEndosso(null);
			proposta.setDataBaixaApolice(null);
			proposta.setDataBaixaEndosso(null);
			proposta.setDataLanctoApolice(null);
			proposta.setDataLanctoEndosso(null);
			proposta.setDataRecebApolice(null);
			proposta.setDataRecebEndosso(null);
			proposta.setCodigoIdentificacao("");
			proposta.setDataEmissaoApolice(null);
			proposta.setPropostaOriginal(null);
			proposta.setPropostaEndossada(null);
			proposta.setTipoProposta(Constants.TP_PROP_RENOVACAO_PROPRIA);
			proposta.setId(null);
			
			if (propostaRenovada.getPropostaRenovada()==null){
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(propostaRenovada.getInicioVigencia());
				calendar.add(Calendar.YEAR, 1);
				//adiciona um ano ao inicio da vigencia
				proposta.setInicioVigencia(new Date(calendar.getTimeInMillis()));
				calendar.setTime(propostaRenovada.getTerminoVigencia());
				calendar.add(Calendar.YEAR, 1);
				//adiciona um ano ao termino da vigencia
				proposta.setTerminoVigencia(new Date(calendar.getTimeInMillis()));
			}/*else{
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(propostaRenovada.getPropostaOriginal().getInicioVigencia());
				calendar.add(Calendar.YEAR, 1);
				//adiciona um ano ao inicio da vigencia
				proposta.setInicioVigencia(new Date(calendar.getTimeInMillis()));
				calendar.setTime(propostaRenovada.getPropostaOriginal().getTerminoVigencia());
				calendar.add(Calendar.YEAR, 1);
				//adiciona um ano ao termino da vigencia
				proposta.setTerminoVigencia(new Date(calendar.getTimeInMillis()));
			}*/
			
			if (propostaRenovada.getPropostaInicial()==null || propostaRenovada.getPropostaInicial().getId()==null){
				proposta.setPropostaInicial(propostaRenovada);
			}else
				proposta.setPropostaInicial(propostaRenovada.getPropostaInicial());

			proposta.setNroPropostaSeg(null);
			proposta.setNumero(this.getSequenciaNumeroProposta());
			//proposta.setPropostaEndossada(propostaRenovada);
			propostaRenovada.setSituacaoOperacional(Constants.SITUACAO_RENOVADA);

			/*if (propostaRenovada.getPropostaOriginal()==null || propostaRenovada.getPropostaOriginal().getId()==null){
				proposta.setPropostaOriginal(propostaRenovada);
			}else*/
			proposta.setPropostaRenovada(propostaRenovada);
				
			proposta.setStatusOperacional(Constants.STATUS_OPER_PEDIDO);
			proposta.setSituacaoOperacional(Constants.SITUACAO_ATIVA);

			if (!proposta.getSeguradora().getId().equals(propostaRenovada.getSeguradora().getId()))
				proposta.setPerfil(seguradora.getPerfilCollection().size()>0 ? seguradora.getPerfilCollection().get(0) : null);

			this.persisteProposta(propostaRenovada);
			this.save(propostaRenovada);
			this.persisteProposta(proposta);
			this.save(proposta);
			
			proposta = (Proposta)this.find(proposta);

			/*if (operacao.equals(Constants.OPERACAO_ENDOSSO_CANCELAMENTO)){
				if (proposta.getPropostaOriginal()!=null && proposta.getPropostaOriginal().getId()!=null){
					//this.executeNamedQuery("updateSituacaoOperacionalProposta", new Object[]{Constants.SITUACAO_ENDOSSADA, proposta.getPropostaOriginal().getId()});
					//this.executeNamedQuery("updateSituacaoOperacionalPropostaPrincipal", new Object[]{Constants.SITUACAO_CANCELADA, proposta.getPropostaOriginal().getId(), proposta.getId()});
				}
			}*/
			
			this.copyDadosProposta(propostaRenovada, proposta);
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
			return proposta;
		}
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

	public void copyDadosProposta(Proposta propostaEndossada, Proposta proposta) throws Exception{};
	
	public void persisteProposta(Proposta proposta){
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
			proposta.setGrupoDeVenda(proposta.getCliente().getGrupoDeVenda());
		}
		if(proposta.getPropostaEndossada() == null || proposta.getPropostaEndossada().getId() == null){
			proposta.setPropostaEndossada(null);
		}
		if(proposta.getPropostaOriginal() == null || proposta.getPropostaOriginal().getId() == null){
			proposta.setPropostaOriginal(null);
		}
		if(proposta.getTipoEndosso() == null || proposta.getTipoEndosso().getId() == null){
			proposta.setTipoEndosso(null);
		}
	}
	
	/**
	 * Metodo criado para corrigir comissionados 
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	private void reprocessarTodosComissionados() throws Exception{
		List<Proposta> propostas = (List<Proposta>)this.genericFindBySQLQuery("select p from Proposta p where p.statusOoperacional in (2,4,6,7,9,10) and p.corretora.id=8050", null);

		for (Proposta proposta : propostas) {

			List<ComissionadoProposta> comissionadosAtivos = this.genericFindByNamedQuery("getComissionadosAtivosByPropostaId", new Object[]{proposta.getId()});
	
			for (ComissionadoProposta comissionadoProposta : comissionadosAtivos) {
				List<RepasseComissao> repasse = this.genericFindByNamedQuery("getRepasseComissaoByComissionado", new Object[]{comissionadoProposta.getId()});
				for (RepasseComissao repasseComissao : repasse) {
					
					RepasseComissao repasseParaEstorno = new RepasseComissao();
					repasseParaEstorno.setComissionado(comissionadoProposta);
					repasseParaEstorno.setDataLancamento(new Date(new java.util.Date().getTime()));
					repasseParaEstorno.setNroDaParcela(repasseComissao.getNroDaParcela());
					repasseParaEstorno.setPercentualRepasse(repasseComissao.getPercentualRepasse());
					repasseParaEstorno.setSituacao(Constants.ST_EM_ABERTO);
					repasseParaEstorno.setValorBase(repasseComissao.getValorBase()*-1);
					repasseParaEstorno.setValorPago(repasseComissao.getValorPago()*-1);
					repasseParaEstorno.setBorderoLancamento(repasseComissao.getBorderoLancamento());
					repasseParaEstorno.setRepasseOrigem(repasseComissao);
					repasseParaEstorno.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseParaEstorno);
				}
				comissionadoProposta.setSituacao(Constants.ST_ESTORNO); // comissionado excluido
				this.save(comissionadoProposta);
			}
			
			ComissionadoProposta comissao = null;
	
			proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());
			for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
				double valorComissao = 0;
				if (grupoProdutor.getTipoComissao().intValue() == 0) // % de comissao sobre o valor da comissao da proposta
					valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 1) // % de comissao sobre o premio liquido
					valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
				else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
					valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
				comissao = new ComissionadoProposta();
				comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
				comissao.setComissao(grupoProdutor.getComissao());
				comissao.setTipoComissao(grupoProdutor.getTipoComissao());
				comissao.setValorComissao(valorComissao);
				comissao.setSituacao(Constants.ST_EM_ABERTO); // comissionado ativo
				comissao.setProposta(proposta);
				this.save(comissao);
	
				proposta.getComissionadoPropostaCollection().add(comissao);
			}
	
			List<BorderoLancamento> comissoesBaixadas = this.genericFindByNamedQuery("getTodasComissoesBaixadasByProposta", new Object[]{proposta.getId()});
			for (BorderoLancamento borderoLancamento : comissoesBaixadas) {
				double valorPago = borderoLancamento.getValorComissao().doubleValue();
				List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
				double premioLiquido = proposta.getPremioLiquido().doubleValue();
				for (int i=0;i<comissionadoProposta.size();i++){
					ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
					double valorRepasseIndividual = 0;
					if (comissionado.getTipoComissao().intValue()==0  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==1 && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
					}else if (comissionado.getTipoComissao().intValue()==2  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
						valorRepasseIndividual = comissionado.getValorComissao().doubleValue();
					}
					double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
					comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
					
				/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(2); // pago total
					else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
						comissionado.setSituacao(1); // pago parcial*/
					this.save(comissionado);
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(borderoLancamento.getBorderoComissao().getDataDocumento());
					repasseComissao.setNroDaParcela(borderoLancamento.getNroParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					repasseComissao.setBorderoLancamento(borderoLancamento);
					repasseComissao.setOrigemLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(repasseComissao);
				}
			}
		}
	}

	public String getDemaisParcelas() {
		return demaisParcelas;
	}

	public void setDemaisParcelas(String demaisParcelas) {
		this.demaisParcelas = demaisParcelas;
	}

}