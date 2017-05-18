package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name="RISCO_TRANSPORTES")
public class RiscoTransportes extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RTR_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="DESCRICAO_RISCO")
	private String descricaoRisco; 

	@ManyToOne
	@JoinColumn(name="PROPOSTA_ID")
	private Proposta proposta;
	
	@ManyToOne
	@JoinColumn(name="SEGURADORA_ID")
	private Seguradora seguradora;

	@Column(name="NRO_APOLICE_ANTERIOR")
	private String nroApoliceAnterior;

	@Column(name="INI_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date iniVigApoliceAnterior;

	@Column(name="FIM_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date fimVigApoliceAnterior;

	private String renovacao;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="riscoTransportes", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<TransporteCoberturas> transporteCoberturasCollection = new ArrayList<TransporteCoberturas>();

	private static final long serialVersionUID = 1L;

	public RiscoTransportes() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getNroApoliceAnterior() {
		return this.nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public Date getIniVigApoliceAnterior() {
		return this.iniVigApoliceAnterior;
	}

	public void setIniVigApoliceAnterior(Date iniVigApoliceAnterior) {
		this.iniVigApoliceAnterior = iniVigApoliceAnterior;
	}

	public Date getFimVigApoliceAnterior() {
		return this.fimVigApoliceAnterior;
	}

	public void setFimVigApoliceAnterior(Date fimVigApoliceAnterior) {
		this.fimVigApoliceAnterior = fimVigApoliceAnterior;
	}

	public String getRenovacao() {
		return this.renovacao;
	}

	public void setRenovacao(String renovacao) {
		this.renovacao = renovacao;
	}

	public void setDescricaoRisco(String descricaoRisco) {
		this.descricaoRisco = descricaoRisco;
	}

	public String getDescricaoRisco() {
		return descricaoRisco;
	}

	public List<TransporteCoberturas> getTransporteCoberturasCollection() {
		return transporteCoberturasCollection;
	}

	public void setTransporteCoberturasCollection(
			List<TransporteCoberturas> transporteCoberturasCollection) {
		this.transporteCoberturasCollection = transporteCoberturasCollection;
	}
}