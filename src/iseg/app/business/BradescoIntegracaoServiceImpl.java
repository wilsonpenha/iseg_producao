package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.conversion.CpfCnpj;
import iseg.app.model.BorderoComissao;
import iseg.app.model.BorderoLancamento;
import iseg.app.model.EdiImportacaoAnexo;
import iseg.app.model.ImportacaoEdiArquivo;
import iseg.app.model.LoteImportacao;
import iseg.app.model.LoteImportacaoItem;
import iseg.app.model.Pessoa;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.SeguradoraRamo;
import iseg.app.model.TipoLancamento;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;

import com.csvreader.CsvReader;

public class BradescoIntegracaoServiceImpl extends PObjectServiceImpl  implements IntegracaoService{

	public BradescoIntegracaoServiceImpl(Session session, EntityManager em, HttpServletRequest request){
		this.setHibernateSession(session);
		this.setEntityManager(em);
		this.setRequest(request);
	}
	
	private Boolean validarArquivoEmissao(ImportacaoEdiArquivo obj) throws Exception{
		return null;
	}

	private Boolean validarArquivoComissao(ImportacaoEdiArquivo obj) throws Exception{
		return null;
	}
	
	public PObject processaArquivoComissao(LoteImportacao loteImport, EdiImportacaoAnexo ediImportacaoAnexo) throws Exception{
		Charset charsetOrigem = Charset.forName("UTF-8");
		CsvReader extratoComissao = new CsvReader(new ByteArrayInputStream(ediImportacaoAnexo.getArquivoByte().getAnexo()),';',charsetOrigem);
		extratoComissao.readHeaders();
		BorderoComissao borderoComissao = new BorderoComissao();
		Map<String, BorderoLancamento> borderoLancamentoMap = new HashMap<String, BorderoLancamento>();
		try{
			Double valorTotalComissao = 0.0;
			Double valorIR = 0.0;
			Double valorISS = 0.0;
			while(extratoComissao.readRecord()){
				String ncocpfcgc = extratoComissao.get("NCO_CPF_CGC");
				String ncotppessoa = extratoComissao.get("NCO_TP_PESSOA");
				String nconcor = extratoComissao.get("NCO_NCOR");
				String ncosuc = extratoComissao.get("NCO_SUC");
				String ncocia = extratoComissao.get("NCO_CIA");
				String ncoamdcobranca = extratoComissao.get("NCO_AMD_COBRANCA");
				String ncoramo = extratoComissao.get("NCO_RAMO");
				String ncoapol = extratoComissao.get("NCO_APOL");
				String ncoitem = extratoComissao.get("NCO_ITEM");
				String ncoendos = extratoComissao.get("NCO_ENDOS");
				String ncoprest = extratoComissao.get("NCO_PREST");
				String ncofatcomis = extratoComissao.get("NCO_FAT_COMIS");
				String ncotipo = extratoComissao.get("NCO_TIPO");
				String ncopremio = extratoComissao.get("NCO_PREMIO");
				String ncocomis = extratoComissao.get("NCO_COMIS");
				String ncoperc = extratoComissao.get("NCO_PERC");
				String ncocodrest = extratoComissao.get("NCO_CODREST");
				String nconmsegurado = extratoComissao.get("NCO_NM_SEGURADO");
				String nconrproposta = extratoComissao.get("NCO_NR_PROPOSTA");
				String nconroct = extratoComissao.get("NCO_NR_OCT");
				String nconrchassi = extratoComissao.get("NCO_NR_CHASSI");
				String nconrlicenca = extratoComissao.get("NCO_NR_LICENCA");
				String ncocpfsegurado = extratoComissao.get("NCO_CPF_SEGURADO");
				String nsevliss = extratoComissao.get("NSE_VL_ISS");
				String nsevlir = extratoComissao.get("NSE_VL_IR");
				String nseliqreceber = extratoComissao.get("NSE_LIQ_RECEBER");
				String nsevlissa = extratoComissao.get("NSE_VL_ISSA");
				String nsevlira = extratoComissao.get("NSE_VL_IRA");
				String nsevlcomisa = extratoComissao.get("NSE_VL_COMISA");
				String nsenrcheque = extratoComissao.get("NSE_NR_CHEQUE");
				String nsetotcomissao = extratoComissao.get("NSE_TOT_COMISSAO");
				String nsecontacorretor = extratoComissao.get("NSE_CONTA_CORRETOR");
				String nsecdagencia = extratoComissao.get("NSE_CD_AGENCIA");
				String nsecdbanco = extratoComissao.get("NSE_CD_BANCO");
				String nsetppagto = extratoComissao.get("NSE_TP_PAGTO");
				String nsenmsucursal = extratoComissao.get("NSE_NM_SUCURSAL");
				String nsenmcorretor = extratoComissao.get("NSE_NM_CORRETOR");
				String nsenmbanco = extratoComissao.get("NSE_NM_BANCO");
				String nsenmagencia = extratoComissao.get("NSE_NM_AGENCIA");
				String nroppstacrrtr = extratoComissao.get("NRO_PPSTA_CRRTR");
				String ccontrespclauto = extratoComissao.get("CCONTR_ESPCL_AUTO");
				
				valorISS = Double.parseDouble(nsevliss!=null?nsevliss:"0");
				valorIR = Double.parseDouble(nsevlir!=null?nsevlir:"0");
				
				BorderoLancamento borderoLancamento = new BorderoLancamento();
				borderoLancamento.setBorderoComissao(borderoComissao);
				borderoComissao.setDataDocumento(getDataArquivo(ncoamdcobranca));
				borderoComissao.setNroExtrato(ncofatcomis.trim());
				borderoLancamento.setDataLancamento(new Date());
				borderoLancamento.setNomeSegurado(nconmsegurado.trim());
				borderoLancamento.setNroApolice(ncoapol.trim());
				borderoLancamento.setNroDocumento(nconrproposta.trim());
				borderoLancamento.setNroParcela(Integer.parseInt(ncoprest));
				borderoLancamento.setPercentualComissao(Double.parseDouble(ncoperc.trim()));
				borderoLancamento.setPremioLiquido(Double.parseDouble(ncopremio.trim()));
				borderoLancamento.setSituacao(Constants.ST_BORDERO_LANCAMENTO_PENDENTE);
				borderoLancamento.setProposta(pesquisaProposta(ncoapol,ncoendos,nconrproposta));
				borderoLancamento.setNroEndosso(ncoendos);
				borderoLancamento.setCpfOuCnpj(new CpfCnpj(ncocpfsegurado));
				Pessoa segurado = null;
				if(!ncocpfsegurado.trim().equals("0")){
					segurado = this.genericFirstFindByNamedQueryNoFilter("getPessoaByCpfOuCnpjNoFilter",new Object[]{ncocpfsegurado});
				}
				borderoLancamento.setSegurado(segurado);
				TipoLancamento tipoLancamento = new TipoLancamento();
				tipoLancamento.setId(new Long(Constants.TP_LOTE_COMISSAO));
				borderoLancamento.setTipoLancamento(tipoLancamento);
				Ramo ramo = null;
				if(ncoramo.equals("988")){
					String nroRamoSeg = nconmsegurado.trim().substring(nconmsegurado.trim().length() - 3, nconmsegurado.trim().length());
					tipoLancamento.setId(new Long(Constants.TP_LOTE_CUSTO_APOLICE));
					borderoLancamento.setTipoLancamento(tipoLancamento);
					SeguradoraRamo seguradoraRamo = this.genericFirstFindByNamedQueryNoFilter("getSeguradoraRamoByCodigoNaSeguradoraAndSeguradora", new Object[]{nroRamoSeg,Constants.SEGURADORA_BRADESCO_AGRUPADO});
					if(seguradoraRamo != null){
						ramo = seguradoraRamo.getRamo();	
					}
				}else{
					SeguradoraRamo seguradoraRamo = this.genericFirstFindByNamedQueryNoFilter("getSeguradoraRamoByCodigoNaSeguradoraAndSeguradora", new Object[]{ncoramo,Constants.SEGURADORA_BRADESCO_AGRUPADO});
					if(seguradoraRamo != null){
						ramo = seguradoraRamo.getRamo(); 
					}
				}
				if(ramo != null){
					if(ramo.getId().compareTo(Constants.RAMO_AUTOMOVEL)==0){
						BorderoLancamento bordLanc = borderoLancamentoMap.get(nconmsegurado.trim());
						if(bordLanc != null){
							bordLanc.setNroApolice(ncoapol);
						}else if(borderoLancamento.getProposta() == null){
							borderoLancamentoMap.put(nconmsegurado.trim(), borderoLancamento);
						}
					}else if(ramo.getId().compareTo(Constants.RAMO_RESIDENCIAL)==0){
						BorderoLancamento bordLanc = borderoLancamentoMap.get(nconmsegurado.trim());
						if(bordLanc != null){
							borderoLancamento.setRamo(bordLanc.getRamo());
							borderoLancamento.setNroApolice(bordLanc.getNroApolice());
						}else if(borderoLancamento.getProposta() == null){
							borderoLancamentoMap.put(nconmsegurado.trim(), borderoLancamento);
						}
					}
				}
				
				borderoLancamento.setRamo(ramo);
				valorTotalComissao += Double.parseDouble(ncocomis.trim());
				borderoLancamento.setValorComissao(Double.parseDouble(ncocomis.trim()));
				borderoComissao.getBorderoLancamentoCollection().add(borderoLancamento);
			}
			BorderoLancamento borLancamentoIss = new BorderoLancamento();
			borLancamentoIss.setTipoLancamento(new TipoLancamento());
			borLancamentoIss.getTipoLancamento().setId(new Long(Constants.TP_LOTE_ISS));
			borLancamentoIss.setNomeSegurado("LANÇAMENTO DE ISS");
			borLancamentoIss.setValorComissao((-1)*valorISS);
			borLancamentoIss.setBorderoComissao(borderoComissao);
			borLancamentoIss.setSituacao(Constants.ST_BORDERO_LANCAMENTO_PENDENTE);
			
			BorderoLancamento borLancamentoIR = new BorderoLancamento();
			borLancamentoIR.setTipoLancamento(new TipoLancamento());
			borLancamentoIR.getTipoLancamento().setId(new Long(Constants.TP_LOTE_IR));
			borLancamentoIR.setNomeSegurado("LANÇAMENTO DE IR ");
			borLancamentoIR.setValorComissao((-1)*valorIR);
			borLancamentoIR.setBorderoComissao(borderoComissao);
			borLancamentoIR.setSituacao(Constants.ST_BORDERO_LANCAMENTO_PENDENTE);
			
			borderoComissao.getBorderoLancamentoCollection().add(borLancamentoIss);
			borderoComissao.getBorderoLancamentoCollection().add(borLancamentoIR);
			Seguradora seguradora = new Seguradora();
			seguradora.setId(Constants.SEGURADORA_BRADESCO_AGRUPADO);
			borderoComissao.setSeguradora(seguradora);
			borderoComissao.setValorTotal(valorTotalComissao - valorISS - valorIR);
			borderoComissao.setCorretora(loteImport.getCorretora());
			borderoComissao.setDataLancamento(new Date());
			borderoComissao.setSituacao(Constants.ST_LOTE_EM_ABERTO);
			borderoComissao.setLoteImportacao(loteImport);
			
			List<BorderoComissao> borderoComissaoList = (List<BorderoComissao>)this.genericFirstFindByNamedQueryNoFilter("getBordComissBySegAndCorretoraAndNroExt",new Object[]{Constants.SEGURADORA_BRADESCO_AGRUPADO,loteImport.getCorretora().getId(),borderoComissao.getNroExtrato()});
			if(borderoComissaoList  == null || borderoComissaoList.isEmpty()){
				this.saveNoFilter(borderoComissao);
				loteImport.setSituacao(Constants.LOTE_IMPORTACAO_SITUACAO_PROCESSADO);
				loteImport.setDtFinalProcessamento(new Timestamp(GregorianCalendar.getInstance().getTimeInMillis()));
				this.saveNoFilter(loteImport);
			}
		}catch(Exception e){
			throw new Exception("Houve uma falha ao ");
		}
		return borderoComissao;
	}
	
	public Proposta pesquisaProposta(String nroApolice, String nroEndosso, String nroProposta) throws Exception{
		if(!nroEndosso.trim().equals("") && !nroEndosso.trim().equals("0")){
			Proposta proposta = this.genericFirstFindByNamedQueryNoFilter("getPropostaByNroEndosso", new Object[]{nroEndosso});
			if(proposta != null){
				return proposta;
			}
		}
		if(!nroApolice.trim().equals("") && !nroApolice.trim().equals("0")){
			Proposta proposta = this.genericFirstFindByNamedQueryNoFilter("getPropostaByNroApolice2", new Object[]{nroApolice});
			if(proposta != null){
				return proposta;
			}
		}
		if(!nroProposta.trim().equals("") && !nroProposta.trim().equals("0")){
			Proposta proposta = this.genericFirstFindByNamedQueryNoFilter("getPropostaByNroPropostaSeg2", new Object[]{nroProposta});
			if(proposta != null){
				return proposta;
			}
		}
		return null;
	}
	public PObject processaArquivoEmissao(LoteImportacao loteImport, EdiImportacaoAnexo ediImportacaoAnexo) throws Exception{
		Charset charsetOrigem = Charset.forName("UTF-8");
		CsvReader segurosEmitidos = new CsvReader(new ByteArrayInputStream(ediImportacaoAnexo.getArquivoByte().getAnexo()),';',charsetOrigem);
		segurosEmitidos.readHeaders();
		BorderoComissao borderoComissao = new BorderoComissao();
		Map<String, BorderoLancamento> borderoLancamentoMap = new HashMap<String, BorderoLancamento>();
		try{
			while(segurosEmitidos.readRecord()){
				String	ccnpj_cia_segrd =	segurosEmitidos.get("CCNPJ_CIA_SEGRD");
				String	ccia_segrd =	segurosEmitidos.get("CCIA_SEGRD");
				String	csucur_segdr =	segurosEmitidos.get("CSUCUR_SEGDR");
				String	ccrrtr =	segurosEmitidos.get("CCRRTR");
				String	cramo_apolc =	segurosEmitidos.get("CRAMO_APOLC");
				String	demis_apolc =	segurosEmitidos.get("DEMIS_APOLC");
				String	icia_segdr =	segurosEmitidos.get("ICIA_SEGDR");
				String	isucur =	segurosEmitidos.get("ISUCUR");
				String	capolc =	segurosEmitidos.get("CAPOLC");
				String	citem_apolc =	segurosEmitidos.get("CITEM_APOLC");
				String	dinic_vgcia =	segurosEmitidos.get("DINIC_VGCIA");
				String	dfim_vgcia =	segurosEmitidos.get("DFIM_VGCIA");
				String	isegrd =	segurosEmitidos.get("ISEGRD");
				String	cnro_ppsta_apolc =	segurosEmitidos.get("CNRO_PPSTA_APOLC");
				String	vtot_prmio_segur =	segurosEmitidos.get("VTOT_PRMIO_SEGUR");
				String	ccpf_cnpj =	segurosEmitidos.get("CCPF_CNPJ");
				String	qprest_prmio_pg =	segurosEmitidos.get("QPREST_PRMIO_PG");
				String	chasi_veic =	segurosEmitidos.get("CHASI_VEIC");
				String	pfator_ajust_mercd =	segurosEmitidos.get("PFATOR_AJUST_MERCD");
				String	ccontr_espcl_auto =	segurosEmitidos.get("CCONTR_ESPCL_AUTO");

				LoteImportacaoItem loteImportacaoItem = new LoteImportacaoItem();
				loteImportacaoItem.setAutorConciliacao(loteImport.getLog().getAutor());
				loteImportacaoItem.setLog(loteImport.getLog());
				loteImportacaoItem.setCpfCnpjSegurado(ccpf_cnpj);
//				loteImportacaoItem.setDtConciliacao(dtConciliacao);
				loteImportacaoItem.setDtFinalVigencia(getDataArquivo(dfim_vgcia));
				loteImportacaoItem.setDtInicioVigencia(getDataArquivo(dinic_vgcia));
//				loteImportacaoItem.setInConciliacaoManual(inConciliacaoManual);
				loteImportacaoItem.setLoteImportacao(loteImport);
				loteImportacaoItem.setNomeSegurado(isegrd);
				loteImportacaoItem.setNumeroApolice(capolc);
//				loteImportacaoItem.setNumeroApoliceAnterior(napolc_segur_anter);
//				loteImportacaoItem.setNumeroEndosso(cind_endss_apolc);
				loteImportacaoItem.setNumeroProposta(cnro_ppsta_apolc);
				loteImportacaoItem.setPremioTotal(new BigDecimal(vtot_prmio_segur.equals("")?"0":vtot_prmio_segur));
				loteImportacaoItem.setProposta(this.pesquisaProposta(capolc, "", cnro_ppsta_apolc));
				loteImportacaoItem.setRegistro(citem_apolc);
				SeguradoraRamo seguradoraRamo = this.genericFirstFindByNamedQueryNoFilter("getSeguradoraRamoByCodigoNaSeguradoraAndSeguradora", new Object[]{cramo_apolc,Constants.SEGURADORA_BRADESCO_AGRUPADO});
				if(seguradoraRamo != null){
					loteImportacaoItem.setRamo(seguradoraRamo.getRamo());
				}
//				loteImportacaoItem.setVersao(versao);
				this.saveNoFilter(loteImportacaoItem);
			}
			loteImport.setSituacao(Constants.LOTE_IMPORTACAO_SITUACAO_PROCESSADO);
			loteImport.setDtFinalProcessamento(new Timestamp(GregorianCalendar.getInstance().getTimeInMillis()));
			this.saveNoFilter(loteImport);
		}catch(Exception e){
			throw new Exception("Houve uma falha ao ");
		}
		return null;
	}
	private Timestamp getDataArquivo(String data) throws ParseException{
		if(data != null && data.length() == 8){
			return new Timestamp(new SimpleDateFormat("yyyyMMdd").parse(data).getTime());
		}
		return null;
		
	}
}
