/************************************************************/
//Titulo.....: Projeto iseg.app.model
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 24/10/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.TerceiroEnvolvidoService;
import iseg.app.model.TerceiroEnvolvido;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class TerceiroEnvolvidoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private TerceiroEnvolvido terceiroEnvolvido;
    private List<PObject> terceiroEnvolvidos;
	protected TerceiroEnvolvidoService service;

	//@Autowired
    public TerceiroEnvolvidoAction(TerceiroEnvolvidoService service) {
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
			this.terceiroEnvolvido = (TerceiroEnvolvido)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public TerceiroEnvolvido getTerceiroEnvolvido() {
        return terceiroEnvolvido;
    }

    public void setTerceiroEnvolvido(TerceiroEnvolvido terceiroEnvolvido) {
        this.terceiroEnvolvido = terceiroEnvolvido;
        this.pobject = this.terceiroEnvolvido;
    }

    public List<PObject> getTerceiroEnvolvidos(){
		try {
	    	return terceiroEnvolvidos;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
    }

	public int getRowCount(){
		try {
	    	return this.service.getRowCount("getCountTerceiroEnvolvido", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
    }

}





/************************************************************/
// Atlas, 2008
/************************************************************/
