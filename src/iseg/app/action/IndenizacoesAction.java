/************************************************************/
//Titulo.....: Projeto iseg.app.model
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 24/10/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.IndenizacoesService;
import iseg.app.model.Indenizacoes;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class IndenizacoesAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Indenizacoes indenizacoes;
    private List<PObject> indenizacoess;
	protected IndenizacoesService service;

	//@Autowired
    public IndenizacoesAction(IndenizacoesService service) {
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
			this.indenizacoes = (Indenizacoes)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Indenizacoes getIndenizacoes() {
        return indenizacoes;
    }

    public void setIndenizacoes(Indenizacoes indenizacoes) {
        this.indenizacoes = indenizacoes;
        this.pobject = this.indenizacoes;
    }

    public List<PObject> getIndenizacoess(){
		try {
	    	return indenizacoess;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
    }

	public int getRowCount(){
		try {
	    	return this.service.getRowCount("getCountIndenizacoes", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
    }

}





/************************************************************/
// Atlas, 2008
/************************************************************/
