package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;

import org.hibernate.TransientObjectException;
import org.hibernate.exception.ConstraintViolationException;


//@Service
public class SeguradoraServiceImpl extends PObjectServiceImpl {

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getSeguradora", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getSeguradora", null);
	}

	public void save(PObject pobject) throws Exception {
		try{
			EntityManager em = this.getEntityManager();
			if (pobject.getId() == null) {
				// new
				em.persist(pobject);
			} else {
				// update
				em.merge(pobject);
			}
			em.flush();
			em.close();
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
			throw new GenericException("save() :: Ocorreu uma falha no sistema.", e);
		}
	}

}