/************************************************************/
//Titulo.....: Projeto iseg
//Empresa....: Atlas
//Versao.....: 0.1
//Alterado em: 20/5/2008
/************************************************************/
package iseg.app.action;

import iseg.app.model.Pessoa;
import iseg.app.model.Produtor;
import iseg.app.model.SmsserverOut;
import iseg.app.persistence.PObjectService;

import java.util.Date;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class SmsConsoleEnvioAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	protected PObjectService service;
	private Pessoa pessoa;
	private String mensagem;

	//@Autowired
	public SmsConsoleEnvioAction(PObjectService service) {
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

	public String enviar(){
		try{
			SmsserverOut smsserverOut = new SmsserverOut();
			smsserverOut.setType("O");
			
			if (this.pessoa.getTelefoneCelular()!=null)
				smsserverOut.setRecipient("55"+this.pessoa.getTelefoneCelular().replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
			else
				return Action.ERROR;
			
			String textoInforma = this.corretoraEmUso.getSmsTextoInforma();
			if (textoInforma==null || textoInforma.isEmpty())
				textoInforma = this.corretoraEmUso.getNome().substring(0,15);
			smsserverOut.setText(textoInforma+":"+mensagem);
			smsserverOut.setCreateDate(new Date());
			smsserverOut.setOriginator("556282660727");
			smsserverOut.setEncoding("7");
			smsserverOut.setStatusReport(0);
			smsserverOut.setFlashSms(0);
			smsserverOut.setPriority(0);
			smsserverOut.setStatus("U");
			smsserverOut.setGatewayId("modem1");
			smsserverOut.setUsuario(this.getUsuarioEmUso());
			Produtor produtor = (Produtor)this.service.find(Produtor.class, this.pessoa.getId());
			if (produtor==null)
				smsserverOut.setPessoa(pessoa);
			else
				smsserverOut.setProdutor(produtor);
			
			this.service.save(smsserverOut);
			return Action.SUCCESS;
		}catch (Exception e) {
			return Action.ERROR;
		}
		
	}
	protected void setPObjectInstance() {
		try {
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@Override
	protected int getRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

}

/************************************************************/
//Atlas, 2008
/************************************************************/