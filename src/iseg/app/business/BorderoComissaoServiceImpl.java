package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.BorderoComissao;
import iseg.app.model.BorderoLancamento;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;


//@Service
public class BorderoComissaoServiceImpl extends PObjectServiceImpl implements BorderoComissaoService{

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getBorderoComissao", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getBorderoComissao", null);
	}

	@SuppressWarnings("unchecked")
	public List<BorderoComissao> getBorderoComissaosForSearch(BorderoComissao borderoComissao, Integer page, Integer pageSize, String order) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = ", b.seguradora.nome from BorderoComissao as b left outer join b.borderoLancamentoCollection l where (1=1) ";

			if(borderoComissao.getDataDocumento() != null){
				strQuery += "and b.dataDocumento = :dataDocumento ";
			}
			if(borderoComissao.getNroExtrato() != null && !borderoComissao.getNroExtrato().isEmpty()){
				strQuery += "and b.nroExtrato = :nroExtrato ";
			}
			if(borderoComissao.getSituacao() != null && borderoComissao.getSituacao().intValue()>=0){
				strQuery += "and b.situacao = :situacao ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice().isEmpty()){
				strQuery += "and l.nroApolice = :nroApolice ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getProposta() != null && 
				borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero()!=null){
				strQuery += "and l.proposta.numero = :numero ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado().isEmpty()){
				strQuery += "and l.nomeSegurado = :nomeSegurado ";
			}
			if(borderoComissao.getSeguradora() != null && borderoComissao.getSeguradora().getId() != null){
				strQuery += "and b.seguradora.id = :seguradoraId ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getRamo() != null && 
			   borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId() != null){
				strQuery += "and l.ramo.id = :ramoId ";
			}

			strQuery += " "+order;

			Query query = this.getEntityManager().createQuery("select distinct b "+strQuery);

			if(borderoComissao.getDataDocumento() != null){
				query.setParameter("dataDocumento", borderoComissao.getDataDocumento());
			}
			if(borderoComissao.getNroExtrato() != null && !borderoComissao.getNroExtrato().isEmpty()){
				query.setParameter("nroExtrato", borderoComissao.getNroExtrato());
			}
			if(borderoComissao.getSituacao() != null && borderoComissao.getSituacao().intValue()>=0){
				query.setParameter("situacao", borderoComissao.getSituacao());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice().isEmpty()){
				query.setParameter("nroApolice", borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getProposta() != null && 
				borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero()!=null){
				query.setParameter("numero", borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado() != null &&
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado().isEmpty()){
				query.setParameter("nomeSegurado", borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado());
			}
			if(borderoComissao.getSeguradora() != null && borderoComissao.getSeguradora().getId() != null){
				query.setParameter("seguradoraId", borderoComissao.getSeguradora().getId());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getRamo() != null && 
			   borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId() != null){
				query.setParameter("ramoId", borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId());
			}
			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);
			
			List<BorderoComissao> borderos = new ArrayList<BorderoComissao>();
			for (Iterator iterator = query.getResultList().iterator(); iterator.hasNext();) {
				Object[] objs = (Object[]) iterator.next();
				borderos.add((BorderoComissao)objs[0]);
			}

			return borderos;

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountBorderoComissaosForSearch(BorderoComissao borderoComissao) throws Exception {

		try{
			this.applyFilter();
			String strQuery = "from BorderoComissao as b left outer join b.borderoLancamentoCollection l where (1=1) ";

			if(borderoComissao.getDataDocumento() != null){
				strQuery += "and b.dataDocumento = :dataDocumento ";
			}
			if(borderoComissao.getNroExtrato() != null && !borderoComissao.getNroExtrato().isEmpty()){
				strQuery += "and b.nroExtrato = :nroExtrato ";
			}
			if(borderoComissao.getSituacao() != null && borderoComissao.getSituacao().intValue()>=0){
				strQuery += "and b.situacao = :situacao ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice().isEmpty()){
				strQuery += "and l.nroApolice = :nroApolice ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getProposta() != null && 
				borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero()!=null){
				strQuery += "and l.proposta.numero = :numero ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado().isEmpty()){
				strQuery += "and l.nomeSegurado = :nomeSegurado ";
			}
			if(borderoComissao.getSeguradora() != null && borderoComissao.getSeguradora().getId() != null){
				strQuery += "and b.seguradora.id = :seguradoraId ";
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getRamo() != null && 
			   borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId() != null){
				strQuery += "and l.ramo.id = :ramoId ";
			}

			Query queryCount = this.getEntityManager().createQuery("select count(distinct b.id) "+strQuery);

			if(borderoComissao.getDataDocumento() != null){
				queryCount.setParameter("dataDocumento", borderoComissao.getDataDocumento());
			}
			if(borderoComissao.getNroExtrato() != null && !borderoComissao.getNroExtrato().isEmpty()){
				queryCount.setParameter("nroExtrato", borderoComissao.getNroExtrato());
			}
			if(borderoComissao.getSituacao() != null && borderoComissao.getSituacao().intValue()>=0){
				queryCount.setParameter("situacao", borderoComissao.getSituacao());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice() != null && 
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice().isEmpty()){
				queryCount.setParameter("nroApolice", borderoComissao.getBorderoLancamentoCollection().get(0).getNroApolice());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getProposta() != null && 
				borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero()!=null){
				queryCount.setParameter("numero", borderoComissao.getBorderoLancamentoCollection().get(0).getProposta().getNumero());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado() != null &&
			  !borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado().isEmpty()){
				queryCount.setParameter("nomeSegurado", borderoComissao.getBorderoLancamentoCollection().get(0).getNomeSegurado());
			}
			if(borderoComissao.getSeguradora() != null && borderoComissao.getSeguradora().getId() != null){
				queryCount.setParameter("seguradoraId", borderoComissao.getSeguradora().getId());
			}
			if(borderoComissao.getBorderoLancamentoCollection().get(0).getRamo() != null && 
			   borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId() != null){
				queryCount.setParameter("ramoId", borderoComissao.getBorderoLancamentoCollection().get(0).getRamo().getId());
			}
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
	
	public BorderoComissao gerarLoteEstorno(BorderoComissao borderoComissao) throws Exception{
		
		borderoComissao.setSituacao(Constants.ST_LOTE_ESTORNADO);
		BorderoComissao loteEstorno = (BorderoComissao)Util.cloneBean(borderoComissao, BorderoComissao.class);
		loteEstorno.setId(null);
		loteEstorno.setNroExtrato(borderoComissao.getNroExtrato());
		loteEstorno.setValorTotal(borderoComissao.getValorTotal()*-1);
		loteEstorno.setSituacao(Constants.ST_LOTE_DE_ESTORNO);
		loteEstorno.setDataLancamento(new Date());
		this.save(loteEstorno);
		
		for (BorderoLancamento borderoLancamento : borderoComissao.getBorderoLancamentoCollection()) {
			BorderoLancamento lancamentoEstorno = (BorderoLancamento)Util.cloneBean(borderoLancamento, BorderoLancamento.class);
			lancamentoEstorno.setId(null);
			lancamentoEstorno.setBorderoComissao(loteEstorno);
			lancamentoEstorno.setDataLancamento(new Date());
			lancamentoEstorno.setValorComissao(borderoLancamento.getValorComissao()*-1);
			lancamentoEstorno.setTipoLancamento(borderoLancamento.getTipoLancamento().getTipoLancamentoEstorno());
			lancamentoEstorno.setSituacao(0);
			this.save(lancamentoEstorno);
			loteEstorno.getBorderoLancamentoCollection().add(lancamentoEstorno);
		}
		PropostaComissaoServiceImpl propostaService = new PropostaComissaoServiceImpl();
		propostaService.setEntityManager(this.getEntityManager());
		propostaService.setRequest(this.getRequest());
		propostaService.baixaComissao(loteEstorno.getBorderoLancamentoCollection(), true);
		loteEstorno.setSituacao(Constants.ST_LOTE_DE_ESTORNO);
		loteEstorno = (BorderoComissao)this.find(loteEstorno);
		this.save(loteEstorno);
		this.save(borderoComissao);
		return borderoComissao;
	}
	
	public BorderoComissao copiarLote(BorderoComissao borderoComissao) throws Exception{
		
		BorderoComissao loteEstorno = (BorderoComissao)Util.cloneBean(borderoComissao, BorderoComissao.class);
		loteEstorno.setId(null);
		loteEstorno.setNroExtrato(borderoComissao.getNroExtrato());
		loteEstorno.setValorTotal(borderoComissao.getValorTotal());
		loteEstorno.setSituacao(Constants.ST_LOTE_EM_ABERTO);
		loteEstorno.setDataLancamento(new Date());
		this.save(loteEstorno);
		
		for (BorderoLancamento borderoLancamento : borderoComissao.getBorderoLancamentoCollection()) {
			BorderoLancamento lancamentoEstorno = (BorderoLancamento)Util.cloneBean(borderoLancamento, BorderoLancamento.class);
			lancamentoEstorno.setId(null);
			lancamentoEstorno.setBorderoComissao(loteEstorno);
			lancamentoEstorno.setDataLancamento(new Date());
			lancamentoEstorno.setValorComissao(borderoLancamento.getValorComissao());
			lancamentoEstorno.setSituacao(0);
			this.save(lancamentoEstorno);
			loteEstorno.getBorderoLancamentoCollection().add(lancamentoEstorno);
		}
		return loteEstorno;
	}
	
}