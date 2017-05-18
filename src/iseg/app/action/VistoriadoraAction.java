/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Endereco;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Uf;
import iseg.app.model.Vistoriadora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class VistoriadoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Vistoriadora vistoriadora;
	private Endereco endereco;
	private List<PObject> vistoriadoras;

	//@Autowired
	public VistoriadoraAction(PObjectService service) {
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
		if (vistoriadora.getAtividadeComercial()!=null && vistoriadora.getAtividadeComercial().getId()==null)
			vistoriadora.setAtividadeComercial(null);
		if (vistoriadora.getGrupoDeVenda()!=null && vistoriadora.getGrupoDeVenda().getId()==null)
			vistoriadora.setGrupoDeVenda(null);
		this.vistoriadora.setIsGeneric(false);
	}

	protected void setPObjectInstance() {
		this.vistoriadora = (Vistoriadora) this.pobject;
	}

	public Vistoriadora getVistoriadora() {
		return vistoriadora;
	}

	public void setVistoriadora(Vistoriadora vistoriadora) {
		this.vistoriadora = vistoriadora;
		this.pobject = this.vistoriadora;
	}

	public List<PObject> getVistoriadoras() {
		return vistoriadoras;
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountVistoriadora", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SkipValidation
	public String salvarListar(){
		try{
			if (vistoriadora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.vistoriadora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
	
			if(this.vistoriadora.getEnderecoCollection()!=null && (this.vistoriadora.getEnderecoCollection().size()==1)){
				this.vistoriadora.getEnderecoCollection().get(0).setPessoa(this.vistoriadora);
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
			if (vistoriadora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.vistoriadora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
	
			if(this.vistoriadora.getEnderecoCollection()!=null && (this.vistoriadora.getEnderecoCollection().size()==1)){
				this.vistoriadora.getEnderecoCollection().get(0).setPessoa(this.vistoriadora);
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
			if (vistoriadora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.vistoriadora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.vistoriadora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
	
			if(this.vistoriadora.getEnderecoCollection()!=null && (this.vistoriadora.getEnderecoCollection().size()==1)){
				this.vistoriadora.getEnderecoCollection().get(0).setPessoa(this.vistoriadora);
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
		getSession().put("cadastroCorrente","vistoriadora");
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

}
/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */