/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 6/24/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Acao;
import iseg.app.model.Menu;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;

public class MenuAction extends BaseAction implements RequestAware{

	private static final long serialVersionUID = 1L;
	private Menu menu;
	private Menu pai;
	private Acao acao;
	private List<PObject> menus;
	protected PObjectService service;

	//@Autowired
	public MenuAction(PObjectService service) {
		super(service);
		this.service = service;
	}

	@SkipValidation
	public String novo() {
		try{
			if (this.menu != null && this.menu.getId()!=null){
				Menu filho = new Menu();
				this.pai = this.menu;
				int ordem = this.service.getRowCount("getMaxOrdem", new Object[]{this.menu.getId()});
				filho.setPai(this.pai);
				filho.setOrdem(ordem+1);
				this.menu = filho;
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String novoBotao() {
		try{
			Acao botao = new Acao();
			botao.setMenu(this.menu);
			this.acao = botao;
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String salvarBotao() {
		try{
			this.service.save(this.acao);
			this.acao = (Acao)service.find(this.acao);
			this.service.refresh(acao);
			this.menu = (Menu)service.find(this.acao.getMenu());
			return Action.SUCCESS;
		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarBotao() {
		
		try{
		
			this.acao = (Acao)service.find(this.acao);
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	protected void persistPObjects(){
		if (this.menu.getPai()!=null && this.menu.getPai().getId()==null)
			this.menu.setPai(null);
	}

	protected void setPObjectInstance() {
		try {
			this.menu = (Menu)this.pobject;
			this.service.refresh(pobject);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@SkipValidation
	public String excluir() {
		
		try{
			
			this.menu = (Menu)this.service.find(pobject);
			Menu menuPai = this.menu.getPai();
			this.service.remove(this.menu);
			
			this.menu = (Menu)this.service.find(menuPai);
			
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError("Este registro Não pode ser excluido por estar sendo referênciado por outro DOCUMENTO!");
			return Action.ERROR;
		}
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
		this.pobject = this.menu;
	}

	public List<PObject> getMenus(){
		return menus;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountMenu", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public List<Menu> getMenuPaiList(){

		try {
			return this.service.genericFindByNamedQueryWithoutApplyFilter("getMenuPai", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Menu>();
		}
	}

	public List<Menu> getListaFilhos(){

		try {
			return this.service.genericFindByNamedQueryWithoutApplyFilter("getMenuPorPai", new Object[]{this.menu.getId()});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Menu>();
		}
	}

	public List<PObject> getPrivilegiosList(){
		return this.getDominioList("Privilegio");
    }

	public Menu getPai() {
		return pai;
	}

	public void setPai(Menu pai) {
		this.pai = pai;
	}

	public Acao getAcao() {
		return acao;
	}

	public void setAcao(Acao acao) {
		this.acao = acao;
	}

}
/************************************************************/
//Atlas, 2008
/************************************************************/