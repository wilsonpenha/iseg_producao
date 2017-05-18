package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="sms_eventos")
@NamedQueries({
	@NamedQuery(name="getCountSmsEventos", query="SELECT Count(*) FROM SmsEventos b"),
	@NamedQuery(name="getSmsEventosAtivos", query="SELECT b FROM SmsEventos b where isAtivo=true"),
	@NamedQuery(name="getSmsEventos", query="SELECT b FROM SmsEventos b")
	})
public class SmsEventos  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEVT_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private String nome;
	
	@Column(name="is_ativo")
	private Boolean isAtivo;

	private static final long serialVersionUID = 1L;

	public SmsEventos() {
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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
}