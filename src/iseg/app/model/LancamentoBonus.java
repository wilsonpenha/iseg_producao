package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="LANCAMENTO_BONUS")
public class LancamentoBonus extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="LBON_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	private Seguradora seguradora;

	@Column(name="VALOR_BONUS")
	private Double valorBonus;

	@Temporal(TemporalType.DATE)
	@Column(name="DATA_LANCAMENTO")
	private Date dataLancamento;

	@Column(name="NRO_EXTRATO")
	private String nroExtrato;

	private String tipo;

	@Column(name="TRANSFERIDO_CAXIA")
	private Integer transferidoCaxia;

	@Temporal(TemporalType.DATE)
	@Column(name="DATA_TRANSFERENCIA")
	private Date dataTransferencia;

	private Integer situacao;

	private static final long serialVersionUID = 1L;

	public LancamentoBonus() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getValorBonus() {
		return this.valorBonus;
	}

	public void setValorBonus(Double valorBonus) {
		this.valorBonus = valorBonus;
	}

	public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public String getNroExtrato() {
		return this.nroExtrato;
	}

	public void setNroExtrato(String nroExtrato) {
		this.nroExtrato = nroExtrato;
	}

	public Integer getTransferidoCaxia() {
		return this.transferidoCaxia;
	}

	public void setTransferidoCaxia(Integer transferidoCaxia) {
		this.transferidoCaxia = transferidoCaxia;
	}

	public Date getDataTransferencia() {
		return this.dataTransferencia;
	}

	public void setDataTransferencia(Date dataTransferencia) {
		this.dataTransferencia = dataTransferencia;
	}

	public Integer getSituacao() {
		return this.situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

}
