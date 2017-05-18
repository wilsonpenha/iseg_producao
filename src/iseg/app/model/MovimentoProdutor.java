package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
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
import javax.persistence.Table;


@Entity
@Table(name="MOVIMENTO_PRODUTOR")
public class MovimentoProdutor extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="MPR_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="DATA_OCORRENCIA")
	private Date dataOcorrencia;

	@Column(name="INICIO_DESCONTO")
	private Date inicioDesconto;

	@Column(name="DATA_DESCONTO")
	private Date dataDesconto;

	private Double valor;

	private String descricao;

	@ManyToOne(fetch=LAZY)
	private Produtor produtor;

	@ManyToOne(fetch=LAZY)
	private Usuario usuario;

	private static final long serialVersionUID = 1L;

	public MovimentoProdutor() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataOcorrencia() {
		return this.dataOcorrencia;
	}

	public void setDataOcorrencia(Date dataOcorrencia) {
		this.dataOcorrencia = dataOcorrencia;
	}

	public Date getInicioDesconto() {
		return this.inicioDesconto;
	}

	public void setInicioDesconto(Date inicioDesconto) {
		this.inicioDesconto = inicioDesconto;
	}

	public Date getDataDesconto() {
		return this.dataDesconto;
	}

	public void setDataDesconto(Date dataDesconto) {
		this.dataDesconto = dataDesconto;
	}

	public Double getValor() {
		return this.valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Produtor getProdutor() {
		return this.produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
