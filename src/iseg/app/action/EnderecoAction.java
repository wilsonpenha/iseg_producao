/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Cidade;
import iseg.app.model.Endereco;
import iseg.app.model.Pessoa;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class EnderecoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Endereco endereco;
	private List<PObject> enderecos;
	private List<String[]> options = new ArrayList<String[]>();
	private String jsonList;
	private String cadastroCorrente;
	private List<Cidade> cidadeList;

	//@Autowired
	public EnderecoAction(PObjectService service) {
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
	public String lista() {
		try{
			String action = Action.SUCCESS;
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = getListEndereco();
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

	protected void persistPObjects() throws Exception {
		Pessoa pessoa = (Pessoa)this.service.find(this.endereco.getPessoa());
		if (this.endereco.getCorrespondencia() != null && this.endereco.getCorrespondencia().equals("SIM")){
			for (Endereco endereco : pessoa.getEnderecoCollection()) {
				if (this.endereco.getId()==null || endereco.getId().longValue()!=this.endereco.getId().longValue()){
					endereco.setCorrespondencia("NAO");
					this.service.save(endereco);
				}
			}
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
		Pessoa pessoa = this.endereco.getPessoa();
		this.endereco = new Endereco();
		this.endereco.setPessoa(pessoa);
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
			this.endereco = (Endereco) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
		this.pobject = this.endereco;
	}

	public List<PObject> getEnderecos() {
		return enderecos;
	}

	public List<Cidade> getCidadeList() {
		return cidadeList;
	}

	public void setCidadeList(List<Cidade> cidadeList) {
		this.cidadeList = cidadeList;
	}

	public List<String[]> getOptions() {
		return options;
	}

	public String getJsonList() {
		return jsonList;
	}

	public int getRowCount() {
		try{
			return this.service.getRowCount("getCountEnderecoByPessoaId", new Object[] { this.getEndereco().getPessoa().getId() });
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getListEndereco() {
		try{
			return service.genericFindByNamedQuery("getEnderecoByPessoaId", new Object[] { this.getEndereco().getPessoa().getId() }, page, pageSize);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public List<PObject> getTipoEnderecoList() {
		return this.getDominioList("TipoEndereco");
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfs(){
		try{
			return (List<Uf>)this.service.genericFindBySQLQuery("Select u From Uf u order by u.nome", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Uf>();
		}
	}

	public String getJsonArray(ArrayList arrayList) {
		JSONArray jsonArray = JSONArray.fromObject(arrayList);
		String json = jsonArray.toString().replace("{", "[");
		json = json.replace("}", "]");
		System.out.println(json);
		return json;
	}

	/*
	 * Método responsavel por verificar qual objeto o Endereço se refere.
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
		}else if(cadastroCorrente.equals("oficina")){
			actionString = "oficina";
		}else if(cadastroCorrente.equals("vistoriadora")){
			actionString = "vistoriadora";
		}

		return result+actionString;

	}
}

/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
