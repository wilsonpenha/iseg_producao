package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="((:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCountSinistro", query="SELECT Count(*) FROM Sinistro s"),
	@NamedQuery(name="getSinistro", query="SELECT s FROM Sinistro s ORDER BY s.nroSinistroSeg"),
	@NamedQuery(name="getSinistroOrdered", query="SELECT s FROM Sinistro s ORDER BY s.nroSinistroSeg")})
public class Sinistro extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SIN_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	private Proposta proposta;

	@Column(name="NRO_PROPOSTA")
	private Long nroProposta;

	@Column(name="NRO_APOLICE")
	private String nroApolice;

	private Long ordem;

	@Column(name="NRO_SINISTRO_SEG")
	private String nroSinistroSeg;

	private String situacao;

	@Column(name="DATA_INCLUSAO_SINISTRO")
	private Date dataInclusaoSinistro;

	@Column(name="DATA_CONCLUSAO")
	private Date dataConclusao;

	@Column(name="DATA_DO_SINISTRO")
	private Date dataDoSinistro;

	@Column(name="DATA_DO_AVISO")
	private Date dataDoAviso;

	private String cep;

	private String logradouro;

	private String numero;

	private String complemento;

	private String bairro;

	private String cidade;

	private String uf;

	private String motorista;

	private Integer idade;

	private String cnh;

	@Column(name="VALIDADE_CNH")
	private Date validadeCnh;

	@Column(name="CONTATO_DO_PROCESSO")
	private String contatoDoProcesso;

	@Column(name="FONE_PREFER_CONTATO")
	private String fonePreferContato;

	@Column(name="FONE_CELULAR_CONTATO")
	private String foneCelularContato;

	@Column(name="RELATO_DO_SINISTRO")
	private String relatoDoSinistro;

	private String avarias;

	@Column(name="USOU_GUINCHO")
	private Boolean usouGuincho;

	@Column(name="CARRO_RESERVA")
	private Boolean carroReserva;

	@Column(name="FEZ_ACORDO")
	private Boolean fezAcordo;

	@Column(name="PROCESSO_JURIDICO")
	private Boolean processoJuridico;

	private String bo;

	@Column(name="POLICIA_MILITAR")
	private Boolean policiaMilitar;

	@Column(name="POLICIA_CIVIL")
	private Boolean policiaCivil;

	@ManyToOne(fetch=LAZY)
	private Vistoriadora vistoriadora;

	@Column(name="NOME_VISTORIADORA")
	private String nomeVistoriadora;

	@Column(name="NOME_VISTORIADOR")
	private String nomeVistoriador;

	@Column(name="NRO_VISTORIA")
	private String nroVistoria;

	@Column(name="DATA_VISTORIA")
	private Date dataVistoria;

	@ManyToOne(fetch=LAZY)
	private Oficina oficina;

	@Column(name="ITEM_SEGURADO_ID")
	private Long itemSegurado;

	@Column(name="DANO_OCORRIDO")
	private Long danoOcorrido;

	@Column(name="DATA_ACIDENTE")
	private Date dataAcidente;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	@OneToMany(mappedBy="sinistro", fetch = LAZY, cascade = { REMOVE, REFRESH })
	@OrderBy("dataPagamento desc")
	private List<Indenizacoes> indenizacaoCollection = new ArrayList<Indenizacoes>();;

	@OneToMany(mappedBy="sinistro", fetch = LAZY, cascade = { REMOVE, REFRESH })
	@OrderBy("dataLancamento desc")
	private List<Acompanhamento> acompanhamentoCollection = new ArrayList<Acompanhamento>();

	@OneToMany(mappedBy="sinistro", fetch = LAZY, cascade = { REMOVE, REFRESH })
	private List<TerceiroEnvolvido> terceiroEnvolvidoCollection = new ArrayList<TerceiroEnvolvido>();
	
	@OneToMany(mappedBy="sinistro", fetch = LAZY, cascade = { REMOVE, REFRESH })
	private List<SinistroAnexo> sinistroAnexoCollection = new ArrayList<SinistroAnexo>();

	private static final long serialVersionUID = 1L;

	public Sinistro() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNroProposta() {
		return this.nroProposta;
	}

	public void setNroProposta(Long nroProposta) {
		this.nroProposta = nroProposta;
	}

	public String getNroApolice() {
		return this.nroApolice;
	}

	public void setNroApolice(String nroApolice) {
		this.nroApolice = nroApolice;
	}

	public Long getOrdem() {
		return this.ordem;
	}

	public void setOrdem(Long ordem) {
		this.ordem = ordem;
	}

	public String getNroSinistroSeg() {
		return this.nroSinistroSeg;
	}

	public void setNroSinistroSeg(String nroSinistroSeg) {
		this.nroSinistroSeg = nroSinistroSeg;
	}

	public String getSituacao() {
		return this.situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Date getDataInclusaoSinistro() {
		return this.dataInclusaoSinistro;
	}

	public void setDataInclusaoSinistro(Date dataInclusaoSinistro) {
		this.dataInclusaoSinistro = dataInclusaoSinistro;
	}

	public Date getDataConclusao() {
		return this.dataConclusao;
	}

	public void setDataConclusao(Date dataConclusao) {
		this.dataConclusao = dataConclusao;
	}

	public Date getDataDoSinistro() {
		return this.dataDoSinistro;
	}

	public void setDataDoSinistro(Date dataDoSinistro) {
		this.dataDoSinistro = dataDoSinistro;
	}

	public Date getDataDoAviso() {
		return this.dataDoAviso;
	}

	public void setDataDoAviso(Date dataDoAviso) {
		this.dataDoAviso = dataDoAviso;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
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

	public String getMotorista() {
		return this.motorista;
	}

	public void setMotorista(String motorista) {
		this.motorista = motorista;
	}

	public Integer getIdade() {
		return this.idade;
	}

	public void setIdade(Integer idade) {
		this.idade = idade;
	}

	public String getCnh() {
		return this.cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public Date getValidadeCnh() {
		return this.validadeCnh;
	}

	public void setValidadeCnh(Date validadeCnh) {
		this.validadeCnh = validadeCnh;
	}

	public String getContatoDoProcesso() {
		return this.contatoDoProcesso;
	}

	public void setContatoDoProcesso(String contatoDoProcesso) {
		this.contatoDoProcesso = contatoDoProcesso;
	}

	public String getFonePreferContato() {
		return this.fonePreferContato;
	}

	public void setFonePreferContato(String fonePreferContato) {
		this.fonePreferContato = fonePreferContato;
	}

	public String getFoneCelularContato() {
		return this.foneCelularContato;
	}

	public void setFoneCelularContato(String foneCelularContato) {
		this.foneCelularContato = foneCelularContato;
	}

	public String getRelatoDoSinistro() {
		return this.relatoDoSinistro;
	}

	public void setRelatoDoSinistro(String relatoDoSinistro) {
		this.relatoDoSinistro = relatoDoSinistro;
	}

	public String getAvarias() {
		return this.avarias;
	}

	public void setAvarias(String avarias) {
		this.avarias = avarias;
	}

	public Boolean getUsouGuincho() {
		return this.usouGuincho;
	}

	public void setUsouGuincho(Boolean usouGuincho) {
		this.usouGuincho = usouGuincho;
	}

	public Boolean getCarroReserva() {
		return this.carroReserva;
	}

	public void setCarroReserva(Boolean carroReserva) {
		this.carroReserva = carroReserva;
	}

	public Boolean getFezAcordo() {
		return this.fezAcordo;
	}

	public void setFezAcordo(Boolean fezAcordo) {
		this.fezAcordo = fezAcordo;
	}

	public Boolean getProcessoJuridico() {
		return this.processoJuridico;
	}

	public void setProcessoJuridico(Boolean processoJuridico) {
		this.processoJuridico = processoJuridico;
	}

	public String getBo() {
		return this.bo;
	}

	public void setBo(String bo) {
		this.bo = bo;
	}

	public Boolean getPoliciaMilitar() {
		return this.policiaMilitar;
	}

	public void setPoliciaMilitar(Boolean policiaMilitar) {
		this.policiaMilitar = policiaMilitar;
	}

	public Boolean getPoliciaCivil() {
		return this.policiaCivil;
	}

	public void setPoliciaCivil(Boolean policiaCivil) {
		this.policiaCivil = policiaCivil;
	}

	public String getNomeVistoriadora() {
		return this.nomeVistoriadora;
	}

	public void setNomeVistoriadora(String nomeVistoriadora) {
		this.nomeVistoriadora = nomeVistoriadora;
	}

	public String getNomeVistoriador() {
		return this.nomeVistoriador;
	}

	public void setNomeVistoriador(String nomeVistoriador) {
		this.nomeVistoriador = nomeVistoriador;
	}

	public String getNroVistoria() {
		return this.nroVistoria;
	}

	public void setNroVistoria(String nroVistoria) {
		this.nroVistoria = nroVistoria;
	}

	public Date getDataVistoria() {
		return this.dataVistoria;
	}

	public void setDataVistoria(Date dataVistoria) {
		this.dataVistoria = dataVistoria;
	}

	public Oficina getOficina() {
		return this.oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
	}

	public List<Indenizacoes> getIndenizacaoCollection() {
		return this.indenizacaoCollection;
	}

	public void setIndenizacaoCollection(List<Indenizacoes> indenizacaoCollection) {
		this.indenizacaoCollection = indenizacaoCollection;
	}

	public List<Acompanhamento> getAcompanhamentoCollection() {
		return this.acompanhamentoCollection;
	}

	public void setAcompanhamentoCollection(List<Acompanhamento> acompanhamentoCollection) {
		this.acompanhamentoCollection = acompanhamentoCollection;
	}

	public List<TerceiroEnvolvido> getTerceiroEnvolvidoCollection() {
		return this.terceiroEnvolvidoCollection;
	}

	public void setTerceiroEnvolvidoCollection(List<TerceiroEnvolvido> terceiroEnvolvidoCollection) {
		this.terceiroEnvolvidoCollection = terceiroEnvolvidoCollection;
	}

	public List<SinistroAnexo> getSinistroAnexoCollection() {
		return sinistroAnexoCollection;
	}

	public void setSinistroAnexoCollection(List<SinistroAnexo> sinistroAnexoCollection) {
		this.sinistroAnexoCollection = sinistroAnexoCollection;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Vistoriadora getVistoriadora() {
		return vistoriadora;
	}

	public void setVistoriadora(Vistoriadora vistoriadora) {
		this.vistoriadora = vistoriadora;
	}

	public Long getItemSegurado() {
		return itemSegurado;
	}

	public void setItemSegurado(Long itemSegurado) {
		this.itemSegurado = itemSegurado;
	}

	public Long getDanoOcorrido() {
		return danoOcorrido;
	}

	public void setDanoOcorrido(Long danoOcorrido) {
		this.danoOcorrido = danoOcorrido;
	}

	public Date getDataAcidente() {
		return dataAcidente;
	}

	public void setDataAcidente(Date dataAcidente) {
		this.dataAcidente = dataAcidente;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Corretora getCorretora() {
		return corretora;
	}
}