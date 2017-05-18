package iseg.app.model;

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
@Table(name="AUTOMOVEL_COBERTURA")
@NamedQueries({
	@NamedQuery(name="automovelCoberturaFindByAutomovel", query = "SELECT ac FROM AutomovelCobertura ac WHERE ac.automovel.id = ?0 ORDER BY ac.cobertura.sequencia")})
public class AutomovelCobertura extends PObject implements Serializable, Auditable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACL_SEQ", sequenceName = "APP_SEQ")
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
	private Automovel automovel;

	@ManyToOne
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg;

	public AutomovelCobertura() {
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

	public Automovel getAutomovel() {
		return this.automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public Coberturas getCobertura() {
		return cobertura;
	}

	public void setCobertura(Coberturas cobertura) {
		this.cobertura = cobertura;
	}
	
	public PObject getRoot() {
		// TODO Auto-generated method stub
		return this.automovel;
	}

	public Usuario getUsuario() {
		// TODO Auto-generated method stub
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}

}