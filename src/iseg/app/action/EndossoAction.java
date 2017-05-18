/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Endosso;
import iseg.app.model.Ramo;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class EndossoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Endosso endosso;
	private List<PObject> endossos;
	private Ramo ramo;

	//@Autowired
	public EndossoAction(PObjectService service) {
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

	@Override
	@SkipValidation
	public String novo() {
		Endosso endosso = (Endosso)Util.cloneBean(this.endosso);
		endosso.setId(null);
		this.endosso = endosso;

		return Action.SUCCESS;
	}

	@Override
	@SkipValidation
	public String lista() {
		try {
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = (List<PObject>) service.genericFindByNamedQuery("getEndosso", new Object[] {}, page,pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.endosso = (Endosso) this.pobject;
			if (this.endosso.getRamo().getSubRamo()==null || this.endosso.getRamo().getSubRamo().getId()==null){
				this.ramo = new Ramo();
				this.ramo.setSubRamo(this.endosso.getRamo());
			}else
				this.ramo = this.endosso.getRamo();
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	protected void persistPObjects() throws Exception {
		if (this.ramo.getSubRamo().getId()!=null)
			if (this.ramo.getId()==null){
				List<Ramo> ramos = this.service.genericFindByNamedQuery("getSubRamo", new Object[]{this.ramo.getSubRamo().getId()});
				if (ramos.size()>0)
					throw new Exception(" obrigatrio informar o Sub-Ramo!");
				this.endosso.setRamo(this.ramo.getSubRamo());
			}else
				this.endosso.setRamo(this.ramo);
		else{
			throw new Exception(" obrigatrio informar o Ramo!");
		}
	}

	public Endosso getEndosso() {
		return endosso;
	}

	public void setEndosso(Endosso endosso) {
		this.endosso = endosso;
		this.pobject = this.endosso;
	}

	public List<PObject> getEndossos() {
		return endossos;
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountEndosso", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

}

/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
