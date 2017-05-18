package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.LAZY;
import iseg.app.conversion.CpfCnpj;
import iseg.app.model.listeners.PropostaListener;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;
import org.hibernate.annotations.Where;


@Entity
@EntityListeners({PropostaListener.class})
@Table(name = "proposta")
@SequenceGenerator(name="seq_proposta", sequenceName = "seq_proposta")
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="((:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or corretora_id = :corretoraParam  or is_generic='true')")    
@NamedQueries({
	@NamedQuery(name="updateSituacaoOperacionalProposta", query="UPDATE Proposta set situacaoOperacional = ?0 where id = ?1 "),
	@NamedQuery(name="updateSituacaoOperacionalPropostaPrincipal", query="UPDATE Proposta p set p.situacaoOperacional = ?0 where p.propostaOriginal.id = ?1 and p.id <> ?2"),
	@NamedQuery(name="getCountProposta", query="SELECT Count(*) FROM Proposta p"),
	@NamedQuery(name="getCountPedidoDeEndosso", query="SELECT Count(*) FROM Proposta p where p.propostaOriginal.id = ?0 and p.statusOperacional in (5,8)"),
	@NamedQuery(name="getProposta", query="SELECT p FROM Proposta p ORDER BY p.numero"),
	@NamedQuery(name="getPropostaById", query="SELECT p FROM Proposta p WHERE p.id = ?0"),
	@NamedQuery(name="getPropostaOrdered", query="SELECT p FROM Proposta p ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByTerminoVigencia", query = "SELECT p FROM Proposta p WHERE p.terminoVigencia = :terminoVigencia ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByDataProposta", query = "SELECT p FROM Proposta p WHERE p.dataProposta = :dataProposta ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByInicioVigencia", query = "SELECT p FROM Proposta p WHERE p.inicioVigencia = :inicioVigencia ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByDataEmissaoApolice", query = "SELECT p FROM Proposta p WHERE p.dataEmissaoApolice = :dataEmissaoApolice ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByStatusOperacional", query = "SELECT p FROM Proposta p WHERE p.statusOperacional = :statusOperacional ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByDataVencim1aParcela", query = "SELECT p FROM Proposta p WHERE p.dataVencim1aParcela = :dataVencim1aParcela ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByNroApolice", query = "SELECT p FROM Proposta p WHERE p.nroApolice = :nroApolice ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByNroApolice2", query = "SELECT p FROM Proposta p WHERE p.nroApolice = ?0 ORDER BY p.numero desc"),
	@NamedQuery(name="getPropostaByNroEndosso", query = "SELECT p FROM Proposta p WHERE p.nroEndosso = ?0 ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByTipoLancamento", query = "SELECT p FROM Proposta p WHERE p.tipoLancamento = :tipoLancamento ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByPropostaOriginal", query = "SELECT p FROM Proposta p WHERE p.propostaOriginal.id = ?0 and p.statusOperacional <> 4 ORDER BY p.numero desc"),
	@NamedQuery(name="getPropostaByNroPropostaSeg", query = "SELECT p FROM Proposta p WHERE p.nroPropostaSeg = :nroPropostaSeg ORDER BY p.numero"),
	@NamedQuery(name="getPropostaByClienteNome", query = "SELECT p FROM Proposta p WHERE p.cliente.nome like ?0 ORDER BY p.numero desc"),
	@NamedQuery(name="getPropostaByClienteCpfOuCnpj", query = "SELECT p FROM Proposta p WHERE p.cliente.cpfOuCnpj = ?0 ORDER BY p.numero desc"),
	@NamedQuery(name="getPropostaByNroPropostaSeg2", query = "SELECT p FROM Proposta p WHERE p.nroPropostaSeg = ?0 ORDER BY p.numero desc")})

	//@NamedQuery(name="getPropostaByParams", query = "SELECT p FROM Proposta p left join p.automovelCollection a WHERE p.dataProposta = ?0 and p.nroPropostaSeg = ?1"),
public class Proposta extends PObject implements Serializable, AtributoCorretora, Auditable, AtributoUsuario {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_proposta")
	private Long id;

	private Long numero;

	@Column(name="CUSTO_APOLICE")
	private Double custoApolice;

	@Column(name="INICIO_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date inicioVigencia;

	@Column(name="TERMINO_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date terminoVigencia;

	@Column(name="INICIO_1A_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date inicio1aVigencia;

	@Column(name="TERMINO_1A_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date termino1aVigencia;

	@Column(name="DATA_PROPOSTA")
	@Temporal(TemporalType.DATE)
	private Date dataProposta;

	private Double desconto;

	@Column(name="PREMIO_LIQUIDO")
	private Double premioLiquido;

	@Column(name="CHEQUE_NOMINAL")
	private String chequeNominal;

	@Column(name="PREMIO_TOTAL")
	private Double premioTotal;

	@Column(name="VALOR_COMISSAO")
	private Double valorComissao;

	@Column(name="DATA_EMISSAO_APOLICE")
	@Temporal(TemporalType.DATE)
	private Date dataEmissaoApolice;

	@Column(name="taxa_total_segurado")
	private Double taxaTotalSegurado;
	
	@Column(name="premio_minimo")
	private Double premioMinimo;

	@Column(name="valor_transportado")
	private Double valorTransportado;
	
	@Column(name="taxa_fatura_atual")
	private Double taxaFaturaAtual;

	@Column(name="STATUS_OPERACIONAL")
	private Long statusOperacional;

	@Column(name="SITUACAO_OPERACIONAL")
	private Long situacaoOperacional;

	private Double iof;

	private Double fator;

	@Column(name="NRO_FATURA")
	private String nroFatura;

	@Column(name="DATA_VENCIM_1A_PARCELA")
	@Temporal(TemporalType.DATE)
	private Date dataVencim1aParcela;

	@Column(name="VALOR_1A_PARCELA")
	private Double valor1aParcela;

	@Column(name="VALOR_DEMAIS_PARCELAS")
	private Double valorDemaisParcelas;
	
	@Column(name="NRO_PARCELA_ATUAL")
	private Integer parcelaAtual;

	@Column(name="NRO_APOLICE")
	private String nroApolice;

	@Temporal(TemporalType.DATE)
	@Column(name="referencia_parcela")
	private Date referenciaParcela;

	@Column(name="data_lancto_apolice")
	@Temporal(TemporalType.DATE)
	private Date dataLanctoApolice;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_lancto_apolice_id")
	private Usuario usuarioLanctoApolice;
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_baixa_apolice_id")
	private Usuario usuarioBaixaApolice;
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_receb_apolice_id")
	private Usuario usuarioRecebApolice;
	
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_lancto_endosso_id")
	private Usuario usuarioLanctoEndosso;
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_baixa_endosso_id")
	private Usuario usuarioBaixaEndosso;
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_receb_endosso_id")
	private Usuario usuarioRecebEndosso;

	@Column(name="data_baixa_apolice")
	@Temporal(TemporalType.DATE)
	private Date dataBaixaApolice;

	@Column(name="data_receb_apolice")
	@Temporal(TemporalType.DATE)
	private Date dataRecebApolice;

	@Column(name="data_lancto_endosso")
	@Temporal(TemporalType.DATE)
	private Date dataLanctoEndosso;

	@Column(name="data_baixa_endosso")
	@Temporal(TemporalType.DATE)
	private Date dataBaixaEndosso;

	@Column(name="data_receb_endosso")
	@Temporal(TemporalType.DATE)
	private Date dataRecebEndosso;

	@Column(name="TIPO_LANCAMENTO")
	private String tipoLancamento;

	private Long adicional;

	@Column(name="OBSERVACOES")
	private String observacoes;

	@Column(name="CLAUSULA_SEGURO")
	private String clausulaSeguro;

	@Column(name="NRO_PROPOSTA_SEG")
	private String nroPropostaSeg;

	@OneToOne
	@JoinColumn(name="ORCAMENTO_SEGURO_ID")
	private OrcamentoSeguro orcamentoSeguro;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PROPOSTA_INICIAL_ID")
	private Proposta propostaInicial;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PROPOSTA_ENDOSSADA_ID")
	private Proposta propostaEndossada;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PROPOSTA_ORIGINAL_ID")
	private Proposta propostaOriginal;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PROPOSTA_RENOVADA_ID")
	private Proposta propostaRenovada;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="TIPO_ENDOSSO_ID")
	private Endosso tipoEndosso;

	@ManyToOne(fetch=LAZY)
	private Vistoriadora vistoriadora;

	@Column(name="DATA_VISTORIA")
	@Temporal(TemporalType.DATE)
	private Date dataVistoria;

	@Column(name="NOME_VISTORIADORA")
	private String nomeVistoriadora;

	@Column(name="NOME_VISTORIADOR")
	private String nomeVistoriador;

	@Column(name="NRO_VISTORIA")
	private String nroVistoria;

	@ManyToOne(fetch=FetchType.LAZY)
	private Corretora corretora;

	@ManyToOne(fetch=FetchType.LAZY)
	private Seguradora seguradora;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="GRUPO_DE_VENDA_ID", referencedColumnName = "ID")
	private GrupoDeVenda grupoDeVenda;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="CLIENTE_ID", referencedColumnName = "ID")
	private Pessoa cliente;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="ESTIPULANTE_ID", referencedColumnName = "ID")
	private Pessoa estipulante;

	@Column(name="CLIENTE_NOME")
	private String clienteNome;
	
	@Column(name="sms_encaminhado")
	private String smsEncaminhado;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF_OU_CNPJ"))
	private CpfCnpj cpfOuCnpj;

	@ManyToOne(fetch=FetchType.LAZY)
	private Usuario usuario;

	@ManyToOne(fetch=FetchType.LAZY)
	private Produtor produtor;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="CONDICAO_PAGAMENTO_ID")
	private CondicaoPagamento condicaoPagamento;

	@Column(name="FORMA_PAGAMENTO")
	private Long formaPagamento;

	@Column(name="FORMA_PAGAMENTO_1A_PARCELA")
	private Long formaPagamento1aParcela;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="RAMO_ID", referencedColumnName = "ID")
	private Ramo ramo;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="TIPO_SEGURO_ID", referencedColumnName = "ID")
	private DominioEsp tipoSeguro;

	@Column(name="NRO_BANCO")
	private Long nroBanco;

	@Column(name="CODIGO_AGENCIA")
	private String codigoAgencia;

	@Column(name="CONTA_CORRENTE")
	private Long contaCorrente;

	@Column(name="CONTA_DIGITO")
	private String contaDigito;

	@Column(name="TITULAR_CCORRENTE")
	private String titularCcorrente;

	@Column(name="CLI_CONDUTOR_PRINCIPAL")
	private String cliCondutorPrincipal;

	@Column(name="QTDE_PARCELAS")
	private Long qtdeParcelas;
	
	@Column(name="TIPO_PROPOSTA")
	private Long tipoProposta;

	@Column(name="NRO_INCLUSOES")
	private Integer nroInclusoes; // para uso no vida empresarial

	@Column(name="VALOR_INCLUSOES")
	private Double valorInclusoes; // para uso no vida empresarial

	@Column(name="PERCENTUAL_AGENCIAMENTO")
	private Double percentualAgenciamento;
	
	@Column(name="VALOR_AGENCIAMENTO")
	private Double valorAgenciamento;

	@Column(name="QTDE_PARCELAS_AGENCIAMENTO")
	private Integer qtdeParcelasAgenciamento;

	@Column(name="POSSUI_AGENCIAMENTO")
	private Boolean possuiAgenciamento;
	
	@Column(name="AGENCIAMENTO_COM_COMISSAO")
	private Boolean agenciamentoComComissao;
	
	@Column(name="POSSUI_PERFIL")
	private Boolean blnPossuiPerfil;
	
	@Column(name="DATA_TRANSMISSAO")
	@Temporal(TemporalType.DATE)
	private Date dataTransmissao;

	@Column(name="DATA_GERACAO")
	@Temporal(TemporalType.DATE)
	private Date dataGeracao;
	
	@Column(name="CODIGO_IDENTIFICACAO")
	private String codigoIdentificacao;

	@Column(name="OBS_ENDOSSO")
	private String obsEndosso;

	@Column(name="NRO_ENDOSSO")
	private String nroEndosso;

	@Column(name="DATA_ENDOSSO")
	@Temporal(TemporalType.DATE)
	private Date dataEndosso;
	
	@Column(name="IS_GENERIC")
	private Boolean isGeneric;

	@Column(name="IS_FATURA", columnDefinition="default false")
	private Boolean isFatura;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="AUTOR_GERACAO", referencedColumnName = "ID")
	private Pessoa autorGeracao;

	@ManyToOne(fetch=LAZY)
	private Perfil perfil;
	
	@Column(name="observacoes_complementares")
	private String observacoesComplementares;

	// Antecipado, no fluxo ou parcelado...(ver classe Constants)
	@Column(name="RECEBER_COMISSAO")
	private Long tipoRecebimentoComissao;

	// Se o Tipo de Recebimento da Comissão for parcelado, indica o número de parcelas.
	@Column(name="PARC_RECEBER_COMISSAO")
	private Long quantParcelasComissao;

	// Se o Tipo de Recebimento da Comissão for no fluxo, indica se irá descontar o Custo da Apólice e o IOF.
	@Column(name="DESC_CAPOLICE_IOF")
	private Boolean descontaCustoApoliceIof;

	@Column(name="RENOVACAO_AUTOMATICA")
	private Boolean renovacaoAutomatica;
	
	private Integer versao;

	@OneToMany(mappedBy="proposta", fetch = LAZY, cascade = { REMOVE, REFRESH })
	@OrderBy("nroDaParcela")
	private List<PropostaComissao> propostaComissaoCollection = new ArrayList<PropostaComissao>();

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="proposta", fetch=FetchType.LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "TIPO_ENDERECO desc")
	private List<PropostaEndereco> propostaEnderecoCollection = new ArrayList<PropostaEndereco>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("isCondutorPrincipal ASC")
	private List<Condutor>condutorCollection = new ArrayList<Condutor>();

	@Transient
	private List<VidaEmpresarial> vidaEmpresarialCollection;

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<RiscoDiversos> riscoDiversosCollection= new ArrayList<RiscoDiversos>();

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="proposta", fetch=FetchType.LAZY)
	private List<RiscoTransportes> riscoTransportesCollection= new ArrayList<RiscoTransportes>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<Imovel> imovelCollection = new ArrayList<Imovel>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("nroParcela asc, referenciaParcela asc")
	private List<ParcelasProposta> parcelasPropostaCollection = new ArrayList<ParcelasProposta>();

	@OneToMany(mappedBy="proposta", fetch=FetchType.LAZY)
	@Where(clause="situacao < 3")
	private List<ComissionadoProposta> comissionadoPropostaCollection = new ArrayList<ComissionadoProposta>();

	@OneToMany(mappedBy="proposta", fetch=FetchType.LAZY)
	private List<ComissionadoAgenciamento> comissionadoAgenciamentoCollection = new ArrayList<ComissionadoAgenciamento>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	private List<Agenciamento> agenciamentoCollection = new ArrayList<Agenciamento>();

	@OneToMany(mappedBy="proposta", fetch=FetchType.LAZY, cascade = { REMOVE, REFRESH })
	private List<Sinistro> sinistroCollection = new ArrayList<Sinistro>();

	@OneToMany(mappedBy="proposta", fetch=FetchType.LAZY, cascade = { REMOVE, REFRESH })
	private List<PropostaAnexo> propostaAnexoCollection = new ArrayList<PropostaAnexo>();
	
	@Transient
	private List<VidaIndividual> vidaIndividualCollection;

	@OneToMany(mappedBy="propostaEndossada", fetch = LAZY)
	private List<Proposta> propostaCollection;

	@OneToMany(mappedBy="propostaOriginal", cascade = { REMOVE, REFRESH }, fetch=FetchType.LAZY)
	@org.hibernate.annotations.OrderBy(clause = "INICIO_VIGENCIA")
	private List<Proposta> endossoCollection;

	@OneToMany(mappedBy="propostaRenovada", cascade = { REMOVE, REFRESH }, fetch=FetchType.LAZY)
	private List<Proposta> renovacaoCollection;

	@OneToMany(mappedBy="propostaInicial", cascade = { REMOVE, REFRESH }, fetch=FetchType.LAZY)
	@org.hibernate.annotations.OrderBy(clause = "numero")
	private List<Proposta> propostaHistoricoCollection;
	
	@OneToMany(mappedBy="proposta", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<PropostaBancos> propostaBancosCollection = new ArrayList<PropostaBancos>();

	/*
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	private List<Automovel> automovelCollection = new ArrayList<Automovel>();
	*/

//	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
//	@OrderBy("numeroItem asc")
	@Transient
	private List<Automovel> automovelWizCollection = new ArrayList<Automovel>();
	
	@OneToMany(mappedBy="proposta", fetch=FetchType.LAZY)
	@Where(clause = "data_exclusao is null")
	@OrderBy("numeroItem asc")
	private List<PropostaAutomovel> propostaAutomovelCollection = new ArrayList<PropostaAutomovel>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<SeguradoEmpresarial> seguradoEmpresarialCollection = new ArrayList<SeguradoEmpresarial>();

	@OneToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="proposta", fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<SeguradoIndividual> seguradoIndividualCollection = new ArrayList<SeguradoIndividual>();

	@Transient
	private List<Historico> historicoCollection;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="proposta", fetch=FetchType.LAZY)
	//@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@OrderBy("ordem asc")
	private List<RespostaPerfil> respostaPerfilCollection = new ArrayList<RespostaPerfil>();

	@OneToMany(mappedBy="proposta", cascade = REMOVE, fetch=FetchType.LAZY)
	private List<BorderoLancamento> borderoLancamentoCollection = new ArrayList<BorderoLancamento>();
	
	@OneToMany(mappedBy="proposta", cascade = REMOVE, fetch=FetchType.LAZY)
	private List<PosVenda> posVendaCollection = new ArrayList<PosVenda>();
	
	@OneToMany(mappedBy="proposta", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private List<PerfilProposta> perfilPropostaCollection = new ArrayList<PerfilProposta>();

	public static Double IOF_PERCENTUAL = 7.38;
	
	@Column(name="CALCULAR_IOF")
	private Boolean calcularIof;
	
	@Column(name="is_frota")
	private Boolean isFrota;

	public Proposta() {
		super();
	}

	public Proposta(Long id, Long numero, Date inicioVigencia, Date terminoVigencia,
			String clienteNome, CpfCnpj cpfOuCnpj, Ramo ramo, Long statusOperacional, Long situacaoOperacional) {
		super();
		this.id = id;
		this.numero = numero;
		this.clienteNome = clienteNome;
		this.cpfOuCnpj = cpfOuCnpj;
		this.inicioVigencia = inicioVigencia;
		this.terminoVigencia = terminoVigencia;
		this.statusOperacional = statusOperacional;
		this.situacaoOperacional = situacaoOperacional;
		this.ramo = ramo;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public Double getCustoApolice() {
		return this.custoApolice==null ? 0 : this.custoApolice;
	}

	public void setCustoApolice(Double custoApolice) {
		this.custoApolice = custoApolice;
	}

	public Date getTerminoVigencia() {
		return this.terminoVigencia;
	}

	public void setTerminoVigencia(Date terminoVigencia) {
		this.terminoVigencia = terminoVigencia;
	}

	public Date getDataProposta() {
		return this.dataProposta;
	}

	public void setDataProposta(Date dataProposta) {
		this.dataProposta = dataProposta;
	}

	public Double getDesconto() {
		return this.desconto==null ? 0 : this.desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}

	public Double getPremioLiquido() {
		return this.premioLiquido==null ? 0 : this.premioLiquido;
	}

	public void setPremioLiquido(Double premioLiquido) {
		this.premioLiquido = premioLiquido;
	}

	public Double getPremioTotal() {
		return this.premioTotal==null ? 0 : this.premioTotal;
	}

	public void setPremioTotal(Double premioTotal) {
		this.premioTotal = premioTotal;
	}

	public Double getValorComissao() {
		return this.valorComissao==null ? 0 : this.valorComissao;
	}

	public void setValorComissao(Double valorComissao) {
		this.valorComissao = valorComissao==null ? 0 : valorComissao;
	}

	public Date getInicioVigencia() {
		return this.inicioVigencia;
	}

	public void setInicioVigencia(Date inicioVigencia) {
		this.inicioVigencia = inicioVigencia;
	}

	public Date getDataEmissaoApolice() {
		return this.dataEmissaoApolice;
	}

	public void setDataEmissaoApolice(Date dataEmissaoApolice) {
		this.dataEmissaoApolice = dataEmissaoApolice;
	}

	public Long getStatusOperacional() {
		return this.statusOperacional;
	}

	public void setStatusOperacional(Long statusOperacional) {
		this.statusOperacional = statusOperacional;
	}

	public Double getIof() {
		return this.iof==null ? 0 : this.iof;
	}

	public List<SeguradoEmpresarial> getSeguradoEmpresarialCollection() {
		return seguradoEmpresarialCollection;
	}

	public void setSeguradoEmpresarialCollection(
			List<SeguradoEmpresarial> seguradoEmpresarialCollection) {
		this.seguradoEmpresarialCollection = seguradoEmpresarialCollection;
	}

	public void setIof(Double iof) {
		this.iof = iof;
	}

	public Date getDataVencim1aParcela() {
		return this.dataVencim1aParcela;
	}

	public void setDataVencim1aParcela(Date dataVencim1aParcela) {
		this.dataVencim1aParcela = dataVencim1aParcela;
	}

	public Double getValor1aParcela() {
		return this.valor1aParcela==null ? 0 : this.valor1aParcela;
	}

	public void setValor1aParcela(Double valor1aParcela) {
		this.valor1aParcela = valor1aParcela;
	}

	public Double getValorDemaisParcelas() {
		return valorDemaisParcelas == null ? 0 : this.valorDemaisParcelas;
	}

	public void setValorDemaisParcelas(Double valorDemaisParcelas) {
		this.valorDemaisParcelas = valorDemaisParcelas;
	}

	public String getNroApolice() {
		return this.nroApolice== null ? "" : this.nroApolice;
	}

	public void setNroApolice(String nroApolice) {
		this.nroApolice = nroApolice;
	}

	public String getTipoLancamento() {
		return this.tipoLancamento;
	}

	public void setTipoLancamento(String tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public Long getAdicional() {
		return this.adicional==null ? 0 : this.adicional;
	}

	public void setAdicional(Long adicional) {
		this.adicional = adicional;
	}

	public String getClausulaSeguro() {
		return this.clausulaSeguro;
	}

	public void setClausulaSeguro(String clausulaSeguro) {
		this.clausulaSeguro = clausulaSeguro;
	}

	public String getNroPropostaSeg() {
		return this.nroPropostaSeg;
	}

	public void setNroPropostaSeg(String nroPropostaSeg) {
		this.nroPropostaSeg = nroPropostaSeg;
	}

	public Proposta getPropostaEndossada() {
		return this.propostaEndossada;
	}

	public void setPropostaEndossada(Proposta propostaEndossada) {
		this.propostaEndossada = propostaEndossada;
	}

	public Corretora getCorretora() {
		return this.corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
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

	public Pessoa getCliente() {
		return this.cliente;
	}

	public void setCliente(Pessoa cliente) {
		this.cliente = cliente;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public CondicaoPagamento getCondicaoPagamento() {
		return this.condicaoPagamento;
	}

	public void setCondicaoPagamento(CondicaoPagamento condicaoPagamento) {
		this.condicaoPagamento = condicaoPagamento;
	}

	public Long getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(Long formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Long getFormaPagamento1aParcela() {
		return formaPagamento1aParcela;
	}

	public void setFormaPagamento1aParcela(Long formaPagamento1aParcela) {
		this.formaPagamento1aParcela = formaPagamento1aParcela;
	}

	public Ramo getRamo() {
		return this.ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Vistoriadora getVistoriadora() {
		return vistoriadora;
	}

	public void setVistoriadora(Vistoriadora vistoriadora) {
		this.vistoriadora = vistoriadora;
	}

	public Date getDataVistoria() {
		return dataVistoria;
	}

	public void setDataVistoria(Date dataVistoria) {
		this.dataVistoria = dataVistoria;
	}

	public String getNomeVistoriadora() {
		return nomeVistoriadora;
	}

	public void setNomeVistoriadora(String nomeVistoriadora) {
		this.nomeVistoriadora = nomeVistoriadora;
	}

	public String getNomeVistoriador() {
		return nomeVistoriador;
	}

	public void setNomeVistoriador(String nomeVistoriador) {
		this.nomeVistoriador = nomeVistoriador;
	}

	public String getNroVistoria() {
		return nroVistoria;
	}

	public void setNroVistoria(String nroVistoria) {
		this.nroVistoria = nroVistoria;
	}

	public DominioEsp getTipoSeguro() {
		return this.tipoSeguro;
	}

	public void setTipoSeguro(DominioEsp tipoSeguro) {
		this.tipoSeguro = tipoSeguro;
	}

	public Long getTipoRecebimentoComissao() {
		return tipoRecebimentoComissao;
	}

	public void setTipoRecebimentoComissao(Long tipoRecebimentoComissao) {
		this.tipoRecebimentoComissao = tipoRecebimentoComissao;
	}

	public Long getQtdeParcelas() {
		return qtdeParcelas;
	}

	public void setQtdeParcelas(Long qtdeParcelas) {
		this.qtdeParcelas = qtdeParcelas;
	}

	public Long getQuantParcelasComissao() {
		return quantParcelasComissao==null ? 1 : quantParcelasComissao;
	}

	public void setQuantParcelasComissao(Long quantParcelasComissao) {
		this.quantParcelasComissao = quantParcelasComissao==null ? 1 : quantParcelasComissao;
	}

	public Boolean getDescontaCustoApoliceIof() {
		return descontaCustoApoliceIof;
	}

	public void setDescontaCustoApoliceIof(Boolean descontaCustoApoliceIof) {
		this.descontaCustoApoliceIof = descontaCustoApoliceIof;
	}

	/** 
	 */
	public List<PropostaComissao> getPropostaComissaoCollection() {
		return this.propostaComissaoCollection;
	}

	/** 
	 */
	public void setPropostaComissaoCollection(
			List<PropostaComissao> propostaComissaoCollection) {
		this.propostaComissaoCollection = propostaComissaoCollection;
	}

	/** 
	 */
	public List<Imovel> getImovelCollection() {
		return this.imovelCollection;
	}

	/** 
	 */
	public void setImovelCollection(List<Imovel> imovelCollection) {
		this.imovelCollection = imovelCollection;
	}

	/** 
	 */
	public List<VidaEmpresarial> getVidaEmpresarialCollection() {
		return this.vidaEmpresarialCollection;
	}

	/** 
	 */
	public void setVidaEmpresarialCollection(
			List<VidaEmpresarial> vidaEmpresarialCollection) {
		this.vidaEmpresarialCollection = vidaEmpresarialCollection;
	}

	/** 
	 */
	public List<RiscoDiversos> getRiscoDiversosCollection() {
		return this.riscoDiversosCollection;
	}

	/** 
	 */
	public void setRiscoDiversosCollection(
			List<RiscoDiversos> riscoDiversosCollection) {
		this.riscoDiversosCollection = riscoDiversosCollection;
	}

	/** 
	 */
	public List<ParcelasProposta> getParcelasPropostaCollection() {
		return this.parcelasPropostaCollection;
	}

	/** 
	 */
	public void setParcelasPropostaCollection(
			List<ParcelasProposta> parcelasPropostaCollection) {
		this.parcelasPropostaCollection = parcelasPropostaCollection;
	}

	/** 
	 */
	public List<Sinistro> getSinistroCollection() {
		return this.sinistroCollection;
	}

	/** 
	 */
	public void setSinistroCollection(List<Sinistro> sinistroCollection) {
		this.sinistroCollection = sinistroCollection;
	}

	/** 
	 */
	public List<VidaIndividual> getVidaIndividualCollection() {
		return this.vidaIndividualCollection;
	}

	/** 
	 */
	public void setVidaIndividualCollection(
			List<VidaIndividual> vidaIndividualCollection) {
		this.vidaIndividualCollection = vidaIndividualCollection;
	}

	/** 
	 */
	public List<Proposta> getPropostaCollection() {
		return this.propostaCollection;
	}

	/** 
	 */
	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
	}

	/* 
	public List<Automovel> getAutomovelCollection() {
		return this.automovelCollection;
	}

	public void setAutomovelCollection(List<Automovel> automovelCollection) {
		this.automovelCollection = automovelCollection;
	}
	 */

	/** 
	 */
	public List<Historico> getHistoricoCollection() {
		return this.historicoCollection;
	}

	/** 
	 */
	public void setHistoricoCollection(List<Historico> historicoCollection) {
		this.historicoCollection = historicoCollection;
	}

	/** 
	 */
	public List<RespostaPerfil> getRespostaPerfilCollection() {
		return this.respostaPerfilCollection;
	}

	/** 
	 */
	public void setRespostaPerfilCollection(
			List<RespostaPerfil> respostaPerfilCollection) {
		this.respostaPerfilCollection = respostaPerfilCollection;
	}

	public Long getNroBanco() {
		return nroBanco;
	}

	public void setNroBanco(Long nroBanco) {
		this.nroBanco = nroBanco;
	}

	public String getCodigoAgencia() {
		return codigoAgencia;
	}

	public void setCodigoAgencia(String codigoAgencia) {
		this.codigoAgencia = codigoAgencia;
	}

	public Long getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(Long contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	public String getTitularCcorrente() {
		return titularCcorrente;
	}

	public void setTitularCcorrente(String titularCcorrente) {
		this.titularCcorrente = titularCcorrente;
	}

	public String getCliCondutorPrincipal() {
		return cliCondutorPrincipal;
	}

	public void setCliCondutorPrincipal(String cliCondutorPrincipal) {
		this.cliCondutorPrincipal = cliCondutorPrincipal;
	}

	public List<Automovel> getAutomovelWizCollection() {
		return automovelWizCollection;
	}

	public void setAutomovelWizCollection(List<Automovel> automovelWizCollection) {
		this.automovelWizCollection = automovelWizCollection;
	}

	public List<ComissionadoProposta> getComissionadoPropostaCollection() {
		return comissionadoPropostaCollection;
	}
	
	public void setComissionadoPropostaCollection(List<ComissionadoProposta> comissionadoPropostaCollection) {
		this.comissionadoPropostaCollection = comissionadoPropostaCollection;
	}

	public Double getFator() {
		return this.fator==null ? 0 : this.fator;
	}

	public void setFator(Double fator) {
		this.fator = fator;
	}

	public String getChequeNominal() {
		return chequeNominal;
	}

	public void setChequeNominal(String chequeNominal) {
		this.chequeNominal = chequeNominal;
	}

	public List<PropostaEndereco> getPropostaEnderecoCollection() {
		return propostaEnderecoCollection;
	}

	public void setPropostaEnderecoCollection(List<PropostaEndereco> propostaEnderecoCollection) {
		this.propostaEnderecoCollection = propostaEnderecoCollection;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Date getDataTransmissao() {
		return dataTransmissao;
	}

	public void setDataTransmissao(Date dataTransmissao) {
		this.dataTransmissao = dataTransmissao;
	}

	public Date getDataGeracao() {
		return dataGeracao;
	}

	public void setDataGeracao(Date dataGeracao) {
		this.dataGeracao = dataGeracao;
	}

	public Pessoa getAutorGeracao() {
		return autorGeracao;
	}

	public void setAutorGeracao(Pessoa autorGeracao) {
		this.autorGeracao = autorGeracao;
	}

	public Boolean getBlnPossuiPerfil() {
		return blnPossuiPerfil;
	}

	public void setBlnPossuiPerfil(Boolean blnPossuiPerfil) {
		this.blnPossuiPerfil = blnPossuiPerfil;
	}

	public Long getTipoProposta() {
		return tipoProposta;
	}

	public void setTipoProposta(Long tipoProposta) {
		this.tipoProposta = tipoProposta;
	}

	public List<SeguradoIndividual> getSeguradoIndividualCollection() {
		return seguradoIndividualCollection;
	}

	public void setSeguradoIndividualCollection(
			List<SeguradoIndividual> seguradoIndividualCollection) {
		this.seguradoIndividualCollection = seguradoIndividualCollection;
	}

	public List<BorderoLancamento> getBorderoLancamentoCollection() {
		return borderoLancamentoCollection;
	}

	public void setBorderoLancamentoCollection(
			List<BorderoLancamento> borderoLancamentoCollection) {
		this.borderoLancamentoCollection = borderoLancamentoCollection;
	}

	public String getCodigoIdentificacao() {
		return codigoIdentificacao;
	}

	public void setCodigoIdentificacao(String codigoIdentificacao) {
		this.codigoIdentificacao = codigoIdentificacao;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public Proposta getPropostaOriginal() {
		return propostaOriginal;
	}

	public void setPropostaOriginal(Proposta propostaOriginal) {
		this.propostaOriginal = propostaOriginal;
	}

	public List<Proposta> getEndossoCollection() {
		return endossoCollection;
	}

	public void setEndossoCollection(List<Proposta> endossoCollection) {
		this.endossoCollection = endossoCollection;
	}

	public Endosso getTipoEndosso() {
		return tipoEndosso;
	}

	public void setTipoEndosso(Endosso tipoEndosso) {
		this.tipoEndosso = tipoEndosso;
	}

	public String getObsEndosso() {
		return obsEndosso;
	}

	public void setObsEndosso(String obsEndosso) {
		this.obsEndosso = obsEndosso;
	}

	public Long getSituacaoOperacional() {
		return situacaoOperacional;
	}

	public void setSituacaoOperacional(Long situacaoOperacional) {
		this.situacaoOperacional = situacaoOperacional;
	}

	public String getNroEndosso() {
		return this.nroEndosso==null ? "" : this.nroEndosso;
	}

	public void setNroEndosso(String nroEndosso) {
		this.nroEndosso = nroEndosso;
	}

	public Date getDataEndosso() {
		return dataEndosso;
	}

	public void setDataEndosso(Date dataEndosso) {
		this.dataEndosso = dataEndosso;
	}

	public String getClienteNome() {
		return clienteNome;
	}

	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}

	public CpfCnpj getCpfOuCnpj() {
		return cpfOuCnpj;
	}

	public void setCpfOuCnpj(CpfCnpj cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
	}

	public Boolean getCalcularIof() {
		return calcularIof;
	}

	public void setCalcularIof(Boolean calcularIof) {
		this.calcularIof = calcularIof;
	}

	public Boolean getRenovacaoAutomatica() {
		return renovacaoAutomatica;
	}

	public void setRenovacaoAutomatica(Boolean renovacaoAutomatica) {
		this.renovacaoAutomatica = renovacaoAutomatica;
	}

	public String getNroFatura() {
		return nroFatura;
	}

	public void setNroFatura(String nroFatura) {
		this.nroFatura = nroFatura;
	}

	public Integer getParcelaAtual() {
		return parcelaAtual;
	}

	public void setParcelaAtual(Integer parcelaAtual) {
		this.parcelaAtual = parcelaAtual;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public List<Agenciamento> getAgenciamentoCollection() {
		return agenciamentoCollection;
	}

	public void setAgenciamentoCollection(
			List<Agenciamento> agenciamentoCollection) {
		this.agenciamentoCollection = agenciamentoCollection;
	}

	public List<ComissionadoAgenciamento> getComissionadoAgenciamentoCollection() {
		return comissionadoAgenciamentoCollection;
	}

	public void setComissionadoAgenciamentoCollection(
			List<ComissionadoAgenciamento> comissionadoAgenciamentoCollection) {
		this.comissionadoAgenciamentoCollection = comissionadoAgenciamentoCollection;
	}

	public Integer getNroInclusoes() {
		return nroInclusoes;
	}

	public void setNroInclusoes(Integer nroInclusoes) {
		this.nroInclusoes = nroInclusoes;
	}

	public Boolean getPossuiAgenciamento() {
		return possuiAgenciamento;
	}

	public void setPossuiAgenciamento(Boolean possuiAgenciamento) {
		this.possuiAgenciamento = possuiAgenciamento;
	}

	public Double getValorInclusoes() {
		return valorInclusoes;
	}

	public void setValorInclusoes(Double valorInclusoes) {
		this.valorInclusoes = valorInclusoes;
	}

	public Double getPercentualAgenciamento() {
		return percentualAgenciamento;
	}

	public void setPercentualAgenciamento(Double percentualAgenciamento) {
		this.percentualAgenciamento = percentualAgenciamento;
	}

	public Double getValorAgenciamento() {
		return valorAgenciamento;
	}

	public void setValorAgenciamento(Double valorAgenciamento) {
		this.valorAgenciamento = valorAgenciamento;
	}

	public Integer getQtdeParcelasAgenciamento() {
		return qtdeParcelasAgenciamento;
	}

	public void setQtdeParcelasAgenciamento(Integer qtdeParcelasAgenciamento) {
		this.qtdeParcelasAgenciamento = qtdeParcelasAgenciamento;
	}

	public String getContaDigito() {
		return contaDigito;
	}

	public void setContaDigito(String contaDigito) {
		this.contaDigito = contaDigito;
	}

	public Boolean getIsGeneric() {
		return isGeneric;
	}

	public void setIsGeneric(Boolean isGeneric) {
		this.isGeneric = isGeneric;
	}
	
	public PObject getRoot(){
		return null;
	}

	public List<Condutor> getCondutorCollection() {
		return condutorCollection;
	}

	public void setCondutorCollection(List<Condutor> condutorCollection) {
		this.condutorCollection = condutorCollection;
	}

	public List<PosVenda> getPosVendaCollection() {
		return posVendaCollection;
	}

	public void setPosVendaCollection(List<PosVenda> posVendaCollection) {
		this.posVendaCollection = posVendaCollection;
	}

	public Date getDataLanctoApolice() {
		return dataLanctoApolice;
	}

	public void setDataLanctoApolice(Date dataLanctoApolice) {
		this.dataLanctoApolice = dataLanctoApolice;
	}

	public Date getDataBaixaApolice() {
		return dataBaixaApolice;
	}

	public void setDataBaixaApolice(Date dataBaixaApolice) {
		this.dataBaixaApolice = dataBaixaApolice;
	}

	public Date getDataRecebApolice() {
		return dataRecebApolice;
	}

	public void setDataRecebApolice(Date dataRecebApolice) {
		this.dataRecebApolice = dataRecebApolice;
	}

	public Date getDataLanctoEndosso() {
		return dataLanctoEndosso;
	}

	public void setDataLanctoEndosso(Date dataLanctoEndosso) {
		this.dataLanctoEndosso = dataLanctoEndosso;
	}

	public Date getDataBaixaEndosso() {
		return dataBaixaEndosso;
	}

	public void setDataBaixaEndosso(Date dataBaixaEndosso) {
		this.dataBaixaEndosso = dataBaixaEndosso;
	}

	public Date getDataRecebEndosso() {
		return dataRecebEndosso;
	}

	public void setDataRecebEndosso(Date dataRecebEndosso) {
		this.dataRecebEndosso = dataRecebEndosso;
	}

	public Proposta getPropostaRenovada() {
		return propostaRenovada;
	}

	public void setPropostaRenovada(Proposta propostaRenovada) {
		this.propostaRenovada = propostaRenovada;
	}

	public Proposta getPropostaInicial() {
		return propostaInicial;
	}

	public void setPropostaInicial(Proposta propostaInicial) {
		this.propostaInicial = propostaInicial;
	}

	public List<Proposta> getPropostaHistoricoCollection() {
		return propostaHistoricoCollection;
	}

	public void setPropostaHistoricoCollection(
			List<Proposta> propostaHistoricoCollection) {
		this.propostaHistoricoCollection = propostaHistoricoCollection;
	}

	public String getSmsEncaminhado() {
		return smsEncaminhado;
	}

	public void setSmsEncaminhado(String smsEncaminhado) {
		this.smsEncaminhado = smsEncaminhado;
	}

	public Date getInicio1aVigencia() {
		return inicio1aVigencia;
	}

	public void setInicio1aVigencia(Date inicio1aVigencia) {
		this.inicio1aVigencia = inicio1aVigencia;
	}

	public Date getTermino1aVigencia() {
		return termino1aVigencia;
	}

	public void setTermino1aVigencia(Date termino1aVigencia) {
		this.termino1aVigencia = termino1aVigencia;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}

	public Pessoa getEstipulante() {
		return estipulante;
	}

	public void setEstipulante(Pessoa estipulante) {
		this.estipulante = estipulante;
	}

	public Boolean getAgenciamentoComComissao() {
		return agenciamentoComComissao;
	}

	public void setAgenciamentoComComissao(Boolean agenciamentoComComissao) {
		this.agenciamentoComComissao = agenciamentoComComissao;
	}

	public Double getTaxaTotalSegurado() {
		return taxaTotalSegurado;
	}

	public void setTaxaTotalSegurado(Double taxaTotalSegurado) {
		this.taxaTotalSegurado = taxaTotalSegurado;
	}

	public Double getPremioMinimo() {
		return premioMinimo;
	}

	public void setPremioMinimo(Double premioMinimo) {
		this.premioMinimo = premioMinimo;
	}

	public Double getValorTransportado() {
		return valorTransportado;
	}

	public void setValorTransportado(Double valorTransportado) {
		this.valorTransportado = valorTransportado;
	}

	public Double getTaxaFaturaAtual() {
		return taxaFaturaAtual;
	}

	public void setTaxaFaturaAtual(Double taxaFaturaAtual) {
		this.taxaFaturaAtual = taxaFaturaAtual;
	}

	public List<RiscoTransportes> getRiscoTransportesCollection() {
		return riscoTransportesCollection;
	}

	public void setRiscoTransportesCollection(
			List<RiscoTransportes> riscoTransportesCollection) {
		this.riscoTransportesCollection = riscoTransportesCollection;
	}

	public Usuario getUsuarioLanctoApolice() {
		return usuarioLanctoApolice;
	}

	public void setUsuarioLanctoApolice(Usuario usuarioLanctoApolice) {
		this.usuarioLanctoApolice = usuarioLanctoApolice;
	}

	public Usuario getUsuarioBaixaApolice() {
		return usuarioBaixaApolice;
	}

	public void setUsuarioBaixaApolice(Usuario usuarioBaixaApolice) {
		this.usuarioBaixaApolice = usuarioBaixaApolice;
	}

	public Usuario getUsuarioRecebApolice() {
		return usuarioRecebApolice;
	}

	public void setUsuarioRecebApolice(Usuario usuarioRecebApolice) {
		this.usuarioRecebApolice = usuarioRecebApolice;
	}

	public Usuario getUsuarioLanctoEndosso() {
		return usuarioLanctoEndosso;
	}

	public void setUsuarioLanctoEndosso(Usuario usuarioLanctoEndosso) {
		this.usuarioLanctoEndosso = usuarioLanctoEndosso;
	}

	public Usuario getUsuarioBaixaEndosso() {
		return usuarioBaixaEndosso;
	}

	public void setUsuarioBaixaEndosso(Usuario usuarioBaixaEndosso) {
		this.usuarioBaixaEndosso = usuarioBaixaEndosso;
	}

	public Usuario getUsuarioRecebEndosso() {
		return usuarioRecebEndosso;
	}

	public void setUsuarioRecebEndosso(Usuario usuarioRecebEndosso) {
		this.usuarioRecebEndosso = usuarioRecebEndosso;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public Boolean getIsFatura() {
		return isFatura;
	}

	public void setIsFatura(Boolean isFatura) {
		this.isFatura = isFatura;
	}

	public List<PropostaBancos> getPropostaBancosCollection() {
		return propostaBancosCollection;
	}

	public void setPropostaBancosCollection(
			List<PropostaBancos> propostaBancosCollection) {
		this.propostaBancosCollection = propostaBancosCollection;
	}

	public List<PerfilProposta> getPerfilPropostaCollection() {
		return perfilPropostaCollection;
	}

	public void setPerfilPropostaCollection(
			List<PerfilProposta> perfilPropostaCollection) {
		this.perfilPropostaCollection = perfilPropostaCollection;
	}

	public Integer getVersao() {
		return versao;
	}

	public void setVersao(Integer versao) {
		this.versao = versao;
	}

	public Boolean getIsFrota() {
		return isFrota;
	}

	public void setIsFrota(Boolean isFrota) {
		this.isFrota = isFrota;
	}

	public String getIsFrotaString() {
		return isFrota ? "FROTA" : "";
	}
	public List<PropostaAnexo> getPropostaAnexoCollection() {
		return propostaAnexoCollection;
	}

	public void setPropostaAnexoCollection(
			List<PropostaAnexo> propostaAnexoCollection) {
		this.propostaAnexoCollection = propostaAnexoCollection;
	}

	public List<Proposta> getRenovacaoCollection() {
		return renovacaoCollection;
	}

	public void setRenovacaoCollection(List<Proposta> renovacaoCollection) {
		this.renovacaoCollection = renovacaoCollection;
	}

	public List<PropostaAutomovel> getPropostaAutomovelCollection() {
		return propostaAutomovelCollection;
	}

	public void setPropostaAutomovelCollection(
			List<PropostaAutomovel> propostaAutomovelCollection) {
		this.propostaAutomovelCollection = propostaAutomovelCollection;
	}

	public String getObservacoesComplementares() {
		return observacoesComplementares;
	}

	public void setObservacoesComplementares(String observacoesComplementares) {
		this.observacoesComplementares = observacoesComplementares;
	}

}