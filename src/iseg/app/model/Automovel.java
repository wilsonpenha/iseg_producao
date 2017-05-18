package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import iseg.app.conversion.CEP;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name = "automovel")
@SequenceGenerator(name="seq_automovel", sequenceName = "seq_automovel")
@NamedQueries({
	@NamedQuery(name="getCountAutomovel", query="SELECT Count(*) FROM Automovel a JOIN a.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0"),
	@NamedQuery(name="getAutomovel", query = "SELECT a FROM Automovel a"),
	@NamedQuery(name="getAutomovelByPlaca", query = "SELECT a FROM Automovel a JOIN a.propostaAutomovelCollection pa where pa.proposta.situacaoOperacional=0 and pa.proposta.corretora.id = ?0 and a.nroPlaca = ?1"),
	@NamedQuery(name="getAutomovelByChassis", query = "SELECT a FROM Automovel a JOIN a.propostaAutomovelCollection pa where pa.proposta.situacaoOperacional=0 and pa.proposta.corretora.id = ?0 and a.nroChassis = ?1"),
	@NamedQuery(name="getAutomovelOrdered", query = "SELECT a FROM Automovel a ORDER BY a.id"),
	@NamedQuery(name="getMaxNumeroItemAutoByProposta", query = "SELECT max(pa.numeroItem)+1 FROM Automovel a JOIN a.propostaAutomovelCollection pa WHERE pa.dataExclusao is null AND  pa.proposta.id = ?0 "),
	@NamedQuery(name="getAutomovelByProposta", query = "SELECT a FROM Automovel a JOIN a.propostaAutomovelCollection pa WHERE  pa.proposta.id = ?0 ")})
public class Automovel extends PObject implements Serializable, Auditable, AtributoUsuario {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_automovel")
	private Long id;

	@Column(name="CODIGO_IDENTIFICACAO")
	private String codigoIdentificacao;

	@Column(name="LINHA_VAZIA")
	private Boolean linhaVazia;

	@Column(name="CODIGO_IDENTIFICACAO_ANTERIOR")
	private String codigoIdentificacaoAnterior;

	@Column(name="ANO_FABRICACAO")
	private String anoFabricacao;

	@Column(name="POSSUI_ANTI_FURTO")
	private String possuiAntiFurto;

	private String renovacao;

	@Column(name="NRO_NF")
	private String nroNf;

	private String status;

	@Column(name="INI_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date iniVigApoliceAnterior;

	@Column(name="NRO_CHASSIS")
	private String nroChassis;

	@Column(name="CODIGO_FIPE")
	private String codigoFipe;
	
	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CEP_CIRCULACAO"))
	private CEP cepCirculacao;
	
	@Column(name="REGIAO_TARIFACAO")
	private String regiaoTarifacao;

	@Column(name="TERCEIRO_EIXO")
	private String terceiroEixo;

	@Column(name="ANO_MODELO")
	private String anoModelo;

	@Column(name="RASTREAMENTO_SATELITE")
	private String rastreamentoSatelite;

	@Column(name="NRO_APOLICE_ANTERIOR")
	private String nroApoliceAnterior;

	@Column(name="QTDE_PORTAS")
	private Long qtdePortas;

	@Column(name="NOME_PROPRIETARIO")
	private String nomeProprietario;

	@Column(name="FIM_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date fimVigApoliceAnterior;

	private String capacidade;

	private String renavan;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CEP_PERNOITE"))
	private CEP cepPernoite;

	@Column(name="CLASSE_BONUS")
	private String classeBonus;

	@Column(name="COR_PREDOMINANTE")
	private String corPredominante;

	@Column(name="ZERO_KM")
	private String zeroKm;

	@Column(name="GRAVAME_ALIENACAO")
	private String gravameAlienacao;

	@Column(name="NRO_PLACA")
	private String nroPlaca;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="MODELO_VEICULO_ID")
	private VeiculoModelo modeloVeiculo;

	@ManyToOne(fetch=FetchType.EAGER)
	private Seguradora seguradora;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="TIPO_FRANQUIA_ID")
	private DominioEsp tipoFranquia;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CATEGORIA_VEICULO_ID")
	private DominioEsp categoriaVeiculo;
	
	@Transient
	private Proposta proposta;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="TIPO_COMBUSTIVEL_ID")
	private DominioEsp tipoCombustivel;

	@Column(name="TIPO_INDENIZACAO")
	private String tipoIndenizacao;

	private String categoria;

	@Column(name="COBERTURA_CASCO")
	private String coberturaCasco;

	@Column(name="VALOR_CASCO")
	private Double valorCasco;

	@Column(name="PERCENTUAL_REFERENCIADO")
	private Double percentualReferenciado;

	private Double premio;

	private Double franquia;
	
	@Column(name="NUMERO_ITEM")
	private Integer numeroItem;

	@Column(name="is_excluido")
	private Boolean isExcluido;

	@Column(name="data_inclusao")
	private Timestamp dataInclusao;

	@Column(name="data_alteracao")
	private Timestamp dataAlteracao;

	@Column(name="data_exclusao")
	private Timestamp dataExclusao;

	@ManyToOne
	@JoinColumn(name="usuario_Inclusao_id")
	private Usuario usuarioInclusao;
	
	@Column(name="modelo_nome")
	private String modeloNome;

	@ManyToOne
	@JoinColumn(name="usuario_Exclusao_id")
	private Usuario usuarioExclusao;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="automovel", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<AutomovelCobertura> automovelCoberturaCollection = new ArrayList<AutomovelCobertura>();

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="automovel", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<AutomovelServicos> automovelServicosCollection = new ArrayList<AutomovelServicos>();

	@OneToMany(cascade=CascadeType.ALL,mappedBy="automovel", fetch = LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	private List<AutomovelAcessorios> automovelAcessoriosCollection = new ArrayList<AutomovelAcessorios>();
	
	@ManyToOne
	@JoinColumn(name="fabricante_id")
	private Fabricante fabricante;

	@ManyToOne
	private Usuario usuario;
	
	@OneToMany(cascade={CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE},mappedBy="automovel", fetch=LAZY)
	private List<PropostaAutomovel> propostaAutomovelCollection = new ArrayList<PropostaAutomovel>();
	

	/**===========================================================================================================================**/
	/**============================================Atributos do AutomovelOrcamento================================================**/
	/**===========================================================================================================================**/
	
	@Column(name="is_apolice_cancelada")
	private Boolean isApoliceCancelada;

	private String motivo;

	@Column(name="qtdsinistro")
	private Integer qtdSinistro;

	private String observacao;

	@Column(name="is_zero_km")
	private Boolean isZeroKm;

	@Column(name="is_segurado_proprietario")
	private Boolean isSeguradoProprietario;

	@Column(name="is_kit_gas")
	private Boolean isKitGas;

	@ManyToOne
	@JoinColumn(name="tipo_financiamento_id")
	private DominioEsp tipoFinanciamento;

	@Column(name="nome_banco")
	private String nomeBanco;

	@Column(name="cnpj_banco")
	private String cnpjBanco;

	@ManyToOne
	@JoinColumn(name="uso_veiculo_id")
	private DominioEsp usoVeiculo;

	@Column(name="lmi_normal")
	private Double lmiNormal;

	@Column(name="lmi_reduzido")
	private Double lmiReduzido;

	@OneToMany(cascade = CascadeType.ALL, mappedBy="automovel", fetch=FetchType.LAZY)
	private List<AutomovelPropAcessorios> automovelPropAcessoriosCollection = new ArrayList<AutomovelPropAcessorios>();

	@OneToMany(mappedBy="automovel")
	private List<AutomovelProprietario> automovelProprietarioCollection = new ArrayList<AutomovelProprietario>();

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="proprietario_arrendatario_id")
	private ProprietarioArrendatario proprietarioArrendatario;
	
	@ManyToOne
	@JoinColumn(name="rastreador_iseg_id")
	private RastreadorIseg rastreadorIseg;
	
	@ManyToOne
	@JoinColumn(name="bloqueador_iseg_id")
	private BloqueadorIseg bloqueadorIseg;
	
	@Column(name="outro_rastreador")
	private String outroRastreador;
	
	@Column(name="outro_bloqueador")
	private String outroBloqueador;
	
	@Column(name="eixos")
	private Integer eixos;
	
	@Column(name="qtd_portas")
	private Integer qtdPortas;
	
	@Column(name="data_saida")
	private Date dataSaida;
	
	@ManyToOne
	@JoinColumn(name="carroceria_iseg_id")
	private CarroceriaIseg carroceriaIseg;
	
	@ManyToOne
	@JoinColumn(name="semireboque_iseg_id")
	private SemireboqueIseg semireboqueIseg;
	
	@ManyToOne
	@JoinColumn(name="carga_iseg_id")
	private CargaIseg cargaIseg;
	
	@ManyToOne
	@JoinColumn(name="tipo_veiculo_id")
	private TipoVeiculo tipoVeiculo;

	private static final long serialVersionUID = 1L;

	public Automovel() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodigoIdentificacao() {
		return this.codigoIdentificacao;
	}

	public void setCodigoIdentificacao(String codigoIdentificacao) {
		this.codigoIdentificacao = codigoIdentificacao;
	}

	public String getAnoFabricacao() {
		return this.anoFabricacao;
	}

	public void setAnoFabricacao(String anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}

	public String getPossuiAntiFurto() {
		return this.possuiAntiFurto;
	}

	public void setPossuiAntiFurto(String possuiAntiFurto) {
		this.possuiAntiFurto = possuiAntiFurto;
	}

	public String getRenovacao() {
		return this.renovacao;
	}

	public void setRenovacao(String renovacao) {
		this.renovacao = renovacao;
	}

	public String getNroNf() {
		return this.nroNf;
	}

	public void setNroNf(String nroNf) {
		this.nroNf = nroNf;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getIniVigApoliceAnterior() {
		return this.iniVigApoliceAnterior;
	}

	public void setIniVigApoliceAnterior(Date iniVigApoliceAnterior) {
		this.iniVigApoliceAnterior = iniVigApoliceAnterior;
	}

	public String getNroChassis() {
		return this.nroChassis;
	}

	public Boolean getLinhaVazia() {
		return linhaVazia;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
	}

	public void setNroChassis(String nroChassis) {
		this.nroChassis = nroChassis;
	}

	public String getCodigoFipe() {
		return this.codigoFipe;
	}

	public void setCodigoFipe(String codigoFipe) {
		this.codigoFipe = codigoFipe;
	}

	public CEP getCepCirculacao() {
		return this.cepCirculacao;
	}

	public void setCepCirculacao(CEP cepCirculacao) {
		this.cepCirculacao = cepCirculacao;
	}

	public String getRegiaoTarifacao() {
		return this.regiaoTarifacao;
	}

	public void setRegiaoTarifacao(String regiaoTarifacao) {
		this.regiaoTarifacao = regiaoTarifacao;
	}

	public String getTerceiroEixo() {
		return this.terceiroEixo;
	}

	public void setTerceiroEixo(String terceiroEixo) {
		this.terceiroEixo = terceiroEixo;
	}

	public String getAnoModelo() {
		return this.anoModelo;
	}

	public void setAnoModelo(String anoModelo) {
		this.anoModelo = anoModelo;
	}

	public String getRastreamentoSatelite() {
		return this.rastreamentoSatelite;
	}

	public void setRastreamentoSatelite(String rastreamentoSatelite) {
		this.rastreamentoSatelite = rastreamentoSatelite;
	}

	public String getNroApoliceAnterior() {
		return this.nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public Long getQtdePortas() {
		return this.qtdePortas;
	}

	public void setQtdePortas(Long qtdePortas) {
		this.qtdePortas = qtdePortas;
	}

	public String getNomeProprietario() {
		return this.nomeProprietario;
	}

	public void setNomeProprietario(String nomeProprietario) {
		this.nomeProprietario = nomeProprietario;
	}

	public Date getFimVigApoliceAnterior() {
		return this.fimVigApoliceAnterior;
	}

	public void setFimVigApoliceAnterior(Date fimVigApoliceAnterior) {
		this.fimVigApoliceAnterior = fimVigApoliceAnterior;
	}

	public String getCapacidade() {
		return this.capacidade;
	}

	public void setCapacidade(String capacidade) {
		this.capacidade = capacidade;
	}

	public String getRenavan() {
		return this.renavan;
	}

	public void setRenavan(String renavan) {
		this.renavan = renavan;
	}

	public CEP getCepPernoite() {
		return this.cepPernoite;
	}

	public void setCepPernoite(CEP cepPernoite) {
		this.cepPernoite = cepPernoite;
	}

	public String getClasseBonus() {
		return this.classeBonus;
	}

	public void setClasseBonus(String classeBonus) {
		this.classeBonus = classeBonus;
	}

	public String getCorPredominante() {
		return this.corPredominante;
	}

	public void setCorPredominante(String corPredominante) {
		this.corPredominante = corPredominante;
	}

	public String getZeroKm() {
		return this.zeroKm;
	}

	public void setZeroKm(String zeroKm) {
		this.zeroKm = zeroKm;
	}

	public String getGravameAlienacao() {
		return this.gravameAlienacao;
	}

	public void setGravameAlienacao(String gravameAlienacao) {
		this.gravameAlienacao = gravameAlienacao;
	}

	public String getNroPlaca() {
		return this.nroPlaca;
	}

	public void setNroPlaca(String nroPlaca) {
		this.nroPlaca = nroPlaca;
	}

	public VeiculoModelo getModeloVeiculo() {
		return this.modeloVeiculo;
	}

	public void setModeloVeiculo(VeiculoModelo modeloVeiculo) {
		this.modeloVeiculo = modeloVeiculo;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public DominioEsp getTipoFranquia() {
		return this.tipoFranquia;
	}

	public void setTipoFranquia(DominioEsp tipoFranquia) {
		this.tipoFranquia = tipoFranquia;
	}

	public DominioEsp getCategoriaVeiculo() {
		return this.categoriaVeiculo;
	}

	public void setCategoriaVeiculo(DominioEsp categoriaVeiculo) {
		this.categoriaVeiculo = categoriaVeiculo;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public DominioEsp getTipoCombustivel() {
		return this.tipoCombustivel;
	}

	public void setTipoCombustivel(DominioEsp tipoCombustivel) {
		this.tipoCombustivel = tipoCombustivel;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public List<AutomovelAcessorios> getAutomovelAcessoriosCollection() {
		return this.automovelAcessoriosCollection;
	}

	public void setAutomovelAcessoriosCollection(List<AutomovelAcessorios> automovelAcessoriosCollection) {
		this.automovelAcessoriosCollection = automovelAcessoriosCollection;
	}

	/** 
	 */
	public List<AutomovelCobertura> getAutomovelCoberturaCollection() {
		return this.automovelCoberturaCollection;
	}

	/** 
	 */
	public void setAutomovelCoberturaCollection(
			List<AutomovelCobertura> automovelCoberturaCollection) {
		this.automovelCoberturaCollection = automovelCoberturaCollection;
	}

	/** 
	 */
	public List<AutomovelServicos> getAutomovelServicosCollection() {
		return this.automovelServicosCollection;
	}

	/** 
	 */
	public void setAutomovelServicosCollection(
			List<AutomovelServicos> automovelServicosCollection) {
		this.automovelServicosCollection = automovelServicosCollection;
	}

	public String getTipoIndenizacao() {
		return tipoIndenizacao;
	}

	public void setTipoIndenizacao(String tipoIndenizacao) {
		this.tipoIndenizacao = tipoIndenizacao;
	}

	public String getCoberturaCasco() {
		return coberturaCasco;
	}

	public void setCoberturaCasco(String coberturaCasco) {
		this.coberturaCasco = coberturaCasco;
	}

	public Double getValorCasco() {
		return valorCasco;
	}

	public void setValorCasco(Double valorCasco) {
		this.valorCasco = valorCasco;
	}

	public Double getPercentualReferenciado() {
		return percentualReferenciado;
	}

	public void setPercentualReferenciado(Double percentualReferenciado) {
		this.percentualReferenciado = percentualReferenciado;
	}

	public Double getPremio() {
		return premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public Double getFranquia() {
		return franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public String getCodigoIdentificacaoAnterior() {
		return codigoIdentificacaoAnterior;
	}

	public void setCodigoIdentificacaoAnterior(String codigoIdentificacaoAnterior) {
		this.codigoIdentificacaoAnterior = codigoIdentificacaoAnterior;
	}

	public Integer getNumeroItem() {
		return numeroItem;
	}

	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}

	public PObject getRoot() {
		return this.proposta;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Boolean getIsApoliceCancelada() {
		return isApoliceCancelada;
	}

	public void setIsApoliceCancelada(Boolean isApoliceCancelada) {
		this.isApoliceCancelada = isApoliceCancelada;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public Integer getQtdSinistro() {
		return qtdSinistro;
	}

	public void setQtdSinistro(Integer qtdSinistro) {
		this.qtdSinistro = qtdSinistro;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Boolean getIsZeroKm() {
		return isZeroKm;
	}

	public void setIsZeroKm(Boolean isZeroKm) {
		this.isZeroKm = isZeroKm;
	}

	public Boolean getIsSeguradoProprietario() {
		return isSeguradoProprietario;
	}

	public void setIsSeguradoProprietario(Boolean isSeguradoProprietario) {
		this.isSeguradoProprietario = isSeguradoProprietario;
	}

	public Boolean getIsKitGas() {
		return isKitGas;
	}

	public void setIsKitGas(Boolean isKitGas) {
		this.isKitGas = isKitGas;
	}

	public DominioEsp getTipoFinanciamento() {
		return tipoFinanciamento;
	}

	public void setTipoFinanciamento(DominioEsp tipoFinanciamento) {
		this.tipoFinanciamento = tipoFinanciamento;
	}

	public String getNomeBanco() {
		return nomeBanco;
	}

	public void setNomeBanco(String nomeBanco) {
		this.nomeBanco = nomeBanco;
	}

	public String getCnpjBanco() {
		return cnpjBanco;
	}

	public void setCnpjBanco(String cnpjBanco) {
		this.cnpjBanco = cnpjBanco;
	}

	public DominioEsp getUsoVeiculo() {
		return usoVeiculo;
	}

	public void setUsoVeiculo(DominioEsp usoVeiculo) {
		this.usoVeiculo = usoVeiculo;
	}

	public Double getLmiNormal() {
		return lmiNormal;
	}

	public void setLmiNormal(Double lmiNormal) {
		this.lmiNormal = lmiNormal;
	}

	public Double getLmiReduzido() {
		return lmiReduzido;
	}

	public void setLmiReduzido(Double lmiReduzido) {
		this.lmiReduzido = lmiReduzido;
	}

	public List<AutomovelPropAcessorios> getAutomovelPropAcessoriosCollection() {
		return automovelPropAcessoriosCollection;
	}

	public void setAutomovelPropAcessoriosCollection(
			List<AutomovelPropAcessorios> automovelPropAcessoriosCollection) {
		this.automovelPropAcessoriosCollection = automovelPropAcessoriosCollection;
	}

	public List<AutomovelProprietario> getAutomovelProprietarioCollection() {
		return automovelProprietarioCollection;
	}

	public void setAutomovelProprietarioCollection(
			List<AutomovelProprietario> automovelProprietarioCollection) {
		this.automovelProprietarioCollection = automovelProprietarioCollection;
	}

	public ProprietarioArrendatario getProprietarioArrendatario() {
		return proprietarioArrendatario;
	}

	public void setProprietarioArrendatario(
			ProprietarioArrendatario proprietarioArrendatario) {
		this.proprietarioArrendatario = proprietarioArrendatario;
	}

	public Boolean getIsExcluido() {
		return isExcluido;
	}

	public void setIsExcluido(Boolean isExcluido) {
		this.isExcluido = isExcluido;
	}

	public Timestamp getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Timestamp dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Timestamp getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Timestamp dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public Timestamp getDataExclusao() {
		return dataExclusao;
	}

	public void setDataExclusao(Timestamp dataExclusao) {
		this.dataExclusao = dataExclusao;
	}

	public Usuario getUsuarioInclusao() {
		return usuarioInclusao;
	}

	public void setUsuarioInclusao(Usuario usuarioInclusao) {
		this.usuarioInclusao = usuarioInclusao;
	}

	public Usuario getUsuarioExclusao() {
		return usuarioExclusao;
	}

	public void setUsuarioExclusao(Usuario usuarioExclusao) {
		this.usuarioExclusao = usuarioExclusao;
	}

	public RastreadorIseg getRastreadorIseg() {
		return rastreadorIseg;
	}

	public void setRastreadorIseg(RastreadorIseg rastreadorIseg) {
		this.rastreadorIseg = rastreadorIseg;
	}

	public BloqueadorIseg getBloqueadorIseg() {
		return bloqueadorIseg;
	}

	public void setBloqueadorIseg(BloqueadorIseg bloqueadorIseg) {
		this.bloqueadorIseg = bloqueadorIseg;
	}

	public String getOutroRastreador() {
		return outroRastreador;
	}

	public void setOutroRastreador(String outroRastreador) {
		this.outroRastreador = outroRastreador;
	}

	public String getOutroBloqueador() {
		return outroBloqueador;
	}

	public void setOutroBloqueador(String outroBloqueador) {
		this.outroBloqueador = outroBloqueador;
	}

	public CarroceriaIseg getCarroceriaIseg() {
		return carroceriaIseg;
	}

	public void setCarroceriaIseg(CarroceriaIseg carroceriaIseg) {
		this.carroceriaIseg = carroceriaIseg;
	}

	public SemireboqueIseg getSemireboqueIseg() {
		return semireboqueIseg;
	}

	public void setSemireboqueIseg(SemireboqueIseg semireboqueIseg) {
		this.semireboqueIseg = semireboqueIseg;
	}

	public TipoVeiculo getTipoVeiculo() {
		return tipoVeiculo;
	}

	public void setTipoVeiculo(TipoVeiculo tipoVeiculo) {
		this.tipoVeiculo = tipoVeiculo;
	}

	public Integer getEixos() {
		return eixos;
	}

	public void setEixos(Integer eixos) {
		this.eixos = eixos;
	}

	public Integer getQtdPortas() {
		return qtdPortas;
	}

	public void setQtdPortas(Integer qtdPortas) {
		this.qtdPortas = qtdPortas;
	}

	public CargaIseg getCargaIseg() {
		return cargaIseg;
	}

	public void setCargaIseg(CargaIseg cargaIseg) {
		this.cargaIseg = cargaIseg;
	}

	public Date getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

	public String getModeloNome() {
		return modeloNome;
	}

	public void setModeloNome(String modeloNome) {
		this.modeloNome = modeloNome;
	}

	public Fabricante getFabricante() {
		return fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

	public List<PropostaAutomovel> getPropostaAutomovelCollection() {
		return propostaAutomovelCollection;
	}

	public void setPropostaAutomovelCollection(
			List<PropostaAutomovel> propostaAutomovelCollection) {
		this.propostaAutomovelCollection = propostaAutomovelCollection;
	}
	
}