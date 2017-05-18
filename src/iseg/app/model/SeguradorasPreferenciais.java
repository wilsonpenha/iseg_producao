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
@Table(name="seguradoras_prefer")
@SequenceGenerator(name="seq_seguradoras_prefer", sequenceName = "seq_seguradoras_prefer")
@NamedQueries({
	@NamedQuery(name="getSeguradorasPreferenciais", query="SELECT a FROM SeguradorasPreferenciais a"),
	@NamedQuery(name="getSeguradorasPreferenciaisByCorretora", query="SELECT a FROM SeguradorasPreferenciais a WHERE a.corretora.id = ?0"),
	@NamedQuery(name="getCountSeguradorasPreferenciais", query="SELECT Count(*) FROM SeguradorasPreferenciais a")
})
public class SeguradorasPreferenciais extends PObject implements Serializable {

	private static final long serialVersionUID = -5826344686012224810L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_seguradoras_prefer")
	private Long id;
	
	private String franquias;
	
	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;
	
	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFranquias() {
		return franquias;
	}

	public void setFranquias(String franquias) {
		this.franquias = franquias;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}
	
}
