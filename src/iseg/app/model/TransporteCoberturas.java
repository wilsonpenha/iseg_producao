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
@Table(name="TRANSPORTE_COBERTURAS")
public class TransporteCoberturas extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="TCO_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private Double lmi;

	private Double premio;

	private Double franquia;
	
	private String descricao;

	@Column(name="TEXTO_FRANQUIA")
	private String textoFranquia;

	private Integer sequencia;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="risco_transportes_id")
	private RiscoTransportes riscoTransportes;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="coberturas_id")
	private Coberturas coberturas;

	private static final long serialVersionUID = 1L;

	public TransporteCoberturas() {
		super();
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

	public String getDescricao() {
		return this.descricao;
	}

	public Long getId() {
		return id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getSequencia() {
		return this.sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}
	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
	}

	public RiscoTransportes getRiscoTransportes() {
		return riscoTransportes;
	}

	public void setRiscoTransportes(RiscoTransportes riscoTransportes) {
		this.riscoTransportes = riscoTransportes;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getFranquia() {
		return franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public String getTextoFranquia() {
		return textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}
}