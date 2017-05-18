package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="orcamento_cobertura_iseg")
@SequenceGenerator(name="seq_orcamento_cobertura_iseg", sequenceName = "seq_orcamento_cobertura_iseg")
@NamedQueries({
	@NamedQuery(name="getOrcamentoCoberturaIseg", query="SELECT a FROM OrcamentoCoberturaIseg a"),
	@NamedQuery(name="getOrcamentoCoberturaIsegById", query="SELECT a FROM OrcamentoCoberturaIseg a WHERE a.id = ?0"),
	@NamedQuery(name="getOrcamentoCoberturaIsegByOrcamentoSeguro", query="SELECT a FROM OrcamentoCoberturaIseg a WHERE a.orcamentoSeguro.id = ?0"),
	@NamedQuery(name="getCountOrcamentoCoberturaIseg", query="SELECT Count(*) FROM OrcamentoCoberturaIseg a"),
	@NamedQuery(name="deleteOrcamentoCoberturaIsegById", query="DELETE FROM OrcamentoCoberturaIseg a WHERE a.id = ?0")
})
public class OrcamentoCoberturaIseg extends PObject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9012708363719839545L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_cobertura_iseg")
	private Long id;

	@Column(name="franquia")
	private Double franquia;

	@Column(name="lmi")
	private Double lmi;

	@Column(name="premio")
	private Double premio;

	@Column(name="texto_franquia")
	private String textoFranquia;

	@Column(name="descricao")
	private String descricao;

	@Column(name="informa_franquia")
	private Boolean informaFranquia;

	@Column(name="sequencia")
	private Long sequencia;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@Column(name="cobertura_contratada")
	private String coberturaContratada;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro;
	
	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg;
	
	@Transient
	private List<Coberturas> coberturasList = new ArrayList<Coberturas>();
	
	@Transient
	private List<CoberturasIseg> coberturasIsegList = new ArrayList<CoberturasIseg>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getFranquia() {
		return franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public Double getLmi() {
		return lmi;
	}

	public void setLmi(Double lmi) {
		this.lmi = lmi;
	}

	public Double getPremio() {
		return premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public String getTextoFranquia() {
		return textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getInformaFranquia() {
		return informaFranquia;
	}

	public void setInformaFranquia(Boolean informaFranquia) {
		this.informaFranquia = informaFranquia;
	}

	public Long getSequencia() {
		return sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getCoberturaContratada() {
		return coberturaContratada;
	}

	public void setCoberturaContratada(String coberturaContratada) {
		this.coberturaContratada = coberturaContratada;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}

	public List<Coberturas> getCoberturasList() {
		return coberturasList;
	}

	public void setCoberturasList(List<Coberturas> coberturasList) {
		this.coberturasList = coberturasList;
	}

	public List<CoberturasIseg> getCoberturasIsegList() {
		return coberturasIsegList;
	}

	public void setCoberturasIsegList(List<CoberturasIseg> coberturasIsegList) {
		this.coberturasIsegList = coberturasIsegList;
	}
	
}
