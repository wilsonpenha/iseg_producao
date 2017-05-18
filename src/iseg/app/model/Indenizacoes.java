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
public class Indenizacoes extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="IDZ_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="DATA_PAGAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataPagamento;

	@Column(name="VALOR_INDENIZADO")
	private Double valorIndenizado;

	@Column(name="TIPO_INDENIZACAO")
	private String tipoIndenizacao;

	@ManyToOne
	private Sinistro sinistro;

	private static final long serialVersionUID = 1L;

	public Indenizacoes() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Double getValorIndenizado() {
		return this.valorIndenizado;
	}

	public void setValorIndenizado(Double valorIndenizado) {
		this.valorIndenizado = valorIndenizado;
	}

	public String getTipoIndenizacao() {
		return this.tipoIndenizacao;
	}

	public void setTipoIndenizacao(String tipoIndenizacao) {
		this.tipoIndenizacao = tipoIndenizacao;
	}

	public Sinistro getSinistro() {
		return this.sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
	}

}
