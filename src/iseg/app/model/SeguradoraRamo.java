package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="seguradora_ramo")
@NamedQueries({
	@NamedQuery(name="getSeguradoraRamoByCodigoNaSeguradoraAndSeguradora", query="SELECT a FROM SeguradoraRamo a WHERE a.codigoNaSeguradora = ?0 AND a.seguradora.id = ?1")
})
public class SeguradoraRamo extends PObject implements Serializable{

	private static final long serialVersionUID = -6350893151516753031L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	@Column(name="codigo_na_seguradora")
	private String codigoNaSeguradora;
	
	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;
	
	@ManyToOne
	@JoinColumn(name="ramo_id")
	private Ramo ramo;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCodigoNaSeguradora() {
		return codigoNaSeguradora;
	}
	public void setCodigoNaSeguradora(String codigoNaSeguradora) {
		this.codigoNaSeguradora = codigoNaSeguradora;
	}
	public Seguradora getSeguradora() {
		return seguradora;
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
}
