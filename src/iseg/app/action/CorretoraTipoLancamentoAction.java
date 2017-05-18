/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.CorretoraTipoLancamento;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class CorretoraTipoLancamentoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private CorretoraTipoLancamento corretoraTipoLancamento;
	private List<PObject> corretoraTipoLancamentoList;
	protected PObjectService service;

	//@Autowired
	public CorretoraTipoLancamentoAction(PObjectService service) {
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

	public String novo() throws Exception{
		try {
			corretoraTipoLancamento = new CorretoraTipoLancamento();
			this.pobject = corretoraTipoLancamento;
			super.novo();
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String lista() {
		try {

			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = this.service.genericFindByNamedQuery("getCorretoraTipoLancamentoByCorretora", new Object[]{this.corretoraTipoLancamento.getCorretora().getId()}, page, pageSize);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.corretoraTipoLancamento = (CorretoraTipoLancamento)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public CorretoraTipoLancamento getCorretoraTipoLancamento() {
		return corretoraTipoLancamento;
	}

	public void setCorretoraTipoLancamento(CorretoraTipoLancamento corretoraTipoLancamento) {
		this.corretoraTipoLancamento = corretoraTipoLancamento;
		this.pobject = this.corretoraTipoLancamento;
	}

	public List<PObject> getCorretoraTipoLancamentoList(){
		return corretoraTipoLancamentoList;
	}
	
	public void persistPObjects() throws Exception{
		if (this.corretoraTipoLancamento.getTipoLancamento()!=null && this.corretoraTipoLancamento.getTipoLancamento().getId()==null)
			throw new Exception("É Obrigatorio informar um Tipo de lancamento!");
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCorretoraTipoLancamentoByCorretora", new Object[]{this.corretoraTipoLancamento.getCorretora().getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}
}

/************************************************************/
//Atlas, 2008
/************************************************************/