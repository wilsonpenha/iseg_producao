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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name="segurado_individual")
public class SeguradoIndividual extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEIN_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=FetchType.LAZY)
	private Proposta proposta;

	private String conjuge;

	@Temporal(TemporalType.DATE)
	@Column(name="data_nascimento_conj")
	private Date dataNascimentoConj;

	@Column(name="sexo_conjuge")
	private String sexoConjuge;

	private String plano;

	@Column(name="linha_vazia")
	private Boolean linhaVazia;

	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;

	@Column(name="nro_apolice_anterior")
	private String nroApoliceAnterior;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="seguradoIndividual", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<SegIndividualCoberturas> segIndividualCoberturasCollection = new ArrayList<SegIndividualCoberturas>();

	@OneToMany(cascade={CascadeType.REMOVE}, mappedBy="seguradoIndividual", fetch=LAZY)
	private List<BeneficiarioIndividual> beneficiarioIndividualCollection;

	private static final long serialVersionUID = 1L;

	public SeguradoIndividual() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getConjuge() {
		return this.conjuge;
	}

	public void setConjuge(String conjuge) {
		this.conjuge = conjuge;
	}

	public Date getDataNascimentoConj() {
		return this.dataNascimentoConj;
	}

	public void setDataNascimentoConj(Date dataNascimentoConj) {
		this.dataNascimentoConj = dataNascimentoConj;
	}

	public String getSexoConjuge() {
		return this.sexoConjuge;
	}

	public void setSexoConjuge(String sexoConjuge) {
		this.sexoConjuge = sexoConjuge;
	}

	public String getPlano() {
		return this.plano;
	}

	public void setPlano(String plano) {
		this.plano = plano;
	}

	public Boolean getLinhaVazia() {
		return this.linhaVazia;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
	}

	public String getNroApoliceAnterior() {
		return this.nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
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

	public List<SegIndividualCoberturas> getSegIndividualCoberturasCollection() {
		return segIndividualCoberturasCollection;
	}

	public void setSegIndividualCoberturasCollection(
			List<SegIndividualCoberturas> segIndividualCoberturasCollection) {
		this.segIndividualCoberturasCollection = segIndividualCoberturasCollection;
	}

	public List<BeneficiarioIndividual> getBeneficiarioIndividualCollection() {
		return beneficiarioIndividualCollection;
	}

	public void setBeneficiarioIndividualCollection(
			List<BeneficiarioIndividual> beneficiarioIndividualCollection) {
		this.beneficiarioIndividualCollection = beneficiarioIndividualCollection;
	}
}
