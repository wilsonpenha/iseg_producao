package iseg.app.business;

import iseg.app.model.Role;
import iseg.app.persistence.PObjectService;


public interface RoleService extends PObjectService{
	public void efetivarPrivilegiosMenus(Role role, Long[] ids) throws Exception;	
	public void efetivarPrivilegiosAcoes(Role role, Long[] ids) throws Exception;	
}
