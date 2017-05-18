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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="seguradora_servicos")
@SequenceGenerator(name="seq_seguradora_servicos", sequenceName = "seq_seguradora_servicos")
@NamedQueries({
	@NamedQuery(name="getSeguradoraServicos", query="SELECT a FROM SeguradoraServicos a"),
	@NamedQuery(name="getCountSeguradoraServicos", query="SELECT Count(*) FROM SeguradoraServicos a")
})
public class SeguradoraServicos extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_seguradora_servicos")
	private Long id;

	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;

	@Column(name="descricao_seguradora")
	private String descricaoSeguradora;

	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;

	private static final long serialVersionUID = 1L;

	public SeguradoraServicos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getDescricaoSeguradora() {
		return this.descricaoSeguradora;
	}

	public void setDescricaoSeguradora(String descricaoSeguradora) {
		this.descricaoSeguradora = descricaoSeguradora;
	}

	public ServicosIseg getServicosIseg() {
		return this.servicosIseg;
	}

	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}

}
