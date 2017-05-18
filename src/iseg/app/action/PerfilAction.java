/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Perfil;
import iseg.app.model.PerguntasPerfil;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PerfilAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Perfil perfil;
	private List<PerguntasPerfil> perguntasPerfils;
	private List<PObject> perfils;
	private PerguntasPerfil perguntasPerfil;

	//@Autowired
	public PerfilAction(PObjectService service) {
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

	@Override
	@SkipValidation
	public String novo() {
		Perfil perfil = (Perfil)Util.cloneBean(this.perfil);
		perfil.setId(null);
		this.perfil = perfil;

		return Action.SUCCESS;
	}

	@Override
	@SkipValidation
	public String lista() {
		try{
			if (this.listCount == 0)
				this.listCount = this.getRowCount();

			this.list = (List<PObject>) service.genericFindByNamedQuery("getPerfilBySeguradora", new Object[] { this.getPerfil().getSeguradora().getId() }, page, pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	protected void setPObjectInstance() {
		try{
			this.perfil = (Perfil) this.pobject;
			this.perguntasPerfils = (List<PerguntasPerfil>)this.service.genericFindBySQLQuery("Select p From PerguntasPerfil p where p.perfil.id = ?0 order by p.ordem", new Object[]{this.perfil.getId()});
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirPergunta(){
		try{
			this.service.save(perguntasPerfil);
			this.perguntasPerfils = (List<PerguntasPerfil>)this.service.genericFindBySQLQuery("Select p From PerguntasPerfil p where p.perfil.id = ?0 order by p.ordem", new Object[]{this.perguntasPerfil.getPerfil().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirPergunta(){
		try {

			this.service.remove(perguntasPerfil);
			this.perguntasPerfils = (List<PerguntasPerfil>)this.service.genericFindBySQLQuery("Select p From PerguntasPerfil p where p.perfil.id = ?0 order by p.ordem", new Object[]{this.perguntasPerfil.getPerfil().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarPergunta(){
		try {
			this.perguntasPerfil = (PerguntasPerfil)this.service.find(this.perguntasPerfil);
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
		this.pobject = this.perfil;
	}

	public List<PObject> getPerfils() {
		return perfils;
	}

	public int getRowCount() {
		try{
			return this.service.getRowCount("getCountPerfil", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PerguntasPerfil> getPerguntasPerfils() {
		return perguntasPerfils;
	}

	public void setPerguntasPerfils(List<PerguntasPerfil> perguntasPerfils) {
		this.perguntasPerfils = perguntasPerfils;
	}

	public PerguntasPerfil getPerguntasPerfil() {
		return perguntasPerfil;
	}

	public void setPerguntasPerfil(PerguntasPerfil perguntasPerfil) {
		this.perguntasPerfil = perguntasPerfil;
	}

}
/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
