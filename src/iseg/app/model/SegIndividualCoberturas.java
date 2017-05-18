package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="seg_individual_coberturas")
public class SegIndividualCoberturas extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SCBI_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	@JoinColumn(name="coberturas_id")
	private Coberturas coberturas;

	private Double lmi;

	private Double premio;

	private String descricao;

	private Integer sequencia;

	@ManyToOne
	@JoinColumn(name="segurado_individual_id")
	private SeguradoIndividual seguradoIndividual;

	private static final long serialVersionUID = 1L;

	public SegIndividualCoberturas() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
	}

	public Double getLmi() {
		return lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public Double getPremio() {
		return premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getSequencia() {
		return sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}

	public SeguradoIndividual getSeguradoIndividual() {
		return seguradoIndividual;
	}

	public void setSeguradoIndividual(SeguradoIndividual seguradoIndividual) {
		this.seguradoIndividual = seguradoIndividual;
	}

}
