package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Pessoa;
import iseg.app.model.Produtor;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.hibernate.TransientObjectException;
import org.hibernate.exception.ConstraintViolationException;


//@Service
public class ProdutorServiceImpl extends PObjectServiceImpl implements ProdutorService{
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getProdutor", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getProdutor", null);
	}

	public void save(Produtor produtor, Pessoa pessoa) throws Exception {
		try{
			this.setCorretora(produtor);
			this.setCorretora(pessoa);
			if (produtor.getId() == null) {
				// new
				this.save(pessoa);
				produtor.setPessoa(pessoa);
				this.save(produtor);
			} else {
				// update
				this.save(produtor);
				this.save(pessoa);
			}
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
			throw new GenericException("save() :: Ocorreu uma falha no sistema.", e);
		}
	}
	
}
