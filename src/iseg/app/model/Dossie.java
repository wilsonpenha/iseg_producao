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
import javax.persistence.SequenceGenerator;


@Entity
public class Dossie extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="DOS_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="HISTORICO_DA_PESSOA")
	private String historicoDaPessoa;

	@ManyToOne
	@JoinColumn(name="TIPO_INFORMACAO_ID")
	private DominioEsp tipoInformacao;

	@ManyToOne
	private Pessoa pessoa;

	@ManyToOne
	private Seguradora seguradora;

	private static final long serialVersionUID = 1L;

	public Dossie() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getHistoricoDaPessoa() {
		return this.historicoDaPessoa;
	}

	public void setHistoricoDaPessoa(String historicoDaPessoa) {
		this.historicoDaPessoa = historicoDaPessoa;
	}

	public DominioEsp getTipoInformacao() {
		return this.tipoInformacao;
	}

	public void setTipoInformacao(DominioEsp tipoInformacao) {
		this.tipoInformacao = tipoInformacao;
	}

	public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}
}