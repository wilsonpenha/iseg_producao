/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Dependentes;
import iseg.app.model.Pessoa;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class DependentesAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Dependentes dependentes;
	protected PObjectService service;

	//@Autowired
	public DependentesAction(PObjectService service) {
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

	protected void setPObjectInstance() {
		try {
			this.dependentes = (Dependentes)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Dependentes getDependentes() {
		return dependentes;
	}

	public void setDependentes(Dependentes dependentes) {
		this.dependentes = dependentes;
		this.pobject = this.dependentes;
	}

	@SkipValidation
	@Override
	public String novo() throws Exception{
		Pessoa pessoa = this.dependentes.getPessoa();
		this.dependentes = new Dependentes();
		this.dependentes.setPessoa(pessoa);
		return super.novo();
	}

	@SkipValidation
	@Override
	public String lista() {
		try{
			String action = Action.SUCCESS;
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = getDependentesList();
			if (this.list.size() == 1) {
				this.pobject = (PObject) this.list.get(0);
				this.editar();
				action = Action.INPUT;
			} else if (this.list.size() == 0) {
				this.pobject.setId(null);
				action = Action.NONE;
			}

			return action;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getDependentesList() {
		try{
			return service.genericFindByNamedQuery("getDependentesByPessoaId", new Object[] { this.getDependentes().getPessoa().getId() }, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountDependentes", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/