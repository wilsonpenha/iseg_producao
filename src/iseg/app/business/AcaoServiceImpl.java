package iseg.app.business;

import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;


public class AcaoServiceImpl extends PObjectServiceImpl { 

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getAcao", null, page, pageSize);
	}

	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getAcao", null);
	}
}