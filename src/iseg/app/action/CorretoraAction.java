/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.exception.GenericException;
import iseg.app.model.Coberturas;
import iseg.app.model.Corretora;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Servicos;
import iseg.app.model.Uf;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class CorretoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Corretora corretora;
	private Pessoa pessoa;
	protected PObjectService service;

	//@Autowired
	public CorretoraAction(PObjectService service) {
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
		if (this.corretora.getAtividadeComercial()!=null && this.corretora.getAtividadeComercial().getId()==null)
			this.corretora.setAtividadeComercial(null);
		if (this.corretora.getPessoaFisica()!=null && this.corretora.getPessoaFisica().getId()==null)
			this.corretora.setPessoaFisica(null);
		if (this.corretora.getGrupoDeVenda()!=null && this.corretora.getGrupoDeVenda().getId()==null)
			this.corretora.setGrupoDeVenda(null);
		if (this.corretora.getId()!=null)
			this.corretora.setCorretora(this.corretora);
		this.corretora.setIsGeneric(false);
		
		if (!this.corretora.getUsarCoberturasAssessoria()){
			try{
				if (this.corretora.getId()==null){
					List<Coberturas> coberturas = this.service.genericFindByNamedQuery("getCoberturas", new Object[]{new Long("1")});
					List<Servicos> servicos = this.service.genericFindByNamedQuery("getServicos", new Object[]{new Long("1")});
					for (Coberturas cobertura : coberturas) {
						Coberturas newCobertura = (Coberturas)Util.cloneBean(cobertura, Coberturas.class);
						newCobertura.setId(null);
						newCobertura.setCorretora(this.corretora);
						this.corretora.getCoberturasCollection().add(newCobertura);
					}
					for (Servicos servico : servicos) {
						Servicos newServicos = (Servicos)Util.cloneBean(servico, Servicos.class);
						newServicos.setId(null);
						newServicos.setCorretora(this.corretora);
						this.corretora.getServicosCollection().add(newServicos);
					}
				}else{
					// buscar possivel existencia de coberturas e servicos.
					List<Coberturas> coberturas = this.service.genericFindByNamedQuery("getCoberturas", new Object[]{this.corretora.getId()});
					List<Servicos> servicos = this.service.genericFindByNamedQuery("getServicos", new Object[]{this.corretora.getId()});
					// carregar as coberturas que serão usadas da assessoria.
					List<Coberturas> coberturasNovas = this.service.genericFindByNamedQuery("getCoberturas", new Object[]{new Long("1")});
					List<Servicos> servicosNovos = this.service.genericFindByNamedQuery("getServicos", new Object[]{new Long("1")});

					if (coberturas.size()==0){ // se não existirem coberturas na corretora, importe todas usadas na assessoria
						for (Coberturas cobertura : coberturasNovas) {
							Coberturas newCobertura = (Coberturas)Util.cloneBean(cobertura, Coberturas.class);
							newCobertura.setId(null);
							newCobertura.setCorretora(this.corretora);
							this.corretora.getCoberturasCollection().add(newCobertura);
						}
					}
					if (servicos.size()==0){ // se não existirem servicos na corretora, importe todas usadas na assessoria
						for (Servicos servico : servicosNovos) {
							Servicos newServicos = (Servicos)Util.cloneBean(servico, Servicos.class);
							newServicos.setId(null);
							newServicos.setCorretora(this.corretora);
							this.corretora.getServicosCollection().add(newServicos);
						}
					}
				}
			}catch (Exception e) {
				addActionError(e.getMessage());
			}
		}
	}

	@SkipValidation
	public String editar() {

		try {

			if (this.pessoa != null) {
				this.pobject = this.pessoa;
			}else if (this.pobject.getId() == null){
				
				if (id == null)// Posteriormente fazer a controle através de // Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			
			this.pobject = service.find(this.pobject);
			this.setPObjectInstance();
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try{
			this.corretora = (Corretora)this.pobject;
		}catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
		this.pobject = this.corretora;
	}

	public String excluir(){
		try {
			if (!this.corretoraEmUso.ehAssessoria()){
				throw new GenericException("Operação Não permitida!");
			}

			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					if (this.pobject.getId().equals(this.corretoraEmUso.getAssessoria().getId().longValue()))
						throw new GenericException("Operação Não permitida!");
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (GenericException ge) {
			addActionError(ge.getMessage());
			getSession().put("cadastroCorrente", "corretora");
			this.lista();
			return Action.ERROR;
		} catch (Exception ge) {
			getSession().put("cadastroCorrente", "corretora");
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			this.lista();
			return Action.ERROR;
		}
	}

	public String novo(){
		try {
			if (!this.corretoraEmUso.ehAssessoria()){
				throw new Exception("Operação Não permitida!");
			}
			this.corretora = new Corretora();
			
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			getSession().put("cadastroCorrente", "corretora");
			this.lista();
			return Action.ERROR;
		}
	}

	@SkipValidation
	@Override
	public String salvarLista() {
		try{
			if (corretora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.corretora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if(this.corretora.getEnderecoCollection()!=null && (this.corretora.getEnderecoCollection().size()==1)){
				this.corretora.getEnderecoCollection().get(0).setPessoa(this.corretora);
			}

			return super.salvarLista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	@Override
	public String salvarNovo() {
		try{
			if (corretora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorInsert";
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.corretora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if(this.corretora.getEnderecoCollection()!=null && (this.corretora.getEnderecoCollection().size()==1)){
				this.corretora.getEnderecoCollection().get(0).setPessoa(this.corretora);
			}
			return super.salvarNovo();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	@SkipValidation
	@Override
	public String salvarEditar(){
		try{
			if (this.corretora.getCpfOuCnpj().getValor()==null || this.corretora.getCpfOuCnpj().getValor().equals(""))
				throw new Exception("O campo CNPJ é de preenchimento obrigatório!");
				
			if (corretora.getId()==null){
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				if (pessoas.size()>0){
					addActionError("CNPJ já cadastrado.");
					return Action.ERROR;
				}
			}else{
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.corretora.getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.corretora.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return Action.ERROR;
					}
				}
			}
			
			if(this.corretora.getEnderecoCollection()!=null && (this.corretora.getEnderecoCollection().size()==1)){
				this.corretora.getEnderecoCollection().get(0).setPessoa(this.corretora);
			}

			super.salvarEditar();
			
			List<Usuario> usuarios = this.service.genericFindByNamedQuery("getUsuariosByCorretora", new Object[] {this.corretora.getId()});
			if (usuarios.size()>0){
				String cnpjUsuario = usuarios.get(0).getUniqueLogin();
				cnpjUsuario = cnpjUsuario.substring(cnpjUsuario.indexOf("@")+1);
				if (!cnpjUsuario.equals(this.corretora.getCpfOuCnpj().getValor())){
					for (Usuario usuario : usuarios) {
						usuario.setUniqueLogin(usuario.getNomeLogin()+"@"+this.corretora.getCpfOuCnpj().getValor());
						this.service.save(usuario);
					}
				}
			}
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String alterarCorretoraEmUso() throws GenericException{
		
		if(this.getUsuarioEmUso().getCorretora().ehAssessoria()){
			Long idDaCorretoraAntiga = getCorretoraEmUso().getId();
			boolean sucesso = true;
			JSONObject jsonObject = new JSONObject();
			jsonObject.accumulate("idDaCorretoraAntiga", idDaCorretoraAntiga);
			try {
				setCorretoraEmUsoNaSessao((Corretora) this.service.findAssessoriaNoFilter(corretora));
				jsonObject.accumulate("descricaoCorretora", getCorretoraEmUso().getNomeCorretoraComAssessoria());
			} catch (Exception e) {
				sucesso = false;
				e.printStackTrace();
			}
			jsonObject.accumulate("success", sucesso);
			setJsonList(jsonObject.toString());
			
			return Action.SUCCESS;
		}else{
			throw new GenericException("O método alterarCorretoraEmUso() não pode ser acessado por usuários que não são de assessoria.");
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista(){
		getSession().put("cadastroCorrente", "corretora");
		return super.lista();
	}

	public List<PObject> getAtividadeComercialList(){
		List<PObject> lista = this.getDominioList("AtividadeComercial");
		return lista;
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getResponsavelList(){
		try {
			return (List<PObject>)this.service.genericFindBySQLQuery("Select p From PessoaFisica p where p.corretora.id = ?0 order by p.nome", new Object[]{this.corretora.getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountCorretora", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
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

/************************************************************/
//Atlas, 2008
/************************************************************/