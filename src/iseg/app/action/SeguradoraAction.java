/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.exception.GenericException;
import iseg.app.model.Endereco;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Seguradora;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class SeguradoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Seguradora seguradora;
	private Endereco endereco;
	private List<PObject> seguradoras;
	private Pessoa pessoa;

	//@Autowired
	public SeguradoraAction(PObjectService service) {
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
		try {
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getIsAssessorada())
				throw new Exception("Assessorada não pode incluir nova Seguradora, contate a assessoria!");

			this.seguradora = new Seguradora();
	
			return Action.SUCCESS;
		} catch (Exception e) {
			this.lista();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try {
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getIsAssessorada())
				throw new Exception("Seguradora não pode ser excluida pela assessoarada!");

			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (GenericException ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		this.seguradora = (Seguradora) this.pobject;
	}

	protected void persistPObjects() throws Exception {
		if (this.seguradora.getAtividadeComercial()!=null && this.seguradora.getAtividadeComercial().getId()==null)
			this.seguradora.setAtividadeComercial(null);
		if (this.seguradora.getGrupoDeVenda().getId()==null)
			this.seguradora.setGrupoDeVenda(null);
		if (this.seguradora.getCiaAgrupadora()!=null && this.seguradora.getCiaAgrupadora().getId()==null)
			this.seguradora.setCiaAgrupadora(null);
		this.seguradora.setIsGeneric(true);
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
		this.pobject = this.seguradora;
	}

	public List<PObject> getSeguradoras() {
		return seguradoras;
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountSeguradora", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String editar() {
		try{
			getSession().put("cadastroCorrente", "seguradora");
			if (this.seguradora == null || this.seguradora.getId() == null) {
				this.seguradora = (Seguradora)this.service.find(Seguradora.class, this.pessoa.getId());
				this.pobject = this.seguradora;
			}
			return super.editar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String salvarListar(){
		try{
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getIsAssessorada())
				throw new Exception("Seguradora não pode ser alterada pela assessoarada!");

			if (seguradora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.seguradora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}
			if(this.seguradora.getEnderecoCollection()!=null && (this.seguradora.getEnderecoCollection().size()==1)){
				this.seguradora.getEnderecoCollection().get(0).setPessoa(this.seguradora);
			}
			return super.salvarLista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String salvarNovo(){
		try{
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getIsAssessorada())
				throw new Exception("Seguradora não pode ser alterada pela assessoarada!");

			if (seguradora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.seguradora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}
			if(this.seguradora.getEnderecoCollection()!=null && (this.seguradora.getEnderecoCollection().size()==1)){
				this.seguradora.getEnderecoCollection().get(0).setPessoa(this.seguradora);
			}
			return super.salvarNovo();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String salvarEditar(){
		try{
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getIsAssessorada())
				throw new Exception("Seguradora não pode ser alterada pela assessoarada!");

			if (seguradora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.seguradora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}
			if(this.seguradora.getEnderecoCollection()!=null && (this.seguradora.getEnderecoCollection().size()==1)){
				this.seguradora.getEnderecoCollection().get(0).setPessoa(this.seguradora);
			}
			return super.salvarEditar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista(){
		getSession().put("cadastroCorrente","seguradora");
		return super.lista();
	}

	public List<PObject> getDominioEspList(){
		return this.getDominioList("atividadeComercial");
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfs(){
		try {
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