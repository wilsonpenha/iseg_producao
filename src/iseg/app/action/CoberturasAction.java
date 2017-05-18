/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 5/29/2008
/************************************************************/
package iseg.app.action;

import iseg.app.exception.GenericException;
import iseg.app.model.Coberturas;
import iseg.app.model.CoberturasIseg;
import iseg.app.model.Corretora;
import iseg.app.model.Ramo;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class CoberturasAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Coberturas coberturas;
	private List<PObject> coberturass;
	private Ramo ramo;
	private CoberturasIseg coberturasIseg; 

	//@Autowired
	public CoberturasAction(PObjectService service) {
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

	@Override
	@SkipValidation
	public String novo() {
		try {
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Assessorada não pode incluir nova Cobertura, contate a assessoria!");

			Coberturas coberturas = (Coberturas)Util.cloneBean(this.coberturas);
			coberturas.setId(null);
			this.coberturas = coberturas;
	
			return Action.SUCCESS;
		} catch (Exception e) {
			this.lista();
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editar() {

		try {

			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Cobertura não pode ser editada pela assessoarada!");

			if (this.pobject.getId() == null) {
				if (id == null)// Posteriormente fazer a controle atrav�s de // Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}
			this.pobject = service.find(this.pobject);
			this.setPObjectInstance();
			return Action.SUCCESS;

		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String excluir() {

		try {
			if (!corretoraEmUso.ehAssessoria() && corretoraEmUso.getUsarCoberturasAssessoria())
				throw new Exception("Cobertura não pode ser excluida pela assessoarada!");

			for (int i = 0; i < id.length; i++) {
				if (id[i] != null) {
					pobject.setId(id[i]);
					this.service.remove(pobject);
				}
			}
			this.listCount = this.getRowCount();

			return this.lista();

		} catch (GenericException ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		} catch (Exception ge) {
			this.lista();
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void persistPObjects() throws Exception {
		this.coberturas.setCorretora(this.corretoraEmUso);
		if (this.ramo.getSubRamo().getId()!=null)
			if (this.ramo.getId()==null){
				List<Ramo> ramos = this.service.genericFindByNamedQuery("getSubRamo", new Object[]{this.ramo.getSubRamo().getId()});
				if (ramos.size()>0)
					throw new Exception("É obrigatório informar o Sub-Ramo!");
				this.coberturas.setRamo(this.ramo.getSubRamo());
			}else
				this.coberturas.setRamo(this.ramo);
		else{
			throw new Exception("É obrigatório informar o Ramo!");
		}
	}

	@Override
	@SkipValidation
	public String lista() {
		try {
			if (this.listCount == 0)
				this.listCount = this.getRowCount();
			
			Corretora corretoraFiltro = null;
			if (corretoraEmUso.ehAssessoria())
				corretoraFiltro = corretoraEmUso;
			else if (corretoraEmUso.getUsarCoberturasAssessoria())
				corretoraFiltro = corretoraEmUso.getAssessoria();
			else
				corretoraFiltro = corretoraEmUso;
			this.list = (List<PObject>) service.genericFindByNamedQuery("getCoberturasBySeguradora", new Object[] { this.getCoberturas().getSeguradora().getId(), corretoraFiltro.getId() }, page,pageSize);
			
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	protected void setPObjectInstance() {
		try {
			this.coberturas = (Coberturas) this.pobject;
			if (this.coberturas.getRamo().getSubRamo()==null || this.coberturas.getRamo().getSubRamo().getId()==null){
				this.ramo = new Ramo();
				this.ramo.setSubRamo(this.coberturas.getRamo());
			}else
				this.ramo = this.coberturas.getRamo();
				
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Coberturas getCoberturas() {
		return coberturas;
	}

	public void setCoberturas(Coberturas coberturas) {
		this.coberturas = coberturas;
		this.pobject = this.coberturas;
	}

	public List<PObject> getCoberturass() {
		return coberturass;
	}

	public int getRowCount() {
		try {
			Corretora corretoraFiltro = null;
			if (corretoraEmUso.ehAssessoria())
				corretoraFiltro = corretoraEmUso;
			else if (corretoraEmUso.getUsarCoberturasAssessoria())
				corretoraFiltro = corretoraEmUso.getAssessoria();
			else
				corretoraFiltro = corretoraEmUso;
			return this.service.getRowCount("getCountCoberturas", new Object[] {corretoraFiltro.getId(),coberturas.getSeguradora().getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public CoberturasIseg getCoberturasIseg() {
		return coberturasIseg;
	}

	public void setCoberturasIseg(CoberturasIseg coberturasIseg) {
		this.coberturasIseg = coberturasIseg;
	}
	public List<CoberturasIseg> getCoberturasIsegList(){
		try {
			return this.service.genericFindByNamedQuery("getCoberturasIseg", new Object[]{Boolean.TRUE});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

/** ********************************************************* */
//Atlas, 2008
/** ********************************************************* */
