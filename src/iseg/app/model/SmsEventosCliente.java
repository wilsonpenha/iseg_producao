package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

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


@Entity
@Table(name="sms_eventos_corretora")
@NamedQueries({
	@NamedQuery(name="getCountSmsEventosCliente", query="SELECT Count(*) FROM SmsEventosCliente b"),
	@NamedQuery(name="getSmsEventosClienteByCliente", query="SELECT b FROM SmsEventosCliente b where b.pessoa.id = ?0"),
	@NamedQuery(name="getSmsEventosCliente", query="SELECT b FROM SmsEventosCliente b")
	})
public class SmsEventosCliente  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEVCL_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="pessoa_id")
	private Pessoa pessoa;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="evento_id")
	private SmsEventos evento;

	private String mensagem;
	
	@JoinColumn(name="dias_antecedencia")
	private Integer diasAntecedencia;
	
	@Column(name="is_ativo")
	private Boolean isAtivo;

	private static final long serialVersionUID = 1L;

	public SmsEventosCliente() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getIsAtivo() {
		return isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public SmsEventos getEvento() {
		return evento;
	}

	public void setEvento(SmsEventos evento) {
		this.evento = evento;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public Integer getDiasAntecedencia() {
		return diasAntecedencia;
	}

	public void setDiasAntecedencia(Integer diasAntecedencia) {
		this.diasAntecedencia = diasAntecedencia;
	}
}