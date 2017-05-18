package iseg.app.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="IMOVEL_ACESSORIOS")
public class ImovelAcessorios implements Serializable {
	@Id
	private Long id;

	private String descicao;

	private BigDecimal valor;

	private BigDecimal premio;

	private BigDecimal franquia;

	@ManyToOne
	private Imovel imovel;

	private static final long serialVersionUID = 1L;

	public ImovelAcessorios() {
		super();
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDescicao() {
		return this.descicao;
	}

	public void setDescicao(String descicao) {
		this.descicao = descicao;
	}

	public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public BigDecimal getPremio() {
		return this.premio;
	}

	public void setPremio(BigDecimal premio) {
		this.premio = premio;
	}

	public BigDecimal getFranquia() {
		return this.franquia;
	}

	public void setFranquia(BigDecimal franquia) {
		this.franquia = franquia;
	}

	public Imovel getImovel() {
		return this.imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

}
