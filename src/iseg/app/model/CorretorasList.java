package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="CORRETORAS_LIST")
@NamedQueries({ 
	@NamedQuery(name="getCorretorasLIst",query="SELECT c FROM CorretorasList c"),
	@NamedQuery(name="deleteListaByUsuario",query="delete FROM CorretorasList where usuario.id = ?0")})
public class CorretorasList  extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CORL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="CORRETORA_ID")
	private Corretora corretora;

	@ManyToOne
	private Usuario usuario;

	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}