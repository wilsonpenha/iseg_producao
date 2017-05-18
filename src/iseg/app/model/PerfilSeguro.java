package iseg.app.model;

import iseg.app.conversion.CEP;
import iseg.app.persistence.PObject;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

@MappedSuperclass  
public abstract class PerfilSeguro extends PObject{
	
	@Id  
    @GeneratedValue(strategy=GenerationType.AUTO) 
	protected Long id; 
	
	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="cep_residencia"))
	protected CEP cepResidencia;
	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="cep_trabalho"))
	protected CEP cepTrabalho;
	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="cep_pernoite"))
	protected CEP cepPernoite;
	
	@ManyToOne
	@JoinColumn(name="tipo_garagem_id")
	protected DominioEsp tipoGaragem;
	@ManyToOne
	@JoinColumn(name="utilizacao_veiculo_id")
	protected DominioEsp utilizacaoVeiculo;
	@ManyToOne
	@JoinColumn(name="tipo_residencia_id")
	protected DominioEsp tipoResidencia;
	@Column(length=5)
	protected String quilometragem;
	
	@Column(name="qtd_outros_veiculos")
	protected Integer qtdOutrosVeiculos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public CEP getCepResidencia() {
		return cepResidencia;
	}

	public void setCepResidencia(CEP cepResidencia) {
		this.cepResidencia = cepResidencia;
	}

	public CEP getCepTrabalho() {
		return cepTrabalho;
	}

	public void setCepTrabalho(CEP cepTrabalho) {
		this.cepTrabalho = cepTrabalho;
	}

	public CEP getCepPernoite() {
		return cepPernoite;
	}

	public void setCepPernoite(CEP cepPernoite) {
		this.cepPernoite = cepPernoite;
	}

	public Integer getQtdOutrosVeiculos() {
		return qtdOutrosVeiculos;
	}

	public void setQtdOutrosVeiculos(Integer qtdOutrosVeiculos) {
		this.qtdOutrosVeiculos = qtdOutrosVeiculos;
	}

	public DominioEsp getTipoGaragem() {
		return tipoGaragem;
	}

	public void setTipoGaragem(DominioEsp tipoGaragem) {
		this.tipoGaragem = tipoGaragem;
	}

	public DominioEsp getUtilizacaoVeiculo() {
		return utilizacaoVeiculo;
	}

	public void setUtilizacaoVeiculo(DominioEsp utilizacaoVeiculo) {
		this.utilizacaoVeiculo = utilizacaoVeiculo;
	}

	public DominioEsp getTipoResidencia() {
		return tipoResidencia;
	}

	public void setTipoResidencia(DominioEsp tipoResidencia) {
		this.tipoResidencia = tipoResidencia;
	}

	public String getQuilometragem() {
		return quilometragem;
	}

	public void setQuilometragem(String quilometragem) {
		this.quilometragem = quilometragem;
	}
	
}
