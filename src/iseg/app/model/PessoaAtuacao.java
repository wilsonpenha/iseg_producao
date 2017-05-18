package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="PESSOA_ATUACAO")
@NamedQueries({
	@NamedQuery(name="getPessoaAtuacao", query="SELECT p FROM PessoaAtuacao p ORDER BY p.pessoa.nome"),
	@NamedQuery(name="getPessoaAtuacaoOrdered", query = "SELECT p FROM PessoaAtuacao p ORDER BY p.pessoa.nome"),
	@NamedQuery(name="getPessoaAtuacaoByPessoa", query = "SELECT p FROM PessoaAtuacao p WHERE  p.pessoa = :pessoaId ORDER BY p.pessoa.nome"),
	@NamedQuery(name="getPessoaAtuacaoByAtuacao", query = "SELECT p FROM PessoaAtuacao p WHERE  p.atuacao = :atuacaoId ORDER BY p.pessoa.nome")})
public class PessoaAtuacao extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PAT_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private static final long serialVersionUID = 1L;

	@ManyToOne
	private Pessoa pessoa;

	@ManyToOne
	private DominioEsp atuacao;

	public PessoaAtuacao() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/** 
	 */
	public Pessoa getPessoa() {
		return this.pessoa;
	}

	/** 
	 */
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	/** 
	 */
	public DominioEsp getAtuacao() {
		return this.atuacao;
	}

	/** 
	 */
	public void setAtuacaoId(DominioEsp atuacao) {
		this.atuacao = atuacao;
	}

}
