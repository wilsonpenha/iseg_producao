package iseg.app.business;

import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;


//@Service
public class SmsTelefonesProdutorServiceImpl extends PObjectServiceImpl {

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		getEntityManager().clear();
		return genericFindByNamedQuery("getSmsTelefoneProdutor", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getSmsTelefoneProdutor", null);
	}
}
