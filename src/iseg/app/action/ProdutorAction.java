/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.ProdutorService;
import iseg.app.constants.Constants;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Produtor;
import iseg.app.model.ProdutorAux;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ProdutorAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Produtor produtor;
	private PessoaFisica importPessoaFisica;
	private PessoaJuridica importPessoaJuridica;
	private PessoaFisica pessoaFisica;
	private Pessoa pessoa;
	private PessoaJuridica pessoaJuridica;
	private Long idProdutor;
	private List<PObject> produtores;
	protected ProdutorService service;
	boolean produtorDePessoaExistente = false;
	protected Integer tipoCliente;
	protected Integer tipoClienteSN;


	//@Autowired
	public ProdutorAction(ProdutorService service) {
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

	@SkipValidation
	public String novo() {
		this.produtor = new Produtor();
		this.produtor.setCorretora(this.corretoraEmUso);
		if (tipoClienteSN.intValue()==0){
			this.tipoCliente = this.tipoClienteSN; 
			this.pessoaFisica = new PessoaFisica();
			this.pobject = this.produtor;
			return "successPF";
		}else if (tipoClienteSN.intValue()==1){
			this.tipoCliente = this.tipoClienteSN; 
			this.pessoaJuridica = new PessoaJuridica();
			this.pobject = this.produtor;
			return "successPJ";
		}else
			return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String editar() {
		
		try{
		
			getSession().put("cadastroCorrente", "produtor");
			if (this.produtor == null || this.produtor.getId() == null) {
				this.produtor = (Produtor)this.service.find(Produtor.class, this.pessoa.getId());
				this.pobject = this.produtor;
			}else
				this.produtor = (Produtor)service.find(this.produtor);
			
			if(HibernateUtil.initializeAndUnproxy(this.produtor.getPessoa()) instanceof PessoaFisica){
				this.tipoCliente = Constants.CLIENTE_PF;
				this.pessoaFisica = (PessoaFisica)service.find(PessoaFisica.class, this.produtor.getPessoa().getId());
				this.tipoClienteSN = 0;
				return "successPF";
			}else if(HibernateUtil.initializeAndUnproxy(this.produtor.getPessoa()) instanceof PessoaJuridica){
				this.tipoCliente = Constants.CLIENTE_PJ;
				this.pessoaJuridica = (PessoaJuridica)service.find(PessoaJuridica.class, this.produtor.getPessoa().getId());
				this.tipoClienteSN = 1;
				return "successPJ";
			}
			
			return Action.ERROR;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void persistPObjects(){
		if (this.produtor.getCorretora()!=null && produtor.getCorretora().getId()==null)
			this.produtor.setCorretora(null);
		if (this.pessoaJuridica!=null && this.pessoaJuridica.getAtividadeComercial()!=null && this.pessoaJuridica.getAtividadeComercial().getId()==null)
			this.pessoaJuridica.setAtividadeComercial(null);
		if (this.produtor.getPessoa().getGrupoDeVenda()!=null && produtor.getPessoa().getGrupoDeVenda().getId()==null)
			this.produtor.getPessoa().setGrupoDeVenda(null);
		this.produtor.setIsGeneric(false);
	}

	protected void setPObjectInstance() {
		try{
			if (tipoClienteSN.intValue()==0){
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.produtor.getPessoa());
			}else if (tipoClienteSN.intValue()==1){
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.produtor.getPessoa());
			}
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
		this.pobject = this.produtor;
	}

	public List<PObject> getProdutores(){
		return produtores;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountProdutor", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	@SkipValidation
	public String listarEditar(){
		if(this.produtor.getPessoa().getEnderecoCollection()!=null && (this.produtor.getPessoa().getEnderecoCollection().size()==1)){
			this.produtor.getPessoa().getEnderecoCollection().get(0).setPessoa(this.produtor.getPessoa());
		}
		return super.salvarEditar();
	}

	@SkipValidation
	@Override
	public String salvarLista() {
		String status = "";
		String action = "";
		try{
			
			status = criarChecarProdutor();
			
			if (status.indexOf("error")>=0)
				return status+action;
			
			if(!produtorDePessoaExistente && this.produtor.getPessoa().getEnderecoCollection()!=null && (this.produtor.getPessoa().getEnderecoCollection().size()==1))
				this.produtor.getPessoa().getEnderecoCollection().get(0).setPessoa(this.produtor.getPessoa());
			
			if(produtorDePessoaExistente){
				this.persistPObjects();
				this.service.save(this.produtor);
			}else{
				this.persistPObjects();
				boolean doRefresh = false;
				if (pobject.getId()==null)
					doRefresh = true;
				this.service.save(this.produtor, this.pessoa);
				if (doRefresh)
					this.service.refresh(pobject);
			}
			
			this.listCount = 0;
			return this.lista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return status+action;
		}
	}

	@SkipValidation
	@Override
	public String salvarNovo() {
		String status = "";
		String action = "";				

		try{
			if (this.produtor.getId()==null)
				action = "Insert";

			status = criarChecarProdutor();
			
			if (status.indexOf("error")>=0)
				return status+action;
			
			if(!produtorDePessoaExistente && this.produtor.getPessoa().getEnderecoCollection()!=null && (this.produtor.getPessoa().getEnderecoCollection().size()==1))
				this.produtor.getPessoa().getEnderecoCollection().get(0).setPessoa(this.produtor.getPessoa());
			
			if(produtorDePessoaExistente){
				this.persistPObjects();
				this.service.save(this.produtor);
			}else{
				this.persistPObjects();
				this.service.save(this.produtor, this.pessoa);
			}
			return this.novo();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return status+action;
		}
	}
	@SkipValidation
	@Override
	public String salvarEditar(){
		String status = "";
		String action = "";
		try{
			
			if (this.produtor.getId()==null)
				action = "Insert";
			
			status = criarChecarProdutor();
			
			if (status.indexOf("error")>=0)
				return status+action;
			
			if(!produtorDePessoaExistente && this.produtor.getPessoa().getEnderecoCollection()!=null && (this.produtor.getPessoa().getEnderecoCollection().size()==1))
				this.produtor.getPessoa().getEnderecoCollection().get(0).setPessoa(this.produtor.getPessoa());
			
			if(produtorDePessoaExistente){
				this.persistPObjects();
				boolean doRefresh = false;
				if (pobject.getId()==null)
					doRefresh = true;
				this.pobject = this.produtor;
				this.service.save(this.produtor);
				if (doRefresh)
					this.service.refresh(pobject);
			}else{
				this.persistPObjects();
				boolean doRefresh = false;
				if (pobject.getId()==null)
					doRefresh = true;
				this.service.save(this.produtor, this.pessoa);
				if (doRefresh)
					this.service.refresh(pobject);
				
			}
			//this.produtor = (Produtor)service.find(this.produtor);
			this.setPObjectInstance();
			return status;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return status+action;
		}
	}

	public String criarChecarProdutor() throws Exception{
		if (produtor.getId()==null){
			if (this.tipoCliente.intValue()==0){
				this.produtor.setPessoa(this.pessoaFisica);
				List <Produtor> nProdutor = this.service.genericFindByNamedQuery("getProdutorByCpfOuCnpj", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				if (nProdutor.size()>0){
					addActionError("CPF já cadastrado.");
					return "errorPF";
				}
				
				this.pessoa = this.pessoaFisica;
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				if (pessoas.size()>0){
					this.criarProdutorDePessoaExistente(pessoas.get(0));
				}
				return "successPF";
			}else{
				this.produtor.setPessoa(this.pessoaJuridica);
				List <Produtor> nProdutor = this.service.genericFindByNamedQuery("getProdutorByCpfOuCnpj", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				if (nProdutor.size()>0){
					addActionError("CNPJ já cadastrado.");
					return "errorPJ";
				}
				
				this.pessoa = this.pessoaJuridica;
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				if (pessoas.size()>0){
					this.criarProdutorDePessoaJuridicaExistente(pessoas.get(0));
				}
				return "successPJ";
			}
		}else{
			if (this.tipoCliente.intValue()==0){
				this.produtor.setPessoa(this.pessoaFisica);
				this.pessoa = this.pessoaFisica;
				List <PessoaFisica> pessoas = this.service.genericFindByNamedQuery("getPessoaFisicaByCpf", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				for (PessoaFisica pessoaFisica : pessoas) {
					if (pessoaFisica.getId().longValue()!=this.produtor.getId().longValue()){
						addActionError("CPF já cadastrado.");
						return "errorPF";
					}
				}
				return "successPF";
			}else{
				this.produtor.setPessoa(this.pessoaJuridica);
				this.pessoa = this.pessoaJuridica;
				List <PessoaJuridica> pessoas = this.service.genericFindByNamedQuery("getPessoaJuridicaByCnpj", new Object[] {this.produtor.getPessoa().getCpfOuCnpj()});
				for (PessoaJuridica pessoaJuridica : pessoas) {
					if (pessoaJuridica.getId().longValue()!=this.produtor.getId().longValue()){
						addActionError("CNPJ já cadastrado.");
						return "errorPJ";
					}
				}
				return "successPJ";
			}
		}
	}
	
	protected void criarProdutorDePessoaExistente(PessoaFisica pessoa){
		produtorDePessoaExistente = true;
		Produtor novoProdutor = new Produtor();
		novoProdutor.setApelido(this.produtor.getApelido());
		novoProdutor.setComissao(this.produtor.getComissao());
		novoProdutor.setCorretora(this.produtor.getCorretora());
		novoProdutor.setDesconto(this.produtor.getDesconto());
//		novoProdutor.setId(pessoa.getId());
		novoProdutor.setPessoa(pessoa);
		novoProdutor.setMatricula(this.produtor.getMatricula());
		novoProdutor.setSituacao(this.produtor.getSituacao());
		this.produtor = novoProdutor;
	}
	
	protected void criarProdutorDePessoaJuridicaExistente(PessoaJuridica pessoa){
		produtorDePessoaExistente = true;
		Produtor novoProdutor = new Produtor();
		novoProdutor.setApelido(this.produtor.getApelido());
		novoProdutor.setComissao(this.produtor.getComissao());
		novoProdutor.setCorretora(this.produtor.getCorretora());
		novoProdutor.setDesconto(this.produtor.getDesconto());
//		novoProdutor.setId(pessoa.getId());
		novoProdutor.setPessoa(pessoa);
		novoProdutor.setMatricula(this.produtor.getMatricula());
		novoProdutor.setSituacao(this.produtor.getSituacao());
		this.produtor = novoProdutor;
	}
	
	@SkipValidation
	public String getDadosPessoaFisica(){
		try {

			PessoaFisica pessoaFisica = (PessoaFisica)this.service.find(this.importPessoaFisica);
			if (pessoaFisica != null){
				this.pessoaFisica = (PessoaFisica) Util.cloneBean(pessoaFisica, PessoaFisica.class);
				this.pessoaFisica.setEnderecoCollection(pessoaFisica.getEnderecoCollection());
				this.pessoaFisica.setId(null);
			}
			this.produtor.setCorretora(this.corretoraEmUso);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String getDadosPessoaJuridica(){
		try {

			PessoaJuridica pessoaJuridica = (PessoaJuridica)this.service.find(this.importPessoaJuridica);
			if (pessoaJuridica != null){
				this.pessoaJuridica = (PessoaJuridica) Util.cloneBean(pessoaJuridica, PessoaJuridica.class);
				this.pessoaJuridica.setEnderecoCollection(pessoaJuridica.getEnderecoCollection());
				this.pessoaJuridica.setId(null);
			}
			this.produtor.setCorretora(this.corretoraEmUso);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {
		
		try{
			ProdutorAux novoProdutor = new ProdutorAux();
			for(int i=0 ; i<id.length ; i++){
				if(id[i]!=null){
					novoProdutor.setId(id[i]);
					Produtor produtor = new Produtor();
					produtor.setId(id[i]);
					try{
						this.service.remove(produtor);
					}catch (Exception e) {
						this.service.remove(novoProdutor);
					}
					
				}
			}
			this.listCount=this.getRowCount();
			
			return this.lista();

		}catch (Exception ge) {
			addActionError("Este Produtor Não pode ser excluido por estar sendo referênciado por algum DOCUMENTO!");
			this.lista();
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista(){
		getSession().put("cadastroCorrente", "produtor");
		return super.lista();
	}

	public Long getIdProdutor() {
		return idProdutor;
	}

	public void setIdProdutor(Long idProdutor) {
		this.idProdutor = idProdutor;
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfs(){
		try{
			return (List<Uf>)this.service.genericFindBySQLQuery("Select u From Uf u order by u.nome", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Uf>();
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
	}

	public PessoaFisica getImportPessoaFisica() {
		return importPessoaFisica;
	}

	public void setImportPessoaFisica(PessoaFisica importPessoaFisica) {
		this.importPessoaFisica = importPessoaFisica;
	}

	public PessoaJuridica getImportPessoaJuridica() {
		return importPessoaJuridica;
	}

	public void setImportPessoaJuridica(PessoaJuridica importPessoaJuridica) {
		this.importPessoaJuridica = importPessoaJuridica;
	}

	public Integer getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(Integer tipoCliente) {
		this.tipoCliente = tipoCliente;
	}

	public Integer getTipoClienteSN() {
		return tipoClienteSN;
	}

	public void setTipoClienteSN(Integer tipoClienteSN) {
		this.tipoClienteSN = tipoClienteSN;
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