package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Set;

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
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountPerguntasPerfil", query="SELECT Count(*) FROM PerguntasPerfil p"),
	@NamedQuery(name="getPerguntasPerfil", query = "SELECT p FROM PerguntasPerfil p order by p.ordem"),
	@NamedQuery(name="getPerguntasPerfilOrdered", query = "SELECT p FROM PerguntasPerfil p ORDER BY p.id"),
	@NamedQuery(name="getPerguntasPerfilByPerfil", query = "SELECT p FROM PerguntasPerfil p WHERE p.perfil.id = ?0 order by p.ordem")})
@Table(name="PERGUNTAS_PERFIL")
public class PerguntasPerfil extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PERPE_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String pergunta;

	@ManyToOne(fetch=LAZY)
	private Perfil perfil;

	@Column(name="IS_ATIVA")
	private Boolean isAtiva;

	private Integer ordem;

	@OneToMany(mappedBy="perguntasPerfil", fetch=FetchType.LAZY)
	private Set<RespostaPerfil> respostaPerfilCollection;

	@Column(name="TIPO_RESPOSTA")
	private Long tipoResposta;

	private static final long serialVersionUID = 1L;

	public PerguntasPerfil() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPergunta() {
		return this.pergunta;
	}

	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}

	public Perfil getPerfil() {
		return this.perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
		
	}

	public Integer getOrdem() {
		return ordem;
	}

	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	public Set<RespostaPerfil> getRespostaPerfilCollection() {
		return this.respostaPerfilCollection;
	}

	public void setRespostaPerfilCollection(Set<RespostaPerfil> respostaPerfilCollection) {
		this.respostaPerfilCollection = respostaPerfilCollection;
	}

	public Long getTipoResposta() {
		return tipoResposta;
	}

	public void setTipoResposta(Long tipoResposta) {
		this.tipoResposta = tipoResposta;
	}

	public Boolean getAtiva() {
		return isAtiva;
	}
	
	public void setAtiva(Boolean isAtiva) {
		this.isAtiva = isAtiva==null ? false : isAtiva;
	}
	
	public Boolean getIsAtiva() {
		return isAtiva;
	}

	public void setIsAtiva(Boolean isAtiva) {
		this.isAtiva = isAtiva==null ? false : isAtiva;
	}

}
