package iseg.app.action;

import iseg.app.business.PosVendaService;
import iseg.app.business.UsuarioService;
import iseg.app.constants.Constants;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Menu;
import iseg.app.model.MenuRole;
import iseg.app.model.Pessoa;
import iseg.app.model.PosVenda;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Role;
import iseg.app.model.Seguradora;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class LoginAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private List<PObject> usuarios;
	protected UsuarioService service;
	protected PosVendaService serviceAux;
	private Menu menu;
	private Long corretoraId;
	private PosVenda posVenda;
	private PosVenda posVendaSearch = new PosVenda();
	private String statusLogin;
	
	private List<PosVenda> posVendas = new ArrayList<PosVenda>();
	
	String cnpjLogin;
	String nomeLogin;
	String senhaAtual;
	String novaSenha;
	String confirmaSenha;
	
	String statusAlterarSenha;
	
	//@Autowired
	public LoginAction(UsuarioService service, PosVendaService serviceAux) {
		super(service);
		this.service = service;
		this.serviceAux = serviceAux;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();
			if(this.getSession().get("propostaSearch") != null){
				this.posVendaSearch = (PosVenda) this.getSession().get("posVendaSearch");
				if (this.getSession().get("page")!=null)
					this.page = (Integer)this.getSession().get("page");
				if (this.getSession().get("pageSize")!=null)
					this.pageSize = (Integer)this.getSession().get("pageSize");
			}
			
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	public String showHome(){
		try{
			if (this.corretoraEmUso.getUsarPosVenda()){
				this.posVendaSearch.setProposta(new Proposta());
				this.posVendaSearch.getProposta().setCliente(new Pessoa());
				this.posVendaSearch.getProposta().setSeguradora(new Seguradora());
				this.posVendaSearch.getProposta().setRamo(new Ramo());
				this.posVendaSearch.getProposta().setGrupoDeVenda(new GrupoDeVenda());
				this.posVendaSearch.setUsuario(getUsuarioEmUso());

				this.getSession().put("posVendaSearch", this.posVendaSearch);
				this.getSession().put("page", page);
				this.getSession().put("pageSize", pageSize);

				if (!getUsuarioEmUso().getNomeLogin().equals(Constants.NOME_ADMIN) && !getUsuarioEmUso().getNomeLogin().equals(Constants.NOME_GESTOR)){
					this.listCount = this.serviceAux.getCountPosVendaForSearch(this.posVendaSearch, Constants.ST_POSVENDA_EM_ABERTO).intValue();
					this.posVendas = this.serviceAux.getPosVendaForSearch(this.posVendaSearch, page, pageSize, Constants.ST_POSVENDA_EM_ABERTO);
				}

				if(this.posVendaSearch != null){
					this.posVendaSearch.getProposta().setInicioVigencia(null);
					this.posVendaSearch.getProposta().setTerminoVigencia(null);
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return Action.SUCCESS;
	}
	
	@SkipValidation
	public String first() {
		this.page = 0;
		this.showHome();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String next() {
		if (!getIsLastPage()) {
			this.page++;
		}
		this.showHome();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String last() {
		if (!getIsLastPage()) {
			this.page = this.listCount / this.pageSize;
		}
		this.showHome();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String previous() {
		if (!getIsFirstPage()) {
			this.page--;
		}
		this.showHome();
		return Action.SUCCESS;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<PObject> getUsuarios() {
		return usuarios;
	}

	protected void setPObjectInstance() {}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountUsuario", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public String doLogin(){
		if (this.usuario.getStatus().equals(Constants.USUARIO_INATIVO)){
			closeSession();
			return Action.ERROR;
		}else{
			String userIp = (String)this.getSession().get("userIp");

			String ipAdress = this.usuario.getRestricaoEnderecoIp();
			if (ipAdress != null && ipAdress.length()>=8){
				StringTokenizer st = new StringTokenizer(ipAdress,";");
				while (st.hasMoreElements()){
					String ipPermitido = (String)st.nextElement();
					if (ipPermitido!=null && ipPermitido.equals(userIp))
						return Action.SUCCESS;
				}
				closeSession();
				return Action.ERROR;
			}else{
				return Action.SUCCESS;
			}
		}
	}
	
	public String checkMenuRole(){
		try{
			Role role = this.usuario.getRole();
			List<MenuRole> menus = this.service.genericFindByNamedQueryWithoutApplyFilter("getMenuRoleByRoleAndMenu", new Object[]{role.getId(),this.menu.getId()});
			String usuarioAdmin = "ADMIN@";
			if (this.corretoraEmUso.ehAssessoria())
				usuarioAdmin += this.corretoraEmUso.getCpfOuCnpj().getValor(); 
			
			if (menus.size()>0 || this.usuario.getUniqueLogin().equals(usuarioAdmin)){
				ServletActionContext.getRequest().setAttribute("direito", " ");
			}else{
				ServletActionContext.getRequest().setAttribute("direito", "display: none;");
			}
			return Action.SUCCESS;
		}catch (Exception e) {
			ServletActionContext.getRequest().setAttribute("direito", "display: none;");
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	public String alterarSenha(){
		try{
			List <Usuario> usuarios = (List<Usuario>)this.service.genericFindFirstResultByNamedQueryWithoutApplyFilter("getUsuarioByNomeLogin", 
					new Object[]{this.nomeLogin, this.cnpjLogin.replace(".", "").replace("/", "").replace("-", "")});
			if (usuarios.size()==0){
				this.statusAlterarSenha = "Usuário inválido!";
				return Action.ERROR;
			}
				
			Usuario usuario = usuarios.get(0);
			
			if (!usuario.getSenha().equals(this.senhaAtual)){
				this.statusAlterarSenha = "Senha atual inválida!";
				return Action.ERROR;
			}
			if (!this.novaSenha.equals(this.confirmaSenha)){
				this.statusAlterarSenha = "Nova senha não confere!";
				return Action.ERROR;
			}
			
			usuario.setSenha(this.novaSenha);
			this.service.save(usuario);
			this.statusAlterarSenha = "Senha alterada!";
			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}
	
	public String listaMenus(){
		return Action.SUCCESS;
	}
	
	public List<Menu> getMenuPaiList(){

		try {
			return this.service.genericFindMenuAndApplyFilter("getMenuPai", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Menu>();
		}
	}

	public List<Menu> getMenuFilhosList(Long id){

		try {
			return this.service.genericFindMenuAndApplyFilter("getMenuPorPai", new Object[]{id});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Menu>();
		}
	}

	public String closeSession(){
        HttpSession session = (HttpSession)this.getSession().get("session");
        if (session!=null)
        	session.invalidate();
    	return Action.SUCCESS;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getNomeLogin() {
		return nomeLogin;
	}

	public void setNomeLogin(String nomeLogin) {
		this.nomeLogin = nomeLogin;
	}

	public String getSenhaAtual() {
		return senhaAtual;
	}

	public void setSenhaAtual(String senhaAtual) {
		this.senhaAtual = senhaAtual;
	}

	public String getNovaSenha() {
		return novaSenha;
	}

	public void setNovaSenha(String novaSenha) {
		this.novaSenha = novaSenha;
	}

	public String getConfirmaSenha() {
		return confirmaSenha;
	}

	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}

	public String getStatusAlterarSenha() {
		return statusAlterarSenha;
	}

	public void setStatusAlterarSenha(String statusAlterarSenha) {
		this.statusAlterarSenha = statusAlterarSenha;
	}

	public Long getCorretoraId() {
		if(corretoraId == null){
			corretoraId = getUsuarioEmUso().getCorretora().getId();
		}
		return corretoraId;
	}

	public void setCorretoraId(Long corretoraId) {
		this.corretoraId = corretoraId;
	}

	public List<PosVenda> getPosVendas() {
		return posVendas;
	}

	public PosVenda getPosVenda() {
		return posVenda;
	}

	public void setPosVenda(PosVenda posVenda) {
		this.posVenda = posVenda;
	}

	public String getCnpjLogin() {
		return cnpjLogin;
	}

	public void setCnpjLogin(String cnpjLogin) {
		this.cnpjLogin = cnpjLogin;
	}

	public String getStatusLogin() {
		return statusLogin;
	}

	public void setStatusLogin(String statusLogin) {
		this.statusLogin = statusLogin;
	}
}