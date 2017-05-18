package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="seguradora_coberturas")
@SequenceGenerator(name="seq_seguradora_coberturas", sequenceName = "seq_seguradora_coberturas")
@NamedQueries({
	@NamedQuery(name="getSeguradoraCoberturas", query="SELECT a FROM SeguradoraCoberturas a"),
	@NamedQuery(name="getCountSeguradoraCoberturas", query="SELECT Count(*) FROM SeguradoraCoberturas a")
})
public class SeguradoraCoberturas extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_seguradora_coberturas")
	private Long id;

	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;

	@Column(name="descricao_seguradora")
	private String descricaoSeguradora;

	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg;

	private static final long serialVersionUID = 1L;

	public SeguradoraCoberturas() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getDescricaoSeguradora() {
		return this.descricaoSeguradora;
	}

	public void setDescricaoSeguradora(String descricaoSeguradora) {
		this.descricaoSeguradora = descricaoSeguradora;
	}

	public CoberturasIseg getCoberturasIseg() {
		return this.coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}

}
