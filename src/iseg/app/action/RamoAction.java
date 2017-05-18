/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Ramo;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class RamoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Ramo ramo;
	private List<PObject> ramos;
	protected PObjectService service;

	//@Autowired
	public RamoAction(PObjectService service) {
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
			this.ramo = (Ramo)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
		this.pobject = this.ramo;
	}

	public List<PObject> getRamos(){
		return ramos;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountRamo", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/