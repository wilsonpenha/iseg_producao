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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@NamedQueries({
	@NamedQuery(name="deleteParcelasAgenciamentoByPercelaOriginaria", query="DELETE FROM ParcelasAgenciamento pc WHERE pc.id in (SELECT rc.id from ParcelasAgenciamento rc WHERE rc.agenciamento.proposta.id = ?0  and rc.referenciaParcela = ?1)"),
	@NamedQuery(name="deleteParcelasAgenciamentoByAgenciamento", query="DELETE FROM ParcelasAgenciamento pc WHERE pc.agenciamento.id = ?0"),
	@NamedQuery(name="getSumOfParcelasAgenciamentoByPropostaAndParcelaDaProposta", query="SELECT SUM(pc.valorParcela) FROM ParcelasAgenciamento pc WHERE pc.agenciamento.proposta.id = ?0  and pc.referenciaParcela = ?1)"),
	@NamedQuery(name="getSumOfValorInclusoesByPropostaAndParcelaDaProposta", query="SELECT SUM(pc.valorInclusoes) FROM ParcelasAgenciamento pc WHERE pc.agenciamento.proposta.id = ?0  and pc.referenciaParcela = ?1)"),
	@NamedQuery(name="getParcelaAgenciamentoByPropostaIdAndNroParcela", query="select p from ParcelasAgenciamento p Where p.agenciamento.proposta.id = ?0 and p.nroParcela = ?1"),
	@NamedQuery(name="getParcelasAgenciamentoByProposta", query="SELECT pc FROM ParcelasAgenciamento pc WHERE pc.agenciamento.proposta.id = ?0 and pc.referenciaParcela = ?1 ")
	})
@Table(name="PARCELAS_AGENCIAMENTO")
public class ParcelasAgenciamento extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PARG_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Temporal(TemporalType.DATE)
	@Column(name="PARCELA_ORIGINARIA")
	private Date parcelaOriginaria;

	@Column(name="NRO_PARCELA")
	private Integer nroParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="REFERENCIA_PARCELA")
	private Date referenciaParcela;

	@Temporal(TemporalType.DATE)
	private Date vencimento;

	@Column(name="VALOR_INCLUSOES")
	private Double valorInclusoes;

	@Column(name="VALOR_PARCELA")
	private Double valorParcela;

	@ManyToOne(fetch=LAZY)
	private Agenciamento agenciamento;
	
	private static final long serialVersionUID = 1L;

	public ParcelasAgenciamento() {
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

	public Agenciamento getAgenciamento() {
		return this.agenciamento;
	}

	public void setAgenciamento(Agenciamento agenciamento) {
		this.agenciamento = agenciamento;
	}

	public Double getValorParcela() {
		return this.valorParcela;
	}

	public void setValorParcela(Double valorParcela) {
		this.valorParcela = valorParcela;
	}

	public Date getParcelaOriginaria() {
		return parcelaOriginaria;
	}

	public void setParcelaOriginaria(Date parcelaOriginaria) {
		this.parcelaOriginaria = parcelaOriginaria;
	}

	public Date getVencimento() {
		return vencimento;
	}

	public void setVencimento(Date vencimento) {
		this.vencimento = vencimento;
	}

	public Double getValorInclusoes() {
		return valorInclusoes;
	}

	public void setValorInclusoes(Double valorInclusoes) {
		this.valorInclusoes = valorInclusoes;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}
}