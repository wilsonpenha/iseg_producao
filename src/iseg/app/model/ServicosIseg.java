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
@Table(name="servicos_iseg")
@SequenceGenerator(name="seq_servicos_iseg", sequenceName = "seq_servicos_iseg")
@NamedQueries({
	@NamedQuery(name="getServicosIseg", query="SELECT a FROM ServicosIseg a WHERE a.isAtiva = ?0 ORDER BY a.sequencia"),
	@NamedQuery(name="getCountServicosIseg", query="SELECT Count(*) FROM ServicosIseg a")
})
public class ServicosIseg extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_servicos_iseg")
	private Long id;

	@Column(name="informa_descricao")
	private Boolean informaDescricao;

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

	@Column(name="status")
	private String status;

	@Column(name="is_ativa")
	private Boolean isAtiva;

	@ManyToOne
	@JoinColumn(name="ramo_id")
	private Ramo ramo;

	@OneToMany(mappedBy="servicosIseg")
	private List<OrcamentoServicosIseg> orcamentoServicosIsegCollection;
	
	@Transient
	private List<Servicos> servicosCollection = new ArrayList<Servicos>();

	private static final long serialVersionUID = 1L;

	public ServicosIseg() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getInformaDescricao() {
		return this.informaDescricao;
	}

	public void setInformaDescricao(Boolean informaDescricao) {
		this.informaDescricao = informaDescricao;
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
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public List<OrcamentoServicosIseg> getOrcamentoServicosIsegCollection() {
		return orcamentoServicosIsegCollection;
	}

	public void setOrcamentoServicosIsegCollection(
			List<OrcamentoServicosIseg> orcamentoServicosIsegCollection) {
		this.orcamentoServicosIsegCollection = orcamentoServicosIsegCollection;
	}

	public List<Servicos> getServicosCollection() {
		return servicosCollection;
	}

	public void setServicosCollection(List<Servicos> servicosCollection) {
		this.servicosCollection = servicosCollection;
	}
	
}
