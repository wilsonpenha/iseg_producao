/************************************************************/
//Titulo.....: Projeto iseg.app.model
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 24/10/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Oficina;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class OficinaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Oficina oficina;
	private List<PObject> oficinas;

	//@Autowired
	public void setOficinas(List<PObject> oficinas) {
		this.oficinas = oficinas;
	}

	public OficinaAction(PObjectService service) {
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
		if (oficina.getAtividadeComercial()!=null && oficina.getAtividadeComercial().getId()==null)
			oficina.setAtividadeComercial(null);
		if (oficina.getGrupoDeVenda()!=null && oficina.getGrupoDeVenda().getId()==null)
			oficina.setGrupoDeVenda(null);
		this.oficina.setIsGeneric(true);

	}

	protected void setPObjectInstance() {
		try {
			this.oficina = (Oficina) this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Oficina getOficina() {
		return oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
		this.pobject = this.oficina;
	}

	public List<PObject> getOficinas() {
		try {
			return oficinas;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCountOficina", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SkipValidation
	public String salvarListar() {
		try {
			if (oficina.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.oficina.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if (this.oficina.getEnderecoCollection() != null
					&& (this.oficina.getEnderecoCollection().size() == 1)) {
				this.oficina.getEnderecoCollection().get(0).setPessoa(
						this.oficina);
			}
			return super.salvarLista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	@SkipValidation
	public String salvarNovo() {
		try {
			if (oficina.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.oficina.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if (this.oficina.getEnderecoCollection() != null
					&& (this.oficina.getEnderecoCollection().size() == 1)) {
				this.oficina.getEnderecoCollection().get(0).setPessoa(
						this.oficina);
			}
			return super.salvarNovo();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@Override
	@SkipValidation
	public String salvarEditar() {
		try {
			if (oficina.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.oficina.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.oficina.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if (this.oficina.getEnderecoCollection() != null
					&& (this.oficina.getEnderecoCollection().size() == 1)) {
				this.oficina.getEnderecoCollection().get(0).setPessoa(
						this.oficina);
			}
			return super.salvarEditar();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {
		try {
			getSession().put("cadastroCorrente", "oficina");
			return super.lista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getDominioEspList() {
		return this.getDominioList("atividadeComercial");
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfs() {
		try {
			return (List<Uf>) this.service.genericFindBySQLQuery(
					"Select u From Uf u order by u.nome", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Uf>();
		}
	}

}

/** ********************************************************* */
// Atlas, 2008
/** ********************************************************* */
