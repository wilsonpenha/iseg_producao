package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Sinistro;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.Query;


//@Service
public class SinistroServiceImpl extends PObjectServiceImpl implements SinistroService{

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getSinistro", null, page, pageSize); 
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getSinistro", null);
	}

	@SuppressWarnings("unchecked")
	public List<Sinistro> getSinistroForSearch(Sinistro sinistro, Integer page, Integer pageSize) throws Exception {
		
		try{
			this.applyFilter();

			String strQuery = "from Sinistro s where (1=1) ";
			
			if(sinistro.getDataDoSinistro() != null){
				strQuery += "and s.dataSinistro = :dataSinistro ";
			}
			if(sinistro.getNroSinistroSeg() != null && !sinistro.getNroSinistroSeg().equals("")){
				strQuery += "and s.nroSinistroSeg = :nroSinistroSeg ";
			}
			if(sinistro.getProposta().getCliente() != null && sinistro.getProposta().getCliente().getId() != null){
				strQuery += "and s.proposta.cliente.id = :clienteId ";
			}
			if(sinistro.getProposta().getSeguradora() != null && sinistro.getProposta().getSeguradora().getId() != null){
				strQuery += "and s.proposta.seguradora.id = :seguradoraId ";
			}
			if(sinistro.getDataDoAviso() != null){
				strQuery += "and s.dataDoAviso = :dataDoAviso ";
			}
			if(sinistro.getProposta().getRamo() != null && sinistro.getProposta().getRamo().getId() != null){
				strQuery += "and s.proposta.ramo.id = :ramoId";
			}
			if(sinistro.getNroApolice() != null && !sinistro.getNroApolice().equals("")){
				strQuery += "and s.nroApolice = :nroApolice";
			}
			if(sinistro.getNroProposta() != null && !sinistro.getNroProposta().equals("")){
				strQuery += "and s.nroProposta = :nroProposta";
			}
			
			strQuery += " ORDER BY s.proposta.cliente.nome ";
			
			Query query = this.getEntityManager().createQuery("select s "+strQuery);
			
			if(sinistro.getDataDoSinistro() != null){
				query.setParameter("dataDoSinistro", sinistro.getDataDoSinistro());
			}
			if(sinistro.getNroSinistroSeg() != null && !sinistro.getNroSinistroSeg().equals("")){
				query.setParameter("nroSinistroSeg", sinistro.getNroSinistroSeg());
			}
			if(sinistro.getProposta().getCliente() != null && sinistro.getProposta().getCliente().getId() != null){
				query.setParameter("clienteId", sinistro.getProposta().getCliente().getId());
			}
			if(sinistro.getProposta().getSeguradora() != null && sinistro.getProposta().getSeguradora().getId() != null){
				query.setParameter("seguradoraId", sinistro.getProposta().getSeguradora().getId());
			}
			if(sinistro.getDataDoAviso() != null){
				query.setParameter("dataDoAviso", sinistro.getDataDoAviso());
			}
			if(sinistro.getProposta().getRamo() != null && sinistro.getProposta().getRamo().getId() != null){
				query.setParameter("ramoId", sinistro.getProposta().getRamo().getId());
			}
			if(sinistro.getNroApolice() != null && !sinistro.getNroApolice().equals("")){
				query.setParameter("nroApolice", sinistro.getNroApolice());
			}
			if(sinistro.getNroProposta() != null && !sinistro.getNroProposta().equals("")){
				query.setParameter("nroProposta", sinistro.getNroProposta());
			}
			
			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);
			
			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountSinistroForSearch(Sinistro sinistro) throws Exception {

		try{
			this.applyFilter();

			String strQuery = "from Sinistro s where (1=1) ";
			
			if(sinistro.getDataDoSinistro() != null){
				strQuery += "and s.dataSinistro = :dataSinistro ";
			}
			if(sinistro.getNroSinistroSeg() != null && !sinistro.getNroSinistroSeg().equals("")){
				strQuery += "and s.nroSinistroSeg = :nroSinistroSeg ";
			}
			if(sinistro.getProposta().getCliente() != null && sinistro.getProposta().getCliente().getId() != null){
				strQuery += "and s.proposta.cliente.id = :clienteId ";
			}
			if(sinistro.getProposta().getSeguradora() != null && sinistro.getProposta().getSeguradora().getId() != null){
				strQuery += "and s.proposta.seguradora.id = :seguradoraId ";
			}
			if(sinistro.getDataDoAviso() != null){
				strQuery += "and s.dataDoAviso = :dataDoAviso ";
			}
			if(sinistro.getProposta().getRamo() != null && sinistro.getProposta().getRamo().getId() != null){
				strQuery += "and s.proposta.ramo.id = :ramoId";
			}
			if(sinistro.getNroApolice() != null && !sinistro.getNroApolice().equals("")){
				strQuery += "and s.nroApolice = :nroApolice";
			}
			if(sinistro.getNroProposta() != null && !sinistro.getNroProposta().equals("")){
				strQuery += "and s.nroProposta = :nroProposta";
			}
			
			Query query = this.getEntityManager().createQuery("select Count(*) "+strQuery);
			
			if(sinistro.getDataDoSinistro() != null){
				query.setParameter("dataDoSinistro", sinistro.getDataDoSinistro());
			}
			if(sinistro.getNroSinistroSeg() != null && !sinistro.getNroSinistroSeg().equals("")){
				query.setParameter("nroSinistroSeg", sinistro.getNroSinistroSeg());
			}
			if(sinistro.getProposta().getCliente() != null && sinistro.getProposta().getCliente().getId() != null){
				query.setParameter("clienteId", sinistro.getProposta().getCliente().getId());
			}
			if(sinistro.getProposta().getSeguradora() != null && sinistro.getProposta().getSeguradora().getId() != null){
				query.setParameter("seguradoraId", sinistro.getProposta().getSeguradora().getId());
			}
			if(sinistro.getDataDoAviso() != null){
				query.setParameter("dataDoAviso", sinistro.getDataDoAviso());
			}
			if(sinistro.getProposta().getRamo() != null && sinistro.getProposta().getRamo().getId() != null){
				query.setParameter("ramoId", sinistro.getProposta().getRamo().getId());
			}
			if(sinistro.getNroApolice() != null && !sinistro.getNroApolice().equals("")){
				query.setParameter("nroApolice", sinistro.getNroApolice());
			}
			if(sinistro.getNroProposta() != null && !sinistro.getNroProposta().equals("")){
				query.setParameter("nroProposta", sinistro.getNroProposta());
			}
			
			return (Long)query.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
}