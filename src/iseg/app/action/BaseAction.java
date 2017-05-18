package iseg.app.action;

import iseg.app.constants.Constants;
import iseg.app.conversion.CaseSensitive;
import iseg.app.exception.GenericException;
import iseg.app.model.AcaoRole;
import iseg.app.model.AtributoCorretora;
import iseg.app.model.AtributoUsuario;
import iseg.app.model.Corretora;
import iseg.app.model.DominioEsp;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Menu;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.ServicosIseg;
import iseg.app.model.SmsEventos;
import iseg.app.model.TipoLancamento;
import iseg.app.model.Uf;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Formatter;
import iseg.utils.HibernateUtil;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.web.context.ServletContextAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public abstract class BaseAction extends ActionSupport implements Preparable, SessionAware, ServletContextAware, ServletRequestAware {

	private static final long serialVersionUID = 1L;

	protected PObjectService service;
	protected List<PObject> list;
	protected PObject pobject;
	protected Long[] id;
	protected int pageSize;
	protected int page;
	protected int listCount;
	protected String dataCorrente = Formatter.getCurrentDate();
	protected Menu menuTrigger;

	protected Usuario usuario;
	protected String nome;
	
	protected String associadoId;
	
	private Map session;
	private Map request;
	private Map response;
    private ServletContext servletContext;
    private HttpServletRequest httpServletRequest; 
    
	public static String appFolder = "";
	
	private Connection conn = null;
	protected Corretora corretoraEmUso;
	private String jsonList;

	public boolean getIsEmpty() {
		return (this.list.size() == 0);
	}

	public boolean getIsFirstPage() {
		return (this.page == 0);
	}

	public boolean getIsLastPage() {
		return ((this.page * this.pageSize + this.pageSize) >= this.listCount);
	}

	public static String publishable = "none";

	@SuppressWarnings("unchecked")
	public void prepare() throws Exception {
		if (this.getSession().get("user") != null) {
			String remoteUser = (String)this.getSession().get("user");
			String userName = remoteUser.substring(0,remoteUser.lastIndexOf("@"));
			String cnpj = remoteUser.substring(remoteUser.lastIndexOf("@")+1);
			
			if (this.getSession().get("menuTrigger") == null) {
				this.getSession().put("menuTrigger", this.menuTrigger);
			} else {
				this.menuTrigger = (Menu) this.getSession().get("menuTrigger");
			}
			if (this.getSession().get("usuario") == null) {
				this.usuario = this.service.genericFindFirstResultByNamedQueryWithoutApplyFilter("getUsuarioByNomeLogin", new Object[] { userName, cnpj });
				this.getSession().put("usuario", this.usuario);
			} else {
				this.usuario = (Usuario) this.getSession().get("usuario");
				if (!this.usuario.getUniqueLogin().equals(this.getSession().get("user"))){
					this.usuario = this.service.genericFindFirstResultByNamedQueryWithoutApplyFilter("getUsuarioByNomeLogin", new Object[] { userName, cnpj });
					this.getSession().put("usuario", this.usuario);
					this.corretoraEmUso = this.usuario.getCorretora();
					this.corretoraEmUso.setInAssessoria(this.corretoraEmUso.getId().equals(this.corretoraEmUso.getAssessoria().getId().longValue()));
					this.corretoraEmUso.setAssessoriaId(this.corretoraEmUso.getAssessoria().getId());
					this.getSession().put("corretoraEmUso", this.corretoraEmUso);
				}
			}
			if (this.getSession().get("corretoraEmUso") == null) {
				this.corretoraEmUso = this.usuario.getCorretora();
				this.corretoraEmUso.setInAssessoria(this.corretoraEmUso.getId().equals(this.corretoraEmUso.getAssessoria().getId().longValue()));
				this.corretoraEmUso.setAssessoriaId(this.corretoraEmUso.getAssessoria().getId());
				this.getSession().put("corretoraEmUso", this.corretoraEmUso);
			} else {
				this.corretoraEmUso = (Corretora) this.getSession().get("corretoraEmUso");
				this.corretoraEmUso = (Corretora)this.service.findAssessoriaNoFilter(this.corretoraEmUso);
			}
		}
		BaseAction.appFolder = this.servletContext.getRealPath("/");
	}

	public BaseAction() { 
		this.pageSize = 10;
		this.page = 0;
		this.listCount = 0;
	}

	public BaseAction(PObjectService service) {
		this();
		this.service = service;
	}

	@SuppressWarnings("unchecked")
	public boolean checarMenuAcaoPrivilegio(String menuId, String actionName) {
		return this.checarMenuAcaoPrivilegio(new Long(menuId), new CaseSensitive(actionName));
	}
	
	public boolean checarMenuAcaoPrivilegio(Long menuId, CaseSensitive actionName) {
		try {
			// A acessoria no pode editar dados de propostas
			if (this.corretoraEmUso.ehAssessoria())
				return false;
			
			AcaoRole acao = this.service.genericFindFirstResultByNamedQueryWithoutApplyFilter("getAcaoRoleByRoleAndAcaoAndMenu", new Object[] { this.usuario.getRole().getId(), actionName, menuId });
			if (acao != null)
				return true;
			else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public String index() {
		return Action.SUCCESS;
	}

	public String execute() {
		return Action.SUCCESS;
	}

	@SkipValidation
	public String first() {
		this.page = 0;
		this.lista();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String next() {
		if (!getIsLastPage()) {
			this.page++;
		}
		this.lista();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String last() {
		if (!getIsLastPage()) {
			this.page = this.listCount / this.pageSize;
		}
		this.lista();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String previous() {
		if (!getIsFirstPage()) {
			this.page--;
		}
		this.lista();
		return Action.SUCCESS;
	}

	@SkipValidation
	public String lista() {
		try {

			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			this.list = service.findAll(page, pageSize);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String novo() throws Exception{
		if (this.pobject != null) {
			try{
				Class cl = Class.forName(this.pobject.getClass().getName());
	            Constructor constructor = cl.getConstructor(new Class[]{});
	            this.pobject = (PObject)constructor.newInstance(new Object[] {});
				if (HibernateUtil.initializeAndUnproxy(pobject) instanceof AtributoCorretora && (!corretoraEmUso.ehAssessoria() && !(HibernateUtil.initializeAndUnproxy(pobject) instanceof Corretora))){
					if (usuario!=null){
						Method s = pobject.getClass().getMethod("setCorretora", new Class[] {Corretora.class});
						s.invoke(pobject, new Object[] {corretoraEmUso});
					}else{
						throw new GenericException("setCorretora :: Ocorreu uma falha no sistema - Usuario está null");
					}
				}
				if (HibernateUtil.initializeAndUnproxy(pobject) instanceof AtributoUsuario){
					if (usuario!=null){
						Method s = pobject.getClass().getMethod("setUsuario", new Class[] {Usuario.class});
						s.invoke(pobject, new Object[] {usuario});
					}else{
						throw new GenericException("setCorretora :: Ocorreu uma falha no sistema - Usuario está null");
					}
				}
				//this.pobject.setId(null);
			}catch (Exception e) {
				throw new Exception(e);
			}
		}
		return Action.SUCCESS;
	}

	@SkipValidation
	public String editar() {

		try {

			if (this.pobject.getId() == null) {
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

	public String salvarLista() {
		try {
			this.persistPObjects();
			boolean doRefresh = false;
			if (pobject.getId()==null)
				doRefresh = true;
			this.service.save(pobject);
			if (doRefresh)
				this.service.refresh(pobject);
			this.listCount = 0;
			return this.lista();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String salvarNovo() {
		try {
			this.persistPObjects();
			this.service.save(pobject);
			return this.novo();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String salvarEditar() {
		try {
			this.persistPObjects();
			this.service.save(pobject);
			this.pobject = service.find(pobject);
			this.setPObjectInstance();
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try {
			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (Exception ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		}
	}

	public String buscaCep(){
		return Action.SUCCESS;
	}
	
	public List<PObject> getList() {
		return list;
	}

	public Long[] getId() {
		return id;
	}

	public void setId(Long[] id) {
		this.id = id;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getFirstPosition() {
		return this.pageSize * this.page + 1;
	}

	public int getLastPosition() {
		return this.pageSize * (this.page + 1) > this.listCount ? this.listCount
				: this.pageSize * (this.page + 1);
	}

	/**
	 * Seta a instância do objeto persistente padrão para uso neste bean.
	 */
	protected abstract void setPObjectInstance() throws Exception;

	protected abstract int getRowCount();

	protected void persistPObjects() throws Exception {

	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public List<PObject> getTipoDocumentoList(){
		return this.getDominioList("TipoDocumento");
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getDominioList(String dominio) {
		try {
			return (List<PObject>) this.service.genericFindBySQLQuery("Select d_esp From DominioEsp d_esp join d_esp.dominio d where Upper(d.nome) = '"+ dominio.toUpperCase()+ "' and d_esp.dominioEspPai.id is null order by d_esp.valor", null);

		} catch (Exception e) {
			addActionError("Falha no sistema ao carregar a lista de Dominio.");
		}
		return new ArrayList<PObject>();
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getSubDominioList(DominioEsp dominioEspPai) {
		try {
			return (List<PObject>) this.service.genericFindBySQLQuery("Select d_esp From DominioEsp d_esp where dominioEspPai.id = " + dominioEspPai.getId(), null);

		} catch (Exception e) {
			addActionError("Falha no sistema ao carregar a lista de Dominio.");
		}
		return new ArrayList<PObject>();
	}

	@SuppressWarnings("unchecked")
	public List<GrupoDeVenda> getGrupoVendaList() {
		try {
			return this.service.genericFindByNamedQuery("getGrupoDeVenda", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	@SuppressWarnings("unchecked")
	public List<Uf> getUfList() {
		try {

			return (List<Uf>) this.service.genericFindBySQLQuery("Select u From Uf u order by u.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Uf>();
	}

	@SuppressWarnings("unchecked")
	public List<GrupoDeVenda> getGrupoDeVendaList() {
		try {
			if (this.corretoraEmUso.getId().equals(new Long(1)))
				return this.service.genericFindByNamedQueryWithoutApplyFilter("getGrupoDeVenda", null);
			else
				return (List<GrupoDeVenda>) this.service.genericFindBySQLQuery("Select g From GrupoDeVenda g", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	@SuppressWarnings("unchecked")
	public List<Corretora> getCorretoraList() {
		try {
			return (List<Corretora>) this.service.genericFindBySQLQuery("Select c From Corretora c", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Corretora>();
	}

	@SuppressWarnings("unchecked")
	public List<Ramo> getRamoList() {
		try {
			return (List<Ramo>) this.service.genericFindBySQLQuery("Select r From Ramo r WHERE subRamo.id is null order by r.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Ramo>();
	}

	@SuppressWarnings("unchecked")
	public Collection<Ramo> getRamoSubRamoList() {
		Comparator<Ramo> ramoCompar = new Comparator<Ramo>(){
			public int compare(Ramo r1, Ramo r2) {
		        return (r1.getNomeRamoSubRamo().compareTo(r2.getNomeRamoSubRamo()));
			}
		};
		try {
			TreeSet<Ramo> tree = new TreeSet<Ramo>(ramoCompar);
			tree.addAll((List<Ramo>) this.service.genericFindBySQLQuery("Select r From Ramo r WHERE r.id not in (select s.subRamo.id from Ramo s where s.subRamo.id is not null)", null));
			return tree;
			

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Collections.EMPTY_SET;
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList() {
		try {

			return (List<Seguradora>) this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	@SuppressWarnings("unchecked")
	public List<TipoLancamento> getTipoLancamentoList() {
		try {

			return (List<TipoLancamento>) this.service.genericFindBySQLQuery("SELECT s FROM TipoLancamento s where s.id not in (select ec.tipoLancamento.id from CorretoraTipoLancamento ec where ec.corretora.id = ?0 ) Order by s.nome", new Object[]{this.corretoraEmUso.getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<TipoLancamento>();
	}

	@SuppressWarnings("unchecked")
	public List<TipoLancamento> getTipoLancamentoByCorretoraList() {
		try {

			return (List<TipoLancamento>) this.service.genericFindBySQLQuery("SELECT s FROM TipoLancamento s where s.id in (select ec.tipoLancamento.id from CorretoraTipoLancamento ec where ec.corretora.id = ?0 ) Order by s.nome", new Object[]{this.corretoraEmUso.getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<TipoLancamento>();
	}

	@SuppressWarnings("unchecked")
	public List<TipoLancamento> getTipoLancamentoTodosList() {
		try {

			return (List<TipoLancamento>) this.service.genericFindBySQLQuery("SELECT s FROM TipoLancamento s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<TipoLancamento>();
	}

	@SuppressWarnings("unchecked")
	public List<SmsEventos> getSmsEventosList() {
		try {

			return (List<SmsEventos>) this.service.genericFindBySQLQuery("SELECT s FROM SmsEventos s where s.id not in (select ec.smsEventos.id from SmsEventosCorretora ec where ec.corretora.id = ?0 ) Order by s.nome", new Object[]{this.corretoraEmUso.getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<SmsEventos>();
	}

	@SuppressWarnings("unchecked")
	public List<SmsEventos> getSmsEventosTodosList() {
		try {

			return (List<SmsEventos>) this.service.genericFindBySQLQuery("SELECT s FROM SmsEventos s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<SmsEventos>();
	}

	public Map<Integer, String> getSituacaoLoteList(){
		return Constants.getSituacaoLoteMap();
	}

	public Map<Long, String> getTipoPropostaList(){
		return Constants.getTipoPropostaMap();
	}

	public String getTipoLancamentoLoteDescricao(Integer tipoLancamento){
		return Constants.getTipoLancamentoLoteDescricao(tipoLancamento);
	}

	public String getStatusOperacionalDescricao(Long statusOperacional){
		return Constants.getStatusOperacionalDescricao(statusOperacional);
	}

	public String getSituacaoCotacaoDescricao(Long situacao){
		return Constants.getSituacaoCotacaoDescricao(situacao);
	}

	public String getTipoProtocoloDescricao(Long tipoProtocolo){
		return Constants.getTipoProtocoloDescricao(tipoProtocolo);
	}

	public String getTipoPropostaDescricao(Long tipoProposta){
		return Constants.getTipoPropostaDescricao(tipoProposta);
	}

	public String getSituacaoLoteDescricao(Integer situacaoLote){
		return Constants.getSituacaoLoteDescricao(situacaoLote);
	}

	public String getSituacaoOperacionalDescricao(Long situacaoOperacional, Date terminoVigencia){
		if (terminoVigencia.getTime() < (new Date()).getTime() && situacaoOperacional.equals(Constants.SITUACAO_ATIVA))
			return "VENCIDA";
		else
			return Constants.getSituacaoOperacionalDescricao(situacaoOperacional);
	}

	public List<PObject> getTipoSeguroList() {
		return this.getDominioList("TipoSeguro");
	}

	public List<PObject> getAtividadeComercialList() {
		return this.getDominioList("AtividadeComercial");
	}

	public List<PObject> getDominioCiasSeguradora() {
		return this.getDominioList("CIAS_SEGURADORA");
	}

	public String getDataCorrente() {
		return dataCorrente;
	}

	public Connection getConnection() {
		return this.service.getConnection();
	}

	public Map getRequest() {
		return request;
	}

	public void setRequest(Map request) {
		this.request = request;
	}

	public Corretora getCorretoraEmUso() {
		return corretoraEmUso;
	}

	public void setCorretoraEmUso(Corretora corretora) {
		this.corretoraEmUso = corretora;
	}

	@SuppressWarnings("unchecked")
	public void setCorretoraEmUsoNaSessao(Corretora corretora) {
		this.corretoraEmUso = corretora;
		this.corretoraEmUso.setInAssessoria(this.corretoraEmUso.getId().equals(this.corretoraEmUso.getAssessoria().getId().longValue()));
		this.corretoraEmUso.setAssessoriaId(this.corretoraEmUso.getAssessoria().getId());
		this.getSession().put("corretoraEmUso", this.corretoraEmUso);
		this.associadoId = corretora.getId().toString();
	}

	public Usuario getUsuarioEmUso() {
		return usuario;
	}

	public void setUsuarioEmUso(Usuario usuario) {
		this.usuario = usuario;
	}

	public Map getResponse() {
		return response;
	}

	public void setResponse(Map response) {
		this.response = response;
	}

	public Menu getMenuTrigger() {
		return menuTrigger;
	}

	public void setMenuTrigger(Menu menuTrigger) {
		this.menuTrigger = menuTrigger;
	}

	public String getJsonList() {
		return jsonList;
	}

	public void setJsonList(String jsonList) {
		this.jsonList = jsonList;
	}

	public boolean isUsuarioDeAssessoria() {
		return getUsuarioEmUso().getCorretora().ehAssessoria();
	}
	
	public boolean isAssessoria() {
		return getCorretoraEmUso().ehAssessoria();
	}
	
	public List<Corretora> getCorretorasAssessoradas() throws Exception{
		return ((Corretora) service.find(getUsuarioEmUso().getCorretora())).getAssessoradas();
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	public String getAssociadoId() {
		return associadoId;
	}

	public void setAssociadoId(String associadoId) {
		this.associadoId = associadoId;
	}

	public HttpServletRequest getServletRequest() {
		return httpServletRequest;
	}

	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
}