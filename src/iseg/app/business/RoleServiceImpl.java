package iseg.app.business;

import iseg.app.model.Acao;
import iseg.app.model.AcaoRole;
import iseg.app.model.Menu;
import iseg.app.model.MenuRole;
import iseg.app.model.Role;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.Query;


//@Service
public class RoleServiceImpl extends PObjectServiceImpl implements RoleService{
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll(int page, int pageSize) {
		this.applyFilter();
        Query query = this.getEntityManager().createNamedQuery("getRole");
        query.setFirstResult(page*pageSize);
        query.setMaxResults(pageSize);
        List<PObject> menus = query.getResultList();
        return menus;
    }
	
	@SuppressWarnings("unchecked")
    public List<PObject> findAll() {
		this.applyFilter();
        Query query = this.getEntityManager().createNamedQuery("getRole");
        List<PObject> menus = query.getResultList();
        return menus;
    }
    
	public void efetivarPrivilegiosMenus(Role role, Long[] ids) throws Exception{
		this.executeNamedQuery("deleteMenuRoleByRole", new Object[]{role.getId()});
		if (ids != null){
			for (int i = 0; i < ids.length; i++) {
				Menu menu =  new Menu();
				menu.setId(ids[i]);
				MenuRole menuRole = new MenuRole();
				menuRole.setRole(role);
				menuRole.setMenu(menu);
				this.save(menuRole);
			}
		}
	}

	public void efetivarPrivilegiosAcoes(Role role, Long[] ids) throws Exception{
		this.executeNamedQuery("deleteAcaoRoleByRole", new Object[]{role.getId()});
		if (ids != null){
			for (int i = 0; i < ids.length; i++) {
				Acao acao =  new Acao();
				acao.setId(ids[i]);
				AcaoRole acaoRole = new AcaoRole();
				acaoRole.setRole(role);
				acaoRole.setAcao(acao);
				this.save(acaoRole);
			}
		}
	}
}
