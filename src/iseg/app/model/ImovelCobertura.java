package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="IMOVEL_COBERTURA")
@NamedQueries({
	@NamedQuery(name="imovelCoberturaFindByImovel", query = "SELECT ac FROM ImovelCobertura ac WHERE ac.imovel.id = ?0 ORDER BY ac.sequencia")})
public class ImovelCobertura extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ICL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String descricao;
	
	private Double franquia;

	@Column(name="INFORMA_FRANQUIA")
	private Boolean blnInformaFranquia;

	private Double premio;

	private Double lmi;

	@Column(name="TEXTO_FRANQUIA")
	private String textoFranquia;

	private Integer sequencia;

	@ManyToOne
	private Coberturas cobertura; 

	@ManyToOne
	private Imovel imovel;

	public ImovelCobertura() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Double getFranquia() {
		return this.franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public Double getPremio() {
		return this.premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public Boolean getBlnInformaFranquia() {
		return blnInformaFranquia;
	}

	public void setBlnInformaFranquia(Boolean blnInformaFranquia) {
		this.blnInformaFranquia = blnInformaFranquia;
	}

	public Double getLmi() {
		return this.lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public String getTextoFranquia() {
		return textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public Integer getSequencia() {
		return sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}

	public Imovel getImovel() {
		return this.imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

	public Coberturas getCobertura() {
		return cobertura;
	}

	public void setCobertura(Coberturas cobertura) {
		this.cobertura = cobertura;
	}
}
