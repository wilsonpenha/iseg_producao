/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.constants.Constants;
import iseg.app.model.Corretora;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class UsuarioAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private List<PObject> usuarios;
	protected PObjectService service;

	//@Autowired
	public UsuarioAction(PObjectService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	public String novo() {
		this.usuario = new Usuario();
		this.pobject = this.usuario;
		return Action.SUCCESS;
	}

	@SkipValidation
	public String excluir() {

		try {
			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					this.usuario = (Usuario)service.find(pobject);
					if (this.usuario.getNomeLogin().equals(Constants.NOME_ADMIN))
						throw new Exception("O usuário ADMIN não pode ser incluido, alterado ou excluido");
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (Exception ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		}
	}

	protected void persistPObjects() throws Exception {
		if (this.usuario.getNomeLogin().equals(Constants.NOME_ADMIN))
			throw new Exception("O usuário ADMIN não pode ser incluido, alterado ou excluido");
		if (this.usuario.getRole()!=null && this.usuario.getRole().getId()==null)
			this.usuario.setRole(null);
		this.usuario.setCorretora((Corretora)this.service.find(this.usuario.getCorretora()));
		this.usuario.setUniqueLogin(this.usuario.getNomeLoginFull());
	}

	protected void setPObjectInstance() throws Exception {
		this.usuario = (Usuario)service.find(Usuario.class, this.pobject.getId());
		if (this.usuario.getNomeLogin().equals(Constants.NOME_ADMIN)){
			this.lista();
			throw new Exception("O usuário ADMIN não pode ser incluido, alterado ou excluido");
		}
		this.service.refresh(pobject);
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
		this.pobject = this.usuario;
	}

	public List<PObject> getUsuarios(){
		return usuarios;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountUsuario", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getCorretorasList(){

		try {
			return (List<PObject>) this.service.genericFindByNamedQuery("getCorretora", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public List<PObject> getPrivilegiosList(){
		try {
			return (List<PObject>) this.service.genericFindByNamedQuery("getRole", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
    }
}
/************************************************************/
//Atlas, 2008
/************************************************************/