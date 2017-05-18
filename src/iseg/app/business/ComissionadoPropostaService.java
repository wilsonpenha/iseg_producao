package iseg.app.business;

import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.Proposta;
import iseg.app.persistence.PObjectService;

public interface ComissionadoPropostaService extends PObjectService{
	public void inserirComissionado(Proposta proposta, ComissionadoProposta comissionadoProposta, PropostaService propostaService, String demaisParcelas) throws Exception;
	public void inserirComissionadoAgenciamento(Proposta proposta, ComissionadoAgenciamento comissionadoAgenciamento) throws Exception;
	public void carregarComissionados(Proposta proposta) throws Exception;
	public void carregarComissionadosAgenciamento(Proposta proposta) throws Exception;
}
