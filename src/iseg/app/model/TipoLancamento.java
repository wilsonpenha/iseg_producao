package iseg.app.model;

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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="tipo_lancamento")
public class TipoLancamento extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="TLCT_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@Column(name="is_apolice")
	private Boolean isApolice;

	@Column(name="is_bonus")
	private Boolean isBonus;

	@Column(name="is_negativo")
	private Boolean isNegativo;

	@ManyToOne
	@JoinColumn(name="tipo_lancamento_estorno_id")
	private TipoLancamento tipoLancamentoEstorno;

	@OneToMany(mappedBy="tipoLancamento")
	private List<CorretoraTipoLancamento> corretoraTipoLancamentoCollection;

	private static final long serialVersionUID = 1L;

	public TipoLancamento() {
		super();
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

	public Boolean getIsApolice() {
		return this.isApolice;
	}

	public void setIsApolice(Boolean isApolice) {
		this.isApolice = isApolice;
	}

	public List<CorretoraTipoLancamento> getCorretoraTipoLancamentoCollection() {
		return this.corretoraTipoLancamentoCollection;
	}

	public void setCorretoraTipoLancamentoCollection(List<CorretoraTipoLancamento> corretoraTipoLancamentoCollection) {
		this.corretoraTipoLancamentoCollection = corretoraTipoLancamentoCollection;
	}

	public Boolean getIsBonus() {
		return isBonus;
	}

	public void setIsBonus(Boolean isBonus) {
		this.isBonus = isBonus;
	}

	public Boolean getIsNegativo() {
		return isNegativo;
	}

	public void setIsNegativo(Boolean isNegativo) {
		this.isNegativo = isNegativo;
	}

	public TipoLancamento getTipoLancamentoEstorno() {
		return tipoLancamentoEstorno;
	}

	public void setTipoLancamentoEstorno(TipoLancamento tipoLancamentoEstorno) {
		this.tipoLancamentoEstorno = tipoLancamentoEstorno;
	}

}
