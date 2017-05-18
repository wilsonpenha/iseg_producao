package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Acompanhamento extends PObject implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACP_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="DATA_LANCAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataLancamento;

	private String detalhamento;

	@ManyToOne
	private Sinistro sinistro;

	public Acompanhamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public String getDetalhamento() {
		return this.detalhamento;
	}

	public void setDetalhamento(String detalhamento) {
		this.detalhamento = detalhamento;
	}

	public Sinistro getSinistro() {
		return this.sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
	}

}
