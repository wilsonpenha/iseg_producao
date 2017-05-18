package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;
import iseg.utils.Formatter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
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
@NamedQueries({
	@NamedQuery(name="deleteParcelasByPropostaId", query="delete from ParcelasProposta p Where p.proposta.id = ?0"),
	@NamedQuery(name="getCountParcelasMaioIgualAtualByPropostaId", query="select count(*) from ParcelasProposta p Where p.proposta.id = ?0 and p.nroParcela>=?1"),
	@NamedQuery(name="selectUltimaParcelaByPropostaId", query="select p from ParcelasProposta p Where p.proposta.id = ?0 and p.nroParcela in (select max(pp.nroParcela) from ParcelasProposta pp where pp.proposta.id=p.proposta.id)"),
	@NamedQuery(name="deleteParcelasVidaEmpresarial", query="delete from ParcelasProposta p Where p.proposta.id = ?0 and p.nroParcela>=?1"),
	@NamedQuery(name="getParcelaPropostaByPropostaId", query="select p from ParcelasProposta p Where p.proposta.id = ?0 order by p.referenciaParcela"),
	@NamedQuery(name="getParcelaPropostaByPropostaIdAndNroParcela", query="select p from ParcelasProposta p Where p.proposta.id = ?0 and p.nroParcela=?1"),
	@NamedQuery(name="getParcelaPropostaByPropostaIdAndReferencia", query="select p from ParcelasProposta p Where p.proposta.id = ?0 and p.referenciaParcela=?1"),
	@NamedQuery(name="getParcelasVidaEmpresarialApartirParcelaAtual", query="select p from ParcelasProposta p Where p.proposta.id = ?0 and p.referenciaParcela>=?1 order by p.referenciaParcela")
	})
@Table(name="PARCELAS_PROPOSTA")
public class ParcelasProposta extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PPR_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="NRO_PARCELA")
	private Integer nroParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="REFERENCIA_PARCELA")
	private Date referenciaParcela;

	@Column(name="NRO_BANCO")
	private String nroBanco;

	@Column(name="CODIGO_AGENCIA")
	private String codigoAgencia;

	@Column(name="CONTA_CORRENTE")
	private String contaCorrente;

	@Column(name="NRO_CHEQUE")
	private String nroCheque;

	@Column(name="NRO_DOCUMENTO")
	private String nroDocumento;

	@Column(name="INICIO_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date inicioVigencia;
	
	@Column(name="TERMINO_VIGENCIA")
	@Temporal(TemporalType.DATE)
	private Date terminoVigencia;

	@Temporal(TemporalType.DATE)
	private Date vencimento;

	@Column(name="VALOR_PARCELA")
	private Double valorParcela;

	private Double desconto;

	private Double iof;

	@Column(name="custo_apolice")
	private Double custoApolice;

	@Column(name="PREMIO_TOTAL")
	private Double premioTotal;

	@Column(name="PERCENTUAL_COMISSAO")
	private Double percentualComissao;

	@Column(name="VALOR_AGENCIAMENTO")
	private Double valorAgenciamento;

	@Column(name="BASE_CALCULO_COMISSAO")
	private Double baseCalculoComissao;

	@Column(name="VALOR_COMISSAO")
	private Double valorComissao;

	@Column(name="SITUACAO", columnDefinition="default 0")
	private Integer situacao;

	@Column(name="valor_transportado")
	private Double valorTransportado;
	
	@Column(name="taxa_fatura_atual")
	private Double taxaFaturaAtual;

	@ManyToOne
	private Proposta proposta;
	
	@ManyToOne // para ser usado no vida empresarial e vicular o grupo de venda de cada parcela.
	@JoinColumn(name="GRUPO_DE_VENDA_ID")
	private GrupoDeVenda grupoDeVenda;

	@OneToMany(mappedBy="parcelasProposta", cascade = { REMOVE, REFRESH },fetch=FetchType.LAZY)
	private List<ComissionadoProposta> comissionadoPropostaCollection = new ArrayList<ComissionadoProposta>();
	
	private static final long serialVersionUID = 1L;

	public ParcelasProposta() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getNroParcela() {
		return this.nroParcela;
	}

	public void setNroParcela(Integer nroParcela) {
		this.nroParcela = nroParcela;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public String getNroCheque() {
		return this.nroCheque;
	}

	public void setNroCheque(String nroCheque) {
		this.nroCheque = nroCheque;
	}

	public Date getVencimento() {
		return this.vencimento;
	}

	public void setVencimento(Date vencimento) {
		this.vencimento = vencimento;
	}

	public Double getValorParcela() {
		return this.valorParcela;
	}

	public void setValorParcela(Double valorParcela) {
		this.valorParcela = valorParcela;
	}

	public String getNroBanco() {
		return nroBanco;
	}

	public void setNroBanco(String nroBanco) {
		this.nroBanco = nroBanco;
	}

	public String getCodigoAgencia() {
		return codigoAgencia;
	}

	public void setCodigoAgencia(String codigoAgencia) {
		this.codigoAgencia = codigoAgencia;
	}

	public String getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(String contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	public String getNroDocumento() {
		return nroDocumento;
	}

	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
	}

	public Double getPercentualComissao() {
		return percentualComissao;
	}

	public void setPercentualComissao(Double percentualComissao) {
		this.percentualComissao = percentualComissao;
	}

	public Date getInicioVigencia() {
		return inicioVigencia;
	}

	public void setInicioVigencia(Date inicioVigencia) {
		this.inicioVigencia = inicioVigencia;
	}

	public Date getTerminoVigencia() {
		return terminoVigencia;
	}

	public void setTerminoVigencia(Date terminoVigencia) {
		this.terminoVigencia = terminoVigencia;
	}

	public Double getIof() {
		return iof;
	}

	public void setIof(Double iof) {
		this.iof = iof;
	}

	public Double getPremioTotal() {
		return premioTotal;
	}

	public void setPremioTotal(Double premioTotal) {
		this.premioTotal = premioTotal;
	}

	public Double getDesconto() {
		return desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}

	public Double getValorAgenciamento() {
		return valorAgenciamento;
	}

	public void setValorAgenciamento(Double valorAgenciamento) {
		this.valorAgenciamento = valorAgenciamento;
	}

	public Double getBaseCalculoComissao() {
		return baseCalculoComissao;
	}

	public void setBaseCalculoComissao(Double baseCalculoComissao) {
		this.baseCalculoComissao = baseCalculoComissao;
	}

	public Double getValorComissao() {
		return valorComissao;
	}

	public void setValorComissao(Double valorComissao) {
		this.valorComissao = valorComissao;
	}

	public List<ComissionadoProposta> getComissionadoPropostaCollection() {
		return comissionadoPropostaCollection;
	}

	public void setComissionadoPropostaCollection(
			List<ComissionadoProposta> comissionadoPropostaCollection) {
		this.comissionadoPropostaCollection = comissionadoPropostaCollection;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public String getReferencia() {
		return Formatter.getMonthYear(this.referenciaParcela);
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
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

	public Double getCustoApolice() {
		return custoApolice;
	}

	public void setCustoApolice(Double custoApolice) {
		this.custoApolice = custoApolice;
	}
}