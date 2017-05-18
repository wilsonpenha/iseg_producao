/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.exception.GenericException;
import iseg.app.model.Corretora;
import iseg.app.model.Servicos;
import iseg.app.model.ServicosIseg;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ServicosAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Servicos servicos;
	private List<PObject> servicoss;

	//@Autowired
	public ServicosAction(PObjectService service) {
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
		try {

			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Assessorada não pode incluir novo Serviço, contate a assessoria!");

			Servicos servicos = (Servicos)Util.cloneBean(this.servicos);
			servicos.setId(null);
			this.servicos = servicos;
	
			return Action.SUCCESS;
		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editar() {

		try {

			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Serviço não pode ser editado pela assessoarada!");

			if (this.pobject.getId() == null) {
				if (id == null)// Posteriormente fazer a controle atrav�s de // Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			this.pobject = service.find(this.pobject);
			this.setPObjectInstance();
			return Action.SUCCESS;

		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try {
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Serviço não pode ser excluido pela assessoarada!");

			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (GenericException ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void persistPObjects() throws Exception {
		if (this.servicos.getServicosIseg()!=null && this.servicos.getServicosIseg().getId()==null)
			this.servicos.setServicosIseg(null); 
		this.servicos.setCorretora(this.corretoraEmUso);
	}
 
	@Override
	@SkipValidation
	public String lista() {
		try {
			if (this.listCount == 0)
				this.listCount = this.getRowCount();

			Corretora corretoraFiltro = null;
			if (corretoraEmUso.ehAssessoria())
				corretoraFiltro = corretoraEmUso;
			else if (corretoraEmUso.getUsarCoberturasAssessoria())
				corretoraFiltro = corretoraEmUso.getAssessoria();
			else
				corretoraFiltro = corretoraEmUso;
			this.list = (List<PObject>) service.genericFindByNamedQuery("getServicosBySeguradora", new Object[] { this.getServicos().getSeguradora().getId(), corretoraFiltro.getId() }, page,pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.servicos = (Servicos) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Servicos getServicos() {
		return servicos;
	}

	public void setServicos(Servicos servicos) {
		this.servicos = servicos;
		this.pobject = this.servicos;
	}

	public List<PObject> getServicoss() {
		return servicoss;
	}

	
	@SuppressWarnings("unchecked")
	public List<ServicosIseg> getServicosIsegByRamo() {
		try {

			return (List<ServicosIseg>) this.service.genericFindBySQLQuery("SELECT s FROM ServicosIseg s where s.ramo.id=?0 Order by s.descricao", new Object[]{this.servicos.getRamo().getId()});
 
		} catch (Exception e) {  
			addActionError(e.getMessage());
		}
		return new ArrayList<ServicosIseg>();
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountServicos", new Object[] {corretoraEmUso.getId(),servicos.getSeguradora().getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

}

/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
