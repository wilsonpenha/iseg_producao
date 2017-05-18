package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.sql.Date;
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

@Entity
@Table(name="automovel_proprietario")
@SequenceGenerator(name="seq_automovel_proprietario", sequenceName = "seq_automovel_proprietario")
@NamedQueries({
	@NamedQuery(name="getAutomovelProprietario", query="SELECT a FROM AutomovelProprietario a"),
	@NamedQuery(name="getCountAutomovelProprietario", query="SELECT Count(*) FROM AutomovelProprietario a")
})
public class AutomovelProprietario extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_automovel_proprietario")
	private Long id;

	@Column(name="cpf_ou_cnpj")
	private String cpfOuCnpj;

	@Column(name="nome")
	private String nome;

	@Column(name="telefone")
	private String telefone;

	@Column(name="data_nascimento")
	private Date dataNascimento;

	@Column(name="tempo_habilitacao")
	private String tempoHabilitacao;

	@Column(name="tipo_pessoa")
	private String tipoPessoa;

	@ManyToOne
	@JoinColumn(name="automovel_orcamento_id")
	private AutomovelOrcamento automovelOrcamento;
	
	@ManyToOne
	@JoinColumn(name="automovel_id")
	private Automovel automovel;

	private static final long serialVersionUID = 1L;

	public AutomovelProprietario() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCpfOuCnpj() {
		return this.cpfOuCnpj;
	}

	public void setCpfOuCnpj(String cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getTempoHabilitacao() {
		return this.tempoHabilitacao;
	}

	public void setTempoHabilitacao(String tempoHabilitacao) {
		this.tempoHabilitacao = tempoHabilitacao;
	}

	public String getTipoPessoa() {
		return this.tipoPessoa;
	}

	public void setTipoPessoa(String tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public AutomovelOrcamento getAutomovelOrcamento() {
		return this.automovelOrcamento;
	}

	public void setAutomovelOrcamento(AutomovelOrcamento automovelOrcamento) {
		this.automovelOrcamento = automovelOrcamento;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

}
