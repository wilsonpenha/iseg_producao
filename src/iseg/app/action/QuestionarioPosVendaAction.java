/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.QuestionarioPosVenda;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class QuestionarioPosVendaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private QuestionarioPosVenda questionarioPosVenda;
	private List<PObject> questionarioPosVendas;

	//@Autowired
	public QuestionarioPosVendaAction(PObjectService service) {
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
		QuestionarioPosVenda questionarioPosVenda = (QuestionarioPosVenda)Util.cloneBean(this.questionarioPosVenda);
		questionarioPosVenda.setId(null);
		this.questionarioPosVenda = questionarioPosVenda;

		return Action.SUCCESS;
	}

	@Override
	@SkipValidation
	public String lista() {
		try {
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = (List<PObject>) service.genericFindByNamedQuery("getQuestionarioPosVenda", new Object[] {}, page,pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.questionarioPosVenda = (QuestionarioPosVenda) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public QuestionarioPosVenda getQuestionarioPosVenda() {
		return questionarioPosVenda;
	}

	public void setQuestionarioPosVenda(QuestionarioPosVenda questionarioPosVenda) {
		this.questionarioPosVenda = questionarioPosVenda;
		this.pobject = this.questionarioPosVenda;
	}

	public List<PObject> getQuestionarioPosVendas() {
		return questionarioPosVendas;
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountQuestionarioPosVenda", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

}

/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
