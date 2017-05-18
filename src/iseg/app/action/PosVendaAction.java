/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.PosVendaService;
import iseg.app.constants.Constants;
import iseg.app.model.PendenciaPosVenda;
import iseg.app.model.PosVenda;
import iseg.app.model.RespostaPosVenda;
import iseg.app.model.Seguradora;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PosVendaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private PosVenda posVenda;
	private PosVenda posVendaSearch;
	private List<PosVenda> posVendas;
	protected PosVendaService service;
	private PendenciaPosVenda pendenciaPosVenda;
	private List<PendenciaPosVenda> pendenciaPosVendaList;
	private Long statusPosVenda;

	protected Boolean mostraUltimaLista = new Boolean(false);

	//@Autowired
	public PosVendaAction(PosVendaService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();
			if(this.getSession().get("posVendaSearch") != null){
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

	protected void persistPObjects() throws Exception {
		for (RespostaPosVenda respostaPosVenda : this.posVenda.getRespostaPosVendaCollection()) {
			if (respostaPosVenda.getResposta()!=null && !respostaPosVenda.getResposta().equals("") && !respostaPosVenda.getIsRespondido()){
				respostaPosVenda.setIsRespondido(true);
				respostaPosVenda.setDataResposta(new Date());
			}
		}
		for (PendenciaPosVenda pendenciaPosVenda : this.posVenda.getPendenciaPosVendaCollection()) {
			if (pendenciaPosVenda.getAcao()!=null && !pendenciaPosVenda.getAcao().equals("") && pendenciaPosVenda.getDataBaixa()==null){
				pendenciaPosVenda.setDataBaixa(new Date());
			}
		}
		
		this.posVenda.setDataAlteracao(new Date());
	}

	protected void setPObjectInstance() {
		try {
			this.posVenda = (PosVenda)this.service.find(PosVenda.class, this.posVenda.getId());
			List<RespostaPosVenda> respostasPendentes = new ArrayList<RespostaPosVenda>();
			List<PendenciaPosVenda> pendenciasPendentes = new ArrayList<PendenciaPosVenda>();
			try{
				respostasPendentes = this.service.genericFindByNamedQuery("getRespostaPosVendaNaoRespodida", new Object[]{this.posVenda.getId()});
				pendenciasPendentes = this.service.genericFindByNamedQuery("getPendenciaPosVendaEmAberto", new Object[]{this.posVenda.getId()});
			}catch (Exception e) {}
			
			if ((respostasPendentes.size()>0 || pendenciasPendentes.size()>0) && this.posVenda.getDataEncerramento()!=null){
				this.posVenda.setDataEncerramento(null);
				this.posVenda.setIsAtivo(true);
				this.service.save(posVenda);
			}else if ((respostasPendentes.size()==0 && pendenciasPendentes.size()==0) && this.posVenda.getDataEncerramento()==null){
				this.posVenda.setDataEncerramento(new Date());
				this.posVenda.setIsAtivo(false);
				this.service.save(posVenda);
			}

			this.posVenda = (PosVenda)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@SkipValidation
	public String lista() {
		try {

			if(this.posVendaSearch != null){
				this.posVendaSearch.getProposta().setInicioVigencia(null);
				this.posVendaSearch.getProposta().setTerminoVigencia(null);
			}
		
			this.getSession().put("posVendaSearch", this.posVendaSearch);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			if(this.posVendaSearch != null){
				this.listCount = this.service.getCountPosVendaForSearch(this.posVendaSearch, this.statusPosVenda).intValue();
				this.posVendas = this.service.getPosVendaForSearch(this.posVendaSearch, page, pageSize, this.statusPosVenda);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirPendencia(){
		try{

			this.pendenciaPosVenda.setUsuario(this.getUsuarioEmUso());
			this.pendenciaPosVenda.setDataAbertura(new Date());
			this.service.save(this.pendenciaPosVenda);
			
			this.posVenda = (PosVenda)this.service.find(this.pendenciaPosVenda.getPosVenda());
			this.posVenda.setDataEncerramento(null);
			this.posVenda.setIsAtivo(true);
			this.service.save(posVenda);

			pendenciaPosVendaList = (List<PendenciaPosVenda>)this.service.genericFindBySQLQuery("Select pend From PendenciaPosVenda pend where pend.posVenda.id = ?0 order by pend.dataAbertura desc", new Object[]{this.pendenciaPosVenda.getPosVenda().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	public PosVenda getPosVenda() {
		return this.posVenda;
	}

	public void setPosVenda(PosVenda posVenda) {
		this.posVenda = posVenda;
		this.pobject = this.posVenda;
	}

	public List<PosVenda> getPosVendas(){
		return posVendas;
	}

	public Map<Long, String> getStatusOperacionalList(){
		return Constants.getStatusOperacionalMap();
	}

	public Map<Long, String> getSituacaoOperacionalList(){
		
		if (this.posVenda.getProposta() != null && this.posVenda.getProposta().getTerminoVigencia()!=null && this.posVenda.getProposta().getTerminoVigencia().getTime() < (new Date()).getTime())
			return Constants.getSituacaoOperacionalVencida();
		else
			return Constants.getSituacaoOperacionalMap();
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradorasList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountPosVenda", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public PosVenda getPosVendaSearch() {
		return posVendaSearch;
	}

	public void setPosVendaSearch(PosVenda posVendaSearch) {
		this.posVendaSearch = posVendaSearch;
	}

	public PendenciaPosVenda getPendenciaPosVenda() {
		return pendenciaPosVenda;
	}

	public void setPendenciaPosVenda(PendenciaPosVenda pendenciaPosVenda) {
		this.pendenciaPosVenda = pendenciaPosVenda;
	}

	public List<PendenciaPosVenda> getPendenciaPosVendaList() {
		return pendenciaPosVendaList;
	}

	public void setPendenciaPosVendaList(
			List<PendenciaPosVenda> pendenciaPosVendaList) {
		this.pendenciaPosVendaList = pendenciaPosVendaList;
	}

	public Long getStatusPosVenda() {
		return statusPosVenda;
	}

	public void setStatusPosVenda(Long statusPosVenda) {
		this.statusPosVenda = statusPosVenda;
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/