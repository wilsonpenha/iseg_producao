package iseg.app.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="pagamentos_repasse")
public class PagamentosRepasse implements Serializable {
	@Id
	private Long id;

	@Column(name="repasse_comissao_id")
	private Long repasseComissaoId;

	@ManyToOne
	private Pagamentos pagamento;

	private static final long serialVersionUID = 1L;

	public PagamentosRepasse() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRepasseComissaoId() {
		return this.repasseComissaoId;
	}

	public void setRepasseComissaoId(Long repasseComissaoId) {
		this.repasseComissaoId = repasseComissaoId;
	}

	public Pagamentos getPagamento() {
		return this.pagamento;
	}

	public void setPagamento(Pagamentos pagamento) {
		this.pagamento = pagamento;
	}

}
