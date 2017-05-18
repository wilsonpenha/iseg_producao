package iseg.app.business;

import iseg.app.model.Corretora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;


//@Service
public class ServicosServiceImpl extends PObjectServiceImpl{

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getServicos", new Object[]{((Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso")).getId()}, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getServicos", new Object[]{((Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso")).getId()});
	}
}