package iseg.app.business;

import iseg.app.model.Corretora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;


//@Service
public class CoberturasServiceImpl extends PObjectServiceImpl{

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getCoberturas", new Object[]{((Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso")).getId()}, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getCoberturas", new Object[]{((Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso")).getId()});
	}
}