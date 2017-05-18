package iseg.app.action;

import iseg.app.business.PessoaService;
import iseg.app.model.Corretora;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Produtor;
import iseg.app.model.Seguradora;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PessoaAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;

	private Pessoa pessoa;
	private Pessoa pessoaSearch;
	private Produtor produtor;
	private List<Pessoa> pessoas;
	protected PessoaService service;
	protected Integer tipoCliente;

	protected Boolean mostraUltimaLista = new Boolean(false);

	//@Autowired
	public PessoaAction(PessoaService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		super.prepare();
		if(this.getSession().get("pessoaSearch") != null){
			this.pessoaSearch = (Pessoa) this.getSession().get("pessoaSearch");
			this.page = (Integer)this.getSession().get("page");
			this.pageSize = (Integer)this.getSession().get("pageSize");
		}
	}

	@Override
	public String execute() {
		this.pessoa = new Pessoa();
		return Action.SUCCESS;
	}

	@Override
	@SkipValidation
	public String novo() {
		try {

			if (tipoCliente==0){
				return "pessoaFisica";
			}else if (tipoCliente==1){
				return "pessoaJuridica";
			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@Override
	@SkipValidation
	public String editar() {
		try {

			this.pessoa = (Pessoa)this.service.find(this.pessoa);

			if (this.pessoa instanceof PessoaFisica){
				Produtor produtor = (Produtor)this.service.find(Produtor.class, pessoa.getId());
				if(produtor!=null){
					return "produtor";
				}
				return "pessoaFisica";
			}else if (this.pessoa instanceof Corretora){
				return "corretora";
			}else if (this.pessoa instanceof Seguradora){
				return "seguradora";
			}else if (this.pessoa instanceof PessoaJuridica){
				return "pessoaJuridica";
			}else{
				
			}
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		try {

			this.getSession().put("pessoaSearch", pessoaSearch);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			if(this.pessoaSearch != null){
				this.listCount = this.service.getCountPessoasForSearch(pessoaSearch).intValue();
				this.pessoas = this.service.getPessoasForSearch(pessoaSearch, page, pageSize);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try{
			for(int i=0 ; i<id.length ; i++){
				if(id[i]!=null){
					pobject.setId(id[i]);
					this.service.remove(pobject);
				}
			}

			return this.lista();

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountPessoa", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	@Override
	protected void persistPObjects(){}

	protected void setPObjectInstance() {
		this.pessoa = (Pessoa)this.pobject;
	}

	public Pessoa getPessoaSearch() {
		return pessoaSearch;
	}

	public void setPessoaSearch(Pessoa pessoaSearch) {
		this.pessoaSearch = pessoaSearch;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
		this.pobject = this.pessoa;
	}

	public List<Pessoa> getPessoas(){
		return pessoas;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public String getListResultPage(){
		return "/WEB-INF/jsp/pessoa/displayListResult.jsp";
	}

	public String getListPage(){
		return "/WEB-INF/jsp/pessoa/displayList.jsp";
	}

	public Integer getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(Integer tipoCliente) {
		this.tipoCliente = tipoCliente;
	}

	public Boolean getMostraUltimaLista() {
		return mostraUltimaLista;
	}

	public void setMostraUltimaLista(Boolean mostraUltimaLista) {
		this.mostraUltimaLista = mostraUltimaLista;
	}

}