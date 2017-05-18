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
@Table(name="automovel_prop_acessorios")
@SequenceGenerator(name="seq_automovel_prop_acessorios", sequenceName = "seq_automovel_prop_acessorios")
@NamedQueries({
	@NamedQuery(name="getAutomovelPropAcessorios", query="SELECT a FROM AutomovelPropAcessorios a"),
	@NamedQuery(name="getCountAutomovelPropAcessorios", query="SELECT Count(*) FROM AutomovelPropAcessorios a"),
	@NamedQuery(name="deleteAutomovelPropAcessoriosByAutomovel", query="DELETE FROM AutomovelPropAcessorios a WHERE a.automovel.id = ?0")
})
public class AutomovelPropAcessorios extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_automovel_prop_acessorios")
	private Long id;

	@ManyToOne
	@JoinColumn(name="acessorio_id")
	private Acessorios acessorio;

	@ManyToOne
	@JoinColumn(name="automovel_id")
	private Automovel automovel;

	private static final long serialVersionUID = 1L;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Acessorios getAcessorio() {
		return this.acessorio;
	}

	public void setAcessorio(Acessorios acessorio) {
		this.acessorio = acessorio;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

}
