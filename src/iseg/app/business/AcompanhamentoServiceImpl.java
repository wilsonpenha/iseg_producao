package iseg.app.business;

import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;


//@Service
public class AcompanhamentoServiceImpl extends PObjectServiceImpl  implements AcompanhamentoService {

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getAcompanhamento", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getAcompanhamento", null);
	}
}