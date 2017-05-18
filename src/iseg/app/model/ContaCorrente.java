package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="CONTA_CORRENTE")
@NamedQueries({
	@NamedQuery(name="getCountContaCorrente", query="SELECT Count(*) FROM ContaCorrente cc"),
	@NamedQuery(name="getContaCorrente", query="SELECT cc FROM ContaCorrente cc"),
	@NamedQuery(name="getContaCorrenteByPessoaId", query = "SELECT e FROM ContaCorrente e WHERE e.pessoa.id = ?0")})
public class ContaCorrente extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CC_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="NOME_BANCO",length=40)
	private String nomeBanco;

	@Column(name="NRO_BANCO",length=4)
	private String nroBanco;
	
	@Column(name="CODIGO_AGENCIA",length=10)
	private String codigoAgencia;

	@Column(name="NRO_CARTAO_CREDITO",length=16)
	private String nroCartaoCredito;

	@Column(name="OPERADORA_CARTAO",length=25)
	private String operadoraCartao;

	@Column(name="CONTA_CORRENTE",length=15)
	private String contaCorrente;

	@Column(name="VALIDADE_CARTAO",length=15)
	private String validadeCartao;

	@ManyToOne
	private Pessoa pessoa;

	private static final long serialVersionUID = 1L;

	public ContaCorrente() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodigoAgencia() {
		return this.codigoAgencia;
	}

	public void setCodigoAgencia(String codigoAgencia) {
		this.codigoAgencia = codigoAgencia;
	}

	public String getNroCartaoCredito() {
		return this.nroCartaoCredito;
	}

	public void setNroCartaoCredito(String nroCartaoCredito) {
		this.nroCartaoCredito = nroCartaoCredito;
	}

	public String getOperadoraCartao() {
		return this.operadoraCartao;
	}

	public void setOperadoraCartao(String operadoraCartao) {
		this.operadoraCartao = operadoraCartao;
	}

	public String getContaCorrente() {
		return this.contaCorrente;
	}

	public void setContaCorrente(String contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	public String getValidadeCartao() {
		return this.validadeCartao;
	}

	public void setValidadeCartao(String validadeCartao) {
		this.validadeCartao = validadeCartao;
	}

	public Pessoa getPessoa() {
		
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public String getNomeBanco() {
		return nomeBanco;
	}

	public void setNomeBanco(String nomeBanco) {
		this.nomeBanco = nomeBanco;
	}

	public String getNroBanco() {
		return nroBanco;
	}

	public void setNroBanco(String nroBanco) {
		this.nroBanco = nroBanco;
	}

}
