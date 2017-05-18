package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="orcamento_cobertura")
@SequenceGenerator(name="seq_orcamento_cobertura", sequenceName = "seq_orcamento_cobertura")
@NamedQueries({
	@NamedQuery(name="getOrcamentoCobertura", query="SELECT a FROM OrcamentoCobertura a"),
	@NamedQuery(name="getCountOrcamentoCobertura", query="SELECT Count(*) FROM OrcamentoCobertura a")
})
@SqlResultSetMapping(
    name = "OrcamentoCobertura",
    entities = @EntityResult(entityClass = OrcamentoCobertura.class),
    columns = {
    		@ColumnResult(name = "CoberturaId")
 })
public class OrcamentoCobertura extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_cobertura")
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
	@JoinColumn(name="coberturas_id")
	private Coberturas coberturas;

	@ManyToOne
	@JoinColumn(name="orcamento_seguradora_id")
	private OrcamentoSeguradora orcamentoSeguradora;
	
	@ManyToOne
	@JoinColumn(name="coberturas_iseg_id")
	private CoberturasIseg coberturasIseg;
	
	@Transient
	private Long coberturaId;
	
	@Transient
	private List<CoberturasIseg> coberturasIsegList = new ArrayList<CoberturasIseg>();
	
	@Transient
	private List<Coberturas> coberturasList = new ArrayList<Coberturas>();

	private static final long serialVersionUID = 1L;

	public OrcamentoCobertura() {
		super();
	}

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

	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
	}

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return orcamentoSeguradora;
	}

	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}

	public Long getCoberturaId() {
		return coberturaId;
	}

	public void setCoberturaId(Long coberturaId) {
		this.coberturaId = coberturaId;
	}

	public List<CoberturasIseg> getCoberturasIsegList() {
		return coberturasIsegList;
	}

	public void setCoberturasIsegList(List<CoberturasIseg> coberturasIsegList) {
		this.coberturasIsegList = coberturasIsegList;
	}

	public List<Coberturas> getCoberturasList() {
		return coberturasList;
	}

	public void setCoberturasList(List<Coberturas> coberturasList) {
		this.coberturasList = coberturasList;
	}
	
}
