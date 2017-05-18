package iseg.app.model;

import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.InheritanceType.JOINED;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@Inheritance(strategy=JOINED)
@NamedQueries({
	@NamedQuery(name="getCountSeguradora", query="SELECT Count(*) FROM Seguradora s"),
	@NamedQuery(name="getSeguradora", query="SELECT s FROM Seguradora s ORDER BY s.nome"),
	@NamedQuery(name="getSeguradoraByInscricaoSusep", query = "SELECT s FROM Seguradora s WHERE s.inscricaoSusep = :inscricaoSusep ORDER BY s.nome"),
	@NamedQuery(name="getSeguradoraByRazaoSocial", query = "SELECT s FROM Seguradora s WHERE s.razaoSocial = :razaoSocial ORDER BY s.nome"),
	@NamedQuery(name="getSeguradoraOrdered", query = "SELECT s FROM Seguradora s ORDER BY s.nome"),
	@NamedQuery(name="getSeguradoraByCpfOuCnpj", query = "SELECT s FROM Seguradora s WHERE s.cpfOuCnpj = :cpfOuCnpj ORDER BY s.nome"),
	@NamedQuery(name="getSeguradoraByNome", query = "SELECT s FROM Seguradora s WHERE s.nome = :nome ORDER BY s.nome")})
public class Seguradora extends PessoaJuridica implements Serializable {

    private static final long serialVersionUID = 1L;

	@Column(length=40)
	private String telefones;

	@Column(name="TELEFONE_0800", length=15)
	private String telefone0800;

	@Column(name="INSCRICAO_SUSEP",length=25)
	private String inscricaoSusep;

	@Column(name="PERC_COMISSAO_MAX")
	private Double percComissaoMax;

	@Column(name="PERC_COMISSAO_MIN")
	private Double percComissaoMin;

	@Column(name="CUSTO_APOLICE")
	private Double custoApolice;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="cia_agrupadora_id")
	private Seguradora ciaAgrupadora;
	
	@OneToMany(cascade=REMOVE, mappedBy = "seguradora", fetch = LAZY)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<Servicos> servicosCollection = new ArrayList<Servicos>();

	@OneToMany(cascade=REMOVE, mappedBy = "seguradora", fetch = LAZY)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<Coberturas> coberturasCollection = new ArrayList<Coberturas>();

	@OneToMany(cascade=REMOVE, fetch = LAZY, mappedBy = "seguradora")
	private List<Proposta> propostaSeguradoraCollection = new ArrayList<Proposta>();

	@OneToMany(cascade=REMOVE, mappedBy = "seguradora", fetch = LAZY)
	private List<Automovel> automovelCollection = new ArrayList<Automovel>();

	@OneToMany(cascade=REMOVE, mappedBy = "seguradora", fetch = LAZY)
	private List<CondicaoPagamento> condicaoPagamentoCollection = new ArrayList<CondicaoPagamento>();

	@OneToMany(cascade=REMOVE, mappedBy = "seguradora", fetch = LAZY)
	private List<Perfil> perfilCollection = new ArrayList<Perfil>();

	@OneToMany(mappedBy="seguradora", fetch = LAZY)
	private List<VistoriadoraSeguradora> vistoriadoraSeguradoraCollection = new ArrayList<VistoriadoraSeguradora>();
	
	@OneToMany(mappedBy="seguradora", fetch = LAZY)
	private List<SeguradoraRamo> seguradoraRamoCollection = new ArrayList<SeguradoraRamo>();

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Seguradora() {
		super();
	}

	public String getTelefones() {
		return this.telefones;
	}

	public void setTelefones(String telefones) {
		this.telefones = telefones;
	}

	public String getTelefone0800() {
		return telefone0800;
	}

	public void setTelefone0800(String telefone0800) {
		this.telefone0800 = telefone0800;
	}

	public String getInscricaoSusep() {
		return this.inscricaoSusep;
	}

	public void setInscricaoSusep(String inscricaoSusep) {
		this.inscricaoSusep = inscricaoSusep;
	}

	public Double getPercComissaoMax() {
		return percComissaoMax;
	}

	public void setPercComissaoMax(Double percComissaoMax) {
		this.percComissaoMax = percComissaoMax;
	}

	public Double getPercComissaoMin() {
		return percComissaoMin;
	}

	public void setPercComissaoMin(Double percComissaoMin) {
		this.percComissaoMin = percComissaoMin;
	}

	public Double getCustoApolice() {
		return custoApolice;
	}

	public void setCustoApolice(Double custoApolice) {
		this.custoApolice = custoApolice;
	}

	public List<Servicos> getServicosCollection() {
		return this.servicosCollection;
	}

	public void setServicosCollection(List<Servicos> servicosCollection) {
		this.servicosCollection = servicosCollection;
	}

	public List<Coberturas> getCoberturasCollection() {
		return this.coberturasCollection;
	}

	public void setCoberturasCollection(List<Coberturas> coberturasCollection) {
		this.coberturasCollection = coberturasCollection;
	}

	public List<Proposta> getPropostaSeguradoraCollection() {
		return this.propostaSeguradoraCollection;
	}

	public void setPropostaSeguradoraCollection(List<Proposta> propostaSeguradoraCollection) {
		this.propostaSeguradoraCollection = propostaSeguradoraCollection;
	}

	public List<Automovel> getAutomovelCollection() {
		return this.automovelCollection;
	}

	public void setAutomovelCollection(List<Automovel> automovelCollection) {
		this.automovelCollection = automovelCollection;
	}

	public List<CondicaoPagamento> getCondicaoPagamentoCollection() {
		return this.condicaoPagamentoCollection;
	}

	public void setCondicaoPagamentoCollection(List<CondicaoPagamento> condicaoPagamentoCollection) {
		this.condicaoPagamentoCollection = condicaoPagamentoCollection;
	}

	public List<Perfil> getPerfilCollection() {
		return this.perfilCollection;
	}

	public void setPerfilCollection(List<Perfil> perfilCollection) {
		this.perfilCollection = perfilCollection;
	}

	public List<VistoriadoraSeguradora> getVistoriadoraSeguradoraCollection() {
		return vistoriadoraSeguradoraCollection;
	}

	public void setVistoriadoraSeguradoraCollection(
			List<VistoriadoraSeguradora> vistoriadoraSeguradoraCollection) {
		this.vistoriadoraSeguradoraCollection = vistoriadoraSeguradoraCollection;
	}

	public Seguradora getCiaAgrupadora() {
		return ciaAgrupadora;
	}

	public void setCiaAgrupadora(Seguradora ciaAgrupadora) {
		this.ciaAgrupadora = ciaAgrupadora;
	}

	public List<SeguradoraRamo> getSeguradoraRamoCollection() {
		return seguradoraRamoCollection;
	}

	public void setSeguradoraRamoCollection(
			List<SeguradoraRamo> seguradoraRamoCollection) {
		this.seguradoraRamoCollection = seguradoraRamoCollection;
	}
	
}