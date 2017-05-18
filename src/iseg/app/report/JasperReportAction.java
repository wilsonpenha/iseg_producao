package iseg.app.report;

import iseg.app.action.BaseAction;
import iseg.app.business.PropostaService;
import iseg.app.constants.Constants;
import iseg.app.model.Corretora;
import iseg.app.model.CorretorasList;
import iseg.app.model.Endereco;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Periodo;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.TipoDeQuebraDeRelatorio;
import iseg.utils.Formatter;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class JasperReportAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	
	protected PropostaService service;
	private Map<String,Object>parameters = new HashMap<String, Object>();

	private Proposta proposta;
	private Ramo ramo;
	private Seguradora seguradora;
	private GrupoDeVenda grupoDeVenda;

	private String usuario;
	private Long produtorId;
	private Long corretoraId;
	private Long situacaoOperacional;
	private Long[] corretorasList;
	private String produtorNome;
	private Long clienteId;
	private String clienteNome;
	private String imagemFile;
	private String nomeCorretora;
	private String enderecoCorretora;
	private String emailCorretora;
	private String idRelatorio;
	private Integer natureza;
	private String dataSource = null;
	private String ordem;
	private boolean quebraCorretora = false;
	private TipoDeQuebraDeRelatorio quebra;
	private Periodo periodoDaProposta;
	private String mesAnoInicio;
	private String mesAnoTermino;
	private Periodo periodoDoInicioDaVigencia;
	private Periodo periodoDoFimDaVigencia;
	private Periodo periodoDaTransmissao;
	protected int isDetalhado;
	private Set<Long> idsDasCorretoras;
	private String ignorarDiferenca;
	private Double valorComissaoReceber;
	public JasperReportAction(PropostaService service) {
		super(service);
		this.service = service;
	}

	public String execute(){

		try {
			grupoDeVenda = (grupoDeVenda!=null && grupoDeVenda.getId() != null) ? (GrupoDeVenda)this.service.find(this.grupoDeVenda) : null;
			seguradora = (seguradora!=null && seguradora.getId() != null) ? (Seguradora)this.service.find(this.seguradora) : null;
			ramo = (ramo!=null && ramo.getId() != null) ? (Ramo)this.service.find(this.ramo) : null;
			Corretora corretora = this.getCorretoraEmUso();
			imagemFile = StringUtils.isNotBlank(corretora.getImagemLogo()) ? corretora.getImagemLogo().toLowerCase() : "logo_iSeg.png";
			Endereco endereco = (Endereco)this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaETipo", new Object[]{corretora.getId(),"C"});

			if (this.getCorretoraEmUso().ehAssessoria())
				addParameterIfNotNull("ASSESSORIA", this.getUsuarioEmUso().getCorretora().getId());

			if (this.quebraCorretora)
				addParameterIfNotNull("QUEBRA_CORRETORAS", new Long(1));

			if (corretorasList != null){
				try{
					this.service.executeNamedQuery("deleteListaByUsuario", new Object[]{this.getUsuarioEmUso().getId()});
					for (int i = 0; i < corretorasList.length; i++) {
						CorretorasList corretoras = new CorretorasList();
						corretoras.setUsuario(getUsuarioEmUso());
						Corretora _corretora = new Corretora();
						_corretora.setId(corretorasList[i]);
						corretoras.setCorretora(_corretora);
						try{
							this.service.save(corretoras);
						}catch (Exception e) {
							// TODO: handle exception
						}
					}
					//addParameterIfNotNull("CORRETORAS", this.corretoraEmUso.getId());
					addParameterIfNotNull("USUARIO_ID", this.getUsuarioEmUso().getId());
				}catch (Exception e) {
					// TODO: handle exception
				}
			}else{
				if (this.getCorretoraEmUso().ehAssessoria()){
					addParameterIfNotNull("CORRETORAS", this.corretoraEmUso.getId());
				}
			}

			if(StringUtils.isBlank(this.getJasperName())){
				return Action.NONE;
			}

			
			if(mesAnoInicio != null || mesAnoTermino != null){
				this.mesAnoInicio = "01/"+this.mesAnoInicio+" 00:00:00";
				this.mesAnoTermino = "01/"+this.mesAnoTermino;
				Calendar c = Calendar.getInstance();
				c.setTimeInMillis(Formatter.getDateTimeLong(this.mesAnoTermino));
				c.add(Calendar.MONTH, 1);
				c.add(Calendar.SECOND, -1);
				this.mesAnoTermino = Formatter.getDateTime(c.getTime());
				addParameterIfNotNull("DATA_INICIO", new Timestamp(Formatter.getDateTimeLong(this.mesAnoInicio)));
				addParameterIfNotNull("DATA_TERMINO", new Timestamp(Formatter.getDateTimeLong(this.mesAnoTermino)));
			}
			if(periodoDaProposta != null){
				addParameterIfNotBlank("periodoDaProposta", periodoDaProposta.toString());
				addParameterIfNotNull("DATA_PROPOSTA_INICIO",		periodoDaProposta.getInicio());
				addParameterIfNotNull("DATA_PROPOSTA_TERMINO",		periodoDaProposta.getFim());
			}
			if(periodoDoInicioDaVigencia != null){
				addParameterIfNotBlank("periodoDoInicioDaVigencia", periodoDoInicioDaVigencia.toString());
				addParameterIfNotNull("INICIO_INICIO_VIGENCIA",		periodoDoInicioDaVigencia.getInicio());
				addParameterIfNotNull("FIM_INICIO_VIGENCIA",		periodoDoInicioDaVigencia.getFim());
			}
			if(periodoDoFimDaVigencia != null){
				addParameterIfNotBlank("periodoDoFimDaVigencia", periodoDoFimDaVigencia.toString());
				addParameterIfNotNull("INICIO_TERMINO_VIGENCIA",	periodoDoFimDaVigencia.getInicio());
				addParameterIfNotNull("FIM_TERMINO_VIGENCIA",		periodoDoFimDaVigencia.getFim());
			}
			if(periodoDaTransmissao != null){
				addParameterIfNotBlank("periodoDaTransmissao", periodoDaTransmissao.toString());
				addParameterIfNotNull("DATA_TRANSMISSAO_INICIO",	periodoDaTransmissao.getInicio());
				addParameterIfNotNull("DATA_TRANSMISSAO_TERMINO",	periodoDaTransmissao.getFim());
			}


			if(ramo != null && ramo.getId() != null){
				this.parameters.put("RAMO_ID", ramo.getId());
				this.parameters.put("RAMO_NOME", ramo.getNome());
			}
			if(seguradora != null && seguradora.getId() != null){
				this.parameters.put("SEGURADORA_ID", seguradora.getId());
				this.parameters.put("SEGURADORA_NOME", seguradora.getNome());
			}
			if(grupoDeVenda != null && grupoDeVenda.getId() != null){
				this.parameters.put("GRUPO_VENDA_ID", grupoDeVenda.getId());
				this.parameters.put("GRUPO_VENDA_NOME", grupoDeVenda.getNomeDoGrupo());
			}
			if(produtorId != null){
				this.parameters.put("PRODUTOR_ID", produtorId);
				this.parameters.put("PRODUTOR_NOME", produtorNome);
			}
			if(clienteId != null){
				this.parameters.put("CLIENTE_ID", clienteId);
				this.parameters.put("CLIENTE_NOME", clienteNome);
			}

			addParameterIfNotNull("SITUACAO_OPERACIONAL", situacaoOperacional);
			addParameterIfNotBlank("SITUACAO_OPERACIONAL_NOME", Constants.getSituacaoOperacionalDescricao(situacaoOperacional));

			// se foi informada a corretora pela assessoria ira filtrar
			if(corretoraId != null){
				this.parameters.put("CORRETORA_ID", corretoraId);
			}else{
				// se não foi informada a assessoria, ira listar todas.
				if (!this.getCorretoraEmUso().ehAssessoria()){
					// se a corretora em uso não for a assessoria então filtra pela corretora
					this.parameters.put("CORRETORA_ID", corretora.getId());
				}
			}
			if(ordem != null){
				this.parameters.put("ORDEM", getOrdem().toLowerCase().toString());
			}
			if(quebra != null){
				this.parameters.put("QUEBRA", getQuebra().toString());
			}
			if (isDetalhado==0)
				this.parameters.put("IS_DETALHADO", "NAO");

			if(corretora != null){
				this.parameters.put("NOME_CORRETORA", corretora.getNome());
				this.parameters.put("EMAIL_CORRETORA", corretora.getEmail());
			}
			if(endereco != null){
				this.parameters.put("ENDERECO_CORRETORA", endereco.getEnderecoCompleto());
			}
			this.parameters.put("IMAGEM_FILE", imagemFile);
			this.parameters.put("PROPOSTA_ID", proposta!=null ? proposta.getId() : new Long("0"));
			this.parameters.put("SUBREPORT_ITENS", getSubReportItens());
			
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}

		return Action.SUCCESS;
	}

	public String getJasperName(){
		String jasperName = "";
		if(this.idRelatorio.equals("1")){
			if(this.natureza == 1){
				jasperName = "/WEB-INF/report/RelVendasDetalhado.jasper";
			}else if(this.natureza == 2){
				jasperName = "/WEB-INF/report/RelProducaoRealizado.jasper";
			}
		}else if(this.idRelatorio.equals("2")){
			jasperName = "/WEB-INF/report/RelRankingVendas.jasper";
		}else if(this.idRelatorio.equals("3")){
			jasperName = "/WEB-INF/report/RelPropostaSemApolices.jasper";
		}else if(this.idRelatorio.equals("4")){
			jasperName = "/WEB-INF/report/RelProducaoDetalhado.jasper";
		}else if(this.idRelatorio.equals("5")) {
			jasperName = "/WEB-INF/report/RelClientesPropostasVigentes.jasper";
		}else if(this.idRelatorio.equals("6")){
			jasperName = "/WEB-INF/report/RelListagemRenovacoesDetalhado.jasper";
		}else if(this.idRelatorio.equals("7")){
			jasperName = "/WEB-INF/report/RelComissoesAPagar.jasper"; 
		}else if(this.idRelatorio.equals("8")){
			jasperName = "/WEB-INF/report/RelExtratoRepasse.jasper";
		/*}else if(idRelatorioRel.equals(8L)){
			jasperName = "/RelResumoRenovacoes.jasper";*/
		}else if(idRelatorio.equals("AUTO")){ 
			jasperName = "/WEB-INF/report/RelPedidoSeguroAuto.jasper";
		}else if(idRelatorio.equals("IMOVEL")){ 
			jasperName = "/WEB-INF/report/RelPedidoSeguro.jasper";
		}else if(idRelatorio.equals("RDIVERSOS")){ 
			jasperName = "/WEB-INF/report/RelPedidoSeguroRiscosDiversos.jasper";
		}else if(idRelatorio.equals("PESSOAS_COLETIVO")){ 
			jasperName = "/WEB-INF/report/RelPedidoSeguroPessoasColetivo1.jasper";
		}else if(idRelatorio.equals("PESSOAS_INDIVIDUAL")){ 
			jasperName = "/WEB-INF/report/RelPedidoSeguroPessoasIndividual.jasper";
		}
		return jasperName;
	}
	
	public String getSubReportItens(){
		if(idRelatorio != null && idRelatorio.equals("IMOVEL")){ // Seguro Auto
			return "RelPedidoSeguroImovelList.jasper";
		}
		return "";
	}
	
	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Map<String, Object> getParameters() {
		if(this.parameters == null){
			this.parameters = new HashMap<String, Object>();
		}
		return parameters;
	}

	public void addParameterIfNotBlank(String key, String value){
		if(StringUtils.isNotBlank(value)){
			addParameter(key, value);
		}
	}
	
	public void addParameterIfNotNull(String key, Object value){
		if(value != null){
			addParameter(key, value);
		}
	}
	
	public void addParameter(String key, Object value){
		getParameters().put(key, value);
	}
	
	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountProposta", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	protected void setPObjectInstance() throws Exception {
		
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public Long getProdutorId() {
		return produtorId;
	}

	public void setProdutorId(Long produtorId) {
		this.produtorId = produtorId;
	}

	public Long getClienteId() {
		return clienteId;
	}

	public void setClienteId(Long clienteId) {
		this.clienteId = clienteId;
	}

	public String getImagemFile() {
		return imagemFile;
	}

	public void setImagemFile(String imagemFile) {
		this.imagemFile = imagemFile;
	}

	public String getNomeCorretora() {
		return nomeCorretora;
	}

	public void setNomeCorretora(String nomeCorretora) {
		this.nomeCorretora = nomeCorretora;
	}

	public String getIdRelatorio() {
		return idRelatorio;
	}

	public void setIdRelatorio(String idRelatorio) {
		this.idRelatorio = idRelatorio;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public String getProdutorNome() {
		return produtorNome;
	}

	public void setProdutorNome(String produtorNome) {
		this.produtorNome = produtorNome;
	}

	public String getClienteNome() {
		return clienteNome;
	}

	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}

	public String getOrdem() {
		return ordem;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

	public TipoDeQuebraDeRelatorio getQuebra() {
		return quebra;
	}

	public void setQuebra(TipoDeQuebraDeRelatorio quebra) {
		this.quebra = quebra;
	}

	public Long getCorretoraId() {
		return corretoraId;
	}

	public void setCorretoraId(Long corretoraId) {
		this.corretoraId = corretoraId;
	}

	public String getEmailCorretora() {
		return emailCorretora;
	}

	public void setEmailCorretora(String emailCorretora) {
		this.emailCorretora = emailCorretora;
	}

	public String getEnderecoCorretora() {
		return enderecoCorretora;
	}

	public void setEnderecoCorretora(String enderecoCorretora) {
		this.enderecoCorretora = enderecoCorretora;
	}
	
	public String getFormat(){
		return "PDF";
	}
	
	public TipoDeQuebraDeRelatorio[] getOpcoesDeQuebraDoRelatorio(){
		return TipoDeQuebraDeRelatorio.values();
	}

	public Periodo getPeriodoDaProposta() {
		return periodoDaProposta;
	}

	public void setPeriodoDaProposta(Periodo periodoDaProposta) {
		this.periodoDaProposta = periodoDaProposta;
	}

	public Periodo getPeriodoDoInicioDaVigencia() {
		return periodoDoInicioDaVigencia;
	}

	public void setPeriodoDoInicioDaVigencia(Periodo periodoDoInicioDaVigencia) {
		this.periodoDoInicioDaVigencia = periodoDoInicioDaVigencia;
	}

	public Periodo getPeriodoDoFimDaVigencia() {
		return periodoDoFimDaVigencia;
	}

	public void setPeriodoDoFimDaVigencia(Periodo periodoDoFimDaVigencia) {
		this.periodoDoFimDaVigencia = periodoDoFimDaVigencia;
	}

	public Periodo getPeriodoDaTransmissao() {
		return periodoDaTransmissao;
	}

	public void setPeriodoDaTransmissao(Periodo periodoDaTransmissao) {
		this.periodoDaTransmissao = periodoDaTransmissao;
	}

	public Long getSituacaoOperacional() {
		return situacaoOperacional;
	}

	public void setSituacaoOperacional(Long situacaoOperacional) {
		this.situacaoOperacional = situacaoOperacional;
	}
	
	public Map<Long, String> getSituacaoOperacionalList(){
		return Constants.getSituacaoOperacionalMap();
	}

	public Set<Long> getIdsDasCorretoras() {
		return idsDasCorretoras;
	}

	public void setIdsDasCorretoras(Set<Long> idsDasCorretoras) {
		this.idsDasCorretoras = idsDasCorretoras;
	}

	public Long[] getCorretorasList() {
		return corretorasList;
	}

	public void setCorretorasList(Long[] corretorasList) {
		this.corretorasList = corretorasList;
	}

	public boolean isQuebraCorretora() {
		return quebraCorretora;
	}

	public void setQuebraCorretora(boolean quebraCorretora) {
		this.quebraCorretora = quebraCorretora;
	}

	public String getMesAnoInicio() {
		return mesAnoInicio;
	}

	public void setMesAnoInicio(String mesAnoInicio) {
		this.mesAnoInicio = mesAnoInicio;
	}

	public String getMesAnoTermino() {
		return mesAnoTermino;
	}

	public void setMesAnoTermino(String mesAnoTermino) {
		this.mesAnoTermino = mesAnoTermino;
	}

	public int getIsDetalhado() {
		return isDetalhado;
	}

	public void setIsDetalhado(int isDetalhado) {
		this.isDetalhado = isDetalhado;
	}

	public Integer getNatureza() {
		return natureza;
	}

	public void setNatureza(Integer natureza) {
		this.natureza = natureza;
	}

	public String getIgnorarDiferenca() {
		return ignorarDiferenca;
	}

	public void setIgnorarDiferenca(String ignorarDiferenca) {
		this.ignorarDiferenca = ignorarDiferenca;
	}

	public Double getValorComissaoReceber() {
		return valorComissaoReceber;
	}

	public void setValorComissaoReceber(Double valorComissaoReceber) {
		this.valorComissaoReceber = valorComissaoReceber;
	}
}