package iseg.app.business;

import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.Query;


//@Service
public class MenuServiceImpl extends PObjectServiceImpl implements MenuService{
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll(int page, int pageSize) {
        Query query = this.getEntityManager().createNamedQuery("getMenu");
        query.setFirstResult(page*pageSize);
        query.setMaxResults(pageSize);
        List<PObject> menus = query.getResultList();
        return menus;
    }
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll() {
        Query query = this.getEntityManager().createNamedQuery("getMenu");
        List<PObject> menus = query.getResultList();
        return menus;
    }
}
