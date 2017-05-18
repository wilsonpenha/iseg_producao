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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="beneficiario_empresarial")
public class BeneficiarioEmpresarial extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="BNF_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@Temporal(TemporalType.DATE)
	@Column(name="data_nascimento")
	private Date dataNascimento;

	private String sexo;

	private String parentesco;

	private Double percentual;

	@ManyToOne
	@JoinColumn(name="segurado_empresarial_id")
	private SeguradoEmpresarial seguradoEmpresarial;

	private static final long serialVersionUID = 1L;

	public BeneficiarioEmpresarial() {
		super();
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getSexo() {
		return this.sexo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SeguradoEmpresarial getSeguradoEmpresarial() {
		return seguradoEmpresarial;
	}

	public void setSeguradoEmpresarial(SeguradoEmpresarial seguradoEmpresarial) {
		this.seguradoEmpresarial = seguradoEmpresarial;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getParentesco() {
		return this.parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public Double getPercentual() {
		return this.percentual;
	}

	public void setPercentual(Double percentual) {
		this.percentual = percentual;
	}
}
