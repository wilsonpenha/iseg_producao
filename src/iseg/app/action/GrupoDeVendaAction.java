package iseg.app.action;

import iseg.app.constants.Constants;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ObservadoresPosVenda;
import iseg.app.model.OperadoresPosVenda;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class GrupoDeVendaAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = 1L;
	private GrupoDeVenda grupoDeVenda;
	private List<PObject> gruposDeVenda;
	private List<PObject> operadoresPosVenda;
	private List<PObject> observadoresPosVenda;
	private List<PObject> grupoProdutores;
	private GrupoProdutor grupoProdutor;
	private OperadoresPosVenda operadorPosVenda;
	private ObservadoresPosVenda observadorPosVenda;
	

	//@Autowired
	public GrupoDeVendaAction(PObjectService service) {
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@Override
	protected void persistPObjects(){
	}

	@SkipValidation
	public String novo() {
		if(this.pobject != null){
			this.pobject.setId(null);
		}
		this.grupoDeVenda = new GrupoDeVenda();
		return Action.SUCCESS;
	}

	protected void setPObjectInstance() {
		try{
			this.grupoDeVenda = (GrupoDeVenda)this.pobject;
			this.grupoProdutores = (List<PObject>) service.genericFindByNamedQuery("getGrupoProdutorByGrupoDeVenda", new Object[] { this.grupoDeVenda.getId() });
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public String getTipoComissaoDescricao(Long tipoComissao){
		return Constants.getTipoComissaoDescricao(tipoComissao);
	}

	public Map<Long, String> getTipoComissaoList(){
		return Constants.getTipoComissaoMap();
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
		this.pobject = this.grupoDeVenda;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountGrupoDeVenda", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getGruposDeVenda(){
		return gruposDeVenda;
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getProdutorList(){
		try{
			return (List<PObject>)this.service.genericFindByNamedQuery("getProdutor", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	@SuppressWarnings("unchecked")
	public String listaUsuariosPosVenda() {
		try {
			this.operadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getOperadoresByGrupoDeVenda", new Object[] { this.getGrupoDeVenda().getId() });
			this.observadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getObservadoresByGrupoDeVenda", new Object[] { this.getGrupoDeVenda().getId() });

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirProdutor(){
		try{

			this.service.save(this.grupoProdutor);
			this.service.refresh(grupoProdutor);
			this.grupoProdutores = (List<PObject>) service.genericFindByNamedQuery("getGrupoProdutorByGrupoDeVenda", new Object[] { this.grupoProdutor.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirProdutor(){
		try {

			this.service.remove(grupoProdutor);
			this.grupoProdutores = (List<PObject>) service.genericFindByNamedQuery("getGrupoProdutorByGrupoDeVenda", new Object[] { this.grupoProdutor.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirOperador(){
		try{

			this.service.save(operadorPosVenda);
			this.service.refresh(operadorPosVenda);
			this.operadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getOperadoresByGrupoDeVenda", new Object[] { this.operadorPosVenda.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirOperador(){
		try {

			this.service.remove(operadorPosVenda);
			this.operadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getOperadoresByGrupoDeVenda", new Object[] { this.operadorPosVenda.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirObservador(){
		try{

			this.service.save(observadorPosVenda);
			this.service.refresh(observadorPosVenda);
			this.observadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getObservadoresByGrupoDeVenda", new Object[] { this.observadorPosVenda.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirObservador(){
		try {

			this.service.remove(observadorPosVenda);
			this.observadoresPosVenda = (List<PObject>) service.genericFindByNamedQuery("getObservadoresByGrupoDeVenda", new Object[] { this.observadorPosVenda.getGrupoDeVenda().getId() });
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getOperadoresPosVenda() {
		return operadoresPosVenda;
	}

	public void setOperadoresPosVenda(List<PObject> operadoresPosVenda) {
		this.operadoresPosVenda = operadoresPosVenda;
	}

	public List<PObject> getObservadresPosVenda() {
		return observadoresPosVenda;
	}

	public void setObservadoresPosVenda(List<PObject> observadoresPosVenda) {
		this.observadoresPosVenda = observadoresPosVenda;
	}

	public void setGruposDeVenda(List<PObject> gruposDeVenda) {
		this.gruposDeVenda = gruposDeVenda;
	}

	public OperadoresPosVenda getOperadorPosVenda() {
		return operadorPosVenda;
	}

	public void setOperadorPosVenda(OperadoresPosVenda operadorPosVenda) {
		this.operadorPosVenda = operadorPosVenda;
	}

	public ObservadoresPosVenda getObservadorPosVenda() {
		return observadorPosVenda;
	}

	public void setObservadorPosVenda(ObservadoresPosVenda observadorPosVenda) {
		this.observadorPosVenda = observadorPosVenda;
	}

	public List<PObject> getObservadoresPosVenda() {
		return observadoresPosVenda;
	}

	public List<PObject> getGrupoProdutores() {
		return grupoProdutores;
	}

	public void setGrupoProdutores(List<PObject> grupoProdutores) {
		this.grupoProdutores = grupoProdutores;
	}

	public GrupoProdutor getGrupoProdutor() {
		return grupoProdutor;
	}

	public void setGrupoProdutor(GrupoProdutor grupoProdutor) {
		this.grupoProdutor = grupoProdutor;
	}
}