/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Corretora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class GerenciarCorretoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Corretora corretora;
	private List<PObject> corretoras;
	protected PObjectService service;

	//@Autowired
	public GerenciarCorretoraAction(PObjectService service) {
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
			this.corretora = (Corretora)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
		this.pobject = this.corretora;
	}

	public List<PObject> getCorretoras(){
		return corretoras;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCorretora", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/