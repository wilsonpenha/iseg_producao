package iseg.app.action;

import iseg.app.business.ComissionadoPropostaService;
import iseg.app.business.PropostaService;
import iseg.app.constants.Constants;
import iseg.app.model.Agenciamento;
import iseg.app.model.ComissionadoAgenciamento;
import iseg.app.model.ComissionadoProposta;
import iseg.app.model.CondicaoPagamento;
import iseg.app.model.ParcelasProposta;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaComissao;
import iseg.app.model.RepasseComissao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ComissionadoPropostaAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private ComissionadoProposta comissionadoProposta;
	private ComissionadoAgenciamento comissionadoAgenciamento;
	private Proposta proposta;
	private List<ComissionadoProposta> comissionadoPropostaList = new ArrayList<ComissionadoProposta>();
	private List<ComissionadoAgenciamento> comissionadoAgenciamentoList = new ArrayList<ComissionadoAgenciamento>();
	private List<PropostaComissao> propostaComissaoList = new ArrayList<PropostaComissao>();
	protected ComissionadoPropostaService service;
	protected PropostaService propostaService;
	private Integer parcelaSelecionada;
	private ParcelasProposta parcelasProposta;
	private String demaisParcelas;

	//@Autowired
	public ComissionadoPropostaAction(ComissionadoPropostaService service, PropostaService propostaService) {
		super(service);
		this.service = service;
		this.propostaService = propostaService;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();
		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SkipValidation
	public String editar() {
		try {

			proposta = (Proposta)this.service.find(this.getProposta());
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String carregarComissionados(){

		try{

			proposta = (Proposta)this.service.find(this.getProposta());

			if(proposta.getComissionadoPropostaCollection().isEmpty()){
				proposta.setComissionadoPropostaCollection(new ArrayList<ComissionadoProposta>());

				this.service.carregarComissionados(proposta);
				
				this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.getProposta().getId()});
				proposta.setComissionadoPropostaCollection(this.comissionadoPropostaList);
			}

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String carregarComissionadosAgenciamento(){

		try{

			proposta = (Proposta)this.service.find(this.getProposta());

			if(proposta.getComissionadoAgenciamentoCollection().isEmpty()){
				proposta.setComissionadoAgenciamentoCollection(new ArrayList<ComissionadoAgenciamento>());

				this.service.carregarComissionados(proposta);
			}

			this.comissionadoAgenciamentoList = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoAtivosByPropostaId", new Object[]{this.getProposta().getId()});
			proposta.setComissionadoAgenciamentoCollection(this.comissionadoAgenciamentoList);

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirComissionado(){    

		try{

			this.service.inserirComissionado(proposta, comissionadoProposta, propostaService, demaisParcelas);
			
			if (comissionadoProposta.getParcelasProposta()!=null && comissionadoProposta.getParcelasProposta().getId()!=null){
				// rotina removida devido alteração no processo de fatura.
				//this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{comissionadoProposta.getParcelasProposta().getId()});
				//preparaListaComissionadosParcelaSelecionada(comissionadoProposta.getParcelasProposta());
			}else{
				this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{proposta.getId()});
				preparaListaComissionados((Proposta)this.service.find(this.comissionadoProposta.getProposta()));
			}

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String removerComissionado(){
		try {

			// quando comissionado tiver relacionamento com a parcela, significa ramo Vida Emrpesarial, onde o processo é diferente.
			this.comissionadoProposta = (ComissionadoProposta)this.service.find(this.comissionadoProposta);
			if (this.comissionadoProposta.getParcelasProposta()!=null && this.comissionadoProposta.getParcelasProposta().getId()!=null){
				// se for remover comissionado para demais parcelas
				this.propostaService.estornarComissionado(this.comissionadoProposta, this.comissionadoProposta.getProposta(), this.demaisParcelas);
				this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByParcelaPropostaId", new Object[]{this.comissionadoProposta.getParcelasProposta().getId()});
				preparaListaComissionadosParcelaSelecionada(this.comissionadoProposta.getParcelasProposta());
			}else{
				this.propostaService.estornarComissionado(this.comissionadoProposta, this.comissionadoProposta.getProposta());
				this.comissionadoPropostaList = this.service.genericFindByNamedQuery("getComissionadoPropostaByPropostaId", new Object[]{this.comissionadoProposta.getProposta().getId()});
				preparaListaComissionados((Proposta)this.service.find(this.proposta));
			}

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarComissionado(){
		try {

			this.comissionadoProposta = (ComissionadoProposta)this.service.find(this.comissionadoProposta);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String inserirComissionadoAgenciamento(){

		try{

			this.service.inserirComissionadoAgenciamento(proposta, comissionadoAgenciamento);

			Proposta proposta = (Proposta)service.find(Proposta.class, this.proposta.getId());
			Agenciamento agenciamento = (Agenciamento)service.find(Agenciamento.class, this.comissionadoAgenciamento.getAgenciamento().getId());
			List<ParcelasProposta> parcelas = this.service.genericFindByNamedQuery("getParcelaPropostaByPropostaIdAndReferencia", new Object[]{this.proposta.getId(),agenciamento.getReferenciaParcela()});
			
			if (parcelas.size()>0)
				parcelasProposta = (ParcelasProposta)parcelas.get(0);
			else{
				parcelasProposta = new ParcelasProposta();
				parcelasProposta.setValorParcela(0.00);
			}

			this.comissionadoAgenciamentoList = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{comissionadoAgenciamento.getAgenciamento().getId()});
			//gerarComissoes();
			preparaListaComissionadosAgenciamento(agenciamento, parcelasProposta);

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String removerComissionadoAgenciamento(){
		try {

			List<RepasseComissao> repasses = this.service.genericFindByNamedQuery("getRepasseComissaoByProposta", new Object[]{this.proposta.getId(),this.proposta.getId()});
			
			Agenciamento agenciamento = (Agenciamento)service.find(Agenciamento.class, this.comissionadoAgenciamento.getAgenciamento().getId());
			List<ParcelasProposta> parcelas = this.service.genericFindByNamedQuery("getParcelaPropostaByPropostaIdAndReferencia", new Object[]{this.proposta.getId(),agenciamento.getReferenciaParcela()});
			
			if (parcelas.size()>0)
				parcelasProposta = (ParcelasProposta)parcelas.get(0);
			else{
				parcelasProposta = new ParcelasProposta();
				parcelasProposta.setValorParcela(0.00);
			}

			this.proposta = (Proposta)this.service.find(this.proposta);
			this.comissionadoAgenciamento = (ComissionadoAgenciamento)this.service.find(this.comissionadoAgenciamento);
			if (repasses.size()>0){ // se existem repasse para esta proposta, excluir o comissionado e incluir do grupo de venda.
				this.propostaService.reprocessarComissionadoAgenciamento(this.comissionadoAgenciamento, this.proposta);				
			}else{
				this.service.remove(comissionadoAgenciamento);
				this.comissionadoAgenciamentoList = this.service.genericFindByNamedQuery("getComissionadoAgenciamentoByAgenciamentoId", new Object[]{comissionadoAgenciamento.getAgenciamento().getId()});
				//gerarComissoes();
			}
			preparaListaComissionadosAgenciamento(agenciamento, parcelasProposta);

			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarComissionadoAgenciamento(){
		try {

			this.comissionadoAgenciamento = (ComissionadoAgenciamento)this.service.find(this.comissionadoAgenciamento);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public void gerarComissoes() throws Exception {

		proposta = (Proposta)this.service.find(this.getProposta());
		PropostaComissao propostaComissao = null;
		propostaComissaoList = new ArrayList<PropostaComissao>();

		if(this.getProposta().getFator() == null){
			this.getProposta().setFator(0.0);
		}
		if(this.getProposta().getCondicaoPagamento() == null){
			this.getProposta().setCondicaoPagamento(new CondicaoPagamento());
		}
		if(this.getProposta().getCondicaoPagamento().getPagamentoComissao() == null){
			this.getProposta().getCondicaoPagamento().setPagamentoComissao("1");
		}
		Double fator = this.getProposta().getFator();
		Double valorComissaoTotal = (proposta.getPremioLiquido()*fator)/100;

		for(ComissionadoProposta comissionadoProposta : this.comissionadoPropostaList){
			Integer quantidadeComissoes = new Integer(proposta.getCondicaoPagamento().getPagamentoComissao());
			for(int i=0 ; i<quantidadeComissoes ; i++){

				propostaComissao = new PropostaComissao();
				propostaComissao.setNroDaParcela(new Integer(i+1));
				propostaComissao.setProposta(proposta);
				propostaComissao.setNatureza(Constants.NT_COMISSAO);
				propostaComissao.setSituacao(Constants.ST_EM_ABERTO);
				propostaComissao.setValorComissao(valorComissaoTotal*comissionadoProposta.getComissao()/(100*quantidadeComissoes));
				propostaComissaoList.add(propostaComissao);
			}
		}
	}

	protected void setPObjectInstance() {
		this.comissionadoProposta = (ComissionadoProposta)this.pobject;
	}

	public ComissionadoProposta getComissionadoProposta() {
		return comissionadoProposta;
	}

	public void setComissionadoProposta(ComissionadoProposta comissionadoProposta) {
		this.comissionadoProposta = comissionadoProposta;
		this.pobject = this.comissionadoProposta;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public List<ComissionadoProposta> getComissionadoPropostaList() {
		return comissionadoPropostaList;
	}

	public void setComissionadoPropostaList(List<ComissionadoProposta> comissionadoPropostaList) {
		this.comissionadoPropostaList = comissionadoPropostaList;
	}

	public List<PropostaComissao> getPropostaComissaoList() {
		return propostaComissaoList;
	}

	public void setPropostaComissaoList(List<PropostaComissao> propostaComissaoList) {
		this.propostaComissaoList = propostaComissaoList;
	}

	public Map<Long, String> getTipoComissaoList(){
		return Constants.getTipoComissaoMap();
	}

	public String getTipoComissaoDescricao(Long tipoComissao){
		return Constants.getTipoComissaoDescricao(tipoComissao);
	}

	public void preparaListaComissionados(Proposta proposta){

		try{

			for(ComissionadoProposta comissionadoProposta : proposta.getComissionadoPropostaCollection()){
				if(Constants.TP_COM_VALOR.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao(comissionadoProposta.getValorComissao());
					comissionadoProposta.setComissao(new Double(0));
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getPremioLiquido()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((proposta.getValorComissao()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void preparaListaComissionadosParcelaSelecionada(ParcelasProposta parcelasProposta){

		try{

			for(ComissionadoProposta comissionadoProposta : parcelasProposta.getComissionadoPropostaCollection()){
				if(Constants.TP_COM_VALOR.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao(comissionadoProposta.getValorComissao());
					comissionadoProposta.setComissao(new Double(0));
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((parcelasProposta.getValorParcela()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoProposta.getTipoComissao())){
					comissionadoProposta.setValorComissao((parcelasProposta.getValorComissao()*comissionadoProposta.getComissao())/100);
					comissionadoProposta.setComissao(comissionadoProposta.getComissao());
				}
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void preparaListaComissionadosAgenciamento(Agenciamento agenciamento, ParcelasProposta parcelasProposta){

		try{

			for(ComissionadoAgenciamento comissionadoAgenciamento : agenciamento.getComissionadoAgenciamentoCollection()){
				if(Constants.TP_COM_VALOR.equals(comissionadoAgenciamento.getTipoComissao())){
					comissionadoAgenciamento.setValorComissao(comissionadoAgenciamento.getValorComissao());
					comissionadoAgenciamento.setComissao(new Double(0));
				}else if(Constants.TP_COM_PERC_SOBRE_PREMIO_LIQ.equals(comissionadoAgenciamento.getTipoComissao())){
					comissionadoAgenciamento.setValorComissao((parcelasProposta.getValorParcela()*comissionadoAgenciamento.getComissao())/100);
					comissionadoAgenciamento.setComissao(comissionadoAgenciamento.getComissao());
				}else if(Constants.TP_COM_PERC_SOBRE_COMISSAO.equals(comissionadoAgenciamento.getTipoComissao())){
					comissionadoAgenciamento.setValorComissao((agenciamento.getValorAgenciamento()*comissionadoAgenciamento.getComissao())/100);
					comissionadoAgenciamento.setComissao(comissionadoAgenciamento.getComissao());
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getRowCount(){return 0;}

	public ComissionadoAgenciamento getComissionadoAgenciamento() {
		return comissionadoAgenciamento;
	}

	public void setComissionadoAgenciamento(
			ComissionadoAgenciamento comissionadoAgenciamento) {
		this.comissionadoAgenciamento = comissionadoAgenciamento;
	}

	public List<ComissionadoAgenciamento> getComissionadoAgenciamentoList() {
		return comissionadoAgenciamentoList;
	}

	public void setComissionadoAgenciamentoList(
			List<ComissionadoAgenciamento> comissionadoAgenciamentoList) {
		this.comissionadoAgenciamentoList = comissionadoAgenciamentoList;
	}

	public Integer getParcelaSelecionada() {
		return parcelaSelecionada;
	}

	public void setParcelaSelecionada(Integer parcelaSelecionada) {
		this.parcelaSelecionada = parcelaSelecionada;
	}

	public ParcelasProposta getParcelasProposta() {
		return parcelasProposta;
	}

	public void setParcelasProposta(ParcelasProposta parcelasProposta) {
		this.parcelasProposta = parcelasProposta;
	}

	public String getDemaisParcelas() {
		return demaisParcelas;
	}

	public void setDemaisParcelas(String demaisParcelas) {
		this.demaisParcelas = demaisParcelas;
	}
}