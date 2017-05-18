package iseg.app.model;

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
@Table(name="AUTOMOVEL_ACESSORIOS")
public class AutomovelAcessorios extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="AAC_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	private DominioEsp acessorio;

	@ManyToOne
	private Automovel automovel;

	private static final long serialVersionUID = 1L;

	public AutomovelAcessorios() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public DominioEsp getAcessorio() {
		return this.acessorio;
	}

	public void setAcessorio(DominioEsp acessorio) {
		this.acessorio = acessorio;
	}

	public Automovel getAutomovel() {
		return this.automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}
}