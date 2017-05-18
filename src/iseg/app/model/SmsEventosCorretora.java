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
	@NamedQuery(name="getCountSmsEventosCorretoraByCorretora", query="SELECT Count(*) FROM SmsEventosCorretora b where b.corretora.id = ?0"),
	@NamedQuery(name="getSmsEventosCorretoraByCorretora", query="SELECT b FROM SmsEventosCorretora b where b.corretora.id = ?0"),
	@NamedQuery(name="getSmsEventosCorretoraAtivos", query="SELECT b FROM SmsEventosCorretora b where b.isAtivo = true order by b.smsEventos.id"),
	@NamedQuery(name="getSmsEventosCorretoraByEventoAndCorretora", query="SELECT b FROM SmsEventosCorretora b where b.smsEventos.id = ?0 and b.corretora.id = ?1"),
	@NamedQuery(name="getSmsEventosCorretora", query="SELECT b FROM SmsEventosCorretora b")
	})
public class SmsEventosCorretora  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEVC_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="evento_id", referencedColumnName = "id")
	private SmsEventos smsEventos;

	private String mensagem;
	
	@Column(name="dias_antecedencia")
	private Integer diasAntecedencia;
	
	@Column(name="is_ativo")
	private Boolean isAtivo;

	private static final long serialVersionUID = 1L;

	public SmsEventosCorretora() {
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

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public SmsEventos getSmsEventos() {
		return smsEventos;
	}

	public void setSmsEventos(SmsEventos smsEventos) {
		this.smsEventos = smsEventos;
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