package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CEP;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Cascade;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountImoveis", query="SELECT Count(*) FROM Imovel i where i.proposta.id = ?0")
})
public class Imovel extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="IMO_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="TIPO_ENDERECO")
	private Long tipoEndereco;

	@Column(name="LINHA_VAZIA")
	private Boolean linhaVazia;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CEP"))
	private CEP cep;

	private String logradouro;

	private String numero;

	private String complemento;

	private String bairro;

	private String cidade;

	private String uf;

	private String telefone;

	@Column(name="IDADE_DO_IMOVEL")
	private Double idadeDoImovel;

	@Column(name="AREA_CONSTRUIDA")
	private Double areaConstruida;

	@Column(name="TIPO_DO_IMOVEL")
	private Long tipoDoImovel;

	@Column(name="USO_DO_IMOVEL")
	private Long usoDoImovel;

	@Column(name="TIPO_DE_CONSTRUCAO")
	private Long tipoDeConstrucao;

	@Column(name="CLASSE_DE_CONTRUCAO")
	private Long classeDeContrucao;

	private Long ocupante;

	@Column(name="VALOR_DO_ALUGUEL")
	private Double valorDoAluguel;

	@Column(name="TEM_VIGILANCIA")
	private String temVigilancia;

	@Column(name="PORTEIRO_ELETRONICO")
	private String porteiroEletronico;

	private String alarmes;

	@Column(name="SEM_TERRENO_BALDIO")
	private String semTerrenoBaldio;

	@Column(name="GRADES_METALICAS")
	private String gradesMetalicas;

	@Column(name="MURO_FECHADO")
	private String muroFechado;

	@Column(name="VLR_RISCO_PREDIO")
	private Double vlrRiscoPredio;

	@Column(name="VLR_RISCO_INSTALACOES")
	private Double vlrRiscoInstalacoes;

	@Column(name="VLR_RISCO_MAQ_EQUIP")
	private Double vlrRiscoMaqEquip;

	@Column(name="VLR_RISCO_MERCADORIAS")
	private Double vlrRiscoMercadorias;

	@Column(name="DESCRICAO_ATIVIDADES")
	private String descricaoAtividades;

	private String clausulas;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="imovel", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<ImovelCobertura> imovelCoberturaCollection = new ArrayList<ImovelCobertura>();

	@OneToMany(mappedBy="imovel")
	private List<ImovelAcessorios> imovelAcessoriosCollection;

	@OneToMany(mappedBy="imovel")
	private List<ImovelServicos> imovelServicosCollection;

	@ManyToOne(fetch=FetchType.LAZY)
	private Proposta proposta;

/*	@ManyToOne(fetch=LAZY)
	private Seguradora seguradora;
*/
	@Column(name="NRO_APOLICE_ANTERIOR")
	private String nroApoliceAnterior;

	@Column(name="CODIGO_IDENTIFICACAO")
	private String codigoIdentificacao;

	@Column(name="CODIGO_IDENTIFICACAO_ANTERIOR")
	private String codigoIdentificacaoAnterior;

	private String categoria;

	@Column(name="CLASSE_BONUS")
	private String classeBonus;

	private static final long serialVersionUID = 1L;

	public Imovel() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Long getTipoEndereco() {
		return this.tipoEndereco;
	}

	public void setTipoEndereco(Long tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}

	public Boolean getLinhaVazia() {
		return linhaVazia;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
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

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Double getIdadeDoImovel() {
		return this.idadeDoImovel;
	}

	public void setIdadeDoImovel(Double idadeDoImovel) {
		this.idadeDoImovel = idadeDoImovel;
	}

	public Double getAreaConstruida() {
		return this.areaConstruida;
	}

	public void setAreaConstruida(Double areaConstruida) {
		this.areaConstruida = areaConstruida;
	}

	public Long getTipoDoImovel() {
		return this.tipoDoImovel;
	}

	public void setTipoDoImovel(Long tipoDoImovel) {
		this.tipoDoImovel = tipoDoImovel;
	}

	public Long getUsoDoImovel() {
		return this.usoDoImovel;
	}

	public void setUsoDoImovel(Long usoDoImovel) {
		this.usoDoImovel = usoDoImovel;
	}

	public Long getTipoDeConstrucao() {
		return this.tipoDeConstrucao;
	}

	public void setTipoDeConstrucao(Long tipoDeConstrucao) {
		this.tipoDeConstrucao = tipoDeConstrucao;
	}

	public Long getClasseDeContrucao() {
		return this.classeDeContrucao;
	}

	public void setClasseDeContrucao(Long classeDeContrucao) {
		this.classeDeContrucao = classeDeContrucao;
	}

	public Long getOcupante() {
		return this.ocupante;
	}

	public void setOcupante(Long ocupante) {
		this.ocupante = ocupante;
	}

	public Double getValorDoAluguel() {
		return this.valorDoAluguel;
	}

	public void setValorDoAluguel(Double valorDoAluguel) {
		this.valorDoAluguel = valorDoAluguel;
	}

	public String getTemVigilancia() {
		return this.temVigilancia;
	}

	public void setTemVigilancia(String temVigilancia) {
		this.temVigilancia = temVigilancia;
	}

	public String getPorteiroEletronico() {
		return this.porteiroEletronico;
	}

	public void setPorteiroEletronico(String porteiroEletronico) {
		this.porteiroEletronico = porteiroEletronico;
	}

	public String getAlarmes() {
		return this.alarmes;
	}

	public void setAlarmes(String alarmes) {
		this.alarmes = alarmes;
	}

	public String getSemTerrenoBaldio() {
		return this.semTerrenoBaldio;
	}

	public void setSemTerrenoBaldio(String semTerrenoBaldio) {
		this.semTerrenoBaldio = semTerrenoBaldio;
	}

	public String getGradesMetalicas() {
		return this.gradesMetalicas;
	}

	public void setGradesMetalicas(String gradesMetalicas) {
		this.gradesMetalicas = gradesMetalicas;
	}

	public String getMuroFechado() {
		return this.muroFechado;
	}

	public void setMuroFechado(String muroFechado) {
		this.muroFechado = muroFechado;
	}

	public Double getVlrRiscoPredio() {
		return this.vlrRiscoPredio;
	}

	public void setVlrRiscoPredio(Double vlrRiscoPredio) {
		this.vlrRiscoPredio = vlrRiscoPredio;
	}

	public Double getVlrRiscoInstalacoes() {
		return this.vlrRiscoInstalacoes;
	}

	public void setVlrRiscoInstalacoes(Double vlrRiscoInstalacoes) {
		this.vlrRiscoInstalacoes = vlrRiscoInstalacoes;
	}

	public Double getVlrRiscoMaqEquip() {
		return this.vlrRiscoMaqEquip;
	}

	public void setVlrRiscoMaqEquip(Double vlrRiscoMaqEquip) {
		this.vlrRiscoMaqEquip = vlrRiscoMaqEquip;
	}

	public Double getVlrRiscoMercadorias() {
		return this.vlrRiscoMercadorias;
	}

	public void setVlrRiscoMercadorias(Double vlrRiscoMercadorias) {
		this.vlrRiscoMercadorias = vlrRiscoMercadorias;
	}

	public String getDescricaoAtividades() {
		return this.descricaoAtividades;
	}

	public void setDescricaoAtividades(String descricaoAtividades) {
		this.descricaoAtividades = descricaoAtividades;
	}

	public String getClausulas() {
		return this.clausulas;
	}

	public void setClausulas(String clausulas) {
		this.clausulas = clausulas;
	}

	public List<ImovelCobertura> getImovelCoberturaCollection() {
		return this.imovelCoberturaCollection;
	}

	public void setImovelCoberturaCollection(List<ImovelCobertura> imovelCoberturaCollection) {
		this.imovelCoberturaCollection = imovelCoberturaCollection;
	}

	public List<ImovelAcessorios> getImovelAcessoriosCollection() {
		return this.imovelAcessoriosCollection;
	}

	public void setImovelAcessoriosCollection(List<ImovelAcessorios> imovelAcessoriosCollection) {
		this.imovelAcessoriosCollection = imovelAcessoriosCollection;
	}

	public List<ImovelServicos> getImovelServicosCollection() {
		return this.imovelServicosCollection;
	}

	public void setImovelServicosCollection(List<ImovelServicos> imovelServicosCollection) {
		this.imovelServicosCollection = imovelServicosCollection;
	}

	public String getNroApoliceAnterior() {
		return nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public String getCodigoIdentificacao() {
		return codigoIdentificacao;
	}

	public void setCodigoIdentificacao(String codigoIdentificacao) {
		this.codigoIdentificacao = codigoIdentificacao;
	}

	public String getCodigoIdentificacaoAnterior() {
		return codigoIdentificacaoAnterior;
	}

	public void setCodigoIdentificacaoAnterior(String codigoIdentificacaoAnterior) {
		this.codigoIdentificacaoAnterior = codigoIdentificacaoAnterior;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getClasseBonus() {
		return classeBonus;
	}

	public void setClasseBonus(String classeBonus) {
		this.classeBonus = classeBonus;
	}

}
