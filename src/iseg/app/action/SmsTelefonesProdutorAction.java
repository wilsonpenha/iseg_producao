/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.SmsTelefonesProdutor;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class SmsTelefonesProdutorAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private SmsTelefonesProdutor smsTelefonesProdutor;
	private List<PObject> smsTelefonesProdutorList;
	protected PObjectService service;

	//@Autowired
	public SmsTelefonesProdutorAction(PObjectService service) {
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
	public String lista() {
		try {

			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = this.service.genericFindByNamedQuery("getSmsTelefonesProdutorByProdutor", new Object[]{this.smsTelefonesProdutor.getProdutor().getId()}, page, pageSize);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.smsTelefonesProdutor = (SmsTelefonesProdutor)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public SmsTelefonesProdutor getSmsTelefonesProdutor() {
		return smsTelefonesProdutor;
	}

	public void setSmsTelefonesProdutor(SmsTelefonesProdutor smsTelefonesProdutor) {
		this.smsTelefonesProdutor = smsTelefonesProdutor;
		this.pobject = this.smsTelefonesProdutor;
	}

	public List<PObject> getSmsTelefonesProdutorList(){
		return smsTelefonesProdutorList;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountSmsTelefonesProdutorByProdutor", new Object[]{this.smsTelefonesProdutor.getProdutor().getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/