/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.ContaCorrente;
import iseg.app.model.Corretora;
import iseg.app.model.Pessoa;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ContaCorrenteAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private ContaCorrente contaCorrente;
	private List<PObject> contasCorrentes;
	protected PObjectService service;
	private String cadastroCorrente;

	//@Autowired
	public ContaCorrenteAction(PObjectService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

			cadastroCorrente = (String)getSession().get("cadastroCorrente");
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	@Override
	public String salvarNovo() {
		try{

			this.persistPObjects();
			this.service.save(pobject);
			this.novo();
			return resultadoAction(Action.SUCCESS);

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}


	@SkipValidation
	@Override
	public String salvarEditar() {
		super.salvarEditar();
		return resultadoAction(Action.SUCCESS);
	}

	@SkipValidation
	public String excluir() {
		String result = super.excluir();
		return result;
	}

	@SkipValidation
	@Override
	public String novo() throws Exception{
		Pessoa pessoa = this.contaCorrente.getPessoa();
		this.contaCorrente = new ContaCorrente();
		this.contaCorrente.setPessoa(pessoa);
		String result = super.novo();
		return resultadoAction(result);
	}

	@SkipValidation
	@Override
	public String editar() {
		String result = super.editar();
		return resultadoAction(result);
	}

	protected void setPObjectInstance() {
		try{
			this.contaCorrente = (ContaCorrente) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public ContaCorrente getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(ContaCorrente contaCorrente) {
		this.contaCorrente = contaCorrente;
		this.pobject = this.contaCorrente;
	}

	public List<PObject> getContasCorrentes(){
		return contasCorrentes;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountContaCorrente", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SkipValidation
	@Override
	public String lista() {
		try{
			String action = Action.SUCCESS;
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = getListContaCorrente();
			if (this.list.size() == 1) {
				this.pobject = (PObject) this.list.get(0);
				this.editar();
				action = Action.INPUT;
			} else if (this.list.size() == 0) {
				this.pobject.setId(null);
				action = Action.NONE;
			}

			return resultadoAction(action);
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getListContaCorrente() {
		try{
			return service.genericFindByNamedQuery("getContaCorrenteByPessoaId", new Object[] { this.getContaCorrente().getPessoa().getId() }, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public Boolean getIsCorretora(){
		try{
			if (this.contaCorrente!=null){
				List<Corretora> corretora = this.service.genericFindByNamedQuery("getCorretoraByID", new Object[] {this.contaCorrente.getPessoa().getId()});
				if (corretora.size()>0)
					return true;
			}
		}catch (Exception e) {
			addActionError(e.getMessage());
		}
		return false;
	}
	/*
	 * M�todo responsavel por verificar qual objeto o Endere�o se refere.
	 */
	private String resultadoAction(String result) {

		this.cadastroCorrente = (String)getSession().get("cadastroCorrente");
		String actionString = "";

		if(cadastroCorrente.equals("pessoaFisica")) {
			actionString = "pessoafisica";
		}else if(cadastroCorrente.equals("produtor")){
			actionString = "produtor";
		}else if (cadastroCorrente.equals("pessoaJuridica")){
			actionString = "pessoajuridica";
		}else if(cadastroCorrente.equals("corretora")){
			if(!result.equals("successcorretora") &&
					!result.equals("inputcorretora")&&
					!result.equals("nonecorretora")){
				actionString = "corretora";}
		}else if(cadastroCorrente.equals("seguradora")){
			actionString = "";
		}
		return result+actionString;

	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/