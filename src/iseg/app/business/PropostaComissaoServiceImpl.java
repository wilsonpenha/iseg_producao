package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Agenciamento;
import iseg.app.model.BorderoComissao;
import iseg.app.model.BorderoLancamento;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.CorretoraTipoLancamento;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ParcelasAgenciamento;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaComissao;
import iseg.app.model.Ramo;
import iseg.app.model.RepasseComissao;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.Formatter;
import iseg.utils.Util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


//@Service
public class PropostaComissaoServiceImpl extends PObjectServiceImpl implements
		PropostaComissaoService {

	public void removePropostaComissao(List<Long> idsPropostaComissao)	throws Exception {
		PropostaComissao comissao = null;
		for (Long idComissao : idsPropostaComissao) {
			comissao = new PropostaComissao();
			comissao.setId(idComissao);
			this.remove(comissao);
		}
	}

	public boolean gerarComissoes(Proposta proposta) throws Exception{
		try {

			DecimalFormat dff = (DecimalFormat) DecimalFormat.getInstance();
			DecimalFormatSymbols dfs = dff.getDecimalFormatSymbols();
			dfs.setDecimalSeparator(',');
			dff.setDecimalFormatSymbols(dfs);
			
			PropostaComissao propostaComissao = null;

			Double fator = proposta.getFator();          
			Double premioLiquido = proposta.getPremioLiquido();
			Double valorComissaoTotal = (premioLiquido*fator)/100;

			// Gerar repasse de comissao com valor fixo.
			int existeBaixaRepasse = this.getRowCount("checarBaixaRepasseExistente", new Object[]{proposta.getId()});
			if (existeBaixaRepasse==0){
				executeNamedQuery("deleteRepasseComissaoByPropostaId", new Object[]{proposta.getId()});
				gerarRepasseValorFixo(proposta);
			}
			
			if(proposta.getTipoRecebimentoComissao().equals(Constants.TP_RECEB_COM_ANTECIPADA)){
				propostaComissao = new PropostaComissao();
				propostaComissao.setNroDaParcela(1);
				propostaComissao.setProposta(proposta);
				propostaComissao.setSituacao(0);
				propostaComissao.setDataVencimento(proposta.getDataVencim1aParcela());
				propostaComissao.setValorComissao(valorComissaoTotal);
				propostaComissao.setPercentualComissao(fator);
				propostaComissao.setNatureza(Constants.NT_COMISSAO);
				propostaComissao.setTipoLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				this.save(propostaComissao);

			} else if(proposta.getTipoRecebimentoComissao().equals(Constants.TP_RECEB_COM_PARCELADO)){

				Integer quantidadeComissoes = proposta.getQuantParcelasComissao().intValue();
				Double valorComissao = valorComissaoTotal/quantidadeComissoes;
				for(int i=0 ; i<quantidadeComissoes ; i++){
					Calendar c = Calendar.getInstance();
					c.setTimeInMillis(proposta.getDataVencim1aParcela().getTime());
					c.add(Calendar.MONTH, i);
					propostaComissao = new PropostaComissao();
					propostaComissao.setNroDaParcela(new Integer(i+1));
					propostaComissao.setProposta(proposta);
					propostaComissao.setSituacao(0);
					propostaComissao.setDataVencimento(c.getTime());
					propostaComissao.setValorComissao(valorComissao);
					propostaComissao.setPercentualComissao(fator);
					propostaComissao.setNatureza(Constants.NT_COMISSAO);
					propostaComissao.setTipoLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(propostaComissao);
				}
			} else if(proposta.getTipoRecebimentoComissao().equals(Constants.TP_RECEB_COM_FLUXO)){

				List<ParcelasProposta>parcelas = proposta.getParcelasPropostaCollection();
				int i=0;
				Double saldo = valorComissaoTotal;

				for(i=0 ; i<parcelas.size() ; i++){
					Double valorComissao = parcelas.get(i).getValorParcela();

					if (valorComissao > 0 && saldo > 0){
						if (valorComissao > saldo) valorComissao = saldo; 
						Calendar c = Calendar.getInstance();
						c.setTimeInMillis(proposta.getDataVencim1aParcela().getTime());
						c.add(Calendar.MONTH, i);
						propostaComissao = new PropostaComissao();
						propostaComissao.setNroDaParcela(new Integer(i+1));
						propostaComissao.setProposta(proposta);
						propostaComissao.setSituacao(0);
						propostaComissao.setDataVencimento(c.getTime());
						propostaComissao.setValorComissao(valorComissao);
						propostaComissao.setPercentualComissao(fator);
						propostaComissao.setNatureza(Constants.NT_COMISSAO);
						propostaComissao.setTipoLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
						this.save(propostaComissao);
						saldo = saldo - valorComissao;
					}
				}
			} 
			
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no calculo das comissoes.", e);
		}
		return true;
	}
	
	public void gerarRepasseValorFixo(Proposta proposta) throws Exception{
		try {
			Proposta propostaR = (Proposta)getEntityManager().find(Proposta.class, proposta.getId());
			List<ComissionadoProposta> comissionados = propostaR.getComissionadoPropostaCollection();
			
			for (ComissionadoProposta comissionado : comissionados) {
				if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)){
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(comissionado.getValorComissao());
					repasseComissao.setDataLancamento(propostaR.getDataTransmissao());
					repasseComissao.setNroDaParcela(1);
					repasseComissao.setValorBase(comissionado.getValorComissao());
					repasseComissao.setPercentualRepasse(new Double(0));
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					this.save(repasseComissao);
				}
			}

		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no calculo de repasse.", e);
		}
	}
	
	public void estornarRepasseValorFixo(Proposta proposta) throws Exception{
		try {
			List<ComissionadoProposta> comissionados = proposta.getComissionadoPropostaCollection();
			
			for (ComissionadoProposta comissionado : comissionados) {
				if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)){
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(comissionado.getValorComissao()*-1);
					repasseComissao.setDataLancamento(proposta.getDataTransmissao());
					repasseComissao.setNroDaParcela(1);
					repasseComissao.setValorBase(comissionado.getValorComissao());
					repasseComissao.setPercentualRepasse(new Double(0));
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					this.save(repasseComissao);
				}
			}

		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no estorno de repasse valor fixo.", e);
		}
	}
	
	public boolean cancelarComissoes(Proposta proposta) throws Exception{
		try {
			
			//estornarRepasseValorFixo(proposta);
			
			Proposta propostaACancelar = proposta;
			for (int i=0;i<propostaACancelar.getPropostaComissaoCollection().size();i++){
				PropostaComissao comissao = propostaACancelar.getPropostaComissaoCollection().get(i);
				if (comissao.getNatureza().equals(Constants.NT_COMISSAO)){
					PropostaComissao estorno = (PropostaComissao)Util.cloneBean(comissao);
					estorno.setId(null);
					estorno.setValorComissao(comissao.getValorComissao().doubleValue()*-1);
					estorno.setNatureza(Constants.NT_ESTORNO_CANCELAMENTO);
					this.save(estorno);
				}
			}
			while (true){
				if (propostaACancelar.getPropostaEndossada()!=null){
					propostaACancelar = (Proposta)getEntityManager().find(Proposta.class,propostaACancelar.getPropostaEndossada().getId());
					
					//estornarRepasseValorFixo(propostaACancelar);
					
					for (int i=0;i<propostaACancelar.getPropostaComissaoCollection().size();i++){
						PropostaComissao comissao = propostaACancelar.getPropostaComissaoCollection().get(i);
						if (comissao.getNatureza().equals(Constants.NT_COMISSAO)){
							PropostaComissao estorno = (PropostaComissao)Util.cloneBean(comissao);
							estorno.setId(null);
							estorno.setValorComissao(comissao.getValorComissao().doubleValue()*-1);
							estorno.setNatureza(Constants.NT_ESTORNO_CANCELAMENTO);
							this.save(estorno);
						}
					}
				}else
					break;
			}
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no cancelamento das comissoes.", e);
		}
		return true;
	}
	
	public boolean recuperarComissoes(Proposta proposta) throws Exception{
		try {
			Proposta propostaACancelar = proposta;
			for (int i=0;i<propostaACancelar.getPropostaComissaoCollection().size();i++){
				PropostaComissao comissao = propostaACancelar.getPropostaComissaoCollection().get(i);
				if (comissao.getNatureza().equals(Constants.NT_ESTORNO_CANCELAMENTO)){
					PropostaComissao estorno = (PropostaComissao)Util.cloneBean(comissao);
					estorno.setId(null);
					estorno.setValorComissao(comissao.getValorComissao().doubleValue()*-1);
					estorno.setNatureza(Constants.NT_COMISSAO_CANCELAMENTO);
					this.save(estorno);
				}
			}
			while (true){
				if (propostaACancelar.getPropostaEndossada()!=null){
					propostaACancelar = (Proposta)getEntityManager().find(Proposta.class,propostaACancelar.getPropostaEndossada().getId());
					for (int i=0;i<propostaACancelar.getPropostaComissaoCollection().size();i++){
						PropostaComissao comissao = propostaACancelar.getPropostaComissaoCollection().get(i);
						if (comissao.getNatureza().equals(Constants.NT_ESTORNO_CANCELAMENTO)){
							PropostaComissao estorno = (PropostaComissao)Util.cloneBean(comissao);
							estorno.setId(null);
							estorno.setValorComissao(comissao.getValorComissao().doubleValue()*-1);
							estorno.setNatureza(Constants.NT_COMISSAO_CANCELAMENTO);
							this.save(estorno);
						}
					}
				}else
					break;
			}
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha ao recuperar comissoes.", e);
		}
		return true;
	}
	
	public boolean gerarComissoesEmpresarial(Proposta proposta) throws Exception{
		try {

			PropostaComissao propostaComissao = null;

			Double fator = proposta.getFator();          
			Double premioLiquido = proposta.getPremioLiquido();
			Double valorComissaoTotal = (premioLiquido*fator)/100;
			Date parcelaAtual = proposta.getReferenciaParcela();
			
			/* excluir lancamentos automaticos de comissoes normais */
			this.executeNamedQuery("deletePropostaComissaoEmpresarialByPropostaIdParcelaAtual", new Object[]{proposta.getId(), proposta.getReferenciaParcela()});
			/* excluir lancamentos automaticos de agenciamento gerados na parcela atual */
			this.executeNamedQuery("deletePropostaComissaoEmpresarialByPropostaIdParcelaOriginaria", new Object[]{proposta.getId(), proposta.getReferenciaParcela()});
			
			
			for(int i=0 ; i<proposta.getParcelasPropostaCollection().size() ; i++){
				if (proposta.getParcelasPropostaCollection().get(i).getReferenciaParcela().compareTo(parcelaAtual)>=0){
					Double valorParcela = proposta.getParcelasPropostaCollection().get(i).getBaseCalculoComissao();
					Double percentualComissao = proposta.getParcelasPropostaCollection().get(i).getPercentualComissao();
					Double valorComissao = valorParcela*percentualComissao/100;
					propostaComissao = new PropostaComissao();
					propostaComissao.setReferenciaParcela(proposta.getParcelasPropostaCollection().get(i).getReferenciaParcela());
					propostaComissao.setProposta(proposta);
					propostaComissao.setNatureza(Constants.NT_COMISSAO);
					propostaComissao.setSituacao(Constants.ST_EM_ABERTO);
					propostaComissao.setDataVencimento(proposta.getParcelasPropostaCollection().get(i).getVencimento());
					propostaComissao.setValorComissao(valorComissao);
					propostaComissao.setPercentualComissao(percentualComissao);
					propostaComissao.setTipoLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
					this.save(propostaComissao);
				}
			}

			List<ParcelasAgenciamento> parcelasAgenciamentoList = this.genericFindByNamedQuery("getParcelasAgenciamentoByProposta", new Object[]{proposta.getId(), parcelaAtual});

			for (ParcelasAgenciamento parcelasAgenciamento : parcelasAgenciamentoList) {
				Double valorParcela = parcelasAgenciamento.getValorParcela();
				propostaComissao = new PropostaComissao();
				propostaComissao.setReferenciaParcela(parcelasAgenciamento.getReferenciaParcela());
				propostaComissao.setProposta(proposta);
				propostaComissao.setNatureza(Constants.NT_AGENCIAMENTO);
				propostaComissao.setSituacao(Constants.ST_EM_ABERTO);
				propostaComissao.setDataVencimento(parcelasAgenciamento.getVencimento());
				propostaComissao.setValorComissao(valorParcela);
				propostaComissao.setPercentualComissao(parcelasAgenciamento.getAgenciamento().getPercentualAgenciamento());
				propostaComissao.setTipoLancamento(Constants.TP_LANCAMENTO_AUTOMATICO);
				propostaComissao.setParcelaOriginaria(parcelasAgenciamento.getParcelaOriginaria());
				this.save(propostaComissao);
			}
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no calculo das comissoes empresarial.", e);
		}
		return true;
	}
	
	public void gerarRepassesFaltantes(){
		
		try {
			//List<PropostaComissao> propostaComissoes = (List<PropostaComissao>)this.genericFindBySQLQuery("select pc from PropostaComissao pc where pc.natureza=7 and pc.proposta.ramo.id !=5 ", null);
			//for (PropostaComissao propostaComissao : propostaComissoes) {
			//	this.baixaComissao(propostaComissao, propostaComissao.getValorComissao()*-1);
			//}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Metodo para baixa de comissao e lancamento de repasse
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public boolean baixaComissao(PropostaComissao propostaComissao,	double valorPago, BorderoLancamento lancamento) throws Exception {
		try {
			this.save(propostaComissao);
			Proposta proposta = (Proposta)getEntityManager().find(Proposta.class, propostaComissao.getProposta().getId());
			CorretoraTipoLancamento corretoraTipoLancamento = (CorretoraTipoLancamento)this.genericFindByNamedQuery("getCorretoraTipoLancamentoByTipoLancamentoAndCorretora", new Object[]{lancamento.getTipoLancamento().getId(), lancamento.getBorderoComissao().getCorretora().getId()}).get(0);
			Ramo ramoPai = proposta.getRamo().getSubRamo();
			if (corretoraTipoLancamento.getIsRepasse()){
				if (proposta.getIsFatura()){
					if (propostaComissao.getNatureza().equals(Constants.NT_BAIXA)){
						List<ParcelasProposta> parcelaProposta = this.genericFindByNamedQuery("getParcelaPropostaByPropostaIdAndReferencia", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						if (parcelaProposta.size()==0){
							throw new GenericException("A referência: "+Formatter.getMonthYear(propostaComissao.getReferenciaParcela())+", não existe como parcela na apólice! Localizador: "+propostaComissao.getProposta().getNumero());
						}
						double premioLiquido = parcelaProposta.get(0).getBaseCalculoComissao().doubleValue();
						List<ComissionadoProposta> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoPropostaByPropostaAndReferencia", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						for (int i=0;i<comissionadosAtuais.size();i++){
							ComissionadoProposta comissionado = (ComissionadoProposta)comissionadosAtuais.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ) && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
							this.save(comissionado);
							
							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setComissionado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
								repasseComissao.setReferenciaParcela(propostaComissao.getReferenciaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
					}
					if (propostaComissao.getNatureza().equals(Constants.NT_BAIXA_AGENCIAMENTO)){
						List<ParcelasAgenciamento> parcelaAgenciamento = this.genericFindByNamedQuery("getParcelasAgenciamentoByProposta", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						if (parcelaAgenciamento.size()==0){
							throw new GenericException("A referência: "+Formatter.getMonthYear(propostaComissao.getReferenciaParcela())+", não existe como parcela na apólice! Localizador: "+propostaComissao.getProposta().getNumero());
						}
						double premioLiquido = parcelaAgenciamento.get(0).getAgenciamento().getValorAgenciamento();
						List<ComissionadoAgenciamento> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaAgenciamento.get(0).getAgenciamento().getId()});
						for (int i=0;i<comissionadosAtuais.size();i++){
							ComissionadoAgenciamento comissionado = (ComissionadoAgenciamento)comissionadosAtuais.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ) && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
						/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(2); // pago total
							else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(1); // pago parcial*/
							this.save(comissionado);
							
							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setAgenciado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
								repasseComissao.setReferenciaParcela(propostaComissao.getReferenciaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
					}
				}else{
					double premioLiquido = proposta.getPremioLiquido().doubleValue();
					if (propostaComissao.getNatureza().equals(Constants.NT_BAIXA) || propostaComissao.getNatureza().equals(Constants.NT_BAIXA_AGENCIAMENTO)){
						List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
						for (int i=0;i<comissionadoProposta.size();i++){
							ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ) && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
						/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(2); // pago total
							else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(1); // pago parcial*/
							this.save(comissionado);
							
							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setComissionado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
								repasseComissao.setNroDaParcela(propostaComissao.getNroDaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
						
						/*if (propostaComissao.getProposta().getRamo().getId().equals(Constants.RAMO_VIDA_EMPRESARIAL) && propostaComissao.getProposta().getRenovacaoAutomatica()){
							List<ParcelasProposta> ultimaParcelaList = this.genericFindByNamedQuery("selectUltimaParcelaByPropostaId", new Object[]{proposta.getId()});
							ParcelasProposta parcelasProposta = ultimaParcelaList.get(0);
							ParcelasProposta novaParcelasProposta = new ParcelasProposta();
							
							
						}*/
					}
				}
			}
		} catch (Exception e) {
			throw new GenericException(e.getMessage(), e);
		}

		return true;
	}

	/**
	 * Metodo para estorno de comissao e lancamento estorno de repasse por lote de lancamento.
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public boolean estornaComissao(PropostaComissao propostaComissao, BorderoLancamento lancamento) throws Exception {
		double valorPago = lancamento.getValorComissao();
		try {
			this.save(propostaComissao);
			Proposta proposta = (Proposta)getEntityManager().find(Proposta.class, propostaComissao.getProposta().getId());
			CorretoraTipoLancamento corretoraTipoLancamento = (CorretoraTipoLancamento)this.genericFindByNamedQuery("getCorretoraTipoLancamentoByTipoLancamentoAndCorretora", new Object[]{lancamento.getTipoLancamento().getId(), lancamento.getBorderoComissao().getCorretora().getId()}).get(0);
			Ramo ramoPai = proposta.getRamo().getSubRamo();
			if (corretoraTipoLancamento.getIsRepasse()){
				if (proposta.getIsFatura()){				
					if (propostaComissao.getNatureza().equals(Constants.NT_ESTORNO)){
						List<ParcelasProposta> parcelaProposta = this.genericFindByNamedQuery("getParcelaPropostaByPropostaIdAndReferencia", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						if (parcelaProposta.size()==0){
							throw new GenericException("A referência: "+Formatter.getMonthYear(propostaComissao.getReferenciaParcela())+", não existe como parcela na apólice! Localizador: "+propostaComissao.getProposta().getNumero());
						}
						double premioLiquido = parcelaProposta.get(0).getBaseCalculoComissao().doubleValue();
						List<ComissionadoProposta> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoPropostaByPropostaAndReferencia", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						for (int i=0;i<comissionadosAtuais.size();i++){
							ComissionadoProposta comissionado = (ComissionadoProposta)comissionadosAtuais.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ) && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
						/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(2); // pago total
							else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(1); // pago parcial*/
							this.save(comissionado);
							
							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setComissionado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
								repasseComissao.setReferenciaParcela(propostaComissao.getReferenciaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
					}
					if (propostaComissao.getNatureza().equals(Constants.NT_ESTORNO_AGENCIAMENTO)){
						List<ParcelasAgenciamento> parcelaAgenciamento = this.genericFindByNamedQuery("getParcelasAgenciamentoByProposta", new Object[]{propostaComissao.getProposta().getId(), propostaComissao.getReferenciaParcela()});
						double premioLiquido = parcelaAgenciamento.get(0).getAgenciamento().getValorAgenciamento();
						if (parcelaAgenciamento.size()==0){
							throw new GenericException("A referência: "+Formatter.getMonthYear(propostaComissao.getReferenciaParcela())+", não existe como parcela na apólice! Localizador: "+propostaComissao.getProposta().getNumero());
						}
						List<ComissionadoAgenciamento> comissionadosAtuais = this.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{parcelaAgenciamento.get(0).getAgenciamento().getId()});
						for (int i=0;i<comissionadosAtuais.size();i++){
							ComissionadoAgenciamento comissionado = (ComissionadoAgenciamento)comissionadosAtuais.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ) && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)  && comissionado.getSituacao().intValue() <= Constants.ST_BAIXADO){ // Em aberto ou Baixa parcial
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
						/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(2); // pago total
							else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(1); // pago parcial*/
							this.save(comissionado);
							
							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setAgenciado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
								repasseComissao.setReferenciaParcela(propostaComissao.getReferenciaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
					}
				}else{
					double premioLiquido = proposta.getPremioLiquido().doubleValue();
					if (propostaComissao.getNatureza().equals(Constants.NT_ESTORNO) || propostaComissao.getNatureza().equals(Constants.NT_ESTORNO_AGENCIAMENTO)){
						List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
						for (int i=0;i<comissionadoProposta.size();i++){
							ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
							double valorRepasseIndividual = 0;
							if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO) ){
								valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ)){
								valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100) * -1;
							}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)){
								valorRepasseIndividual = 0;
							}
							double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
							comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
							
						/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(2); // pago total
							else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
								comissionado.setSituacao(1); // pago parcial*/
							this.save(comissionado);

							if (valorRepasseIndividual != 0){
								RepasseComissao repasseComissao = new RepasseComissao();
								repasseComissao.setComissionado(comissionado);
								repasseComissao.setValorPago(valorRepasseIndividual);
								repasseComissao.setDataLancamento(lancamento.getBorderoComissao().getDataDocumento());
								repasseComissao.setNroDaParcela(propostaComissao.getNroDaParcela());
								repasseComissao.setValorBase(valorPago);
								repasseComissao.setPercentualRepasse(comissionado.getComissao());
								repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
								repasseComissao.setBorderoLancamento(lancamento);
								this.save(repasseComissao);
							}
						}
						
					}
				}
			}
		} catch (Exception e) {
			throw new GenericException(e.getMessage(), e);
		}

		return true;
	}

	/**
	 * Estorna repasse de comissao apartir de um cancelamento de comissao.
	 * 
	 * @param propostaComissao
	 * @return
	 * @throws Exception
	 */
	public boolean estornaComissao(PropostaComissao propostaComissao) throws Exception {
		double valorPago = propostaComissao.getValorComissao();
		try {
			this.save(propostaComissao);
			Proposta proposta = (Proposta)getEntityManager().find(Proposta.class, propostaComissao.getProposta().getId());
			List<ComissionadoProposta> comissionadoProposta = proposta.getComissionadoPropostaCollection();
			double premioLiquido = proposta.getPremioLiquido().doubleValue();
			for (int i=0;i<comissionadoProposta.size();i++){
				ComissionadoProposta comissionado = (ComissionadoProposta)comissionadoProposta.get(i);
				double valorRepasseIndividual = 0;
				if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_COMISSAO) ){
					valorRepasseIndividual = valorPago * (comissionado.getComissao().doubleValue()/100);
				}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ)){
					valorRepasseIndividual = premioLiquido * (comissionado.getComissao().doubleValue()/100) * -1;
				}else if (comissionado.getTipoComissao().equals(Constants.TP_COM_VALOR)){
					valorRepasseIndividual = 0;
				}
				double valorPagoAnterior = comissionado.getValorPago()==null ? 0 : comissionado.getValorPago().doubleValue();
				comissionado.setValorPago(new Double(valorRepasseIndividual+valorPagoAnterior));
				
			/*	if (comissionado.getValorPago().doubleValue()>=comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(2); // pago total
				else if (comissionado.getValorPago().doubleValue()<comissionado.getValorComissao().doubleValue())
					comissionado.setSituacao(1); // pago parcial*/
				this.save(comissionado);

				if (valorRepasseIndividual != 0){
					RepasseComissao repasseComissao = new RepasseComissao();
					repasseComissao.setComissionado(comissionado);
					repasseComissao.setValorPago(valorRepasseIndividual);
					repasseComissao.setDataLancamento(propostaComissao.getDataVencimento());
					repasseComissao.setNroDaParcela(propostaComissao.getNroDaParcela());
					repasseComissao.setValorBase(valorPago);
					repasseComissao.setPercentualRepasse(comissionado.getComissao());
					repasseComissao.setSituacao(Constants.ST_EM_ABERTO); // em aberto
					this.save(repasseComissao);
				}
			}
			 
		} catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no estorno da comissão!", e);
		}

		return true;
	}

	/**
	 * Metodo para baixa de comissao e lancamento de repasse a partir de lote de lancamento de baixas
	 * Calcular o valor do repasse de acordo com a forma de comissionamento no campo tipo de comissao em PropostaComissao
	 * 
	 * 0-Percentual sobre o valor da comissao
	 * 1-Percentual sobre o premio liquido
	 * 2-Valor/fixo em dinheiro
	 * 
	 */
	public boolean baixaComissao(List<BorderoLancamento> borderoLancamentoList, boolean fecharLote) throws Exception {
		try {
			boolean fechadoParcial = false;
			int count = borderoLancamentoList.size();
			for (int i=0;i<borderoLancamentoList.size();i++){
				BorderoLancamento lancamento = borderoLancamentoList.get(i);
				if (lancamento.getSituacao().intValue()==0){ // somente processa lancamentos Não baixados
					if (lancamento.getTipoLancamento().getIsApolice() && lancamento.getProposta() != null){
						//double diferenca = comissao.getValorComissao().doubleValue()-lancamento.getValorComissao().doubleValue();
						// Cria uma nova parcela com o valor restante.
						PropostaComissao comissaoLancamentoBaixa = new PropostaComissao();
						comissaoLancamentoBaixa.setProposta(lancamento.getProposta());
						
						Ramo ramoPai = lancamento.getProposta().getRamo().getSubRamo(); 
						if (lancamento.getProposta().getIsFatura()){
						// particularidades da baixa de VIDA_EMPRESARIAL ou Transporte
							comissaoLancamentoBaixa.setReferenciaParcela(lancamento.getReferenciaParcela());
							
							if (lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_AGENCIAMENTO.intValue() ||
								lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_ESTORNO_AGENC.intValue()){
								
								List<Agenciamento> agenciamentosExistente = this.genericFindByNamedQuery("getAgenciamentoByPropostaAndParcelaAtual", new Object[]{lancamento.getProposta().getId(),lancamento.getReferenciaParcela()});
								if (agenciamentosExistente.size()==0){
									gerarNovoAgenciamento(lancamento);
								}
							}else{
								List<PropostaComissao> comissaoExistentePorReferencia = 
									(List<PropostaComissao>)this.genericFindBySQLQuery("Select pc From PropostaComissao pc where pc.proposta.id = ?0 and pc.referenciaParcela = ?1",
									new Object[]{lancamento.getProposta().getId(), lancamento.getReferenciaParcela()});
								if (comissaoExistentePorReferencia.size()==0){
									if (lancamento.getReferenciaParcela().getTime()<lancamento.getProposta().getInicioVigencia().getTime() || 
										lancamento.getReferenciaParcela().getTime()>lancamento.getProposta().getTerminoVigencia().getTime()){
										throw new Exception("Verifique lançamento do RAMO VIDA com Refencia "+Formatter.getMonthYear(lancamento.getReferenciaParcela())+", \nPois o mesmo não corresponde a uma vigência válida na Proposta Nro.: "+lancamento.getProposta().getNumero());
									}
								}
							}
						}else
							comissaoLancamentoBaixa.setNroDaParcela(lancamento.getNroParcela());
						comissaoLancamentoBaixa.setDataVencimento(lancamento.getBorderoComissao().getDataDocumento());
						comissaoLancamentoBaixa.setSituacao(Constants.ST_BAIXADO);
						comissaoLancamentoBaixa.setValorComissao(lancamento.getValorComissao()*-1);
						comissaoLancamentoBaixa.setPercentualComissao(lancamento.getPercentualComissao());
						comissaoLancamentoBaixa.setValorPagamento(new Double(0.0));
						comissaoLancamentoBaixa.setDataPagamento(lancamento.getDataLancamento());
						comissaoLancamentoBaixa.setTipoLancamento(Constants.TP_LANCAMENTO_MANUAL);
						if (lancamento.getValorComissao().doubleValue()<0){
							if (lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_ESTORNO.intValue())
								comissaoLancamentoBaixa.setNatureza(Constants.NT_ESTORNO);
							else if (lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_ESTORNO_AGENC.intValue())
								comissaoLancamentoBaixa.setNatureza(Constants.NT_ESTORNO_AGENCIAMENTO);
							else 
								comissaoLancamentoBaixa.setNatureza(Constants.NT_ESTORNO);

							this.save(comissaoLancamentoBaixa);
							lancamento.setSituacao(Constants.ST_BAIXADO); // baixado
							this.save(lancamento);
							this.estornaComissao(comissaoLancamentoBaixa, lancamento);
							count--;
						}else{

							if (lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_COMISSAO.intValue())
								comissaoLancamentoBaixa.setNatureza(Constants.NT_BAIXA);
							else if (lancamento.getTipoLancamento().getId().intValue()==Constants.TP_LOTE_AGENCIAMENTO.intValue())
								comissaoLancamentoBaixa.setNatureza(Constants.NT_BAIXA_AGENCIAMENTO);
							else 
								comissaoLancamentoBaixa.setNatureza(Constants.NT_BAIXA);

							this.save(comissaoLancamentoBaixa);
							lancamento.setSituacao(Constants.ST_BAIXADO); // baixado
							this.save(lancamento);
							this.baixaComissao(comissaoLancamentoBaixa, lancamento.getValorComissao(),lancamento);
							count--;
							Proposta proposta = lancamento.getProposta();
							if (proposta.getNroApolice()==null || proposta.getNroApolice().trim().equals("")){
								proposta.setNroApolice(lancamento.getNroApolice());
								this.save(proposta);
							}
						}
					}else{
						if (fecharLote){
							lancamento.setSituacao(Constants.ST_BAIXADO); // baixado como lancamento de bonus ou imposto.
							count--;
/*							if (lancamento.getTipoLancamento().getId().intValue()==2 || lancamento.getTipoLancamento().getId().intValue()==3 
								|| lancamento.getTipoLancamento().getId().intValue()==14 || lancamento.getTipoLancamento().getId().intValue()==15){
								Impostos impostos = new Impostos();
								impostos.setTipo(lancamento.getTipoLancamento().getNome());
								impostos.setSeguradora(lancamento.getBorderoComissao().getSeguradora());
								impostos.setValorImposto(lancamento.getValorComissao()*-1); // torna valor negativo no lote para positivo no impostos.
								impostos.setDataLancamento(lancamento.getDataLancamento());
								this.save(impostos);
								lancamento.setSituacao(Constants.ST_BAIXADO); // baixado como lancamento de bonus ou imposto.
								count--;
							}else{
								LancamentoBonus lancamentoBonus = new LancamentoBonus();
								lancamentoBonus.setTipo(lancamento.getTipoLancamento().getNome());
								lancamentoBonus.setSeguradora(lancamento.getBorderoComissao().getSeguradora());
								lancamentoBonus.setValorBonus(lancamento.getValorComissao());
								lancamentoBonus.setNroExtrato(lancamento.getBorderoComissao().getNroExtrato());
								lancamentoBonus.setDataLancamento(lancamento.getDataLancamento());
								lancamentoBonus.setSituacao(0); // lancamento em aberto, para ser transferido pro caixa.
								this.save(lancamentoBonus);
								lancamento.setSituacao(Constants.ST_BAIXADO); // baixado como lancamento de bonus ou imposto.
								count--;
							}
*/						}
					}
				}else if (lancamento.getSituacao().intValue()==2){ // lancamento baixado
					count--;
				}

			}
			BorderoComissao borderoComissao = borderoLancamentoList.get(0).getBorderoComissao();
			if (count==0 && fecharLote){
				borderoComissao.setSituacao(1); // Fechado Total.
				if (borderoComissao.getDataLancamento()==null)
					borderoComissao.setDataLancamento(new Date());
				this.save(borderoComissao);
			}
		} catch (Exception e) {
			throw new GenericException(e.getMessage(), e);
		}

		return true;
	}
	
	public void gerarNovoAgenciamento(BorderoLancamento lancamento) throws Exception{
		List<Agenciamento> ultimoAgenciamento = this.genericFindByNamedQuery("getAgenciamentoByProposta", new Object[]{lancamento.getProposta().getId()});
		// Criar um registro de agenciamento para uma baixa realizada para uma referencia inexistente pro agenciamento.
		Agenciamento novoAgenciamento = new Agenciamento();
		novoAgenciamento.setProposta(lancamento.getProposta());
		novoAgenciamento.setReferenciaParcela(lancamento.getReferenciaParcela());
		if (ultimoAgenciamento.size()>0){
			novoAgenciamento.setPercentualAgenciamento(ultimoAgenciamento.get(0).getPercentualAgenciamento());
		}else{
			novoAgenciamento.setPercentualAgenciamento(lancamento.getPercentualComissao());
		}
		novoAgenciamento.setDataLancamento(lancamento.getDataLancamento());
		novoAgenciamento.setQtdeParcelas(1);
		novoAgenciamento.setValorInclusoes(lancamento.getPremioLiquido());
		novoAgenciamento.setValorAgenciamento(lancamento.getValorComissao());
		novoAgenciamento.setGrupoDeVenda(lancamento.getProposta().getGrupoDeVenda());
		novoAgenciamento.setNroInclusoes(1);

		// criar parcela do agenciamento
		ParcelasAgenciamento parcelasAgenciamento = new ParcelasAgenciamento();
		parcelasAgenciamento.setAgenciamento(novoAgenciamento);
		parcelasAgenciamento.setNroParcela(1);
		parcelasAgenciamento.setReferenciaParcela(lancamento.getReferenciaParcela());
		parcelasAgenciamento.setValorParcela(lancamento.getValorComissao());
		parcelasAgenciamento.setParcelaOriginaria(novoAgenciamento.getReferenciaParcela());
		parcelasAgenciamento.setVencimento(novoAgenciamento.getDataLancamento());
		parcelasAgenciamento.setValorInclusoes(novoAgenciamento.getValorInclusoes());

		novoAgenciamento.getParcelasAgenciamentoCollection().add(parcelasAgenciamento);
		this.save(novoAgenciamento);
		
		// Gera os comissionados para o referido agenciamento.
		for(GrupoProdutor grupoProdutor : novoAgenciamento.getGrupoDeVenda().getGrupoProdutorCollection()){
			ComissionadoAgenciamento comissionado = new ComissionadoAgenciamento();
			comissionado.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissionado.setComissao(grupoProdutor.getComissao());
			comissionado.setTipoComissao(grupoProdutor.getTipoComissao());
			comissionado.setValorComissao((novoAgenciamento.getValorAgenciamento()*comissionado.getComissao())/100);
			comissionado.setSituacao(0);
			comissionado.setProposta(novoAgenciamento.getProposta());
			comissionado.setAgenciamento(novoAgenciamento);
			this.save(comissionado);
		}
	}
}
