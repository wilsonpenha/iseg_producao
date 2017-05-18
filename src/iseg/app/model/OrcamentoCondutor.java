package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name="orcamento_condutor")
public class OrcamentoCondutor extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="OCDT_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String cnh;

	private String cpf;

	@Column(name="data_1a_habilitacao")
	private Date data1aHabilitacao;

	@Column(name="data_nascimento")
	private Date dataNascimento;

	private String dirige;

	@Column(name="estado_civil")
	private String estadoCivil;

	private Long idade;

	private String nome;

	private String profissao;

	private String sexo;

	private String telefones;

	@Column(name="tempo_habilitacao")
	private Long tempoHabilitacao;

	@Column(name="tipo_condutor")
	private String tipoCondutor;

	@Column(name="uso_semana")
	private Long usoSemana;

	@Column(name="data_venc_habilitacao")
	private Date dataVencHabilitacao;

	@ManyToOne(fetch=LAZY)
	private Usuario usuario;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="orcamento_Seguro_id", referencedColumnName = "id")
	private OrcamentoSeguro orcamentoSeguro;

	private static final long serialVersionUID = 1L;

	public OrcamentoCondutor() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCnh() {
		return this.cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getData1aHabilitacao() {
		return this.data1aHabilitacao;
	}

	public void setData1aHabilitacao(Date data1aHabilitacao) {
		this.data1aHabilitacao = data1aHabilitacao;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getDirige() {
		return this.dirige;
	}

	public void setDirige(String dirige) {
		this.dirige = dirige;
	}

	public String getEstadoCivil() {
		return this.estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public Long getIdade() {
		return this.idade;
	}

	public void setIdade(Long idade) {
		this.idade = idade;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getProfissao() {
		return this.profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getSexo() {
		return this.sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefones() {
		return this.telefones;
	}

	public void setTelefones(String telefones) {
		this.telefones = telefones;
	}

	public Long getTempoHabilitacao() {
		return this.tempoHabilitacao;
	}

	public void setTempoHabilitacao(Long tempoHabilitacao) {
		this.tempoHabilitacao = tempoHabilitacao;
	}

	public String getTipoCondutor() {
		return this.tipoCondutor;
	}

	public void setTipoCondutor(String tipoCondutor) {
		this.tipoCondutor = tipoCondutor;
	}

	public Long getUsoSemana() {
		return this.usoSemana;
	}

	public void setUsoSemana(Long usoSemana) {
		this.usoSemana = usoSemana;
	}

	public Date getDataVencHabilitacao() {
		return this.dataVencHabilitacao;
	}

	public void setDataVencHabilitacao(Date dataVencHabilitacao) {
		this.dataVencHabilitacao = dataVencHabilitacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

}
