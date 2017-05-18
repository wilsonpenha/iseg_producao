package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="CAD_CEP")
@NamedQueries({
	@NamedQuery(name="getCountCep", query="SELECT Count(*) FROM Cep c"),
	@NamedQuery(name="getCep", query="SELECT c FROM Cep c ORDER BY c.cep")
})
public class Cep extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEQ_CEP",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="CEP")
	private String cep;

	@Column(name="LOGRADOURO")
	private String logradouro;

	@Column(name="COMPLEMENTO")
	private String complemento;

	@Column(name="BAIRRO")
	private String bairro;

	@Column(name="CIDADE")
	private String cidade;

	@Column(name="UF")
	private String uf;

	public Cep() {
		super();
	}

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
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
}