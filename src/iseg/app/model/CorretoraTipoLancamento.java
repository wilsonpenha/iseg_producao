package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="corretora_tipo_lancamento")
@NamedQueries({
	@NamedQuery(name="getCountCorretoraTipoLancamentoByCorretora", query="SELECT Count(*) FROM CorretoraTipoLancamento b where b.corretora.id = ?0"),
	@NamedQuery(name="getCorretoraTipoLancamentoByCorretora", query="SELECT b FROM CorretoraTipoLancamento b where b.corretora.id = ?0"),
	@NamedQuery(name="getCorretoraTipoLancamentoByTipoLancamentoAndCorretora", query="SELECT b FROM CorretoraTipoLancamento b where b.tipoLancamento.id = ?0 and b.corretora.id = ?1"),
	@NamedQuery(name="getCorretoraTipoLancamento", query="SELECT b FROM CorretoraTipoLancamento b")
	})
public class CorretoraTipoLancamento extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CTL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	private Corretora corretora;

	@Column(name="is_repasse")
	private Boolean isRepasse;

	@ManyToOne
	@JoinColumn(name="tipo_lancamento_id")
	private TipoLancamento tipoLancamento;

	private static final long serialVersionUID = 1L;

	public CorretoraTipoLancamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Corretora getCorretora() {
		return this.corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Boolean getIsRepasse() {
		return this.isRepasse;
	}

	public void setIsRepasse(Boolean isRepasse) {
		this.isRepasse = isRepasse;
	}

	public TipoLancamento getTipoLancamento() {
		return this.tipoLancamento;
	}

	public void setTipoLancamento(TipoLancamento tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

}
