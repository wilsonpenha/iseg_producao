package iseg.app.model;

import java.io.Serializable;

import iseg.app.persistence.PObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="escolaridade")
@NamedQueries({
	@NamedQuery(name="getEscolaridade", query="SELECT a FROM Escolaridade a")
})
public class Escolaridade extends PObject implements Serializable{

	private static final long serialVersionUID = -7693704774311569079L;

	@Id
	private Long id;
	
	@Column(name="descricao")
	private String descricao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
}
