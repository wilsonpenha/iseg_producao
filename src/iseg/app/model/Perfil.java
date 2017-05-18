package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountPerfil", query="SELECT Count(*) FROM Perfil p"),
	@NamedQuery(name="getPerfil", query = "SELECT p FROM Perfil p"),
	@NamedQuery(name="getPerfilOrdered", query = "SELECT p FROM Perfil p ORDER BY p.id"),
	@NamedQuery(name="getPerfilBySeguradora", query = "SELECT p FROM Perfil p WHERE p.seguradora.id = ?0")})
public class Perfil extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PER_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@Column(name="IS_ATIVO")
	private Boolean isAtivo;

	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;

	@OneToMany(mappedBy="perfil", fetch=FetchType.LAZY)
	private List<PerguntasPerfil> perguntasPerfilCollection = new ArrayList<PerguntasPerfil>();

	private static final long serialVersionUID = 1L;

	public Perfil() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getIsAtivo() {
		return isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo==null ? false : isAtivo;
	}

	public List<PerguntasPerfil> getPerguntasPerfilCollection() {
		return perguntasPerfilCollection;
	}

	public void setPerguntasPerfilCollection(
			List<PerguntasPerfil> perguntasPerfilCollection) {
		this.perguntasPerfilCollection = perguntasPerfilCollection;
	}

}
