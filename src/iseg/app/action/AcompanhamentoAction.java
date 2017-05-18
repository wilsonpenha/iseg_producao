/************************************************************/
//Titulo.....: Projeto iseg.app.model
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 24/10/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.AcompanhamentoService;
import iseg.app.model.Acompanhamento;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class AcompanhamentoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Acompanhamento acompanhamento;
    private List<PObject> acompanhamentos;
	protected AcompanhamentoService service;

    public AcompanhamentoAction(AcompanhamentoService service) {
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
			this.acompanhamento = (Acompanhamento)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Acompanhamento getAcompanhamento() {
        return acompanhamento;
    }

    public void setAcompanhamento(Acompanhamento acompanhamento) {
        this.acompanhamento = acompanhamento;
        this.pobject = this.acompanhamento;
    }

    public List<PObject> getAcompanhamentos(){
		try {
	    	return acompanhamentos;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
    }

	public int getRowCount(){
    	try {
			return this.service.getRowCount("getCountAcompanhamento", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
    }

}





/************************************************************/
// Atlas, 2008
/************************************************************/
