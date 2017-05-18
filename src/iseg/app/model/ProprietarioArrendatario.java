package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="proprietario_arrendatario")
@SequenceGenerator(name="seq_proprietario_arrendatario", sequenceName = "seq_proprietario_arrendatario")
@NamedQueries({
	@NamedQuery(name="getProprietarioArrendatario", query="SELECT a FROM ProprietarioArrendatario a"),
	@NamedQuery(name="getCountProprietarioArrendatario", query="SELECT Count(*) FROM ProprietarioArrendatario a")
})
public class ProprietarioArrendatario extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_proprietario_arrendatario")
	private Long id;

	@Column(name="nome")
	private String nome;

	@Column(name="cpf_ou_cnpj")
	private String cpfOuCnpj;

	@Column(name="telefone")
	private String telefone;

	@Column(name="data_nascimento")
	private Date dataNascimento;

	@Column(name="tempo_habilitacao")
	private Integer tempoHabilitacao;
	
	@Column(name="tipo_pessoa")
	private Integer tipoPessoa;

	@ManyToOne
	@JoinColumn(name="relacao_seg_prop_id")
	private DominioEsp relacaoSeguradoProprietario;

	private static final long serialVersionUID = 1L;

	public ProprietarioArrendatario() {
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

	public String getCpfOuCnpj() {
		return this.cpfOuCnpj;
	}

	public void setCpfOuCnpj(String cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
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

	public Integer getTempoHabilitacao() {
		return tempoHabilitacao;
	}

	public void setTempoHabilitacao(Integer tempoHabilitacao) {
		this.tempoHabilitacao = tempoHabilitacao;
	}

	public Integer getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(Integer tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public DominioEsp getRelacaoSeguradoProprietario() {
		return relacaoSeguradoProprietario;
	}

	public void setRelacaoSeguradoProprietario(
			DominioEsp relacaoSeguradoProprietario) {
		this.relacaoSeguradoProprietario = relacaoSeguradoProprietario;
	}
}
