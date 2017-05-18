package iseg.app.action;

import iseg.app.business.PropostaComissaoService;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaComissao;
import iseg.app.model.Seguradora;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PropostaComissaoAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private PropostaComissao propostaComissao;
	private Proposta proposta;
	private List<PropostaComissao> propostaComissaoList;
	protected PropostaComissaoService service;

	protected String idRelatorio;
	protected String titulo;

	//@Autowired
	public PropostaComissaoAction(PropostaComissaoService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	public String gerarComissoes(){
		try {

			proposta = (Proposta)this.service.find(this.getProposta());
			PropostaComissao propostaComissao = null;
			propostaComissaoList = new ArrayList<PropostaComissao>();

			Double fator = this.getProposta().getFator();
			Double valorComissaoTotal = (proposta.getPremioLiquido()*fator)/100;

			for(ComissionadoProposta comissionadoProposta : proposta.getComissionadoPropostaCollection()){
				Integer quantidadeComissoes = new Integer(proposta.getCondicaoPagamento().getPagamentoComissao());
				for(int i=0 ; i<quantidadeComissoes ; i++){
					propostaComissao = new PropostaComissao();
					propostaComissao.setNroDaParcela(new Integer(i+1));
					propostaComissao.setProposta(proposta);
					propostaComissao.setPercentualComissao(fator);
					propostaComissao.setValorComissao(valorComissaoTotal*comissionadoProposta.getComissao()/(100*quantidadeComissoes));
					propostaComissaoList.add(propostaComissao);
				}
			}

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		this.propostaComissao = (PropostaComissao)this.pobject;
	}

	public String relatorio(){
		return Action.SUCCESS;
	}

	public String getIdRelatorio() {
		return idRelatorio;
	}

	public void setIdRelatorio(String idRelatorio) {
		this.idRelatorio = idRelatorio;
	}

	public String getTitulo() {
		if (this.idRelatorio.equals("1"))
			titulo = "Relatório de Comissões Detalhado";
		else if (this.idRelatorio.equals("2"))
			titulo = " Listagem de Comissões Recebidas";
		else if (this.idRelatorio.equals("3"))
			titulo = "Listagem de Repasse de Comissões";
		else if (this.idRelatorio.equals("4"))
			titulo = "Relatório de Comissões a Receber e Recebidas";
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public PropostaComissao getPropostaComissao() {
		return propostaComissao;
	}

	public void setPropostaComissao(PropostaComissao propostaComissao) {
		this.propostaComissao = propostaComissao;
		this.pobject = this.propostaComissao;
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0) Order by s.nome", new Object[]{this.proposta.getRamo().getId()});

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public List<GrupoDeVenda> getGrupoVendaList(){
		try{
			return this.service.genericFindByNamedQuery("getGrupoDeVenda", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public List<PropostaComissao> getPropostaComissaoList() {
		return propostaComissaoList;
	}

	public void setPropostaComissaoList(List<PropostaComissao> propostaComissaoList) {
		this.propostaComissaoList = propostaComissaoList;
	}

	public int getRowCount(){return 0;}
	
}