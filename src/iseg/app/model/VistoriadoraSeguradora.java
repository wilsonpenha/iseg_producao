package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="VISTORIADORA_SEGURADORA")
public class VistoriadoraSeguradora extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="VIS_SEG_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;

	@ManyToOne(fetch=LAZY)
	private Vistoriadora vistoriadora;

	private static final long serialVersionUID = 1L;

	public VistoriadoraSeguradora() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Vistoriadora getVistoriadora() {
		return this.vistoriadora;
	}

	public void setVistoriadora(Vistoriadora vistoriadora) {
		this.vistoriadora = vistoriadora;
	}
}