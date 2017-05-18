/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.SmsEventosCorretora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class SmsEventosCorretoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private SmsEventosCorretora smsEventosCorretora;
	private List<PObject> smsEventosCorretoraList;
	protected PObjectService service;

	//@Autowired
	public SmsEventosCorretoraAction(PObjectService service) {
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
			this.list = this.service.genericFindByNamedQuery("getSmsEventosCorretoraByCorretora", new Object[]{this.smsEventosCorretora.getCorretora().getId()}, page, pageSize);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.smsEventosCorretora = (SmsEventosCorretora)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public SmsEventosCorretora getSmsEventosCorretora() {
		return smsEventosCorretora;
	}

	public void setSmsEventosCorretora(SmsEventosCorretora smsEventosCorretora) {
		this.smsEventosCorretora = smsEventosCorretora;
		this.pobject = this.smsEventosCorretora;
	}

	public List<PObject> getSmsEventosCorretoraList(){
		return smsEventosCorretoraList;
	}
	
	public void persistPObjects() throws Exception{
		if (this.smsEventosCorretora.getSmsEventos()!=null && this.smsEventosCorretora.getSmsEventos().getId()==null)
			throw new Exception("É Obrigatorio informar um evento!");
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountSmsEventosCorretoraByCorretora", new Object[]{this.smsEventosCorretora.getCorretora().getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/