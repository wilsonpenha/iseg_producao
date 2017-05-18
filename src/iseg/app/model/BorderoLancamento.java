package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;
import iseg.app.constants.Constants;
import iseg.app.conversion.CpfCnpj;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountItens", query="SELECT Count(*) FROM BorderoLancamento i where i.borderoComissao.id = ?0"),
	@NamedQuery(name="getLancamentos", query="SELECT l FROM BorderoLancamento l where l.borderoComissao.id = ?0"),
	@NamedQuery(name="getTodasComissoesBaixadasByProposta", query="SELECT l FROM BorderoLancamento l where l.proposta.id = ?0 and l.situacao = 2 and l.borderoComissao.situacao < 2"), // somente lancamentos baixados de lotes em aberto ou fechados (nao processar lotes estonados ou de estorno)
	@NamedQuery(name="getTodasComissoesBaixadasByPropostaAndNroParcela", query="SELECT l FROM BorderoLancamento l where l.proposta.id = ?0 and l.nroParcela = ?1 and l.situacao = 2 and l.borderoComissao.situacao < 2"),
	@NamedQuery(name="getTodasComissoesBaixadasByPropostaAndReferencia", query="SELECT l FROM BorderoLancamento l where l.proposta.id = ?0 and l.referenciaParcela = ?1 and l.situacao = 2 and l.borderoComissao.situacao < 2"),
	@NamedQuery(name="getTodasComissoesBaixadasByPropostaTipoAgenciamento", query="SELECT l FROM BorderoLancamento l where l.proposta.id = ?0 and l.referenciaParcela = ?1 and l.tipoLancamento = 5 and l.situacao = 2 and l.borderoComissao.situacao < 2")
})
@Table(name="bordero_lancamento")
public class BorderoLancamento extends PObject implements Serializable, AtributoUsuario {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="BDL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Temporal(TemporalType.DATE)
	@Column(name="data_lancamento")
	private Date dataLancamento; 

	@Column(name="nro_documento")
	private String nroDocumento;

	@ManyToOne(fetch=FetchType.EAGER)
	private Ramo ramo;

	@Column(name="nro_proposta")
	private String nroProposta;
	
	@Column(name="nro_apolice")
	private String nroApolice;
	
	@Column(name="nro_endosso")
	private String nroEndosso;

	@ManyToOne(fetch=LAZY)
	private Proposta proposta;
	
	@ManyToOne(fetch=LAZY)
	private Pessoa segurado;
	
	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF_OU_CNPJ"))
	private CpfCnpj cpfOuCnpj;

	@Column(name="nome_segurado")
	private String nomeSegurado;

	@Column(name="nro_parcela")
	private Integer nroParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="referencia_parcela")
	private Date referenciaParcela;

	@Column(name="premio_liquido")
	private Double premioLiquido;

	@Column(name="percentual_comissao")
	private Double percentualComissao;

	@Column(name="valor_comissao")
	private Double valorComissao;

	@ManyToOne
	@JoinColumn(name="bordero_comissao_id")
	private BorderoComissao borderoComissao;

	private Long sequencia;

	private Integer situacao;

	@ManyToOne
	@JoinColumn(name="tipo_lancamento")
	private TipoLancamento tipoLancamento;
	
	@ManyToOne(fetch=LAZY)
	private Usuario usuario;

	@Column(name="is_repasse")
	private Boolean isRepasse;

	@Transient
	private String nroApoliceAnterior;

	private static final long serialVersionUID = 1L;

	public BorderoLancamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public String getNroDocumento() {
		return this.nroDocumento;
	}

	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
	}

	public Ramo getRamo() {
		return this.ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public String getNroApolice() {
		return this.nroApolice;
	}

	public void setNroApolice(String nroApolice) {
		this.nroApolice = nroApolice;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public String getNomeSegurado() {
		return this.nomeSegurado;
	}

	public void setNomeSegurado(String nomeSegurado) {
		this.nomeSegurado = nomeSegurado;
	}

	public Integer getNroParcela() {
		return this.nroParcela;
	}

	public void setNroParcela(Integer nroParcela) {
		this.nroParcela = nroParcela;
	}

	public Double getPremioLiquido() {
		return this.premioLiquido;
	}

	public void setPremioLiquido(Double premioLiquido) {
		this.premioLiquido = premioLiquido;
	}

	public Double getPercentualComissao() {
		return this.percentualComissao;
	}

	public void setPercentualComissao(Double percentualComissao) {
		this.percentualComissao = percentualComissao;
	}

	public Double getValorComissao() {
		return this.valorComissao;
	}

	public void setValorComissao(Double valorComissao) {
		this.valorComissao = valorComissao;
	}

	public BorderoComissao getBorderoComissao() {
		return this.borderoComissao;
	}

	public void setBorderoComissao(BorderoComissao borderoComissao) {
		this.borderoComissao = borderoComissao;
	}

	public Long getSequencia() {
		return sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public String getSituacaoDesc() {
		return Constants.getSituacaoCotacaoDescricao(situacao);
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public TipoLancamento getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(TipoLancamento tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public Boolean getIsRepasse() {
		return isRepasse;
	}

	public void setIsRepasse(Boolean isRepasse) {
		this.isRepasse = isRepasse;
	}

	public String getNroProposta() {
		return nroProposta;
	}

	public void setNroProposta(String nroProposta) {
		this.nroProposta = nroProposta;
	}

	public String getNroEndosso() {
		return nroEndosso;
	}

	public void setNroEndosso(String nroEndosso) {
		this.nroEndosso = nroEndosso;
	}

	public Pessoa getSegurado() {
		return segurado;
	}

	public void setSegurado(Pessoa segurado) {
		this.segurado = segurado;
	}

	public CpfCnpj getCpfOuCnpj() {
		return cpfOuCnpj;
	}

	public void setCpfOuCnpj(CpfCnpj cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
	}

	public String getNroApoliceAnterior() {
		return nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}
	
}
