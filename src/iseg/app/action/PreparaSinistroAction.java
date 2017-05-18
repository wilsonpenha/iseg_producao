package iseg.app.action;

import iseg.app.business.PropostaService;
import iseg.app.constants.Constants;
import iseg.app.model.Automovel;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.RiscoDiversos;
import iseg.app.model.Seguradora;
import iseg.app.model.Sinistro;
import iseg.app.persistence.PObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class PreparaSinistroAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = -8481638176160014396L;
	private Sinistro sinistro;
	private Proposta proposta;
	private Proposta propostaSearch;
	private Seguradora seguradora;
	private Ramo ramo;
	private String idRelatorio;
	private String titulo;
	private List<Proposta> propostas;
	protected PropostaService service;
	List<ParcelasProposta>parcelas;
	private List<Automovel> automovelList;

	//@Autowired
	public PreparaSinistroAction(PropostaService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		super.prepare();

		if(this.getSession().get("preparaSinistroSearch") != null){
			this.propostaSearch = (Proposta) this.getSession().get("preparaSinistroSearch");
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {

		try {

			this.getSession().put("preparaSinistroSearch", propostaSearch);
			if(this.propostaSearch != null){
				this.listCount = this.service.getCountPropostasForSearch(propostaSearch).intValue();
				this.propostas = this.service.getPropostasForSearch(propostaSearch, page, pageSize);
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String find() {

		try{

			if(this.pobject.getId()==null){
				if(id==null)//Posteriormente fazer a controle através de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			//Alterado por Romero em 05/01/2012 - 
			//	O método find não sobre influência do filter, permitindo que qualquer usuário autenticado 
			//	visualize uma proposta da base, mesmo que não pertença à sua corretora.
			//this.proposta = (Proposta)service.find(Proposta.class, this.pobject.getId());
			this.proposta = (Proposta)service.genericFindFirstResultByNamedQuery("getPropostaById", new Object[] { this.pobject.getId() });
			if (this.proposta == null) {
				//Posteriormente fazer a controle através de Exception
				return Action.SUCCESS;
			}
			
			if (this.proposta.getRamo().getId().longValue()==this.getRamoAutomovel()){
				this.automovelList = (List<Automovel>)this.service.genericFindBySQLQuery("Select i From Automovel i join i.propostaAutomovelCollection pa where pa.dataExclusao is null AND pa.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()});
				this.proposta.setAutomovelWizCollection(this.automovelList);
			}
			if (this.proposta.getRamo().getId().longValue()==this.getRamoRiscoDiversos()){
				this.proposta.setRiscoDiversosCollection((List<RiscoDiversos>)this.service.genericFindBySQLQuery("Select i From RiscoDiversos i where i.proposta.id = ?0 order by i.id", new Object[]{this.proposta.getId()}));
			}

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}


	@SkipValidation
	public String novo() {
		try{

			Proposta proposta = (Proposta)this.service.find(this.proposta);

			this.sinistro = new Sinistro();
			this.sinistro.setProposta(proposta);

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String getStatusOperacionalDescricao(Long statusOperacional){
		return Constants.getStatusOperacionalDescricao(statusOperacional);
	}

	protected void setPObjectInstance() {
		this.proposta = (Proposta)this.pobject;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
		this.pobject = this.proposta;
	}

	public List<Proposta> getPropostas(){
		return propostas;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountProposta", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{
			return (List<Seguradora>)this.service.genericFindBySQLQuery("Select s From Seguradora s", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	@SuppressWarnings("unchecked")
	public List<Ramo> getRamoList(){
		try{
			return (List<Ramo>)this.service.genericFindBySQLQuery("Select r From Ramo r", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Ramo>();
	}

    public long getRamoAutomovel(){
    	return Constants.RAMO_AUTOMOVEL.longValue();
    }

    public long getRamoVidaEmpresarial(){
    	return Constants.RAMO_VIDA_EMPRESARIAL.longValue();
    }

    public long getRamoImovel(){
    	return Constants.RAMO_IMOVEL.longValue();
    }

    public long getRamoRiscoDiversos(){
    	return Constants.RAMO_RISCO_DIVERSOS.longValue();
    }

    public long getRamoVidaIndividual(){
    	return Constants.RAMO_VIDA_INDIVIDUAL.longValue();
    }

    public long getRamoResidencial(){
    	return Constants.RAMO_RESIDENCIAL.longValue();
    }

    public long getRamoEmpresarial(){
    	return Constants.RAMO_EMPRESARIAL.longValue();
    }

    public long getRamoCondominio(){
    	return Constants.RAMO_CONDOMINIO.longValue();
    }

    public List<PObject> getTipoSeguroList(){
		return this.getDominioList("TipoSeguro");
	}

	public Map<Long, String> getStatusOperacionalList(){
		return Constants.getStatusOperacionalMap();
	}

	public Proposta getPropostaSearch() {
		return propostaSearch;
	}

	public void setPropostaSearch(Proposta propostaSearch) {
		this.propostaSearch = propostaSearch;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
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
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Sinistro getSinistro() {
		return sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
	}
}