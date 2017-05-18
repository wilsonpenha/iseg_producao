package iseg.app.model;


import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

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
	@NamedQuery(name="getRamo", query="SELECT r FROM Ramo r ORDER BY r.nome"),
	@NamedQuery(name="getSubRamo", query="SELECT r FROM Ramo r WHERE r.subRamo.id = ?0 ORDER BY r.nome"),
	@NamedQuery(name="getCountRamo", query="SELECT Count(*) FROM Ramo r"),
	@NamedQuery(name="getRamoOrdered", query = "SELECT r FROM Ramo r ORDER BY r.nome"),
	@NamedQuery(name="getRamoByCodigoSusep", query = "SELECT r FROM Ramo r WHERE r.codigoSusep = ?0 ORDER BY r.nome"),
	@NamedQuery(name="getRamoByNome", query = "SELECT r FROM Ramo r WHERE r.nome = :nome ORDER BY r.nome")})
public class Ramo extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RAM_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(length=20)
	private String nome;

	@Column(name="CODIGO_SUSEP")
	private Integer codigoSusep;

	@ManyToOne(targetEntity=Ramo.class, fetch = LAZY)
	@JoinColumn(name="sub_ramo_id", referencedColumnName = "id")
	private Ramo subRamo; 

	@Column(name="is_pagto_via_fatura")
	private Boolean isPagtoViaFatura;

	@OneToMany(mappedBy="ramo", fetch = LAZY)
	private List<Proposta> propostaCollection;

	@OneToMany(mappedBy="ramo", fetch = LAZY)
	private List<BorderoLancamento> borderoLancamentoCollection;

	@OneToMany(mappedBy="ramo", fetch = LAZY)
	private List<Coberturas> coberturaCollection;

	public static final Integer AUTOMOVEL = 31;

	public Ramo() {
		super();
	}

	public String getNomeRamoSubRamo(){
		if (this.subRamo!=null && this.subRamo.getId()!=null)
			return this.subRamo.getNome()+"/"+this.getNome();
		else
			return this.nome;
	}
	
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getCodigoSusep() {
		return codigoSusep;
	}

	public void setCodigoSusep(Integer codigoSusep) {
		this.codigoSusep = codigoSusep;
	}

	public List<Proposta> getPropostaCollection() {
		return this.propostaCollection;
	}

	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
	}

	public List<BorderoLancamento> getBorderoLancamentoCollection() {
		return borderoLancamentoCollection;
	}

	public void setBorderoLancamentoCollection(
			List<BorderoLancamento> borderoLancamentoCollection) {
		this.borderoLancamentoCollection = borderoLancamentoCollection;
	}

	public List<Coberturas> getCoberturaCollection() {
		return coberturaCollection;
	}

	public void setCoberturaCollection(List<Coberturas> coberturaCollection) {
		this.coberturaCollection = coberturaCollection;
	}

	public Ramo getSubRamo() {
		return subRamo;
	}

	public void setSubRamo(Ramo subRamo) {
		this.subRamo = subRamo;
	}

	public Boolean getIsPagtoViaFatura() {
		return isPagtoViaFatura;
	}

	public void setIsPagtoViaFatura(Boolean isPagtoViaFatura) {
		this.isPagtoViaFatura = isPagtoViaFatura;
	}
}