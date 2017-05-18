/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.DominioEsp;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class DominioEspAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private DominioEsp dominioEsp;
	private List<PObject> dominioEsps;

	//@Autowired
	public DominioEspAction(PObjectService service) {
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
		try{
			this.dominioEsp = (DominioEsp)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public DominioEsp getDominioEsp() {
		return dominioEsp;
	}

	public void setDominioEsp(DominioEsp dominioEsp) {
		this.dominioEsp = dominioEsp;
		this.pobject = this.dominioEsp;
	}

	public List<PObject> getDominioEsps(){
		return dominioEsps;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountDominioEsp", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getDominioEspPaiList(){
		try{
			return (List<PObject>)this.service.genericFindByNamedQuery("getDominioEsp", null, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public List<PObject> getDominioList(){
		try{
			return (List<PObject>)this.service.genericFindByNamedQuery("getDominio", null, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}
}