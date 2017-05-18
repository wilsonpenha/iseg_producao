package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name="getRespostaPerfilByProposta", query="SELECT r FROM RespostaPerfil r where r.proposta.id = ?0")})
@Table(name="RESPOSTA_PERFIL")
public class RespostaPerfil extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RPF_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String resposta;

	private Integer ordem;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="pergunta_id", referencedColumnName = "id")
	private PerguntasPerfil perguntasPerfil;

	@ManyToOne(fetch=FetchType.EAGER)
	private Proposta proposta;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro;
	
	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	private static final long serialVersionUID = 1L;

	public RespostaPerfil() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getResposta() {
		return this.resposta;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}

	public PerguntasPerfil getPerguntasPerfil() {
		return this.perguntasPerfil;
	}

	public void setPerguntasPerfil(PerguntasPerfil perguntasPerfil) {
		this.perguntasPerfil = perguntasPerfil;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Integer getOrdem() {
		return ordem;
	}

	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}