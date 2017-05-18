package iseg.app.action;

import iseg.app.business.RepasseComissaoService;
import iseg.app.constants.Constants;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Proposta;
import iseg.app.model.RepasseComissao;
import iseg.app.model.Seguradora;
import iseg.app.model.TipoDeQuebraDeRelatorio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class RepasseComissaoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private RepasseComissao repasseComissao;
	private Proposta proposta;
	private Long[] repasseIds;
	private List<RepasseComissao> repasseComissaoList;
	protected RepasseComissaoService service;

	private Date inicioDataPagamento;
	private Date fimDataPagamento;
	private Date inicioDataLancamento;
	private Date fimDataLancamento;
	private Date dataQuitacao;
	private Integer situacao;
	private Long produtorId;

	protected TipoDeQuebraDeRelatorio quebra;
	protected String ordem;
	protected String idRelatorio;
	protected String titulo;

	//@Autowired
	public RepasseComissaoAction(RepasseComissaoService service) {
		super(service);
		this.service = service;
	}

	@SkipValidation
	public String quitacao() {
		try {

			this.repasseComissaoList = this.service.genericFindByNamedQuery("getRepasseByProdutorDataLancaNaoPago", new Object[]{this.getInicioDataPagamento(),this.getFimDataPagamento(),this.getProdutorId(),this.getProdutorId()});

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String lista() {
		try {

			if (repasseComissao!=null)
				this.repasseComissaoList = this.service.getRepasseComissaosForSearch(this.repasseComissao, this.inicioDataPagamento, this.fimDataPagamento, this.inicioDataLancamento, this.fimDataLancamento, situacao, page, pageSize);

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	public String novo()throws Exception{
		try{
			super.novo();
			this.repasseComissao.setDataLancamento(new Date());
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	protected void persistPObjects() throws Exception {
		if (this.repasseComissao.getId()==null){
			if (this.repasseComissao.getTipoLancamento().intValue()==Constants.TP_LANCAMENTO_DEBITO)
				this.repasseComissao.setValorPago(this.repasseComissao.getValorPago()*-1);
		}
	}

	@SkipValidation
	public String efetivarQuitacao() {
		try {

			this.service.quitarRepasse(repasseIds, this.getDataQuitacao());
			//this.service.quitarRepasse(this.getInicioDataPagamento(),this.getFimDataPagamento(),this.getProdutorId(),this.getDataQuitacao());

			return lista();
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	public String salvarLista() {
		try {
			if (this.repasseComissao.getId()!=null){
				this.service.estornarLancamento(this.repasseComissao, this.getUsuarioEmUso());
				this.repasseComissao = new RepasseComissao();
				return this.lista();
			}else{
				super.salvarLista();
				this.repasseComissao = new RepasseComissao();
				return Action.SUCCESS;
			}
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		this.repasseComissao = (RepasseComissao)this.pobject;
	}

	public String relatorio(){
		this.ordem = "cliente_nome";
		this.quebra = TipoDeQuebraDeRelatorio.POR_PRODUTOR;
		return Action.SUCCESS;
	}

	public String getIdRelatorio() {
		return idRelatorio;
	}

	public void setIdRelatorio(String idRelatorio) {
		this.idRelatorio = idRelatorio;
	}

	public String getTitulo() {
		if (this.idRelatorio.equals("1"))
			titulo = "Relatório de Comissões Detalhado";
		else if (this.idRelatorio.equals("2"))
			titulo = "Relatório de Comissões Resumido";
		else if (this.idRelatorio.equals("3"))
			titulo = "Relatório Repasse de Comissões";
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public RepasseComissao getRepasseComissao() {
		return repasseComissao;
	}

	public void setRepasseComissao(RepasseComissao repasseComissao) {
		this.repasseComissao = repasseComissao;
		this.pobject = this.repasseComissao;
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0) Order by s.nome", new Object[]{this.proposta.getRamo().getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public List<GrupoDeVenda> getGrupoVendaList(){
		try{
			return this.service.genericFindByNamedQuery("getGrupoDeVenda", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public List<RepasseComissao> getRepasseComissaoList() {
		return repasseComissaoList;
	}

	public void setRepasseComissaoList(List<RepasseComissao> repasseComissaoList) {
		this.repasseComissaoList = repasseComissaoList;
	}

	public int getRowCount(){return 0;}

	public Date getInicioDataPagamento() {
		return inicioDataPagamento;
	}

	public void setInicioDataPagamento(Date inicioDataPagamento) {
		this.inicioDataPagamento = inicioDataPagamento;
	}

	public Date getFimDataPagamento() {
		return fimDataPagamento;
	}

	public void setFimDataPagamento(Date fimDataPagamento) {
		this.fimDataPagamento = fimDataPagamento;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Long getProdutorId() {
		return produtorId;
	}

	public void setProdutorId(Long produtorId) {
		this.produtorId = produtorId;
	}

	public Date getDataQuitacao() {
		return new Date();
	}

	public void setDataQuitacao(Date dataQuitacao) {
		this.dataQuitacao = dataQuitacao;
	}
	
	public TipoDeQuebraDeRelatorio[] getOpcoesDeQuebraDoRelatorio(){
		return TipoDeQuebraDeRelatorio.values();
	}

	public void setQuebra(TipoDeQuebraDeRelatorio quebra) {
		this.quebra = quebra;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

	public TipoDeQuebraDeRelatorio getQuebra() {
		return quebra;
	}

	public String getOrdem() {
		return ordem;
	}

	public Date getInicioDataLancamento() {
		return inicioDataLancamento;
	}

	public void setInicioDataLancamento(Date inicioDataLancamento) {
		this.inicioDataLancamento = inicioDataLancamento;
	}

	public Date getFimDataLancamento() {
		return fimDataLancamento;
	}

	public void setFimDataLancamento(Date fimDataLancamento) {
		this.fimDataLancamento = fimDataLancamento;
	}

	public Long[] getRepasseIds() {
		return repasseIds;
	}

	public void setRepasseIds(Long[] repasseIds) {
		this.repasseIds = repasseIds;
	}

}