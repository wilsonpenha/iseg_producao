package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="ACRESCIMO_DESCONTO")
public class AcrescimoDesconto extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACR_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="ACRESCIMO_DESCONTO")
	private String acrescimoDesconto;

	private Double percentual;

	private String descricao;

	@ManyToOne
	private Automovel automovel;

	private static final long serialVersionUID = 1L;

	public AcrescimoDesconto() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAcrescimoDesconto() {
		return this.acrescimoDesconto;
	}

	public void setAcrescimoDesconto(String acrescimoDesconto) {
		this.acrescimoDesconto = acrescimoDesconto;
	}

	public Double getPercentual() {
		return this.percentual;
	}

	public void setPercentual(Double percentual) {
		this.percentual = percentual;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Automovel getAutomovel() {
		return this.automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

}
