/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.CondicaoPagamento;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class CondicaoPagamentoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private CondicaoPagamento condicaoPagamento;
	private List<PObject> condicaoPagamentos;

	//@Autowired
	public CondicaoPagamentoAction(PObjectService service) {
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
		if (this.listCount == 0)
			this.listCount = this.getRowCount();
		this.list = getListCondicaoPagamento();

		return Action.SUCCESS;
	}

	protected void setPObjectInstance() {
		try {
			this.condicaoPagamento = (CondicaoPagamento)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public CondicaoPagamento getCondicaoPagamento() {
		return condicaoPagamento;
	}

	public void setCondicaoPagamento(CondicaoPagamento condicaoPagamento) {
		this.condicaoPagamento = condicaoPagamento;
		this.pobject = this.condicaoPagamento;
	}

	public List<PObject> getCondicaoPagamentos(){
		return condicaoPagamentos;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCondicaoPagamento", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getListCondicaoPagamento() {
		try {
			return (List<PObject>) service.genericFindByNamedQuery("getCondicaoPagamentoBySeguradora", new Object[] { this.getCondicaoPagamento().getSeguradora().getId() }, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/