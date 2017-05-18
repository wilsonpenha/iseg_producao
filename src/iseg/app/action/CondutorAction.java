package iseg.app.action;

import iseg.app.model.Condutor;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class CondutorAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = 1L;
	private Condutor condutor;
	private List<PObject> condutores;

	//@Autowired
	public CondutorAction(PObjectService service) {
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {
		try {
			if(this.getCondutor().getAutomovel() != null && this.getCondutor().getAutomovel().getId() != null){
				this.list = (List<PObject>)service.genericFindByNamedQuery("getCondutorByAutomovel", new Object[]{this.getCondutor().getAutomovel()});
				this.listCount = list != null ? list.size() : 0;
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.condutor = (Condutor)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Condutor getCondutor() {
		return condutor;
	}

	public void setCondutor(Condutor condutor) {
		this.condutor = condutor;
		this.pobject = this.condutor;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCondutor", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getAutomoveis(){
		return condutores;
	}

	public List<PObject> getEstadoCivilList(){
		return this.getDominioList("EstadoCivil");
	}
}