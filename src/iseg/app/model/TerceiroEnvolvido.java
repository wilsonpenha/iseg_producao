package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="TERCEIRO_ENVOLVIDO")
public class TerceiroEnvolvido extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="TEC_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@Column(name="CPF_OU_CNPJ")
	private String cpfOuCnpj;

	@Column(name="TELEFONE_PREFERENCIAL")
	private String telefonePreferencial;

	@Column(name="TELEFONE_ALTERNATIVO")
	private String telefoneAlternativo;

	@Column(name="TELEFONE_CELULAR")
	private String telefoneCelular;

	private String uf;

	private String logradouro;

	private String numero;

	private String complemento;

	private String bairro;

	private String cidade;

	private String cep;

	@Column(name="TIPO_ENDERECO")
	private String tipoEndereco;

	private String condutor;

	@Column(name="CONDUTOR_CPF")
	private String condutorCpf;

	@Column(name="DATA_NASCIMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	private String cnh;

	@Column(name="VEICULO_ENVOLVIDO")
	private String veiculoEnvolvido;

	private String cor;

	@Column(name="ANO_FABRICACAO")
	private String anoFabricacao;

	@Column(name="ANO_MODELO")
	private String anoModelo;

	private String placa;

	private String avarias;

	@ManyToOne
	private Sinistro sinistro;

	@ManyToOne
	private Oficina oficina;

	private static final long serialVersionUID = 1L;

	public TerceiroEnvolvido() {
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

	public String getTelefonePreferencial() {
		return this.telefonePreferencial;
	}

	public void setTelefonePreferencial(String telefonePreferencial) {
		this.telefonePreferencial = telefonePreferencial;
	}

	public String getTelefoneAlternativo() {
		return this.telefoneAlternativo;
	}

	public void setTelefoneAlternativo(String telefoneAlternativo) {
		this.telefoneAlternativo = telefoneAlternativo;
	}

	public String getTelefoneCelular() {
		return this.telefoneCelular;
	}

	public void setTelefoneCelular(String telefoneCelular) {
		this.telefoneCelular = telefoneCelular;
	}

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTipoEndereco() {
		return this.tipoEndereco;
	}

	public void setTipoEndereco(String tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}

	public String getCondutor() {
		return this.condutor;
	}

	public void setCondutor(String condutor) {
		this.condutor = condutor;
	}

	public String getCondutorCpf() {
		return this.condutorCpf;
	}

	public void setCondutorCpf(String condutorCpf) {
		this.condutorCpf = condutorCpf;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getCnh() {
		return this.cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public String getVeiculoEnvolvido() {
		return this.veiculoEnvolvido;
	}

	public void setVeiculoEnvolvido(String veiculoEnvolvido) {
		this.veiculoEnvolvido = veiculoEnvolvido;
	}

	public String getCor() {
		return this.cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getAnoFabricacao() {
		return this.anoFabricacao;
	}

	public void setAnoFabricacao(String anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}

	public String getAnoModelo() {
		return this.anoModelo;
	}

	public void setAnoModelo(String anoModelo) {
		this.anoModelo = anoModelo;
	}

	public String getPlaca() {
		return this.placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getAvarias() {
		return this.avarias;
	}

	public void setAvarias(String avarias) {
		this.avarias = avarias;
	}

	public Sinistro getSinistro() {
		return this.sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
	}

	public Oficina getOficina() {
		return this.oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
	}

}
