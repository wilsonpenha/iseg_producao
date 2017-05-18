package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getRepasseComissaoByProposta", query = "SELECT pc FROM RepasseComissao pc left join pc.comissionado c left join pc.agenciado a WHERE c.proposta.id = ?0 or a.proposta.id = ?1"),
	@NamedQuery(name="getRepasseComissaoByComissionado", query = "SELECT pc FROM RepasseComissao pc WHERE pc.comissionado.id = ?0 "),
	@NamedQuery(name="getRepasseComissaoByAgenciado", query = "SELECT pc FROM RepasseComissao pc WHERE pc.agenciado.id = ?0 "),
	@NamedQuery(name="checarBaixaRepasseExistente", query = "SELECT count(*) FROM RepasseComissao pc WHERE pc.comissionado.proposta.id = ?0 and pc.situacao > 0"),
	@NamedQuery(name="deleteRepasseComissaoByPropostaId", query = "DELETE FROM RepasseComissao pc WHERE pc.id in (SELECT rc.id from RepasseComissao rc WHERE rc.comissionado.proposta.id = ?0)"),
	@NamedQuery(name="getRepasseByProdutorDataLancaNaoPago", query = "SELECT pc FROM RepasseComissao pc left join pc.comissionado c left join pc.agenciado a left join pc.produtor p left join pc.borderoLancamento bl left join bl.borderoComissao bc WHERE pc.situacao=0 and ((bc.dataDocumento >= ?0 and bc.dataDocumento <= ?1) or (pc.dataLancamento >= ?0 and pc.dataLancamento <= ?1)) and (p.id = ?2 or c.pessoa.id = ?2 or a.pessoa.id = ?3) order by pc.dataLancamento desc")
	})
@Table(name="REPASSE_COMISSAO")
public class RepasseComissao extends PObject implements Serializable, AtributoCorretora, AtributoUsuario {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="REP_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch = LAZY)
	private ComissionadoProposta comissionado;

	@ManyToOne(fetch = LAZY)
	private ComissionadoAgenciamento agenciado;

	@Column(name="VALOR_PAGO")
	private Double valorPago;

	@Column(name="DATA_LANCAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataLancamento;

	@Column(name="DATA_PAGAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataPagamento;

	private Integer situacao;

	@Column(name="NRO_DA_PARCELA")
	private Integer nroDaParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="REFERENCIA_PARCELA")
	private Date referenciaParcela;

	@Column(name="VALOR_BASE")
	private Double valorBase;

	@Column(name="PERCENTUAL_REPASSE")
	private Double percentualRepasse;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="CORRETORA_ID")
	private Corretora corretora;
	
	// Vinculo o repasse gerado com o lancamento de lote que originou
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="bordero_lancamento_id")
	private BorderoLancamento borderoLancamento;
	
	// Vinculo o repasse gerado com o repasse que originou o credito
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="repasse_id")
	private RepasseComissao repasseOrigem;
	
	@Column(name="tipo_lancamento")
	private Integer tipoLancamento;
	
	@Column(name="origem_lancamento")
	private Integer origemLancamento;
	
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="USUARIO_ID")
	private Usuario usuario;
	
	private String descricao;
	
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="usuario_estorno_id")
	private Usuario usuarioEstorno;

	@Column(name="motivo_estorno")
	private String motivoEstorno;
	
	@Column(name="DATA_ESTORNO")
	@Temporal(TemporalType.DATE)
	private Date dataEstorno;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PRODUTOR_ID")
	private Produtor produtor;

	public RepasseComissao() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ComissionadoProposta getComissionado() {
		return comissionado;
	}

	public void setComissionado(ComissionadoProposta comissionado) {
		this.comissionado = comissionado;
	}

	public Double getValorPago() {
		return this.valorPago==null ? 0.0 : this.valorPago;
	}

	public void setValorPago(Double valorPago) {
		this.valorPago = valorPago==null ? 0.0 : valorPago;
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Date getDataLancamento() {
		return dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public Integer getNroDaParcela() {
		return nroDaParcela;
	}

	public void setNroDaParcela(Integer nroDaParcela) {
		this.nroDaParcela = nroDaParcela;
	}

	public Double getValorBase() {
		return valorBase;
	}

	public void setValorBase(Double valorBase) {
		this.valorBase = valorBase;
	}

	public Double getPercentualRepasse() {
		return percentualRepasse;
	}

	public void setPercentualRepasse(Double percentualRepasse) {
		this.percentualRepasse = percentualRepasse;
	}

	public ComissionadoAgenciamento getAgenciado() {
		return agenciado;
	}

	public void setAgenciado(ComissionadoAgenciamento agenciado) {
		this.agenciado = agenciado;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}

	public BorderoLancamento getBorderoLancamento() {
		return borderoLancamento;
	}

	public void setBorderoLancamento(BorderoLancamento borderoLancamento) {
		this.borderoLancamento = borderoLancamento;
	}

	public RepasseComissao getRepasseOrigem() {
		return repasseOrigem;
	}

	public void setRepasseOrigem(RepasseComissao repasseOrigem) {
		this.repasseOrigem = repasseOrigem;
	}

	public Integer getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(Integer tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Integer getOrigemLancamento() {
		return origemLancamento;
	}

	public void setOrigemLancamento(Integer origemLancamento) {
		this.origemLancamento = origemLancamento;
	}

	public String getSituacaoDesc() {
		return situacao==null ? "Nulo" : situacao==0 ? "NAO PAGO" : situacao==2 ? "PAGO" : "ESTORNADO";
	}

	public String getTipoLancamentoDesc() {
		return (tipoLancamento==0 && repasseOrigem==null) ? "DEBITO" : (tipoLancamento==1 && repasseOrigem==null )? "CREDITO" : "ESTORNO";
	}

	public String getMotivoEstorno() {
		return motivoEstorno;
	}

	public void setMotivoEstorno(String motivoEstorno) {
		this.motivoEstorno = motivoEstorno;
	}

	public Date getDataEstorno() {
		return dataEstorno;
	}

	public void setDataEstorno(Date dataEstorno) {
		this.dataEstorno = dataEstorno;
	}

	public Usuario getUsuarioEstorno() {
		return usuarioEstorno;
	}

	public void setUsuarioEstorno(Usuario usuarioEstorno) {
		this.usuarioEstorno = usuarioEstorno;
	}

}
