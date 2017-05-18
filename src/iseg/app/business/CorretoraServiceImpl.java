package iseg.app.business;

import iseg.app.model.Corretora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;


//@Service
public class CorretoraServiceImpl extends PObjectServiceImpl{
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getCorretora", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
    public List<Corretora> findAll() {
		return super.findAll(Corretora.class, Order.asc("nome"));
    }
	
	@SuppressWarnings("unchecked")
	public List<Corretora> getCorretorasAssessoradas(Corretora assessoria){
		Criteria criteria = getHibernateSession().createCriteria(Corretora.class)
		.add(Property.forName("assessoria").eq(assessoria));
		
		return criteria.list();
	}
}