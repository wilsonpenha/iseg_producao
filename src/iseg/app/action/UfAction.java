/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Seguradora;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class UfAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Uf uf;
	private List<PObject> ufs;
	protected PObjectService service;
	private String dataInicio;
	private String dataTermino;
	private String codigo;

	//@Autowired
	public String getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDataTermino() {
		return dataTermino;
	}

	public void setDataTermino(String dataTermino) {
		this.dataTermino = dataTermino;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public UfAction(PObjectService service) {
		super(service);
		this.service = service;
	}

	public String relatorio(){
		return Action.SUCCESS;
	}
	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	protected void setPObjectInstance() {
		try {
			this.uf = (Uf)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	public Uf getUf() {
		return uf;
	}

	public void setUf(Uf uf) {
		this.uf = uf;
		this.pobject = this.uf;
	}

	public List<PObject> getUfs(){
		return ufs;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountUf", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{
			return (List<Seguradora>)this.service.genericFindBySQLQuery("Select s From Seguradora s", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Seguradora>();
		}
	}
}
/************************************************************/
//Atlas, 2008
/************************************************************/