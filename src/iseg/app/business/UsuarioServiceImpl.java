package iseg.app.business;

import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.Query;


//@Service
public class UsuarioServiceImpl extends PObjectServiceImpl implements UsuarioService{
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll(int page, int pageSize) {
		this.applyFilter();
        Query query = this.getEntityManager().createNamedQuery("getUsuario");
        query.setFirstResult(page*pageSize);
        query.setMaxResults(pageSize);
        List<PObject> uf = query.getResultList();
        return uf;
    }
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll() {
		this.applyFilter();
        Query query = this.getEntityManager().createNamedQuery("getUsuario");
        List<PObject> uf = query.getResultList();
        return uf;
    }
    
    public int getRowCount(String queryName, Object[] params) {
		this.applyFilter();
        Query query = this.getEntityManager().createNamedQuery(queryName);
        Long count = (Long)query.getSingleResult();
        return count.intValue();
    }
}
