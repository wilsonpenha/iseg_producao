package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;
import iseg.utils.Formatter;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@NamedQueries({
	@NamedQuery(name="getPropostaComissaoIdByProposta", query = "SELECT pc.id FROM PropostaComissao pc WHERE pc.proposta.id = ?0"),
	@NamedQuery(name="checarBaixaExistente", query = "SELECT count(*) FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and pc.situacao > 0"),
	@NamedQuery(name="getPropostaComissaoByPropostaId", query = "SELECT pc FROM PropostaComissao pc WHERE pc.proposta.id = ?0 order by pc.nroDaParcela"),
	/* getPropostaComissaoBaixadasByProposta, pega todas as baxas de comissoes ordenadas pela referencia, será usado pela baixa de Agenciamento ou Comissao no VIDA em grupo. */
	@NamedQuery(name="getPropostaComissaoBaixadasByProposta", query = "SELECT pc FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and pc.situacao = 2 and pc.natureza = 1 order by pc.referenciaParcela desc"),
	@NamedQuery(name="getMaxNroParcelaFromPropostaComissaoByPropostaId", query = "SELECT max(pc.nroDaParcela) FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and pc.nroDaParcela >= ?1"),
	@NamedQuery(name="deletePropostaComissaoByPropostaId", query = "DELETE FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and pc.tipoLancamento = 0"),
	@NamedQuery(name="deletePropostaComissaoEmpresarialByPropostaIdParcelaAtual", query = "DELETE FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and "+
		"pc.referenciaParcela >= ?1 and pc.tipoLancamento = 0 and pc.natureza = 0"),/* excluir lancamentos automaticos de comissoes/agenciamento futuros */
	@NamedQuery(name="deletePropostaComissaoEmpresarialByPropostaIdParcelaOriginaria", query = "DELETE FROM PropostaComissao pc WHERE pc.proposta.id = ?0 and "+
		"pc.parcelaOriginaria = ?1 and pc.tipoLancamento = 0 and pc.natureza = 5")/* excluir lancamentos automaticos de comissoes/agenciamento futuros */
		}) 
@Table(name="PROPOSTA_COMISSAO")
public class PropostaComissao extends PObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PRC_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="DATA_PAGAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataPagamento;

	@Column(name="VALOR_PAGAMENTO")
	private Double valorPagamento;

	@Column(name="PERCENTUAL_COMISSAO")
	private Double percentualComissao;

	@Column(name="VALOR_COMISSAO")
	private Double valorComissao;

	@Column(name="NRO_DA_PARCELA")
	private Integer nroDaParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="PARCELA_ORIGINARIA")
	private Date parcelaOriginaria;

	@Temporal(TemporalType.DATE)
	@Column(name="referencia_parcela")
	private Date referenciaParcela;

	@Column(name="DATA_VENCIMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataVencimento;

	private Integer situacao;

	private Integer natureza;

	@Column(name="TIPO_LANCAMENTO")
	private Integer tipoLancamento;

	@ManyToOne(fetch=LAZY)
	private Proposta proposta;

	public PropostaComissao() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Double getValorPagamento() {
		return this.valorPagamento;
	}

	public void setValorPagamento(Double valorPagamento) {
		this.valorPagamento = valorPagamento==null ? 0.0 : valorPagamento;
	}

	public Double getValorComissao() {
		return this.valorComissao;
	}

	public void setValorComissao(Double valorComissao) {
		this.valorComissao = valorComissao==null ? 0.0 : valorComissao;
	}

	public String getValorComissaoDesc() {
		return Formatter.formatNumber(valorComissao, 2);
	}

	public Integer getNroDaParcela() {
		return this.nroDaParcela;
	}

	public void setNroDaParcela(Integer nroDaParcela) {
		this.nroDaParcela = nroDaParcela;
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	@Column
	public Integer getSituacao() {
		return situacao==null ? 0 : situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao==null ? 0 : situacao;
	}

	public Integer getNatureza() {
		return natureza;
	}

	public void setNatureza(Integer natureza) {
		this.natureza = natureza==null ? 0 : natureza;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Double getPercentualComissao() {
		return this.percentualComissao==null ? 0 : this.percentualComissao;
	}

	public String getPercentualComissaoDesc() {
		return Formatter.formatNumber(percentualComissao, 2);
	}

	public void setPercentualComissao(Double percentualComissao) {
		this.percentualComissao = percentualComissao==null ? 0 : percentualComissao;
	}

	public Integer getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(Integer tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public Date getParcelaOriginaria() {
		return parcelaOriginaria;
	}

	public void setParcelaOriginaria(Date parcelaOriginaria) {
		this.parcelaOriginaria = parcelaOriginaria;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}
}