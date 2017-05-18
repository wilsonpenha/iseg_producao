package iseg.app.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="perfil_proposta")
@SequenceGenerator(name="seq_perfil_proposta", sequenceName = "seq_perfil_proposta")
@NamedQueries({
	@NamedQuery(name="getPerfilProposta", query="SELECT a FROM PerfilProposta a")
})
public class PerfilProposta extends PerfilSeguro implements Serializable{
	
	private static final long serialVersionUID = -7376615956591493703L;

	@ManyToOne
	@JoinColumn(name="proposta_id")
	private Proposta proposta;

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}
	
}
