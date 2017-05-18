/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.OrcamentoCorretoraService;
import iseg.app.constants.Constants;
import iseg.app.model.CoberturasIseg;
import iseg.app.model.Corretora;
import iseg.app.model.CorretoraCoberturasIseg;
import iseg.app.model.CorretoraServicosIseg;
import iseg.app.model.DominioEsp;
import iseg.app.model.SeguradorasPreferenciais;
import iseg.app.model.ServicosIseg;
import iseg.app.model.TemplateMensagem;
import iseg.app.model.TipoMensagem;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

/**
 * @author Wilson
 *
 */
public class OrcamentoCorretoraAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	protected OrcamentoCorretoraService service;
	private Long franquias[];
	private List<CorretoraServicosIseg> corretoraServicosIsegList = new ArrayList<CorretoraServicosIseg>();
	private List<CorretoraCoberturasIseg> corretoraCoberturasIsegList = new ArrayList<CorretoraCoberturasIseg>();
	private List<SeguradorasPreferenciais> seguradorasPreferenciaisList = new ArrayList<SeguradorasPreferenciais>();
	private Corretora corretora;
	private CorretoraCoberturasIseg corretoraCoberturasIseg;
	private CorretoraServicosIseg corretoraServicosIseg;
	private SeguradorasPreferenciais seguradorasPreferenciais;
	private List<TemplateMensagem> templateEmailList = new ArrayList<TemplateMensagem>();
	private List<TemplateMensagem> templateSmsList = new ArrayList<TemplateMensagem>();
	private TemplateMensagem templateMensagem;
	private List<DominioEsp> franquiasList = new ArrayList<DominioEsp>();
	private Long[] templateMensagemId = new Long[2];
	private Long templateMensagemEmailId;
	private Long templateMensagemSmsId;

	//@Autowired
	public OrcamentoCorretoraAction(PObjectService service) {
		super(service);
		this.service = (OrcamentoCorretoraService)service;
	}
	
	public void prepare() throws Exception {
		try {
			if(this.corretora != null && this.corretora.getId() != null){
				this.corretora = (Corretora)this.service.find(this.corretora);
			}
			super.prepare();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	public String lista() {
		try {
			return Action.SUCCESS;
		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public List<PObject> getCoberturasIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getCoberturasIseg", new Object[]{Boolean.TRUE});
	}
	
	public List<PObject> getServiocosIseg() throws Exception{
		return this.service.genericFindByNamedQuery("getServicosIseg", new Object[]{Boolean.TRUE});
	}

	public List<CorretoraServicosIseg> getCorretoraServicosIsegList() {
		if(this.corretora != null && this.corretora.getId() != null){
			try {
				this.corretoraServicosIsegList =  this.service.genericFindByNamedQuery("getCorretoraServicosIsegByCorretora", new Object[]{this.corretora.getId()});
				for(CorretoraServicosIseg corretoraServicosIseg : this.corretoraServicosIsegList){
					corretoraServicosIseg.setServicosIseg((ServicosIseg)this.service.find(corretoraServicosIseg.getServicosIseg()));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return corretoraServicosIsegList;
	}

	public List<CorretoraCoberturasIseg> getCorretoraCoberturasIsegList() {
		if(this.corretora != null && this.corretora.getId() != null){
			try {
				this.corretoraCoberturasIsegList =  this.service.genericFindByNamedQuery("getCorretoraCoberturasIsegByCorretora", new Object[]{this.corretora.getId()});
				for(CorretoraCoberturasIseg corretoraCoberturasIseg : this.corretoraCoberturasIsegList){
					corretoraCoberturasIseg.setCoberturasIseg((CoberturasIseg)this.service.find(corretoraCoberturasIseg.getCoberturasIseg()));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return corretoraCoberturasIsegList;
	}
	
	public List<SeguradorasPreferenciais> getSeguradorasPreferenciaisList(){
		if(this.corretora != null && this.corretora.getId() != null){
			try {
				this.seguradorasPreferenciaisList = this.service.genericFindByNamedQuery("getSeguradorasPreferenciaisByCorretora", new Object[]{this.corretora.getId()});
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return this.seguradorasPreferenciaisList;
	}
	
	public List<TemplateMensagem> getTemplateEmailList() {
		if(this.corretora != null && this.corretora.getId() != null){
			try {
				templateEmailList = this.service.genericFindByNamedQuery("getTemplateMensagemByCorretoraAndInmidia", new Object[]{this.corretora.getId(), Constants.TEMPLATE_INMIDIA_EMAIL});
				for(TemplateMensagem templateMensagem : templateEmailList){
					templateMensagem.setTipoMensagem((TipoMensagem)this.service.find(templateMensagem.getTipoMensagem()));
					if(templateMensagem.getIsPadrao() != null && templateMensagem.getIsPadrao()){
						this.templateMensagemEmailId = templateMensagem.getId();
						templateMensagemId[0] = templateMensagem.getId();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return templateEmailList;
	}

	public List<TemplateMensagem> getTemplateSmsList() {
		if(this.corretora != null && this.corretora.getId() != null){
			try {
				templateSmsList = this.service.genericFindByNamedQuery("getTemplateMensagemByCorretoraAndInmidia", new Object[]{this.corretora.getId(), Constants.TEMPLATE_INMIDIA_SMS});
				for(TemplateMensagem templateMensagem : templateSmsList){
					templateMensagem.setTipoMensagem((TipoMensagem)this.service.find(templateMensagem.getTipoMensagem()));
					if(templateMensagem.getIsPadrao() != null && templateMensagem.getIsPadrao()){
						this.templateMensagemSmsId = templateMensagem.getId();
						templateMensagemId[1] = templateMensagem.getId();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return templateSmsList;
	}
	
	public List<PObject> getTipoMensagemList() throws Exception{
		return this.service.genericFindByNamedQuery("getTipoMensagem", new Object[]{Boolean.TRUE});
	}

	public List<PObject> getTipoFranquias() {
		return this.getDominioList("TipoFranquia");
	}
	
	public String inserirCoberturaIseg(){
		try{
			this.service.save(this.corretoraCoberturasIseg);
			this.corretora = this.corretoraCoberturasIseg.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String inserirServicoIseg(){
		try{
			this.service.save(this.corretoraServicosIseg);
			this.corretora = this.corretoraServicosIseg.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String inserirSeguradorasPreferenciais(){
		try{
			String franquia = "";
			for(Long f : franquias){
				franquia += f.toString() + "/";
			}
			this.seguradorasPreferenciais.setFranquias(franquia);
			this.service.save(this.seguradorasPreferenciais);
			this.corretora = this.seguradorasPreferenciais.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String inserirTemplateMensagem(){
		try{
			this.service.save(this.templateMensagem);
			this.corretora = this.templateMensagem.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String excluirCoberturaIseg(){
		try{
			this.service.remove(this.corretoraCoberturasIseg);
			this.corretora = this.corretoraCoberturasIseg.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String excluirServicoIseg(){
		try{
			this.service.remove(this.corretoraServicosIseg);
			this.corretora = this.corretoraServicosIseg.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String excluirSeguradorasPreferenciais(){
		try{
			this.service.remove(this.seguradorasPreferenciais);
			this.corretora = this.seguradorasPreferenciais.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String excluirTemplateMensagem(){
		try{
			this.service.remove(this.templateMensagem);
			this.corretora = this.templateMensagem.getCorretora();
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String editarCoberturaIseg(){
		try{
			if(this.corretoraCoberturasIseg != null && this.corretoraCoberturasIseg.getId() != null){
				this.corretoraCoberturasIseg = (CorretoraCoberturasIseg)this.service.find(this.corretoraCoberturasIseg);
				this.corretora = this.corretoraCoberturasIseg.getCorretora();
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String editarSeguradora(){
		try{
			if(this.seguradorasPreferenciais != null && this.seguradorasPreferenciais.getId() != null){
				this.seguradorasPreferenciais = (SeguradorasPreferenciais)this.service.find(this.seguradorasPreferenciais);
				String[] fran = this.seguradorasPreferenciais.getFranquias().split("/");
				int i = 0;
				this.franquias = new Long[2];
				for(String franquiaS : fran){
					this.franquias[i] = Long.parseLong(franquiaS);
					this.franquiasList.add((DominioEsp)this.service.find(DominioEsp.class,Long.parseLong(franquiaS)));
					i++;
				}
				this.corretora = this.seguradorasPreferenciais.getCorretora();
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	public String editarTemplateMensagem(){
		try{
			if(this.templateMensagem != null && this.templateMensagem.getId() != null){
				this.templateMensagem = (TemplateMensagem)this.service.find(this.templateMensagem);
				this.corretora = this.templateMensagem.getCorretora();
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	@Override
	public String salvarNovo() {
		try{
			if(this.corretora != null && this.corretora.getId() != null){
				this.service.salvarEditar(this.corretora,this.templateMensagemId);
			}
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	public String salvarEditar() {
		try{
			if(this.corretora != null && this.corretora.getId() != null){
				this.service.salvarEditar(this.corretora,this.templateMensagemId);
			}
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}
	
	@Override
	protected int getRowCount() {
		return 0;
	}

	@Override
	protected void setPObjectInstance() throws Exception {
	}

	public Long[] getFranquias() {
		return franquias;
	}

	public void setFranquias(Long[] franquias) {
		this.franquias = franquias;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public CorretoraCoberturasIseg getCorretoraCoberturasIseg() {
		return corretoraCoberturasIseg;
	}

	public void setCorretoraCoberturasIseg(
			CorretoraCoberturasIseg corretoraCoberturasIseg) {
		this.corretoraCoberturasIseg = corretoraCoberturasIseg;
	}

	public CorretoraServicosIseg getCorretoraServicosIseg() {
		return corretoraServicosIseg;
	}

	public void setCorretoraServicosIseg(CorretoraServicosIseg corretoraServicosIseg) {
		this.corretoraServicosIseg = corretoraServicosIseg;
	}

	public SeguradorasPreferenciais getSeguradorasPreferenciais() {
		return seguradorasPreferenciais;
	}

	public void setSeguradorasPreferenciais(
			SeguradorasPreferenciais seguradorasPreferenciais) {
		this.seguradorasPreferenciais = seguradorasPreferenciais;
	}

	public TemplateMensagem getTemplateMensagem() {
		return templateMensagem;
	}

	public void setTemplateMensagem(TemplateMensagem templateMensagem) {
		this.templateMensagem = templateMensagem;
	}

	public List<DominioEsp> getFranquiasList() {
		return franquiasList;
	}

	public void setFranquiasList(List<DominioEsp> franquiasList) {
		this.franquiasList = franquiasList;
	}

	public Long[] getTemplateMensagemId() {
		return templateMensagemId;
	}

	public void setTemplateMensagemId(Long[] templateMensagemId) {
		this.templateMensagemId = templateMensagemId;
	}

	public Long getTemplateMensagemEmailId() {
		return templateMensagemEmailId;
	}

	public void setTemplateMensagemEmailId(Long templateMensagemEmailId) {
		this.templateMensagemEmailId = templateMensagemEmailId;
	}

	public Long getTemplateMensagemSmsId() {
		return templateMensagemSmsId;
	}

	public void setTemplateMensagemSmsId(Long templateMensagemSmsId) {
		this.templateMensagemSmsId = templateMensagemSmsId;
	}
	
}