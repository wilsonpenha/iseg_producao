/** ********************************************************* */
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/** ********************************************************* */
package iseg.app.action;

import iseg.app.model.Endereco;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PessoaJuridicaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private PessoaJuridica pessoaJuridica;
	private Endereco endereco;
	private List<PObject> pessoaJuridicas;
	private Long idPessoaJuridica;
	private Pessoa pessoa;
	protected PObjectService service;

	//@Autowired
	public PessoaJuridicaAction(PObjectService service) {
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

	protected void persistPObjects(){
		if (pessoaJuridica.getAtividadeComercial()!=null && pessoaJuridica.getAtividadeComercial().getId()==null)
			pessoaJuridica.setAtividadeComercial(null);
		if (pessoaJuridica.getGrupoDeVenda()!=null && pessoaJuridica.getGrupoDeVenda().getId()==null)
			pessoaJuridica.setGrupoDeVenda(null);
		this.pessoaJuridica.setIsGeneric(false);

	}
	protected void setPObjectInstance() {
		try{
			this.pessoaJuridica = (PessoaJuridica) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
		this.pobject = this.pessoaJuridica;

	}

	public Long getIdPessoaJuridica() {
		return idPessoaJuridica;
	}

	public void setIdPessoaJuridica(Long idPessoaJuridica) {
		this.idPessoaJuridica = idPessoaJuridica;
	}

	public List<PObject> getPessoaJuridicas() {
		return pessoaJuridicas;
	}

	public int getRowCount() {
		try{
			return this.service.getRowCount("getCountPessoaJuridica", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
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

	@SuppressWarnings("unchecked")
	@Override
	public String salvarEditar() {
		try {

			if (pessoaJuridica.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.pessoaJuridica.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			pessoaJuridica.setGrupoDeVenda(pessoaJuridica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaJuridica.getGrupoDeVenda()));
			getSession().put("cadastroCorrente", "pessoaJuridica");

			if(this.pessoaJuridica.getEnderecoCollection()!=null && (this.pessoaJuridica.getEnderecoCollection().size()==1)){
				this.pessoaJuridica.getEnderecoCollection().get(0).setPessoa(this.pessoaJuridica);
			}

			return super.salvarEditar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	public String salvarLista() {
		try {

			if (pessoaJuridica.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.pessoaJuridica.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			pessoaJuridica.setGrupoDeVenda(pessoaJuridica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaJuridica.getGrupoDeVenda()));
			if(this.pessoaJuridica.getEnderecoCollection()!=null && (this.pessoaJuridica.getEnderecoCollection().size()==1)){
				this.pessoaJuridica.getEnderecoCollection().get(0).setPessoa(this.pessoaJuridica);
			}
			super.salvarLista();

			return "pessoa";

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	public String salvarNovo() {
		try {

			if (pessoaJuridica.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.pessoaJuridica.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.pessoaJuridica.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}

			pessoaJuridica.setGrupoDeVenda(pessoaJuridica.getGrupoDeVenda().getId() == null ? null : (GrupoDeVenda) this.service.find(pessoaJuridica.getGrupoDeVenda()));
			if(this.pessoaJuridica.getEnderecoCollection()!=null && (this.pessoaJuridica.getEnderecoCollection().size()==1)){
				this.pessoaJuridica.getEnderecoCollection().get(0).setPessoa(this.pessoaJuridica);
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
		try{
			getSession().put("cadastroCorrente", "pessoaJuridica");
			if (this.pessoaJuridica == null || this.pessoaJuridica.getId() == null) {
				this.pessoaJuridica = (PessoaJuridica)this.service.find(PessoaJuridica.class, this.pessoa.getId());
				this.pobject = this.pessoaJuridica;
			}
			return super.editar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getDominioEspList() {
		return this.getDominioList("AtividadeComercial");
	}

	public List<Uf> getUfList() {
		try{
			return this.service.genericFindByNamedQuery("getUf", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Uf>();
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

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
}
/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
