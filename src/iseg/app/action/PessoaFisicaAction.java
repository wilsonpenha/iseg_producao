/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Endereco;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PessoaFisicaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private PessoaFisica pessoaFisica;
	private Endereco endereco;
	private List<PObject> pessoaFisicas;
	private Long idPessoaFisica;
	private Pessoa pessoa;

	//@Autowired
	public PessoaFisicaAction(PObjectService service) {
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

	protected void persistPObjects() throws Exception {
		if (this.pessoaFisica.getGrupoDeVenda()!=null && this.pessoaFisica.getGrupoDeVenda().getId()==null)
			this.pessoaFisica.setGrupoDeVenda(null);
		if(this.pessoaFisica.getProfissao() != null && this.pessoaFisica.getProfissao().getId() == null)
			this.pessoaFisica.setProfissao(null);
		this.pessoaFisica.setIsGeneric(false);
	}

	protected void setPObjectInstance() {
		try{
			this.pessoaFisica = (PessoaFisica) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
		this.pobject = this.pessoaFisica;
	}

	public Long getIdPessoaFisica() {
		return idPessoaFisica;
	}

	public void setIdPessoaFisica(Long idPessoaFisica) {
		this.idPessoaFisica = idPessoaFisica;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public List<PObject> getPessoaFisicas() {
		return pessoaFisicas;
	}

	public int getRowCount() {
		try{
			return this.service.getRowCount("getCountPessoaFisica", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	@Override
	public String salvarEditar() {
		try {

			if (pessoaFisica.getId()==null){
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CPF já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				for (PessoaFisica pessoaFisica : pessoas) {
					if (pessoaFisica.getId().longValue()!=this.pessoaFisica.getId().longValue()){
						addActionError("CPF já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			//pessoaFisica.setGrupoDeVenda(pessoaFisica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaFisica.getGrupoDeVenda()));
			getSession().put("cadastroCorrente", "pessoaFisica");

			if(this.pessoaFisica.getEnderecoCollection()!=null && (this.pessoaFisica.getEnderecoCollection().size()==1)){
				this.pessoaFisica.getEnderecoCollection().get(0).setPessoa(this.pessoaFisica);
			}
			this.persistPObjects();
			this.service.save(this.pessoaFisica);
			this.pobject = service.find(this.pessoaFisica);
			this.setPObjectInstance();
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}

	}

	@SkipValidation
	@Override
	public String salvarLista() {
		try {

			if (pessoaFisica.getId()==null){
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CPF já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				for (PessoaFisica pessoaFisica : pessoas) {
					if (pessoaFisica.getId().longValue()!=this.pessoaFisica.getId().longValue()){
						addActionError("CPF já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			pessoaFisica.setGrupoDeVenda(pessoaFisica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaFisica.getGrupoDeVenda()));

			if(this.pessoaFisica.getEnderecoCollection()!=null && (this.pessoaFisica.getEnderecoCollection().size()==1)){
				this.pessoaFisica.getEnderecoCollection().get(0).setPessoa(this.pessoaFisica);
			}
			super.salvarLista();

			return "pessoa";

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}

	}

	@SkipValidation
	@Override
	public String salvarNovo() {
		try {

			if (pessoaFisica.getId()==null){
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CPF já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.pessoaFisica.getCpfOuCnpj()});
				for (PessoaFisica pessoaFisica : pessoas) {
					if (pessoaFisica.getId().longValue()!=this.pessoaFisica.getId().longValue()){
						addActionError("CPF já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			pessoaFisica.setGrupoDeVenda(pessoaFisica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaFisica.getGrupoDeVenda()));

			if(this.pessoaFisica.getEnderecoCollection()!=null && (this.pessoaFisica.getEnderecoCollection().size()==1)){
				this.pessoaFisica.getEnderecoCollection().get(0).setPessoa(this.pessoaFisica);
			}
			return super.salvarNovo();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR; 
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String editar() {
		try {
			getSession().put("cadastroCorrente", "pessoaFisica");
			if (this.pessoaFisica == null || this.pessoaFisica.getId() == null) {
				this.pessoaFisica = (PessoaFisica)this.service.find(PessoaFisica.class, this.pessoa.getId());
				this.pobject = this.pessoaFisica;
			}
			return super.editar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	@Override
	public String lista() {
		try{
			return "pessoa";
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
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
}
/** ********************************************************* */
// Atlas, 2008
/** ********************************************************* */
