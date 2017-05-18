package iseg.app.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import iseg.app.persistence.PObject;

@Entity
@Table(name="tipo_conta_relacionamento")
@NamedQueries({
	@NamedQuery(name="getTipoContaRelacionamento", query="SELECT a FROM TipoContaRelacionamento a")
})
public class TipoContaRelacionamento extends PObject implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	private Long id;
	
	@Column(name="descricao")
	private String descricao;

	@ManyToOne
	@JoinColumn(name="banco_relacionamento_id")
	private BancoRelacionamento bancoRelacionamento; 

	@Column(name="COD_BRADESCO")
	private Integer codBradesco;

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

	public BancoRelacionamento getBancoRelacionamento() {
		return bancoRelacionamento;
	}

	public void setBancoRelacionamento(BancoRelacionamento bancoRelacionamento) {
		this.bancoRelacionamento = bancoRelacionamento;
	}

	public Integer getCodBradesco() {
		return codBradesco;
	}

	public void setCodBradesco(Integer codBradesco) {
		this.codBradesco = codBradesco;
	}

}