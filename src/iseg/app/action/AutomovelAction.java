package iseg.app.action;

import iseg.app.model.Automovel;
import iseg.app.model.DominioEsp;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class AutomovelAction extends BaseAction implements Preparable {
	private static final long serialVersionUID = 1L;
	private Automovel automovel;
	private List<PObject> automoveis;

	private DominioEsp marca;

	//@Autowired
	public AutomovelAction(PObjectService service) {
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
		for(int i=0 ; i<automovel.getAutomovelCoberturaCollection().size() ; i++){
			if(automovel.getAutomovelCoberturaCollection().get(i) != null){
				automovel.getAutomovelCoberturaCollection().get(i).setAutomovel(automovel);
			}
		}
		for(int i=0 ; i<automovel.getAutomovelServicosCollection().size() ; i++){
			if(automovel.getAutomovelServicosCollection().get(i) != null){
				automovel.getAutomovelServicosCollection().get(i).setAutomovel(automovel);
			}
		}
		for(int i=0 ; i<automovel.getAutomovelAcessoriosCollection().size() ; i++){
			if(automovel.getAutomovelAcessoriosCollection().get(i) != null){
				automovel.getAutomovelAcessoriosCollection().get(i).setAutomovel(automovel);
			}else{
				automovel.getAutomovelAcessoriosCollection().remove(i--);
			}
		}
	}

	@SkipValidation
	public String visualizar() {
		try {

			if (this.automovel.getId()==null){
				if(id==null)//Posteriormente fazer a controle atrav�s de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			this.automovel = (Automovel)service.find(this.automovel);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		this.automovel = (Automovel)this.pobject;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
		this.pobject = this.automovel;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountAutomovel", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<PObject> getAutomoveis(){
		return automoveis;
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getCondutorList(){
		try{
			return (List<PObject>)this.service.genericFindBySQLQuery("Select c From Condutor c Order by c.nome", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getServicoList(){
		try{
			return (List<PObject>)this.service.genericFindBySQLQuery("Select s From Servicos s Order by s.descricao", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<PObject> getCoberturaList(){
		try{
			return (List<PObject>)this.service.genericFindBySQLQuery("Select c From Coberturas c Order by c.descricao", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<PObject>();
		}
	}

	@SkipValidation
	public String getModeloVeiculoList(){
		if(this.marca != null){
			this.list = (List<PObject>) this.getSubDominioList(this.marca);
		}
		return Action.SUCCESS;
	}

	public List<PObject> getModelosList(){
		if(this.list == null){
			this.list = new ArrayList<PObject>();
		}
		return list;
	}

	public List<PObject> getMarcaVeiculoList(){
		return this.getDominioList("MarcaModeloVeiculo");
	}

	public List<PObject> getTipoFranquiaList(){
		return this.getDominioList("TipoFranquia");
	}

	public List<PObject> getAcessorioList(){
		return this.getDominioList("Acessorio");
	}

	public List<PObject> getCategoriaVeiculoList(){
		return this.getDominioList("CategoriaVeiculo");
	}

	public List<PObject> getTipoCombustivelList(){
		return this.getDominioList("TipoCombustivel");
	}

	public List<PObject> getEstadoCivilList(){
		return this.getDominioList("EstadoCivil");
	}

	public DominioEsp getMarca() {
		return marca;
	}

	public void setMarca(DominioEsp marca) {
		this.marca = marca;
	}
}