package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.RepasseComissao;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;


//@Service
public class RepasseComissaoServiceImpl extends PObjectServiceImpl implements
		RepasseComissaoService {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	public void quitarRepasse(Long[] repasseIds, Date dataPagamento) throws Exception{
		try{
			for (int i = 0; i < repasseIds.length; i++) {
				RepasseComissao repasseComissao = (RepasseComissao)this.find(RepasseComissao.class, repasseIds[i]);
				repasseComissao.setDataPagamento(dataPagamento);
				repasseComissao.setSituacao(Constants.ST_BAIXADO);
				this.save(repasseComissao);
			}
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha na quitaçãoo do Repasse.", e);
		}
	}

	public void quitarRepasse(Date inicioDataPagamento, Date fimDataPagamento, Long produtorId, Date dataPagamento) throws Exception{
		try{
			List<RepasseComissao> repasseComissaoList = this.genericFindByNamedQuery("getRepasseByProdutorDataLancaNaoPago", new Object[]{inicioDataPagamento,fimDataPagamento,produtorId,produtorId});
			for (RepasseComissao repasseComissao : repasseComissaoList) {
				repasseComissao.setDataPagamento(dataPagamento);
				repasseComissao.setSituacao(Constants.ST_BAIXADO);
				this.save(repasseComissao);
			}
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha na quitaçãoo do Repasse.", e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<RepasseComissao> getRepasseComissaosForSearch(RepasseComissao repasseComissao, Date inicioDataPagamento, Date fimDataPagamento, 
			Date inicioDataLancamento, Date fimDataLancamento, Integer situacao, Integer page, Integer pageSize) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = "from RepasseComissao as r left join r.produtor p where r.origemLancamento = 1 "; // TP_LANCA_MANUAL = 1

			if(inicioDataPagamento != null){
				strQuery += "and r.dataPagamento >= :inicioDataPagamento ";
			}
			if(fimDataPagamento != null){
				strQuery += "and r.dataPagamento <= :fimDataPagamento ";
			}
			if(inicioDataLancamento != null){
				strQuery += "and r.dataLancamento >= :inicioDataLancamento ";
			}
			if(fimDataLancamento != null){
				strQuery += "and r.dataLancamento <= :fimDataLancamento ";
			}
			if(situacao != null && situacao.intValue() >=0){
				strQuery += "and r.situacao = :situacao ";
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getId() != null){
				strQuery += "and p.id = :produtorId ";
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getNome() != null && !repasseComissao.getProdutor().getNome().equals("")){
				strQuery += "and p.pessoa.nome = :produtorNome ";
			}

			strQuery += " ORDER BY r.dataLancamento desc ";

			Query query = localEM.createQuery("select r "+strQuery);

			if(inicioDataPagamento != null){
				query.setParameter("inicioDataPagamento", inicioDataPagamento);
			}
			if(fimDataPagamento != null){
				query.setParameter("fimDataPagamento", fimDataPagamento);
			}
			if(inicioDataLancamento != null){
				query.setParameter("inicioDataLancamento", inicioDataLancamento);
			}
			if(fimDataLancamento != null){
				query.setParameter("fimDataLancamento", fimDataLancamento);
			}
			if(situacao != null && situacao.intValue() >=0){
				query.setParameter("situacao", situacao);
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getId() != null){
				query.setParameter("produtorId", repasseComissao.getProdutor().getId());
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getNome() != null && !repasseComissao.getProdutor().getNome().equals("")){
				query.setParameter("produtorNome", repasseComissao.getProdutor().getNome().trim());
			}

			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);

			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountRepasseComissaosForSearch(RepasseComissao repasseComissao, Date inicioDataPagamento, Date fimDataPagamento, 
			Date inicioDataLancamento, Date fimDataLancamento, Integer situacao) throws Exception {

		try{

			this.applyFilter();
			String strQuery = "from RepasseComissao as r left join r.produtor p where r.origemLancamento = 1 "; // TP_LANCA_MANUAL = 1

			if(inicioDataPagamento != null){
				strQuery += "and r.dataPagamento >= :inicioDataPagamento ";
			}
			if(fimDataPagamento != null){
				strQuery += "and r.dataPagamento <= :fimDataPagamento ";
			}
			if(inicioDataLancamento != null){
				strQuery += "and r.dataLancamento >= :inicioDataLancamento ";
			}
			if(fimDataLancamento != null){
				strQuery += "and r.dataLancamento <= :fimDataLancamento ";
			}
			if(situacao != null && situacao.intValue() >=0){
				strQuery += "and r.situacao = :situacao ";
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getId() != null){
				strQuery += "and p.id = :produtorId ";
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getNome() != null && !repasseComissao.getProdutor().getNome().equals("")){
				strQuery += "and p.pessoa.nome = :produtorNome ";
			}

			Query query = localEM.createQuery("select count(r.id) "+strQuery);

			if(inicioDataPagamento != null){
				query.setParameter("inicioDataPagamento", inicioDataPagamento);
			}
			if(fimDataPagamento != null){
				query.setParameter("fimDataPagamento", fimDataPagamento);
			}
			if(inicioDataLancamento != null){
				query.setParameter("inicioDataLancamento", inicioDataLancamento);
			}
			if(fimDataLancamento != null){
				query.setParameter("fimDataLancamento", fimDataLancamento);
			}
			if(situacao != null && situacao.intValue() >=0){
				query.setParameter("situacao", situacao);
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getId() != null){
				query.setParameter("produtorId", repasseComissao.getProdutor().getId());
			}
			if(repasseComissao.getProdutor() != null && repasseComissao.getProdutor().getNome() != null && !repasseComissao.getProdutor().getNome().equals("")){
				query.setParameter("produtorNome", repasseComissao.getProdutor().getNome().trim());
			}

			localEM.clear();
			return (Long)query.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	public void estornarLancamento(RepasseComissao repasseComissao, Usuario usuarioEstorno) throws Exception{
		try {
			RepasseComissao repasseOrigem = (RepasseComissao)this.find(RepasseComissao.class, repasseComissao.getId());
			if (repasseOrigem.getSituacao().intValue()==Constants.ST_EM_ABERTO){
				repasseOrigem.setSituacao(Constants.ST_ESTORNO);
				repasseOrigem.setDataEstorno(new Date());
				repasseOrigem.setUsuarioEstorno(usuarioEstorno);
				this.save(repasseOrigem);
			}else{
				repasseComissao.setRepasseOrigem(repasseOrigem);
				repasseComissao.setSituacao(Constants.ST_EM_ABERTO);
				repasseComissao.setId(null); // ira criar um novo lancamento como estorno
				repasseComissao.setValorPago(repasseOrigem.getValorPago().doubleValue()*-1D);
				if (repasseComissao.getTipoLancamento().intValue()==Constants.TP_LANCAMENTO_CREDITO)
					repasseComissao.setTipoLancamento(Constants.TP_LANCAMENTO_DEBITO);
				else
					repasseComissao.setTipoLancamento(Constants.TP_LANCAMENTO_CREDITO);
				repasseOrigem.setDataEstorno(new Date());
				repasseOrigem.setUsuarioEstorno(usuarioEstorno);
				repasseComissao.setDescricao("ESTORNO DE "+repasseComissao.getDescricao());
				this.save(repasseComissao);
			}
			
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
}
