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
@Table(name="corretora_servicos_iseg")
@SequenceGenerator(name="seq_corretora_servicos_iseg", sequenceName = "seq_corretora_servicos_iseg")
@NamedQueries({
	@NamedQuery(name="getCorretoraServicosIseg", query="SELECT a FROM CorretoraServicosIseg a"),
	@NamedQuery(name="getCorretoraServicosIsegByCorretora", query="SELECT a FROM CorretoraServicosIseg a WHERE a.corretora.id = ?0"),
	@NamedQuery(name="getCountCorretoraServicosIseg", query="SELECT Count(*) FROM CorretoraServicosIseg a")
})
public class CorretoraServicosIseg extends PObject implements Serializable {

	private static final long serialVersionUID = 6170932908731024359L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_corretora_servicos_iseg")
	private Long id;
	
	private Double lmi;
	
	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;
	
	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;

	public Long getId() {
		return this.id;
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
	
	public ServicosIseg getServicosIseg() {
		return servicosIseg;
	}
	
	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}
}
