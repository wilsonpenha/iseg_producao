package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="resposta_pos_venda")
@NamedQueries({
	@NamedQuery(name="getCountRespostaPosVenda", query="SELECT Count(*) FROM RespostaPosVenda b"),
	@NamedQuery(name="getRespostaPosVenda", query="SELECT b FROM RespostaPosVenda b"),
	@NamedQuery(name="getRespostaPosVendaNaoRespodida", query="SELECT b FROM RespostaPosVenda b where b.posVenda.id = ?0 and isRespondido = false")
	})
public class RespostaPosVenda extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RPVD_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private String resposta;

	private String observacoes;

	@Column(name="is_respondido")
	private Boolean isRespondido;

	@Column(name="data_resposta")
	@Temporal(TemporalType.DATE)
	private Date dataResposta;

	@ManyToOne
	@JoinColumn(name="pos_venda_id")
	private PosVenda posVenda;

	@ManyToOne
	private QuestionarioPosVenda questionario;

	@ManyToOne
	private Usuario usuario;

	private static final long serialVersionUID = 1L;

	public RespostaPosVenda() {
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

	public Boolean getIsRespondido() {
		return this.isRespondido;
	}

	public void setIsRespondido(Boolean isRespondido) {
		this.isRespondido = isRespondido;
	}

	public PosVenda getPosVenda() {
		return this.posVenda;
	}

	public void setPosVenda(PosVenda posVenda) {
		this.posVenda = posVenda;
	}

	public QuestionarioPosVenda getQuestionario() {
		return questionario;
	}

	public void setQuestionario(QuestionarioPosVenda questionario) {
		this.questionario = questionario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public Date getDataResposta() {
		return dataResposta;
	}

	public void setDataResposta(Date dataResposta) {
		this.dataResposta = dataResposta;
	}

}
