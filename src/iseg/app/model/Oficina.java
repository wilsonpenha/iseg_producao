package iseg.app.model;

import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.InheritanceType.JOINED;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;



@Entity
@Inheritance(strategy=JOINED) 
@NamedQueries({
	@NamedQuery(name="getCountOficina", query="SELECT Count(*) FROM Oficina o"),
	@NamedQuery(name="getOficina", query="SELECT o FROM Oficina o ORDER BY o.nome")})
public class Oficina extends PessoaJuridica implements Serializable {

	
	
	@OneToMany(cascade=REMOVE, mappedBy = "oficina", fetch = LAZY)
	private Set<Sinistro> sinistroCollection;

	@OneToMany(cascade=REMOVE, mappedBy = "oficina", fetch = LAZY)
	private Set<TerceiroEnvolvido> terceiroEnvolvidoCollection;

	private static final long serialVersionUID = 1L;

	public Oficina() {
		super();
	}

	public Set<Sinistro> getSinistroCollection() {
		return this.sinistroCollection;
	}

	public void setSinistroCollection(Set<Sinistro> sinistroCollection) {
		this.sinistroCollection = sinistroCollection;
	}

	public Set<TerceiroEnvolvido> getTerceiroEnvolvidoCollection() {
		return this.terceiroEnvolvidoCollection;
	}

	public void setTerceiroEnvolvidoCollection(Set<TerceiroEnvolvido> terceiroEnvolvidoCollection) {
		this.terceiroEnvolvidoCollection = terceiroEnvolvidoCollection;
	}

}
