package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="RISCO_COBERTURAS")
public class RiscoCoberturas extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RCO_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private Double lmi;
	
	private Double premio;
	
	private Double franquia;
	
	private String descricao;
	
	@Column(name="TEXTO_FRANQUIA")
	private String textoFranquia;
	
	private Integer sequencia;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="RISCO_DIVERSOS_ID")
	private RiscoDiversos riscoDiversos;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="coberturas_id")
	private Coberturas coberturas;

	private static final long serialVersionUID = 1L;

	public RiscoCoberturas() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public RiscoDiversos getRiscoDiversos() {
		return riscoDiversos;
	}

	public void setRiscoDiversos(RiscoDiversos riscoDiversos) {
		this.riscoDiversos = riscoDiversos;
	}

	public Double getLmi() {
		return this.lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public Double getPremio() {
		return this.premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public String getTextoFranquia() {
		return this.textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public Double getFranquia() {
		return this.franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
	}

	public Integer getSequencia() {
		return sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}
}