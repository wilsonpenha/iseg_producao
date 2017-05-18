package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="sms_creditos")
@NamedQueries({
	@NamedQuery(name="getCountSmsCreditos", query="SELECT Count(*) FROM SmsCreditos b"),
	@NamedQuery(name="getSmsCreditosByCorretora", query="SELECT b FROM SmsCreditos b where b.corretora.id = ?0"),
	@NamedQuery(name="getSmsCreditos", query="SELECT b FROM SmsCreditos b")
	})
public class SmsCreditos  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SCRED_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="corretora_id")
	private Corretora corretora;

	@Temporal(TemporalType.DATE)
	@JoinColumn(name="data_inclusao")
	private Date datainclusao;

	private Integer quantidade;
	
	private static final long serialVersionUID = 1L;

	public SmsCreditos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Date getDatainclusao() {
		return datainclusao;
	}

	public void setDatainclusao(Date datainclusao) {
		this.datainclusao = datainclusao;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

}