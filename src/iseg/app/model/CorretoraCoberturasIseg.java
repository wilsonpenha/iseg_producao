package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

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
@Table(name="corretora_coberturas_iseg")
@SequenceGenerator(name="seq_corretora_coberturas_iseg", sequenceName = "seq_corretora_coberturas_iseg")
@NamedQueries({
	@NamedQuery(name="getCorretoraCoberturasIseg", query="SELECT a FROM CorretoraCoberturasIseg a"),
	@NamedQuery(name="getCorretoraCoberturasIsegByCorretora", query="SELECT a FROM CorretoraCoberturasIseg a WHERE a.corretora.id = ?0"),
	@NamedQuery(name="getCountCorretoraCoberturasIseg", query="SELECT Count(*) FROM CorretoraCoberturasIseg a")
})
public class CorretoraCoberturasIseg extends PObject implements Serializable {

	private static final long serialVersionUID = 8329366838694049014L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_corretora_coberturas_iseg")
	private Long id;
	
	private Double lmi;
	
	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;
	
	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getLmi() {
		return lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}

}
