/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.RoleService;
import iseg.app.constants.Constants;
import iseg.app.model.AcaoRole;
import iseg.app.model.Menu;
import iseg.app.model.MenuRole;
import iseg.app.model.Role;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PrivilegioAction extends BaseAction implements Preparable{

	private static final long serialVersionUID = 1L;
	private Role role;
	private MenuRole menuRole;
	private AcaoRole acaoRole;
	private Long[] acaoId;
	private String autoCompleteResult;
	private List<PObject> roles;
	protected RoleService service;

	//@Autowired
	public PrivilegioAction(RoleService service) {
		super(service);
		this.service = service;
	}

	public String efetivarPrivilegios(){
		try {
			this.service.efetivarPrivilegiosMenus(this.role, this.id);
			this.service.efetivarPrivilegiosAcoes(this.role, this.acaoId);
			return Action.SUCCESS;
		}catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	protected void setPObjectInstance() {
		try {
			this.role = (Role)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
		this.pobject = this.role;
	}

	public List<PObject> getRoles(){
		return roles;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountRole", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public String checkMenuRole(){
		try{
			List<MenuRole> menus = this.service.genericFindByNamedQuery("getMenuRoleByRoleAndMenu", new Object[]{this.role.getId(),this.menuRole.getMenu().getId()});
			if (menus.size()>0){
				Menu menu = (Menu)this.service.find(menus.get(0).getMenu());
				String usuarioAdmin = "ADMIN@";
				if (this.corretoraEmUso.ehAssessoria())
					usuarioAdmin += this.corretoraEmUso.getCpfOuCnpj().getValor(); 

				if (((menu.getNome().equals("Menus") || menu.getNome().equals("Ações")) && this.usuario.getUniqueLogin().equals(usuarioAdmin)))
					ServletActionContext.getRequest().setAttribute("direito", "checked");
				else if ((menu.getNome().equals("Menus") || menu.getNome().equals("Ações")))
					ServletActionContext.getRequest().setAttribute("direito", " ");
				else
					ServletActionContext.getRequest().setAttribute("direito", "checked");
						
			}else{
				ServletActionContext.getRequest().setAttribute("direito", " ");
			}
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	public String checkAcaoRole(){
		try{
			List<AcaoRole> acoes = this.service.genericFindByNamedQuery("getAcaoRoleByAcaoAndRole", new Object[]{this.role.getId(),this.acaoRole.getAcao().getId()});
			if (acoes.size()>0){
				ServletActionContext.getRequest().setAttribute("direito", "checked");
			}else{
				ServletActionContext.getRequest().setAttribute("direito", " ");
			}
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}

	public String listaMenus(){
		return Action.SUCCESS;
	}
	
	public List<Menu> getMenuPaiList(){

		try {
			return this.service.genericFindByNamedQuery("getMenuPai", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Menu>();
		}
	}

	public Long getMenuIdMenus(){
		return Constants.MENU_ID_MENUS;
	}
	
	public Long getMenuIdSmsEventos(){
		return Constants.MENU_ID_EVENTOS_SMS;
	}
	
	public List<PObject> getPrivilegiosList(){
		return this.getDominioList("Privilegio");
    }

	public MenuRole getMenuRole() {
		return menuRole;
	}

	public void setMenuRole(MenuRole menuRole) {
		this.menuRole = menuRole;
	}
	public String getAutoCompleteResult() {
		return autoCompleteResult;
	}

	public void setAutoCompleteResult(String autoCompleteResult) {
		this.autoCompleteResult = autoCompleteResult;
	}

	public AcaoRole getAcaoRole() {
		return acaoRole;
	}

	public void setAcaoRole(AcaoRole acaoRole) {
		this.acaoRole = acaoRole;
	}

	public Long[] getAcaoId() {
		return acaoId;
	}

	public void setAcaoId(Long[] acaoId) {
		this.acaoId = acaoId;
	}

}
/************************************************************/
//Atlas, 2008
/************************************************************/