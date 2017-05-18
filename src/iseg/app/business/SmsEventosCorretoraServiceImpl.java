package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.model.Automovel;
import iseg.app.model.Corretora;
import iseg.app.model.PessoaFisica;
import iseg.app.model.Produtor;
import iseg.app.model.Proposta;
import iseg.app.model.SmsEventosCorretora;
import iseg.app.model.SmsTelefonesProdutor;
import iseg.app.model.SmsserverIn;
import iseg.app.model.SmsserverOut;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.Formatter;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.google.transconsole.common.messages.Hash;
import com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable;


//@Service
public class SmsEventosCorretoraServiceImpl extends PObjectServiceImpl implements SmsEventosCorretoraService {

	public List<PObject> findAll(int page, int pageSize) throws Exception {
		getEntityManager().clear();
		return genericFindByNamedQuery("getSmsEventosCorretora", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getSmsEventosCorretora", null);
	}
	
	public void agenteDeEventosSms() throws Exception{
		List<SmsEventosCorretora> smsEventosCorretoraList = this.genericFindByNamedQueryWithoutApplyFilter("getSmsEventosCorretoraAtivos", null);
		
		for (SmsEventosCorretora smsEventosCorretora : smsEventosCorretoraList) {
			if (smsEventosCorretora.getSmsEventos().getId().equals(Constants.SMS_EVT_ANIVERSARIANTE)){
				enviarSmsAniversariantes(smsEventosCorretora);
			}else if (smsEventosCorretora.getSmsEventos().getId().equals(Constants.SMS_EVT_APOLICE_VENCIDA)){
				enviarSmsVencimentoApolice(smsEventosCorretora);
			}else if (smsEventosCorretora.getSmsEventos().getId().equals(Constants.SMS_EVT_CNH_VENCIDA)){
				enviarSmsVencimentoCnh(smsEventosCorretora);
			}
		}
		
	}
	
	public void enviarSmsAniversariantes(SmsEventosCorretora smsEventosCorretora) throws Exception{
		Calendar c1 = Calendar.getInstance();
		c1.setTime(new Date());
		c1.add(Calendar.DATE, -smsEventosCorretora.getDiasAntecedencia().intValue());
		
		if (smsEventosCorretora.getCorretora().getSmsIsAtivo()){
			List<PessoaFisica> pessoaList = (List<PessoaFisica>)this.genericFindBySQLQueryWithoutApplyFilter("Select p from PessoaFisica p where p.corretora.id = ?0 and p.smsIsAtivo = true and month(p.dataNascimento) = ?1 and day(p.dataNascimento) = ?2", new Object[]{smsEventosCorretora.getCorretora().getId(),c1.get(Calendar.MONTH)+1,c1.get(Calendar.DAY_OF_MONTH)});
			for (PessoaFisica pessoa : pessoaList) {
				if (pessoa.getTelefoneCelular() != null && pessoa.getTelefoneCelular().length()>9){
					String nroCelular = pessoa.getTelefoneCelular(); 
					nroCelular = String.format("(%s) %s-%s", new String[]{nroCelular.substring(0, 2), nroCelular.substring(2, 6), nroCelular.substring(6)});

					String textoInforma = smsEventosCorretora.getCorretora().getSmsTextoInforma();
					if (textoInforma==null || textoInforma.isEmpty()){
						textoInforma = smsEventosCorretora.getCorretora().getNome().substring(0,14)+", informa: ";
					}               

					String textoMensagem = smsEventosCorretora.getMensagem();
					if (textoMensagem==null || textoMensagem.trim().isEmpty()){
						textoMensagem = "A <CORRETORANOME>, DESEJA-LHE UM FELIZ ANIVERSARIO E UM ANO REPLETO DE REALIZACOES, MUITO SAUDE E PAZ. AGRADECEMOS A PREFERENCIA.";
					}
					textoMensagem = textoMensagem.replaceAll("<CORRETORANOME>", smsEventosCorretora.getCorretora().getNome());
					
					SmsserverOut smsserverOut = new SmsserverOut();
					smsserverOut.setType("O");
					smsserverOut.setRecipient("556282660727");
					smsserverOut.setText(textoInforma+textoMensagem);
					smsserverOut.setCreateDate(new Date());
					smsserverOut.setOriginator("556282660727");
					smsserverOut.setEncoding("7");
					smsserverOut.setStatusReport(0);
					smsserverOut.setFlashSms(0);
					smsserverOut.setPriority(0);
					smsserverOut.setStatus("U");
					smsserverOut.setGatewayId("modem1");
					this.save(smsserverOut);
				}
				
			}
		}
	}
	
	public void enviarSmsVencimentoApolice(SmsEventosCorretora smsEventosCorretora) throws Exception{
		Calendar c1 = Calendar.getInstance();
		c1.setTime(new Date());
		c1.add(Calendar.DATE, smsEventosCorretora.getDiasAntecedencia().intValue());
		
		if (smsEventosCorretora.getCorretora().getSmsIsAtivo()){
			List<Proposta> propostaList = (List<Proposta>)this.genericFindBySQLQueryWithoutApplyFilter("Select p from Proposta p where p.corretora.id = ?0 and p.cliente.smsIsAtivo = true and p.terminoVigencia = ?1 and p.situacaoOperacional = 0", new Object[]{smsEventosCorretora.getCorretora().getId(),c1.getTime()});
			for (Proposta proposta : propostaList) {
				if (proposta.getCliente().getTelefoneCelular() != null && proposta.getCliente().getTelefoneCelular().length()>9){
					String pnome = proposta.getClienteNome();
					String nroApolice = proposta.getNroApolice();
					String cia = proposta.getSeguradora().getNome();
					String terminoVigencia = Formatter.getDate(proposta.getTerminoVigencia());
					String itemSegurado = "ITEM DIVERSOS";

					if (proposta.getRamo().getId().longValue()==Constants.RAMO_AUTOMOVEL.longValue() && proposta.getAutomovelWizCollection().size()>0){
						itemSegurado = "VEICULO PLC:"+proposta.getAutomovelWizCollection().get(0).getNroPlaca() + " / " + "COR:"+proposta.getAutomovelWizCollection().get(0).getCorPredominante();
					}
					String nroCelular = proposta.getCliente().getTelefoneCelular(); 
					nroCelular = String.format("(%s) %s-%s", new String[]{nroCelular.substring(0, 2), nroCelular.substring(2, 6), nroCelular.substring(6)});

					String textoInforma = smsEventosCorretora.getCorretora().getSmsTextoInforma();
					if (textoInforma==null || textoInforma.isEmpty()){
						textoInforma = smsEventosCorretora.getCorretora().getNome().substring(0,14)+", informa: ";
					}               

					String textoMensagem = smsEventosCorretora.getMensagem();
					if (textoMensagem==null || textoMensagem.trim().isEmpty()){
						textoMensagem = "CARO SR. <PNOME>, SUA APOLICE DE NRO.: <NROAPOLICE>, REFERENTE AO ITEM SEGURADO: <ITEMSEGURADO>, SEGURADORA: <CIA>, IRA VENCER EM, <TERM_VIGENC>, EM CASO DE DUVIDA LIGUE PARA SEU CORRETOR.";
					}
					textoMensagem = textoMensagem.replaceAll("<PNOME>", pnome).replaceAll("<NROAPOLICE>", nroApolice).replaceAll("<CIA>", cia).replaceAll("<TERM_VIGENC>", terminoVigencia).replaceAll("<ITEMSEGURADO>", itemSegurado);
					
					SmsserverOut smsserverOut = new SmsserverOut();
					smsserverOut.setType("O");
					smsserverOut.setRecipient("556282660727");
					smsserverOut.setText(textoInforma+textoMensagem);
					smsserverOut.setCreateDate(new Date());
					smsserverOut.setOriginator("556282660727");
					smsserverOut.setEncoding("7");
					smsserverOut.setStatusReport(0);
					smsserverOut.setFlashSms(0);
					smsserverOut.setPriority(0);
					smsserverOut.setStatus("U");
					smsserverOut.setGatewayId("modem1");
					this.save(smsserverOut);
				}
				
			}
		}
	}
	
	public void enviarSmsVencimentoCnh(SmsEventosCorretora smsEventosCorretora) throws Exception{
		Calendar c1 = Calendar.getInstance();
		c1.setTime(new Date());
		c1.add(Calendar.DATE, smsEventosCorretora.getDiasAntecedencia().intValue());
		
		if (smsEventosCorretora.getCorretora().getSmsIsAtivo()){
			List<PessoaFisica> pessoaList = (List<PessoaFisica>)this.genericFindBySQLQueryWithoutApplyFilter("Select p from PessoaFisica p where p.corretora.id = ?0 and p.smsIsAtivo = true and p.dataVencHabilitacao is not null and p.dataVencHabilitacao = ?1 ", new Object[]{smsEventosCorretora.getCorretora().getId(),c1.getTime()});
			for (PessoaFisica pessoaFisica : pessoaList) {
				if (pessoaFisica.getTelefoneCelular() != null && pessoaFisica.getTelefoneCelular().length()>9){
					String pnome = pessoaFisica.getNome();
					String dataVencCnh = Formatter.getDate(pessoaFisica.getDataVencHabilitacao());
					
					String textoMensagem = smsEventosCorretora.getMensagem();
					textoMensagem = textoMensagem.replaceAll("<PNOME>", pnome).replaceAll("<DATAVENCCNH>", dataVencCnh);
					
					String textoInforma = pessoaFisica.getCorretora().getSmsTextoInforma();
					if (textoInforma==null || textoInforma.equals(""))
						textoInforma = "iSeg informa: ";

					SmsserverOut smsserverOut = new SmsserverOut();
					smsserverOut.setType("O");
					smsserverOut.setRecipient("556282660727");
					smsserverOut.setText(textoInforma+textoMensagem);
					smsserverOut.setCreateDate(new Date());
					smsserverOut.setOriginator("556282660727");
					smsserverOut.setEncoding("7");
					smsserverOut.setStatusReport(0);
					smsserverOut.setFlashSms(0);
					smsserverOut.setPriority(0);
					smsserverOut.setStatus("U");
					smsserverOut.setGatewayId("modem1");
					this.save(smsserverOut);
				}
				
			}
		}
	}
	
	public void consultaSms() throws Exception{
		List<SmsserverIn> smsIn = this.genericFindByNamedQueryWithoutApplyFilter("getSmsserverInNaoEncaminhados", new Object[]{});
		
		for (SmsserverIn smsserverIn : smsIn) {
			try{
				String nroCelular = smsserverIn.getOriginator().substring(1);
				if (nroCelular.length()>9){
					nroCelular = String.format("(%s) %s-%s", new String[]{nroCelular.substring(0, 2), nroCelular.substring(2, 6), nroCelular.substring(6)});
					List<Produtor> produtores = this.genericFindByNamedQueryWithoutApplyFilter("getProdutorByNroCelular", new Object[]{nroCelular});
					List<SmsTelefonesProdutor> telefones = new ArrayList<SmsTelefonesProdutor>();
					
					// Se o telefone da consulta não for do produtor, então verifica se ele está na lista de telefones permitidos.
					if (produtores.size()==0)
						telefones = this.genericFindByNamedQueryWithoutApplyFilter("getNroCelularDeProdutores", new Object[]{nroCelular});
					
					String textoRetorno = "iSeg informa: ";
					Corretora corretora = null;

					if (produtores.size()>0){
						Hashtable ids = new Hashtable();
						for (Produtor produtor : produtores) {
							corretora = produtor.getCorretora();
							if (!ids.containsKey(corretora.getId())){
								enviarSms(smsserverIn, textoRetorno, corretora);
								ids.put(corretora.getId(), corretora.getId());
							}
						}
					}else if (telefones.size()>0){
						Hashtable ids = new Hashtable();
						for (SmsTelefonesProdutor smsTelefonesProdutor : telefones) {
							corretora = smsTelefonesProdutor.getProdutor().getCorretora();
							if (!ids.containsKey(corretora.getId())){
								enviarSms(smsserverIn, textoRetorno, corretora);
								ids.put(corretora.getId(), corretora.getId());
							}
						}
					}else{
						smsserverIn.setEncaminhado("I");
						this.save(smsserverIn);
					}
				}else{
					smsserverIn.setEncaminhado("I");
					this.save(smsserverIn);
				}
			}catch (Exception e) {
				smsserverIn.setEncaminhado("E");
				this.save(smsserverIn);
				e.printStackTrace();
			}
		}		
	}
	
	private void enviarSms(SmsserverIn smsserverIn, String textoRetorno, Corretora corretora) throws Exception{
		String smsText = smsserverIn.getText().toUpperCase();
		String shortCodeValue = "";
		int posShortCode = smsText.indexOf(" ");
		Date hoje = new Date();
		if (posShortCode>=0){
			String shortCode = smsText.substring(0,posShortCode);
			
			// Se for pesquisa PL (por placa) ou CH (por chassis), retorna dados do veiculo.
			if ("PL".equals(shortCode) || "CH".equals(shortCode)){
				shortCodeValue = smsText.substring(posShortCode+1).replace(" ", "").replace("-", "").replace(".", "");
				List<Automovel> automoveis = null;
				if ("PL".equals(shortCode))
					automoveis = this.genericFindByNamedQueryWithoutApplyFilter("getAutomovelByPlaca", new Object[]{corretora.getId(), shortCodeValue});
				else
					automoveis = this.genericFindByNamedQueryWithoutApplyFilter("getAutomovelByChassis", new Object[]{corretora.getId(), shortCodeValue});
				
				if (automoveis.size()>0){
					Automovel automovel = automoveis.get(0);
					if (automovel.getProposta().getTerminoVigencia().getTime() < hoje.getTime())
						textoRetorno += "(APOLICE VENCIDA) / ";
						
					String cliente = automovel.getProposta().getCliente().getNome();
					textoRetorno += "CLI:"+(cliente.length()>15 ? cliente.substring(0,15) : cliente) + " / ";
					String cia = automovel.getProposta().getSeguradora().getNome();
					textoRetorno += "CIA:"+(cia.length()>15 ? cia.substring(0,15) : cia) + " / ";
					String _0800 = automovel.getProposta().getSeguradora().getTelefone0800();
					textoRetorno += _0800==null ? "SAC:(N/INF) / " : "SAC:"+_0800 + " / ";
					textoRetorno += "PLC:"+automovel.getNroPlaca() + " / " + "COR:"+automovel.getCorPredominante() + " / ";
					textoRetorno += "FRQ:R"+Formatter.formatNumber(automovel.getFranquia()) + " / ";
					textoRetorno += "APOL:"+automovel.getProposta().getNroApolice() + " / ";
					textoRetorno += "TVIG:"+Formatter.getDate(automovel.getProposta().getTerminoVigencia());
					if (textoRetorno.length()>160)
						textoRetorno = textoRetorno.substring(0,159);
					
					SmsserverOut smsserverOut = new SmsserverOut();
					smsserverOut.setType("O");
					smsserverOut.setRecipient("55"+smsserverIn.getOriginator().substring(1));
					smsserverOut.setText(textoRetorno);
					smsserverOut.setCreateDate(new Date());
					smsserverOut.setOriginator("556282660727");
					smsserverOut.setEncoding("7");
					smsserverOut.setStatusReport(0);
					smsserverOut.setFlashSms(0);
					smsserverOut.setPriority(0);
					smsserverOut.setStatus("U");
					smsserverOut.setGatewayId("modem1");
					this.save(smsserverOut);
					smsserverIn.setEncaminhado("S");
					this.save(smsserverIn);
				}else{
					SmsserverOut smsserverOut = new SmsserverOut();
					smsserverOut.setType("O");
					smsserverOut.setRecipient("55"+smsserverIn.getOriginator().substring(1));
					smsserverOut.setText(textoRetorno+"Sua solicitacao, nao pode ser atendida pelo seguinte motivo: " + 
							            ("PL".equals(shortCode) ? "PLACA :"+shortCodeValue+" nao foi localizada" : "CHASSIS :"+shortCodeValue+" nao foi localizado"));
					smsserverOut.setCreateDate(new Date());
					smsserverOut.setOriginator("556282660727");
					smsserverOut.setEncoding("7");
					smsserverOut.setStatusReport(0);
					smsserverOut.setFlashSms(0);
					smsserverOut.setPriority(0);
					smsserverOut.setStatus("U");
					smsserverOut.setGatewayId("modem1");
					this.save(smsserverOut);
					smsserverIn.setEncaminhado("S");
					this.save(smsserverIn);
				}
			}else{
				SmsserverOut smsserverOut = new SmsserverOut();
				smsserverOut.setType("O");
				smsserverOut.setRecipient("55"+smsserverIn.getOriginator().substring(1));
				smsserverOut.setText(textoRetorno+"Sua solicitacao, nao pode ser atendida pelo seguinte motivo: " + 
						            "O SHORT-CODE informado, e invalido ("+smsText+")");
				smsserverOut.setCreateDate(new Date());
				smsserverOut.setOriginator("556282660727");
				smsserverOut.setEncoding("7");
				smsserverOut.setStatusReport(0);
				smsserverOut.setFlashSms(0);
				smsserverOut.setPriority(0);
				smsserverOut.setStatus("U");
				smsserverOut.setGatewayId("modem1");
				this.save(smsserverOut);
				smsserverIn.setEncaminhado("S");
				this.save(smsserverIn);
			}
		}else{
			SmsserverOut smsserverOut = new SmsserverOut();
			smsserverOut.setType("O");
			smsserverOut.setRecipient("55"+smsserverIn.getOriginator().substring(1));
			smsserverOut.setText(textoRetorno+"Sua solicitacao, nao pode ser atendida pelo seguinte motivo: " + 
					            "O SHORT-CODE informado, e invalido ("+smsText+")");
			smsserverOut.setCreateDate(new Date());
			smsserverOut.setOriginator("556282660727");
			smsserverOut.setEncoding("7");
			smsserverOut.setStatusReport(0);
			smsserverOut.setFlashSms(0);
			smsserverOut.setPriority(0);
			smsserverOut.setStatus("U");
			smsserverOut.setGatewayId("modem1");
			this.save(smsserverOut);
			smsserverIn.setEncaminhado("S");
			this.save(smsserverIn);
		}
	}
}
