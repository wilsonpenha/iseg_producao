/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.SmsEventos;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;


import com.opensymphony.xwork2.Preparable;

public class SmsEventosAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private SmsEventos smsEventos;
	private List<PObject> smsEventosList;
	protected PObjectService service;

	//@Autowired
	public SmsEventosAction(PObjectService service) {
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
			this.smsEventos = (SmsEventos)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public SmsEventos getSmsEventos() {
		return smsEventos;
	}

	public void setSmsEventos(SmsEventos smsEventos) {
		this.smsEventos = smsEventos;
		this.pobject = this.smsEventos;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountSmsEventos", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/