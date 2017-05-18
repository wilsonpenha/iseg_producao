package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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

@Entity
@Table(name="automovel_orcamento")
@SequenceGenerator(name="seq_automovel_orcamento", sequenceName = "seq_automovel_orcamento")
@NamedQueries({
	@NamedQuery(name="getAutomovelOrcamentoById", query="SELECT a FROM AutomovelOrcamento a WHERE a.id = ?0"),
	@NamedQuery(name="getCountAutomovelOrcamento", query="SELECT Count(*) FROM AutomovelOrcamento a"),
	@NamedQuery(name="getAutomovelOrcamentoByOrcamentoSeguro", query="SELECT a FROM AutomovelOrcamento a WHERE a.orcamentoSeguro.id = ?0")
})
public class AutomovelOrcamento extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_automovel_orcamento")
	private Long id;

	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;

	@ManyToOne
	@JoinColumn(name="seguradora_anterior_id")
	private DominioEsp seguradoraAnterior;

	@Column(name="fim_vig_apolice_anterior")
	private Date fimVigApoliceAnterior;

	@Column(name="nro_apolice_anterior")
	private String nroApoliceAnterior;

	@Column(name="classe_bonus")
	private String classeBonus;

	@Column(name="codigo_identificacao_anterior")
	private String codigoIdentificacaoAnterior;

	@Column(name="is_apolice_cancelada")
	private Boolean isApoliceCancelada;

	private String motivo;

	@Column(name="qtd_sinistro")
	private Integer qtdSinistro;

	private String observacao;

	@ManyToOne
	@JoinColumn(name="veiculo_modelo_id")
	private VeiculoModelo veiculoModelo;

	@Column(name="ano_fabricacao")
	private String anoFabricacao;

	@Column(name="ano_modelo")
	private String anoModelo;

	@Column(name="is_zero_km")
	private Boolean isZeroKm;

	@Column(name="nro_nf")
	private String nroNf;

	@ManyToOne
	@JoinColumn(name="tipo_combustivel_id")
	private DominioEsp tipoCombustivel;

	@Column(name="is_segurado_proprietario")
	private Boolean isSeguradoProprietario;

	private String renavan;

	@Column(name="nro_placa")
	private String nroPlaca;

	@Column(name="nro_chassis")
	private String nroChassis;

	@Column(name="cor_predominante")
	private String corPredominante;

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
	@JoinColumn(name="tipo_franquia_id")
	private DominioEsp tipoFranquia;

	@Column(name="capacidade")
	private String capacidade;

	@Column(name="categoria")
	private String categoria;

	@Column(name="codigo_fipe")
	private String codigoFipe;

	@Column(name="codigo_identificacao")
	private String codigoIdentificacao;

	@Column(name="gravame_alienacao")
	private String gravameAlienacao;

	@Column(name="possui_anti_furto")
	private String possuiAntiFurto;

	@Column(name="rastreamento_satelite")
	private String rastreamentoSatelite;

	@Column(name="regiao_tarifacao")
	private String regiaoTarifacao;

	@Column(name="renovacao")
	private String renovacao;

	@Column(name="status")
	private String status;

	@Column(name="terceiro_eixo")
	private String terceiroEixo;

	@ManyToOne
	@JoinColumn(name="categoria_veiculo_id")
	private DominioEsp categoriaVeiculo;

	@Column(name="linha_vazia")
	private Boolean linhaVazia;

	@Column(name="numero_item")
	private Integer numeroItem;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="uso_veiculo_id")
	private DominioEsp usoVeiculo;

	@Column(name="valor_casco")
	private Double valorCasco;

	@Column(name="lmi_normal")
	private Double lmiNormal;

	@Column(name="lmi_reduzido")
	private Double lmiReduzido;

	@Column(name="tipo_indenizacao")
	private String tipoIndenizacao;

	@Column(name="percentual_referenciado")
	private Double percentualReferenciado;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="orcamento_id")
	private OrcamentoSeguro orcamentoSeguro;

	@OneToMany(cascade = CascadeType.ALL, mappedBy="automovelOrcamento", fetch=FetchType.LAZY)
	private List<AutomovelOrcAcessorios> automovelOrcAcessoriosCollection = new ArrayList<AutomovelOrcAcessorios>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy="automovelOrcamento", fetch=FetchType.LAZY)
	private List<AutomovelProprietario> automovelProprietarioCollection = new ArrayList<AutomovelProprietario>();

	@ManyToOne
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

	@Column(name="is_blindado")
	private Boolean isBlindado;
	
	@Column(name="data_saida")
	@Temporal(TemporalType.DATE)
	private Date dataSaida;
	
	private static final long serialVersionUID = 1L;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Date getFimVigApoliceAnterior() {
		return fimVigApoliceAnterior;
	}

	public void setFimVigApoliceAnterior(Date fimVigApoliceAnterior) {
		this.fimVigApoliceAnterior = fimVigApoliceAnterior;
	}

	public String getNroApoliceAnterior() {
		return nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public String getClasseBonus() {
		return classeBonus;
	}

	public void setClasseBonus(String classeBonus) {
		this.classeBonus = classeBonus;
	}

	public String getCodigoIdentificacaoAnterior() {
		return codigoIdentificacaoAnterior;
	}

	public void setCodigoIdentificacaoAnterior(String codigoIdentificacaoAnterior) {
		this.codigoIdentificacaoAnterior = codigoIdentificacaoAnterior;
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

	public VeiculoModelo getVeiculoModelo() {
		return veiculoModelo;
	}

	public void setVeiculoModelo(VeiculoModelo veiculoModelo) {
		this.veiculoModelo = veiculoModelo;
	}

	public String getAnoFabricacao() {
		return anoFabricacao;
	}

	public void setAnoFabricacao(String anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}

	public String getAnoModelo() {
		return anoModelo;
	}

	public void setAnoModelo(String anoModelo) {
		this.anoModelo = anoModelo;
	}

	public Boolean getIsZeroKm() {
		return isZeroKm;
	}

	public void setIsZeroKm(Boolean isZeroKm) {
		this.isZeroKm = isZeroKm;
	}

	public String getNroNf() {
		return nroNf;
	}

	public void setNroNf(String nroNf) {
		this.nroNf = nroNf;
	}

	public DominioEsp getTipoCombustivel() {
		return tipoCombustivel;
	}

	public void setTipoCombustivel(DominioEsp tipoCombustivel) {
		this.tipoCombustivel = tipoCombustivel;
	}

	public Boolean getIsSeguradoProprietario() {
		return isSeguradoProprietario;
	}

	public void setIsSeguradoProprietario(Boolean isSeguradoProprietario) {
		this.isSeguradoProprietario = isSeguradoProprietario;
	}

	public String getRenavan() {
		return renavan;
	}

	public void setRenavan(String renavan) {
		this.renavan = renavan;
	}

	public String getNroPlaca() {
		return nroPlaca;
	}

	public void setNroPlaca(String nroPlaca) {
		this.nroPlaca = nroPlaca;
	}

	public String getNroChassis() {
		return nroChassis;
	}

	public void setNroChassis(String nroChassis) {
		this.nroChassis = nroChassis;
	}

	public String getCorPredominante() {
		return corPredominante;
	}

	public void setCorPredominante(String corPredominante) {
		this.corPredominante = corPredominante;
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

	public DominioEsp getTipoFranquia() {
		return tipoFranquia;
	}

	public void setTipoFranquia(DominioEsp tipoFranquia) {
		this.tipoFranquia = tipoFranquia;
	}

	public String getCapacidade() {
		return capacidade;
	}

	public void setCapacidade(String capacidade) {
		this.capacidade = capacidade;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getCodigoFipe() {
		return codigoFipe;
	}

	public void setCodigoFipe(String codigoFipe) {
		this.codigoFipe = codigoFipe;
	}

	public String getCodigoIdentificacao() {
		return codigoIdentificacao;
	}

	public void setCodigoIdentificacao(String codigoIdentificacao) {
		this.codigoIdentificacao = codigoIdentificacao;
	}

	public String getGravameAlienacao() {
		return gravameAlienacao;
	}

	public void setGravameAlienacao(String gravameAlienacao) {
		this.gravameAlienacao = gravameAlienacao;
	}

	public String getPossuiAntiFurto() {
		return possuiAntiFurto;
	}

	public void setPossuiAntiFurto(String possuiAntiFurto) {
		this.possuiAntiFurto = possuiAntiFurto;
	}

	public String getRastreamentoSatelite() {
		return rastreamentoSatelite;
	}

	public void setRastreamentoSatelite(String rastreamentoSatelite) {
		this.rastreamentoSatelite = rastreamentoSatelite;
	}

	public String getRegiaoTarifacao() {
		return regiaoTarifacao;
	}

	public void setRegiaoTarifacao(String regiaoTarifacao) {
		this.regiaoTarifacao = regiaoTarifacao;
	}

	public String getRenovacao() {
		return renovacao;
	}

	public void setRenovacao(String renovacao) {
		this.renovacao = renovacao;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTerceiroEixo() {
		return terceiroEixo;
	}

	public void setTerceiroEixo(String terceiroEixo) {
		this.terceiroEixo = terceiroEixo;
	}

	public DominioEsp getCategoriaVeiculo() {
		return categoriaVeiculo;
	}

	public void setCategoriaVeiculo(DominioEsp categoriaVeiculo) {
		this.categoriaVeiculo = categoriaVeiculo;
	}

	public Boolean getLinhaVazia() {
		return linhaVazia;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
	}

	public Integer getNumeroItem() {
		return numeroItem;
	}

	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public DominioEsp getUsoVeiculo() {
		return usoVeiculo;
	}

	public void setUsoVeiculo(DominioEsp usoVeiculo) {
		this.usoVeiculo = usoVeiculo;
	}

	public Double getValorCasco() {
		return valorCasco;
	}

	public void setValorCasco(Double valorCasco) {
		this.valorCasco = valorCasco;
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

	public String getTipoIndenizacao() {
		return tipoIndenizacao;
	}

	public void setTipoIndenizacao(String tipoIndenizacao) {
		this.tipoIndenizacao = tipoIndenizacao;
	}

	public Double getPercentualReferenciado() {
		return percentualReferenciado;
	}

	public void setPercentualReferenciado(Double percentualReferenciado) {
		this.percentualReferenciado = percentualReferenciado;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public List<AutomovelOrcAcessorios> getAutomovelOrcAcessoriosCollection() {
		return automovelOrcAcessoriosCollection;
	}

	public void setAutomovelOrcAcessoriosCollection(
			List<AutomovelOrcAcessorios> automovelOrcAcessoriosCollection) {
		this.automovelOrcAcessoriosCollection = automovelOrcAcessoriosCollection;
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

	public Boolean getIsBlindado() {
		return isBlindado;
	}

	public void setIsBlindado(Boolean isBlindado) {
		this.isBlindado = isBlindado;
	}

	public Date getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

	public DominioEsp getSeguradoraAnterior() {
		return seguradoraAnterior;
	}

	public void setSeguradoraAnterior(DominioEsp seguradoraAnterior) {
		this.seguradoraAnterior = seguradoraAnterior;
	}

}
