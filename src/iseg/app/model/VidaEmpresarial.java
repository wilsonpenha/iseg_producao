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
@Table(name="VIDA_EMPRESARIAL")
public class VidaEmpresarial extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="VEM_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne
	private Proposta proposta;

	private static final long serialVersionUID = 1L;

	public VidaEmpresarial() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

}
