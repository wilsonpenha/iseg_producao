package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

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
@NamedQueries({
	@NamedQuery(name="getTotalPremioSegurados", query="SELECT sum(premio) FROM SeguradoCoberturas sc where sc.seguradoEmpresarial.proposta.id = ?0")
})
@Table(name="segurado_coberturas")
public class SeguradoCoberturas extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SCOB_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private Double lmi;

	private Double premio;

	private String descricao;

	private Integer sequencia;

	@ManyToOne
	@JoinColumn(name="segurado_empresarial_id")
	private SeguradoEmpresarial seguradoEmpresarial;

	@ManyToOne
	@JoinColumn(name="coberturas_id")
	private Coberturas coberturas;

	private static final long serialVersionUID = 1L;

	public SeguradoCoberturas() {
		super();
	}

	public Double getLmi() {
		return this.lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public Double getPremio() {
		return this.premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public Long getId() {
		return id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getSequencia() {
		return this.sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}

	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
	}

	public SeguradoEmpresarial getSeguradoEmpresarial() {
		return seguradoEmpresarial;
	}

	public void setSeguradoEmpresarial(SeguradoEmpresarial seguradoEmpresarial) {
		this.seguradoEmpresarial = seguradoEmpresarial;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
