/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Dominio;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class DominioAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Dominio dominio;
	private List<PObject> dominios;

	//@Autowired
	public DominioAction(PObjectService service) {
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
			this.dominio = (Dominio)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Dominio getDominio() {
		return dominio;
	}

	public void setDominio(Dominio dominio) {
		this.dominio = dominio;
		this.pobject = this.dominio;
	}

	public List<PObject> getDominios(){
		return dominios;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountDominio", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/