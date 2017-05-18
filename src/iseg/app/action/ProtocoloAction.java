/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.ProtocoloService;
import iseg.app.constants.Constants;
import iseg.app.model.Automovel;
import iseg.app.model.Proposta;
import iseg.app.model.Protocolo;
import iseg.app.model.ProtocoloItens;
import iseg.app.model.Seguradora;
import iseg.app.model.Sequencia;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ProtocoloAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Protocolo protocolo;
	private Proposta proposta;
	private ProtocoloItens protocoloSearch;
	private List<Protocolo> protocolos;
	protected ProtocoloService service;
	private ProtocoloItens protocoloItens;
	private List<ProtocoloItens> protocoloItensList;
	private Long statusProtocolo;
	private List<Proposta> propostas;
	private Long[] propostaIds;

	protected Boolean mostraUltimaLista = new Boolean(false);

	@Autowired
	public ProtocoloAction(ProtocoloService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();
			if(this.getSession().get("protocoloSearch") != null){
				this.protocoloSearch = (ProtocoloItens) this.getSession().get("protocoloSearch");
				if (this.getSession().get("page")!=null)
					this.page = (Integer)this.getSession().get("page");
				if (this.getSession().get("pageSize")!=null)
					this.pageSize = (Integer)this.getSession().get("pageSize");
			}

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	protected void persistPObjects() throws Exception {
		try{
			if (this.protocolo.getNumero() == null){
				this.protocolo.setNumero(this.getSequenciaNumeroProtocolo());
				this.protocolo.setCorretora(this.corretoraEmUso);
			}
			this.protocolo.setUsuario(this.getUsuarioEmUso());
		}catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	public String novo() {
		this.protocolo = new Protocolo();
		this.protocolo.setDataAbertura(new Date());
		
		return Action.SUCCESS;
	}
	
	public Long getSequenciaNumeroProtocolo() throws Exception {
		Sequencia sequencia = (Sequencia)this.service.genericFindFirstResultByNamedQuery("getSequenciaByChave", new Object[]{"Protocolo",this.getCorretoraEmUso().getId()});
		if(sequencia == null){
			sequencia = new Sequencia();
			sequencia.setChave("Protocolo");
			sequencia.setCorretora(this.getCorretoraEmUso());
			sequencia.setValor(0L);
			this.service.save(sequencia);
		}
		sequencia.setValor(sequencia.getValor()+1);
		this.service.save(sequencia);
		return sequencia.getValor();
	}

	protected void setPObjectInstance() {
		try {
			
			this.protocolo = (Protocolo)this.pobject;
			this.protocoloItensList = (List<ProtocoloItens>)this.service.genericFindBySQLQuery("Select p From ProtocoloItens p where p.protocolo.id = ?0 order by p.proposta.produtor.apelido, p.id asc", new Object[]{this.protocolo.getId()});
			
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String pesquisarPropostas() {
		try{
			//this.propostas = (List<Proposta>)this.service.genericFindBySQLQuery("Select p from Proposta p where p.situacaoOperacional = 0 and p.statusOperacional in (0,2,4,6,7,9,10) and p.grupoDeVenda.id = ?0 and p.id not in (select pi.proposta.id from ProtocoloItens pi) order by p.numero desc", new Object[]{this.proposta.getGrupoDeVenda().getId()});
			this.service.applyFilter();

			String strQuery = "Select new Proposta(p.id,p.numero,p.inicioVigencia, p.terminoVigencia, p.clienteNome, p.cpfOuCnpj, p.ramo, p.statusOperacional, p.situacaoOperacional) from Proposta p where 1=1";

			if(proposta.getDataProposta() != null){
				strQuery += "and p.dataProposta = :dataProposta ";
			}
			if(proposta.getDataBaixaApolice() != null){
				strQuery += "and (p.dataBaixaApolice = :dataBaixaApolice or p.dataBaixaEndosso = :dataBaixaApolice) ";
			}
			if(proposta.getDataLanctoApolice() != null){
				strQuery += "and (p.datalanctoApolice = :dataLanctoApolice or p.dataLanctoEndosso = :dataLanctoApolice) ";
			}
			if(proposta.getInicioVigencia() != null){
				strQuery += "and p.inicioVigencia = :inicioVigencia ";
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				strQuery += "and p.grupoDeVenda.id = :grupoDeVendaId ";
			}

			strQuery += " ORDER BY numero desc ";

			Query query = this.service.getEntityManager().createQuery(strQuery);

			if(proposta.getDataProposta() != null){
				query.setParameter("dataProposta", proposta.getDataProposta());
			}
			if(proposta.getDataBaixaApolice() != null){
				query.setParameter("dataBaixaApolice", proposta.getDataBaixaApolice());
			}
			if(proposta.getDataLanctoApolice() != null){
				query.setParameter("dataLanctoApolice", proposta.getDataLanctoApolice());
			}
			if(proposta.getInicioVigencia() != null){
				query.setParameter("inicioVigencia", proposta.getInicioVigencia());
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				query.setParameter("grupoDeVendaId", proposta.getGrupoDeVenda().getId());
			}

			query.setFirstResult(0);
			query.setMaxResults(150);

			this.propostas = (List<Proposta>) query.getResultList();

			
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
	}
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {
		try {

			this.getSession().put("protocoloSearch", this.protocoloSearch);
			this.getSession().put("page", page);
			this.getSession().put("pageSize", pageSize);

			if(this.protocoloSearch != null){
				this.listCount = this.service.getCountProtocoloForSearch(this.protocoloSearch.getProtocolo(), this.protocoloSearch.getProposta(), this.statusProtocolo).intValue();
				this.protocolos = this.service.getProtocoloForSearch(this.protocoloSearch.getProtocolo(), this.protocoloSearch.getProposta(), page, pageSize, this.statusProtocolo);
				this.mostraUltimaLista=true;
			}

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirItensProposta(){
		try{

			for (int i = 0; i < propostaIds.length; i++) {
				Proposta proposta = new Proposta();
				
				proposta.setId(propostaIds[i]);
				ProtocoloItens protocoloItens = new ProtocoloItens();
				protocoloItens.setProtocolo(this.protocolo);
				protocoloItens.setProposta(proposta);
				protocoloItens.setTipoDocumento(null);
				protocoloItens.setUsuario(this.getUsuarioEmUso());
				this.service.save(protocoloItens);
				this.service.refresh(protocoloItens);
			}
			
			this.protocoloItensList = (List<ProtocoloItens>)this.service.genericFindBySQLQuery("Select p From ProtocoloItens p where p.protocolo.id = ?0 order by p.proposta.produtor.apelido, p.id asc", new Object[]{this.protocolo.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String removerItemProtocolo(){
		try{

			this.service.remove(this.protocoloItens);
			
			this.protocoloItensList = (List<ProtocoloItens>)this.service.genericFindBySQLQuery("Select p From ProtocoloItens p where p.protocolo.id = ?0 order by p.proposta.produtor.apelido, p.id asc", new Object[]{this.protocolo.getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	public Protocolo getProtocolo() {
		return this.protocolo;
	}

	public void setProtocolo(Protocolo protocolo) {
		this.protocolo = protocolo;
		this.pobject = this.protocolo;
	}

	public List<Protocolo> getProtocolos(){
		return protocolos;
	}

	public Map<Long, String> getStatusOperacionalList(){
		return Constants.getStatusOperacionalMap();
	}

	public Map<Long, String> getSituacaoOperacionalList(){
		
		if (this.getProposta() != null && this.getProposta().getTerminoVigencia()!=null && this.getProposta().getTerminoVigencia().getTime() < (new Date()).getTime())
			return Constants.getSituacaoOperacionalVencida();
		else
			return Constants.getSituacaoOperacionalMap();
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradorasList(){
		try{

			return (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s Order by s.nome", null);

		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountProtocolo", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public ProtocoloItens getProtocoloSearch() {
		return protocoloSearch;
	}

	public void setProtocoloSearch(ProtocoloItens protocoloSearch) {
		this.protocoloSearch = protocoloSearch;
	}

	public ProtocoloItens getProtocoloItens() {
		return protocoloItens;
	}

	public void setProtocoloItens(ProtocoloItens protocoloItens) {
		this.protocoloItens = protocoloItens;
	}

	public List<ProtocoloItens> getProtocoloItensList() {
		return protocoloItensList;
	}

	public void setProtocoloItensList(
			List<ProtocoloItens> protocoloItensList) {
		this.protocoloItensList = protocoloItensList;
	}

	public Long getStatusProtocolo() {
		return statusProtocolo;
	}

	public void setStatusProtocolo(Long statusProtocolo) {
		this.statusProtocolo = statusProtocolo;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public List<Proposta> getPropostas() {
		return propostas;
	}

	public void setPropostas(List<Proposta> propostas) {
		this.propostas = propostas;
	}

	public Long[] getPropostaIds() {
		return propostaIds;
	}

	public void setPropostaIds(Long[] propostaIds) {
		this.propostaIds = propostaIds;
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/