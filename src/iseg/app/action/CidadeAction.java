/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Cidade;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class CidadeAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Cidade cidade;
	private List<PObject> cidades;
	protected PObjectService service;

	//@Autowired
	public CidadeAction(PObjectService service) {
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
			this.cidade = (Cidade)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
		this.pobject = this.cidade;
	}

	public List<PObject> getCidades(){
		return cidades;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCidade", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/