package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.model.Agenciamento;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.GrupoProdutor;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Pessoa;
import iseg.app.model.Proposta;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class ComissionadoPropostaServiceImpl extends PObjectServiceImpl implements ComissionadoPropostaService {

	public void inserirComissionado(Proposta proposta, ComissionadoProposta comissionadoProposta, 
			PropostaService propostaService, String demaisParcelas) throws Exception{
		proposta = (Proposta)this.find(Proposta.class, proposta.getId());
		ParcelasProposta parcelasProposta;
		comissionadoProposta.setProposta(proposta);
		comissionadoProposta.setSituacao(0);
		
		if (comissionadoProposta.getParcelasProposta()!=null && comissionadoProposta.getParcelasProposta().getId()!=null){
			// Rotina removida devido alterações do processo de fatura.
			/*double valorRepasseIndividual = 0;
			parcelasProposta = (ParcelasProposta)this.service.find(comissionadoProposta.getParcelasProposta());

			if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_COMISSAO){
				valorRepasseIndividual = parcelasProposta.getValorComissao() * (comissionadoProposta.getComissao().doubleValue()/100);
			}else if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ){
				valorRepasseIndividual = parcelasProposta.getValorParcela() * (comissionadoProposta.getComissao().doubleValue()/100);
			}else if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_VALOR){
				valorRepasseIndividual = comissionadoProposta.getValorComissao().doubleValue();
				comissionadoProposta.setComissao(new Double(0));
			}
			comissionadoProposta.setValorComissao(valorRepasseIndividual);
			comissionadoProposta.setPessoa((Pessoa)this.service.find(comissionadoProposta.getPessoa()));
			
			if (comissionadoProposta.getParcelasProposta()!=null && comissionadoProposta.getParcelasProposta().getId()==null)
				comissionadoProposta.setParcelasProposta(null);
				
			save(comissionadoProposta);

			propostaService.setDemaisParcelas(demaisParcelas);
			propostaService.processarRepasseNovoComissionado(comissionadoProposta,comissionadoProposta.getParcelasProposta());
		*/}else{
			double valorRepasseIndividual = 0;
			if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_COMISSAO){
				valorRepasseIndividual = proposta.getValorComissao() * (comissionadoProposta.getComissao().doubleValue()/100);
			}else if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ){
				valorRepasseIndividual = proposta.getPremioLiquido() * (comissionadoProposta.getComissao().doubleValue()/100);
			}else if (comissionadoProposta.getTipoComissao().intValue()==Constants.TP_COM_VALOR){
				valorRepasseIndividual = comissionadoProposta.getValorComissao().doubleValue();
				comissionadoProposta.setComissao(new Double(0));
			}
			comissionadoProposta.setValorComissao(valorRepasseIndividual);
			comissionadoProposta.setPessoa((Pessoa)this.find(comissionadoProposta.getPessoa()));
			
			if (comissionadoProposta.getParcelasProposta()!=null && comissionadoProposta.getParcelasProposta().getId()==null)
				comissionadoProposta.setParcelasProposta(null);
				
			this.save(comissionadoProposta);

			propostaService.processarRepasseNovoComissionado(comissionadoProposta);
		}
	}

	public void inserirComissionadoAgenciamento(Proposta proposta, ComissionadoAgenciamento comissionadoAgenciamento) throws Exception{
		proposta = (Proposta)service.find(Proposta.class, proposta.getId());
		ParcelasProposta parcelasProposta;
		Agenciamento agenciamento = (Agenciamento)service.find(Agenciamento.class, comissionadoAgenciamento.getAgenciamento().getId());
		List<ParcelasProposta> parcelas = this.service.genericFindByNamedQuery("getParcelaPropostaByPropostaIdAndReferencia", new Object[]{proposta.getId(),agenciamento.getReferenciaParcela()});
		
		if (parcelas.size()>0)
			parcelasProposta = (ParcelasProposta)parcelas.get(0);
		else{
			parcelasProposta = new ParcelasProposta();
			parcelasProposta.setValorParcela(0.00);
		}
		
		comissionadoAgenciamento.setProposta(proposta);
		comissionadoAgenciamento.setSituacao(0);
		double valorRepasseIndividual = 0;
		if (comissionadoAgenciamento.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_COMISSAO){
			valorRepasseIndividual = agenciamento.getValorAgenciamento() * (comissionadoAgenciamento.getComissao().doubleValue()/100);
		}else if (comissionadoAgenciamento.getTipoComissao().intValue()==Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ){
			valorRepasseIndividual = parcelasProposta.getValorParcela() * (comissionadoAgenciamento.getComissao().doubleValue()/100);
		}else if (comissionadoAgenciamento.getTipoComissao().intValue()==Constants.TP_COM_VALOR){
			valorRepasseIndividual = comissionadoAgenciamento.getValorComissao().doubleValue();
			comissionadoAgenciamento.setComissao(new Double(0));
		}
		comissionadoAgenciamento.setValorComissao(valorRepasseIndividual);
		comissionadoAgenciamento.setPessoa((Pessoa)this.find(comissionadoAgenciamento.getPessoa()));
		this.save(comissionadoAgenciamento);
	}

	public void carregarComissionados(Proposta proposta) throws Exception{

		proposta = (Proposta)this.find(proposta);

		ComissionadoProposta comissao = null;

		for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
			double valorComissao = 0;
			if (grupoProdutor.getTipoComissao().intValue() == 0) // % comissao sobre o valor da comissao da proposta
				valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 1) // % comissao sobre premio liquido
				valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
				valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
			comissao = new ComissionadoProposta();
			comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissao.setComissao(grupoProdutor.getComissao());
			comissao.setTipoComissao(grupoProdutor.getTipoComissao());
			comissao.setValorComissao(valorComissao);
			comissao.setSituacao(0);
			comissao.setProposta(proposta);
			this.save(comissao);
		}
	}

	public void carregarComissionadosAgenciamento(Proposta proposta) throws Exception {
		
		proposta = (Proposta)this.find(proposta);

		ComissionadoAgenciamento comissao = null;

		for(GrupoProdutor grupoProdutor : proposta.getGrupoDeVenda().getGrupoProdutorCollection()){
			double valorComissao = 0;
			if (grupoProdutor.getTipoComissao().intValue() == 0) // % comissao sobre o valor da comissao da proposta
				valorComissao = proposta.getValorComissao().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 1) // % comissao sobre premio liquido
				valorComissao = proposta.getPremioLiquido().doubleValue() * (grupoProdutor.getComissao().doubleValue()/100);
			else if (grupoProdutor.getTipoComissao().intValue() == 2) // valor de comissao fixa
				valorComissao = grupoProdutor.getValorComissaoFixa().doubleValue();
			comissao = new ComissionadoAgenciamento();
			comissao.setPessoa(grupoProdutor.getProdutor().getPessoa());
			comissao.setComissao(grupoProdutor.getComissao());
			comissao.setTipoComissao(grupoProdutor.getTipoComissao());
			comissao.setValorComissao(valorComissao);
			comissao.setSituacao(0);
			comissao.setProposta(proposta);
			this.save(comissao);
		}
	}
}
