package iseg.app.model;

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
import javax.persistence.Transient;

import iseg.app.persistence.PObject;

@Entity
@Table(name="acessorios")
@SequenceGenerator(name="seq_acessorios", sequenceName = "seq_acessorios")
@NamedQueries({
	@NamedQuery(name="getAcessorios", query="SELECT a FROM Acessorios a"),
	@NamedQuery(name="getCountAcessorios", query="SELECT Count(*) FROM Acessorios a")
})
public class Acessorios extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_acessorios")
	private Long id;

	@ManyToOne
	@JoinColumn(name="tipo_acessorio_id")
	private DominioEsp tipoAcessorio;

	@Column(name="descricao")
	private String descricao;
	
	@Transient
	private Long idSelecionado;

	private static final long serialVersionUID = 1L;

	public Acessorios() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public DominioEsp getTipoAcessorio() {
		return tipoAcessorio;
	}

	public void setTipoAcessorio(DominioEsp tipoAcessorio) {
		this.tipoAcessorio = tipoAcessorio;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Long getIdSelecionado() {
		return idSelecionado;
	}

	public void setIdSelecionado(Long idSelecionado) {
		this.idSelecionado = idSelecionado;
	}

}
