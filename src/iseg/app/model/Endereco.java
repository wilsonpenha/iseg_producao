package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CEP;
import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountEnderecoByPessoaId", query="SELECT Count(*) FROM Endereco e WHERE e.pessoa.id = ?0"),
	@NamedQuery(name="getCountEndereco", query="SELECT Count(*) FROM Endereco e"),
	@NamedQuery(name="getEndereco", query = "SELECT e FROM Endereco e"),
	@NamedQuery(name="getEnderecoOrdered", query = "SELECT e FROM Endereco e ORDER BY e.id"),
	@NamedQuery(name="getEnderecoByPessoaIdOrderedDesc", query = "SELECT e FROM Endereco e WHERE e.pessoa.id = ?0 ORDER BY e.id desc"),
	@NamedQuery(name="getEnderecoByPessoaETipo", query = "SELECT e FROM Endereco e WHERE e.pessoa.id = ?0 and tipoEndereco = ?1"),
	@NamedQuery(name="getEnderecoByPessoaId", query = "SELECT e FROM Endereco e WHERE e.pessoa.id = ?0")})
public class Endereco extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="END_SEQ",sequenceName="APP_SEQ")
	private Long id;
	
	@Column(length=50)
	private String bairro;

	@Column(length=35)
	private String cidade;

	@Column(length=2)
	private String uf;

	@Column(length=6)
	private String numero;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CEP"))
	private CEP cep;
	
	@Column(length=60)
	private String logradouro;

	@Column(length=60)
	private String complemento;
	
	@Column(name="TIPO_ENDERECO")
	private String tipoEndereco;
	
	private String telefone;
	
	private String fax;

	private String correspondencia;

	@ManyToOne
	private Pessoa pessoa;

	private static final long serialVersionUID = 1L;

	public Endereco() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public CEP getCep() {
		return this.cep;
	}

	public void setCep(CEP cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}


	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTipoEndereco() {
		return tipoEndereco;
	}

	public void setTipoEndereco(String tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}

	public String getCorrespondencia() {
		return correspondencia;
	}

	public void setCorrespondencia(String correspondencia) {
		this.correspondencia = correspondencia;
	}	

	public String getEnderecoCompleto(){
		return getLogradouro()+", "+getNumero()+" - "+getBairro()+" - "+getCidade()+"/"+getUf()+" - CEP: "+getCep().getValor() + " - Fones : "+getTelefone();
	}
}
