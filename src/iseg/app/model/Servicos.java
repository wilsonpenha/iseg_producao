package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;
import iseg.app.persistence.PObject;

import java.io.Serializable;
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
	@NamedQuery(name="getCountServicos", query="SELECT Count(*) FROM Servicos c WHERE c.corretora.id = ?0 and c.seguradora.id = ?1"),
	@NamedQuery(name="getServicos", query = "SELECT c FROM Servicos c WHERE c.corretora.id = ?0 ORDER BY c.descricao"),
	@NamedQuery(name="getServicosBySeguradora", query = "SELECT c FROM Servicos c WHERE c.seguradora.id = ?0 AND c.corretora.id = ?1 ORDER BY c.ramo.nome, c.sequencia"),
	@NamedQuery(name="getServicosByServicosIsegAndSeguradoraAndCorretora", query = "SELECT c FROM Servicos c WHERE c.corretora.id = ?0 AND c.seguradora.id = ?1 AND c.ramo.id = ?2 AND c.servicosIseg.id = ?3 ORDER BY c.sequencia")})
public class Servicos extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SER_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="IS_ATIVA")
	private Boolean isAtiva;

	private String descricao;

	@Column(name="INFORMA_FRANQUIA")
	private Boolean blnInformaFranquia;

	@Column(name="INFORMA_DESCRICAO")
	private Boolean blnInformaDescricao;

	private Long sequencia;

	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;

	@ManyToOne(fetch=LAZY)
	private Ramo ramo;

	@OneToMany(mappedBy="servicos", fetch = LAZY)
	private Set<AutomovelServicos> automovelServicosCollection;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;
	
	@Column(name="codigo_na_seguradora")
	private String codigoNaSeguradora;
	
	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;
	
	private static final long serialVersionUID = 1L;

	public Servicos() {
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
		this.isAtiva = isAtiva;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getBlnInformaFranquia() {
		return blnInformaFranquia;
	}

	public void setBlnInformaFranquia(Boolean blnInformaFranquia) {
		this.blnInformaFranquia = blnInformaFranquia;
	}

	public Boolean getBlnInformaDescricao() {
		return blnInformaDescricao;
	}

	public void setBlnInformaDescricao(Boolean blnInformaDescricao) {
		this.blnInformaDescricao = blnInformaDescricao;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Long getSequencia() {
		return sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public Set<AutomovelServicos> getAutomovelServicosCollection() {
		return this.automovelServicosCollection;
	}

	public void setAutomovelServicosCollection(Set<AutomovelServicos> automovelServicosCollection) {
		this.automovelServicosCollection = automovelServicosCollection;
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

	public ServicosIseg getServicosIseg() {
		return servicosIseg;
	}

	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}

}