package iseg.app.business;

import iseg.app.model.Agenciamento;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Proposta;
import iseg.app.model.Seguradora;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface PropostaService extends PObjectService{

	public List<Proposta>getPropostasForSearch(Proposta proposta, Integer page, Integer pageSize) throws Exception;
	public Long getCountPropostasForSearch(Proposta proposta) throws Exception;
	public void reprocessarGrupoDeVendaEComissionados(Proposta proposta) throws Exception;
	public void reprocessarGrupoDeVendaEComissionados(GrupoDeVenda grupoDeVendaAtual, GrupoDeVenda grupoDeVendaAnterior, ParcelasProposta parcelaSelecionada) throws Exception;
	public void reprocessarGrupoDeVendaEComissionados(List<ComissionadoProposta> comissionadosNovos, ParcelasProposta parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception;
	public void atualizarGrupoDeVendaEComissionados(List<ComissionadoProposta> comissionadosNovos, ParcelasProposta parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception;
	public void reprocessarGrupoDeVendaEComissionadosAgenciamento(GrupoDeVenda grupoDeVendaAtual, GrupoDeVenda grupoDeVendaAnterior, Agenciamento parcelaSelecionada) throws Exception;
	public void estornarComissionado(ComissionadoProposta comissionadoRemovido, Proposta proposta) throws Exception;
	public void estornarComissionado(ComissionadoProposta comissionadoRemovido, Proposta proposta, String demaisParcelas) throws Exception;
	public void processarRepasseNovoComissionado(ComissionadoProposta comissionado) throws Exception;

	public void reprocessarGrupoDeVendaEComissionadosAgenciamento(List<ComissionadoAgenciamento> comissionadosNovos, Agenciamento parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception;	
	public void atualizarGrupoDeVendaEComissionadosAgenciamento(List<ComissionadoAgenciamento> comissionadosNovos, Agenciamento parcelaSelecionada, GrupoDeVenda grupoDeVendaAtual) throws Exception;
	
	//public void processarRepasseNovoComissionado(ComissionadoProposta comissionado, ParcelasProposta parcelaSelecionada) throws Exception;
	public void reprocessarComissionadoAgenciamento(ComissionadoAgenciamento comissionadoRemovido, Proposta proposta) throws Exception;
	public void excluirProposta(Proposta proposta) throws Exception;
	public Proposta aplicaEndosso(Proposta proposta, Long operacao, Long tipoEndosso) throws Exception;
	public Proposta renovacaoPropria(Proposta proposta, Seguradora seguradora) throws Exception;
	public void setDemaisParcelas(String demaisParcelas);
}
