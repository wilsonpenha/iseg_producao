package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Wilson
 *
 */
@Entity
@Table(name="banco_relacionamento")
@NamedQueries({
	@NamedQuery(name="getBancoRelacionamento", query="SELECT a FROM BancoRelacionamento a ORDER BY a.id ASC")
})
public class BancoRelacionamento extends PObject implements Serializable {

	private static final long serialVersionUID = -2233923538220922646L;

	@Id
	private Long id;
	
	@Column(name="nome")
	private String nome;
	
	@OneToMany(mappedBy="bancoRelacionamento",fetch=FetchType.LAZY)
	private List<TipoContaRelacionamento> tipoContaRelacionamentoCollection;
	
	@Transient
	private Long selecionado;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<TipoContaRelacionamento> getTipoContaRelacionamentoCollection() {
		return tipoContaRelacionamentoCollection;
	}

	public void setTipoContaRelacionamentoCollection(
			List<TipoContaRelacionamento> tipoContaRelacionamentoCollection) {
		this.tipoContaRelacionamentoCollection = tipoContaRelacionamentoCollection;
	}

	public Long getSelecionado() {
		return selecionado;
	}

	public void setSelecionado(Long selecionado) {
		this.selecionado = selecionado;
	}
	
}
