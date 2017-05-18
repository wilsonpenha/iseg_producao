package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountCoberturas", query="SELECT Count(*) FROM Coberturas c WHERE c.corretora.id = ?0 and c.seguradora.id = ?1"),
	@NamedQuery(name="getCoberturas", query = "SELECT c FROM Coberturas c WHERE c.corretora.id = ?0 ORDER BY c.descricao"),
	@NamedQuery(name="getCoberturasBySeguradora", query = "SELECT c FROM Coberturas c WHERE c.seguradora.id = ?0 and c.corretora.id = ?1 ORDER BY c.ramo.nome, c.sequencia"),
	@NamedQuery(name="getCoberturasByCoberturasIsegAndSeguradoraAndCorretora", query = "SELECT c FROM Coberturas c WHERE c.corretora.id = ?0 AND c.seguradora.id = ?1 AND c.ramo.id = ?2 AND c.coberturasIseg.id = ?3 ORDER BY c.sequencia")
	})
public class Coberturas extends PObject implements Serializable, AtributoCorretora {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="COB_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="IS_ATIVA")
	private Boolean isAtiva;

	private String descricao;

	@Column(name="TIPO_COBERTURA")
	private String tipoCobertura;

	private Integer sequencia;

	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;

	@ManyToOne(fetch=LAZY)
	private Ramo ramo;

	@Column(name="INFORMA_FRANQUIA")
	private Boolean blnInformaFranquia;

	@OneToMany(mappedBy="cobertura", fetch = LAZY)
	private Set<AutomovelCobertura> automovelCoberturaCollection;
	
	@ManyToOne(fetch=LAZY)
	private Corretora corretora;
	
	@Column(name="codigo_na_seguradora")
	private String codigoNaSeguradora;
	
	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg; 
	
	public Coberturas() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getIsAtiva() {
		return this.isAtiva;
	}

	public void setIsAtiva(Boolean isAtiva) {
		this.isAtiva = isAtiva==null ? false : isAtiva;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Set<AutomovelCobertura> getAutomovelCoberturaCollection() {
		return automovelCoberturaCollection;
	}

	public void setAutomovelCoberturaCollection(Set<AutomovelCobertura> automovelCoberturaCollection) {
		this.automovelCoberturaCollection = automovelCoberturaCollection;
	}

	public String getTipoCobertura() {
		return tipoCobertura;
	}

	public void setTipoCobertura(String tipoCobertura) {
		this.tipoCobertura = tipoCobertura;
	}

	public Boolean getBlnInformaFranquia() {
		return blnInformaFranquia;
	}

	public void setBlnInformaFranquia(Boolean blnInformaFranquia) {
		this.blnInformaFranquia = blnInformaFranquia;
	}

	public Integer getSequencia() {
		return sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public String getCodigoNaSeguradora() {
		return codigoNaSeguradora;
	}

	public void setCodigoNaSeguradora(String codigoNaSeguradora) {
		this.codigoNaSeguradora = codigoNaSeguradora;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}
	
}