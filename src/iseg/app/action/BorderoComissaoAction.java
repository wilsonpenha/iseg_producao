/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.BorderoComissaoService;
import iseg.app.business.PropostaComissaoService;
import iseg.app.constants.Constants;
import iseg.app.conversion.CpfCnpj;
import iseg.app.model.BorderoComissao;
import iseg.app.model.BorderoLancamento;
import iseg.app.model.CorretoraTipoLancamento;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.TipoLancamento;
import iseg.utils.Formatter;
import iseg.utils.Util;

import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.aop.framework.adapter.ThrowsAdviceInterceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class BorderoComissaoAction extends BaseAction implements Preparable, ServletRequestAware,ServletResponseAware {

	private static final long serialVersionUID = 1L;
	private BorderoComissao borderoComissao;
	private BorderoComissao borderoComissaoSearch;
	private BorderoLancamento borderoLancamento;
	private List<BorderoComissao> borderos;
	private List<BorderoLancamento> borderoLancamentoList;
	private BorderoComissaoService service;
	private PropostaComissaoService serviceAux;
	private Double totalParcial;
	private InputStream inputStream;
	private List<Proposta> propostaList = new ArrayList<Proposta>();
	//uso na referencia da parcela
	private String referencia;

	protected Boolean mostraUltimaLista = new Boolean(false);
	private String ordenacao = "";
	private Integer campoOrdenacao = 0;
	private String tipoOrdenacao = "DESC";
	private String[] campos = new String[]{"b.nroExtrato","b.dataDocumento","b.seguradora.nome"};
	private Long idProposta;
	
	List<Ramo> subRamoList = new ArrayList<Ramo>();
	List<Ramo> ramosList = new ArrayList<Ramo>();

	//@Autowired
	public BorderoComissaoAction(BorderoComissaoService service, PropostaComissaoService serviceAux) {
		super(service);
		this.service = service;
		this.serviceAux = serviceAux;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();
			if(this.getSession().get("borderoComissaoSearch") != null){
				this.borderoComissaoSearch = (BorderoComissao) this.getSession().get("borderoComissaoSearch");
				if (this.getSession().get("campoOrdenacao")!=null){
					this.campoOrdenacao = (Integer)this.getSession().get("campoOrdenacao");
					this.tipoOrdenacao = (String)this.getSession().get("tipoOrdenacao");
				}
				if (this.getSession().get("page")!=null)
					this.page = (Integer)this.getSession().get("page");
				if (this.getSession().get("pageSize")!=null)
					this.pageSize = (Integer)this.getSession().get("pageSize");
			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		try {

			this.getSession().put("borderoComissaoSearch", borderoComissaoSearch);
			this.getSession().put("campoOrdenacao", this.campoOrdenacao);
			this.getSession().put("tipoOrdenacao", this.tipoOrdenacao);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);
			
			this.ordenacao = " ORDER BY "+this.campos[this.campoOrdenacao.intValue()]+" "+this.tipoOrdenacao;
			if(this.borderoComissaoSearch != null){
				this.listCount = this.service.getCountBorderoComissaosForSearch(borderoComissaoSearch).intValue();
				this.borderos = this.service.getBorderoComissaosForSearch(borderoComissaoSearch, page, pageSize, ordenacao);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try{
			this.pobject = service.find(this.borderoComissao);
			validarBorderoParaExclusao(this.borderoComissao);
			this.service.remove(pobject);
			this.mostraUltimaLista = true;
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public void validarBorderoParaExclusao(BorderoComissao borderoComissao) throws Exception{
		for(BorderoLancamento borderoLancamento : borderoComissao.getBorderoLancamentoCollection()){
			if(borderoLancamento.getSituacao() == Constants.ST_BORDERO_LANCAMENTO_BAIXADO){
				throw new Exception("Erro ao excluir lote pois já existe lançamento baixado.");
			}
		}
	}

	protected void setPObjectInstance() {
		this.borderoComissao = (BorderoComissao) this.pobject;
		borderoLancamentoList = this.borderoComissao.getBorderoLancamentoCollection();
		try{
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	public BorderoComissao getBorderoComissao() {
		return borderoComissao;
	}

	public String getCountLancamentos() {
		return String.valueOf(borderoComissao.getBorderoLancamentoCollection().size());
	}

	public void setBorderoComissao(BorderoComissao borderoComissao) {
		this.borderoComissao = borderoComissao;
		this.pobject = this.borderoComissao;
	}

	public List<BorderoComissao> getBorderos() {
		return borderos;
	}

	public int getRowCount() {
		try {
			return this.service.getRowCount("getCount", new Object[] {});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SkipValidation
	public String novo() {

		try {
			this.borderoComissao = new BorderoComissao();
			this.borderoComissao.setDataLancamento(new Date());
			this.borderoComissao.setSituacao(0);

			borderoLancamentoList = this.borderoComissao.getBorderoLancamentoCollection();

			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.ERROR;
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

	@SkipValidation
	public String salvarEditar(){
		try{
			if(this.borderoComissao.getId() == null){
				verificarNumeroExtrato(this.borderoComissao);
			}
			this.persistPObjects();

			if(this.borderoComissao.getBorderoLancamentoCollection()!=null && (this.borderoComissao.getBorderoLancamentoCollection().size()==1)){
				this.borderoComissao.getBorderoLancamentoCollection().get(0).setBorderoComissao(this.borderoComissao);
			}

			this.service.save(pobject);
			this.pobject = service.find(pobject);

			borderoLancamentoList = this.borderoComissao.getBorderoLancamentoCollection();
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);

			this.setPObjectInstance();
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}

	}
	
	public void verificarNumeroExtrato(BorderoComissao borderoComissao) throws Exception{
		List<BorderoComissao> borderoList = this.service.genericFindByNamedQuery("getBordComissBySegAndCorretoraAndNroExt", new Object[]{borderoComissao.getSeguradora().getId(),corretoraEmUso.getId(), borderoComissao.getNroExtrato()});
		if(borderoList != null && !borderoList.isEmpty()){
			throw new Exception("Extrato já cadastrado no sistema");
		}
	}

	protected void persistPObjects() throws Exception{
		if (this.borderoComissao.getSeguradora().getId()==null){
			throw new Exception("Informe a seguradora!");
		}
		BorderoLancamento borderoLancamento = null;
		if(borderoComissao.getBorderoLancamentoCollection() != null){
			for(int i=0 ; i<borderoComissao.getBorderoLancamentoCollection().size() ; i++){
				borderoLancamento = borderoComissao.getBorderoLancamentoCollection().get(i);
				if(borderoLancamento.getProposta() != null && borderoLancamento.getProposta().getId() == null){
					borderoLancamento.setProposta(null);
				}
				if(borderoLancamento.getRamo() != null && borderoLancamento.getRamo().getId() == null){
					borderoLancamento.setRamo(null);
				}
				if(borderoLancamento == null){
					borderoComissao.getBorderoLancamentoCollection().remove(i--);
				}else{
					borderoComissao.getBorderoLancamentoCollection().get(i).setBorderoComissao(borderoComissao);
				}
			}
		}
		this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
	}

	@SkipValidation
	public String efetivarBaixa(){
		try{

			boolean refresh = true;
			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;
			borderoLancamentoList = this.borderoComissao.getBorderoLancamentoCollection();

			Double totalParcial = getTotalParcial()==null ? 0 : getTotalParcial();
			Double valorTotal = this.borderoComissao.getValorTotal();

			this.serviceAux.baixaComissao(borderoLancamentoList, false);  // ira somente baixar as comissões sem fechar o lote.

			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;

			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			borderoLancamento = new BorderoLancamento();

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String fecharLote(){
		try{

			boolean refresh = true;
			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;
			borderoLancamentoList = this.borderoComissao.getBorderoLancamentoCollection();

			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			Double valorTotal = this.borderoComissao.getValorTotal();

			if (totalParcial.doubleValue()==valorTotal.doubleValue()){
				this.serviceAux.baixaComissao(borderoLancamentoList, true); // irá baixar comissões e fechar o lote.
			}else
				throw new Exception("O total dos lancamentos Não batem com o total informado!");

			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;

			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			borderoLancamento = new BorderoLancamento();

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String gerarLoteEstorno(){
		try{

			boolean refresh = true;
			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;

			this.borderoComissao = this.service.gerarLoteEstorno(borderoComissao);
			
			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			borderoLancamento = new BorderoLancamento();

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String copiarLote(){
		try{

			boolean refresh = true;
			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;

			this.borderoComissao = this.service.copiarLote(borderoComissao);
			
			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			borderoLancamento = new BorderoLancamento();

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirLancamento(){
		try{

			if (this.borderoLancamento.getRamo().getId()==null && this.borderoLancamento.getRamo().getSubRamo().getId()!=null){
				this.borderoLancamento.setRamo(this.borderoLancamento.getRamo().getSubRamo());
			}

			if (this.borderoLancamento.getTipoLancamento()!=null && this.borderoLancamento.getTipoLancamento().getId()==null){
				borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
				throw new Exception("Informe o Tipo de Lançamento!");
			}
			
			if (this.borderoLancamento.getValorComissao()==null || this.borderoLancamento.getValorComissao().doubleValue()==0.00){
				borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
				throw new Exception("O valor do lancamento é obrigatorio!");
			}
			
			boolean refresh = true;
			TipoLancamento tipoLancamento = (TipoLancamento)this.service.find(this.borderoLancamento.getTipoLancamento());

			if (tipoLancamento.getIsApolice()){
				
				if (this.borderoLancamento.getProposta()==null || this.borderoLancamento.getProposta().getId()==null){
					borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
					throw new Exception("É obrigatório selecionar uma Apólice válida!");
				}
				Proposta proposta = (Proposta)this.service.find(this.borderoLancamento.getProposta());
				
				boolean isRepasse = ((CorretoraTipoLancamento)this.service.genericFindByNamedQuery("getCorretoraTipoLancamentoByTipoLancamentoAndCorretora", new Object[]{this.borderoLancamento.getTipoLancamento().getId(), this.corretoraEmUso.getId()}).get(0)).getIsRepasse();
				
				this.borderoLancamento.setIsRepasse(isRepasse);
				
				if (this.borderoLancamento.getNroApolice()==null || this.borderoLancamento.getNroApolice().trim().isEmpty()){
					borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
					throw new Exception("O nro da apolice é obrigatoria!");
				}
				if (this.borderoLancamento.getNomeSegurado()==null || this.borderoLancamento.getNomeSegurado().trim().isEmpty()){
					borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
					throw new Exception("O nome do segurado é obrigatoria!");
				}
				if (this.borderoLancamento.getNroParcela()==null && (this.referencia==null || this.referencia.trim().isEmpty())){
					borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
					throw new Exception("O nro/referencia da parcela é obrigatoria!");
				}
				if (proposta.getStatusOperacional().longValue() == Constants.STATUS_OPER_APOLICE || proposta.getStatusOperacional().longValue() == Constants.STATUS_OPER_PROPOSTA){
					if (proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty() && !proposta.getNroApolice().equals(this.borderoLancamento.getNroApolice()))
						throw new Exception("O nro de apólice informado diverge do nro de apólice existente! Verifique o nro de apólice!");
				}else{
					if (proposta.getNroEndosso() != null && !proposta.getNroEndosso().isEmpty() && !proposta.getNroEndosso().equals(this.borderoLancamento.getNroApolice()))
						throw new Exception("O nro de endosso informado diverge do nro de endosso existente! Verifique o nro de endosso!");
				}
				
				if (this.referencia!=null && !this.referencia.isEmpty() && 
				   (this.borderoLancamento.getRamo()!=null && this.borderoLancamento.getProposta().getIsFatura())){
					
					// pega a data no 1o. dia do mes da vigencia para checar a referencia.
					Date inicioVigencia = new Date(Formatter.getDateLong("01/"+Formatter.getMonthYear(proposta.getInicioVigencia())));
					this.borderoLancamento.setReferenciaParcela(new Date(Formatter.getDateLong("01/"+this.referencia)));
					if (this.borderoLancamento.getProposta()!=null && this.borderoLancamento.getProposta().getId()!=null){
						if (this.borderoLancamento.getReferenciaParcela().getTime()<inicioVigencia.getTime() || 
							this.borderoLancamento.getReferenciaParcela().getTime()>proposta.getTerminoVigencia().getTime()){
	
							if (this.borderoLancamento.getId()!=null)
								this.borderoLancamento = (BorderoLancamento)this.service.find(this.borderoLancamento);
							this.referencia = Formatter.getMonthYear(this.borderoLancamento.getReferenciaParcela());
							
							borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
							Ramo ramo = this.borderoLancamento.getRamo().getSubRamo();
							if (ramo!=null)
								this.subRamoList = (List<Ramo>)this.service.genericFindBySQLQuery("Select r From Ramo r WHERE r.subRamo.id = ?0 order by r.nome", new Object[]{ramo.getId()});
							throw new Exception("A referencia da parcela informada nâo pode ser menor ou maior que a vigencia atual da apolice!");
						}
					}
				}
			}else{
				this.borderoLancamento.setRamo(null);
				this.borderoLancamento.setProposta(null);
				this.borderoLancamento.setNroApolice(null);
				this.borderoLancamento.setNomeSegurado("LANÇAMENTO DE "+tipoLancamento.getNome());
			}
			
			this.pobject = service.find(pobject);
			this.borderoComissao = (BorderoComissao)this.pobject;
			this.borderoLancamento.setBorderoComissao(borderoComissao);

			if (this.borderoLancamento.getProposta()==null || this.borderoLancamento.getProposta().getId()==null)
				this.borderoLancamento.setProposta(null);
			if (this.borderoLancamento.getRamo()==null || this.borderoLancamento.getRamo().getId()==null)
				this.borderoLancamento.setRamo(null);

			if (this.borderoLancamento.getId()!=null)
				refresh=false;

			this.borderoLancamento.setSituacao(0);
			this.borderoLancamento.setDataLancamento(new Date());
			if (tipoLancamento.getIsNegativo())
				this.borderoLancamento.setValorComissao(this.borderoLancamento.getValorComissao()*-1);
			this.service.save(this.borderoLancamento);

			if (refresh)
				this.service.refresh(this.borderoLancamento);

			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.id", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);

			this.borderoLancamento = new BorderoLancamento();

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarLancamento(){
		try {

			if (this.borderoLancamento.getRamo().getId()==null && this.borderoLancamento.getRamo().getSubRamo().getId()!=null){
				this.borderoLancamento.setRamo(this.borderoLancamento.getRamo().getSubRamo());
			}

			BorderoLancamento borderoLancamentoDB = (BorderoLancamento)this.service.find(this.borderoLancamento);
			
			this.borderoLancamento = (BorderoLancamento)Util.cloneBean(borderoLancamentoDB, BorderoLancamento.class);
			
			if (this.borderoLancamento.getValorComissao().doubleValue()<0)
				this.borderoLancamento.setValorComissao(this.borderoLancamento.getValorComissao().doubleValue()*-1);
			
			Ramo ramo = this.borderoLancamento.getRamo().getSubRamo();
			if (ramo!=null)
				this.subRamoList = (List<Ramo>)this.service.genericFindBySQLQuery("Select r From Ramo r WHERE r.subRamo.id = ?0 order by r.nome", new Object[]{ramo.getId()});
			else{
				ramo = new Ramo();
				ramo.setSubRamo(this.borderoLancamento.getRamo());
				this.borderoLancamento.setRamo(ramo);
			}
			
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);

			this.referencia = Formatter.getMonthYear(this.borderoLancamento.getReferenciaParcela());
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String removerLancamento(){
		try {

			this.service.remove(borderoLancamento);
			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getLancamentos(){
		try {
			borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.borderoComissao.id = ?0 order by bl.sequencia", new Object[]{this.borderoComissao.getId()});
			this.totalParcial = (Double)((List)this.service.genericFindBySQLQuery("Select sum(valorComissao) From BorderoLancamento bl where bl.borderoComissao.id = ?0", new Object[]{this.borderoComissao.getId()})).get(0);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String consultarBorderoLancamento(){
		try {
			String cpfOuCnpj = this.borderoLancamento.getCpfOuCnpj().getValor();
			String nomeSegurado = this.borderoLancamento.getNomeSegurado();
			String nroApolice = this.borderoLancamento.getNroApolice();
			this.borderoLancamento = (BorderoLancamento)this.service.find(this.borderoLancamento);
			if(this.borderoLancamento.getRamo() != null){
				this.ramosList.add(this.borderoLancamento.getRamo());
				this.subRamoList.add(this.borderoLancamento.getRamo().getSubRamo());
			}
			this.propostaList = this.service.genericFindByNamedQuery("getPropostaByNroApolice2",new Object[]{!nroApolice.equals("")?nroApolice:this.borderoLancamento.getNroApolice()});
			if(this.propostaList == null || this.propostaList.isEmpty()){
				if(!cpfOuCnpj.equals("0") && !cpfOuCnpj.equals("")){
					this.propostaList = this.service.genericFindByNamedQuery("getPropostaByClienteCpfOuCnpj",new Object[]{new CpfCnpj(cpfOuCnpj)});
				}
			}
			if(this.propostaList == null || this.propostaList.isEmpty()){
				if(nomeSegurado.equals("")){
					nomeSegurado = this.borderoLancamento.getNomeSegurado();
				}
				String[] nomeSeguradoArray = nomeSegurado.split(" ");
				int i = 0;
				int cont = 0;
				do{
					String formaNome = "";
					for( ; i < nomeSeguradoArray.length ; i++){
						if(!nomeSeguradoArray[i].equals("")){
							if(cont != 0){
								if(i < nomeSeguradoArray.length - cont){
									formaNome = formaNome.concat(nomeSeguradoArray[i].trim()).concat(" ");
								}
							}else{
								formaNome = formaNome.concat(nomeSeguradoArray[i].trim()).concat(" ");
							}
						}
					}
					cont ++;
					i = 0;
					this.propostaList = this.service.genericFindByNamedQuery("getPropostaByClienteNome",new Object[]{formaNome.trim().concat("%")},0,50);
				}while(this.propostaList.isEmpty() && cont < nomeSeguradoArray.length);
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String editarBorderoLancamento(){
		try {
			this.borderoComissao = this.borderoLancamento.getBorderoComissao();
			List<BorderoLancamento> borderoLancamentoList = null;
			if(this.borderoLancamento.getNroApoliceAnterior() != null && this.borderoLancamento.getBorderoComissao().getId() != null){
				borderoLancamentoList = (List<BorderoLancamento>)this.service.genericFindBySQLQuery("Select bl From BorderoLancamento bl where bl.nroApolice = ?0 AND bl.borderoComissao.id = ?1 order by bl.sequencia", new Object[]{this.borderoLancamento.getNroApoliceAnterior(), this.borderoLancamento.getBorderoComissao().getId()});
			}
			if(borderoLancamentoList != null && !borderoLancamentoList.isEmpty()){
				for(BorderoLancamento bl : borderoLancamentoList){
					if(this.borderoLancamento.getProposta() != null && this.borderoLancamento.getProposta().getId() == null){
						this.borderoLancamento.setProposta(null);
					}else{
						bl.setProposta(this.borderoLancamento.getProposta());
						bl.setSegurado(this.borderoLancamento.getProposta().getCliente());
						if(this.borderoLancamento.getProposta().getNroApolice() != null && !this.borderoLancamento.getProposta().getNroApolice().equals(""))
							bl.setNroApolice(this.borderoLancamento.getProposta().getNroApolice());
					}
					this.service.save(bl);
				}
			}else{
				if(this.borderoLancamento.getProposta() != null && this.borderoLancamento.getProposta().getId() == null){
					this.borderoLancamento.setProposta(null);
				}else{
					if(this.borderoLancamento.getSegurado() != null && this.borderoLancamento.getSegurado().getId() == null){
						this.borderoLancamento.setSegurado(this.borderoLancamento.getProposta().getCliente());
					}
				}
				this.service.save(this.borderoLancamento);
			}
			getLancamentos();
			return Action.SUCCESS;
			
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public Double getTotalParcial(){
		try {
			return this.totalParcial;
		}catch (Exception e) {
			return new Double(0);
		}
	}
	
	public String consultarProposta(){
		String idProposta = "";
		if(this.borderoLancamento != null && this.borderoLancamento.getProposta() != null && this.borderoLancamento.getProposta().getId() != null){
			try {
				Proposta proposta = (Proposta) this.service.find(borderoLancamento.getProposta());
				if(proposta != null){
					idProposta = proposta.getNumero().toString();
				}
				this.inputStream = new StringBufferInputStream(idProposta);
				return Action.SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		this.inputStream = new StringBufferInputStream("Localizador não encontrado");
		return Action.SUCCESS;
	}
	
	public Map<Integer, String> getTipoLancamentoLote(){
		return Constants.getTipoLancamentoLoteMap();
	}
	public String getListResultPage(){
		return "/WEB-INF/jsp/borderoComissao/displayListResult.jsp";
	}

	public String getListPage(){
		return "/WEB-INF/jsp/borderoComissao/displayList.jsp";
	}

	public BorderoLancamento getBorderoLancamento() {
		return borderoLancamento;
	}

	public void setBorderoLancamento(BorderoLancamento borderoLancamento) {
		this.borderoLancamento = borderoLancamento;
	}

	public BorderoComissao getBorderoComissaoSearch() {
		return borderoComissaoSearch;
	}

	public void setBorderoComissaoSearch(BorderoComissao borderoComissaoSearch) {
		this.borderoComissaoSearch = borderoComissaoSearch;
	}

	public List<BorderoLancamento> getBorderoLancamentoList() {
		return borderoLancamentoList;
	}

	public void setBorderoLancamentoList(
			List<BorderoLancamento> borderoLancamentoList) {
		this.borderoLancamentoList = borderoLancamentoList;
	}

	public Boolean getMostraUltimaLista() {
		return mostraUltimaLista;
	}

	public void setMostraUltimaLista(Boolean mostraUltimaLista) {
		this.mostraUltimaLista = mostraUltimaLista;
	}

	public String getOrdenacao() {
		return ordenacao;
	}

	public void setOrdenacao(String ordenacao) {
		this.ordenacao = ordenacao;
	}

	public Integer getCampoOrdenacao() {
		return campoOrdenacao;
	}

	public void setCampoOrdenacao(Integer campoOrdenacao) {
		this.campoOrdenacao = campoOrdenacao;
	}

	public String getTipoOrdenacao() {
		return tipoOrdenacao;
	}

	public void setTipoOrdenacao(String tipoOrdenacao) {
		this.tipoOrdenacao = tipoOrdenacao;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public List<Ramo> getSubRamoList() {
		return subRamoList;
	}

	public void setSubRamoList(List<Ramo> subRamoList) {
		this.subRamoList = subRamoList;
	}

	public List<Ramo> getRamosList() {
		return ramosList;
	}

	public void setRamosList(List<Ramo> ramosList) {
		this.ramosList = ramosList;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		
	}
	public List<Proposta> getPropostaList() {
		return propostaList;
	}

	public void setPropostaList(List<Proposta> propostaList) {
		this.propostaList = propostaList;
	}

	public Long getIdProposta() {
		return idProposta;
	}

	public void setIdProposta(Long idProposta) {
		this.idProposta = idProposta;
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyyMMdd").parse("20130519")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}