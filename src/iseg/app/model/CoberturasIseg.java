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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="coberturas_iseg")
@SequenceGenerator(name="seq_cobertura_iseg", sequenceName = "seq_cobertura_iseg")
@NamedQueries({
	@NamedQuery(name="getCoberturasIseg", query="SELECT a FROM CoberturasIseg a WHERE a.isAtiva = ?0 ORDER BY a.sequencia"),
	@NamedQuery(name="getCountCoberturasIseg", query="SELECT Count(*) FROM CoberturasIseg a")
})
public class CoberturasIseg extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_cobertura_iseg")
	private Long id;

	@Column(name="informa_franquia")
	private Boolean informaFranquia;

	@Column(name="descricao")
	private String descricao;
	
	@Column(name="nome_longo")
	private String nomeLongo;
	
	@Column(name="informacao")
	private String informacao;

	@Column(name="sequencia")
	private Long sequencia;

	@Column(name="tipo_cobertura")
	private String tipoCobertura;

	@Column(name="status")
	private String status;

	@Column(name="is_ativa")
	private Boolean isAtiva;

	@ManyToOne
	@JoinColumn(name="ramo_id")
	private Ramo ramo;

	@OneToMany(mappedBy="coberturasIseg")
	private List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegCollection;

	@Transient
	private List<Coberturas> coberturasCollection = new ArrayList<Coberturas>();
	
	private static final long serialVersionUID = 1L;

	public CoberturasIseg() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getInformaFranquia() {
		return this.informaFranquia;
	}

	public void setInformaFranquia(Boolean informaFranquia) {
		this.informaFranquia = informaFranquia;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNomeLongo() {
		return nomeLongo;
	}

	public void setNomeLongo(String nomeLongo) {
		this.nomeLongo = nomeLongo;
	}

	public String getInformacao() {
		return informacao;
	}

	public void setInformacao(String informacao) {
		this.informacao = informacao;
	}

	public Long getSequencia() {
		return this.sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public String getTipoCobertura() {
		return this.tipoCobertura;
	}

	public void setTipoCobertura(String tipoCobertura) {
		this.tipoCobertura = tipoCobertura;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getIsAtiva() {
		return this.isAtiva;
	}

	public void setIsAtiva(Boolean isAtiva) {
		this.isAtiva = isAtiva;
	}

	public Ramo getRamo() {
		return this.ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public List<OrcamentoCoberturaIseg> getOrcamentoCoberturaIsegCollection() {
		return orcamentoCoberturaIsegCollection;
	}

	public void setOrcamentoCoberturaIsegCollection(
			List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegCollection) {
		this.orcamentoCoberturaIsegCollection = orcamentoCoberturaIsegCollection;
	}

	public List<Coberturas> getCoberturasCollection() {
		return coberturasCollection;
	}

	public void setCoberturasCollection(List<Coberturas> coberturasCollection) {
		this.coberturasCollection = coberturasCollection;
	}
}
