package iseg.app.report;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import iseg.app.business.PropostaService;
import iseg.app.model.Periodo;
import iseg.app.model.Usuario;

import com.opensymphony.xwork2.Action;

public class ApoliceParaBaixaReportAction extends JasperReportAction {

	private static final long serialVersionUID = 1L;
	private Integer stNroApolice;
	private Integer stBaixaApolice;
	private Integer stNroEndosso;
	private Integer stBaixaEndosso;
	private Periodo periodoDeLanctoApolice;
	private Periodo periodoDeBaixaApolice;
	private Periodo periodoDeLanctoEndosso;
	private Periodo periodoDeBaixaEndosso;
	private Long situacaoOperacional;
	private String usuarioId;

	public Long getSituacaoOperacional() {
		return situacaoOperacional;
	}

	public void setSituacaoOperacional(Long situacaoOperacional) {
		this.situacaoOperacional = situacaoOperacional;
	}

	public ApoliceParaBaixaReportAction(PropostaService service) {
		super(service);
	}

	/**
	 * Ações do controle 
	 **/
	public String execute(){
		super.addParameterIfNotNull("SITUACAO_OPERACIONAL", this.getSituacaoOperacional());
		super.addParameterIfNotNull("ST_NRO_APOLICE", this.getStNroApolice());
		super.addParameterIfNotNull("ST_BAIXA_APOLICE", this.getStBaixaApolice());
		super.addParameterIfNotNull("ST_NRO_ENDOSSO", this.getStNroEndosso());
		super.addParameterIfNotNull("ST_BAIXA_ENDOSSO", this.getStBaixaEndosso());
		if(this.getPeriodoDeLanctoApolice() != null){
			super.addParameterIfNotNull("DATA_LANCAMENTO_APOLICE_INICIO", this.getPeriodoDeLanctoApolice().getInicio());
			super.addParameterIfNotNull("DATA_LANCAMENTO_APOLICE_FIM", this.getPeriodoDeLanctoApolice().getFim());
		}
		if(this.getPeriodoDeBaixaApolice() != null){
			super.addParameterIfNotNull("DATA_BAIXA_APOLICE_INICIO", this.getPeriodoDeBaixaApolice().getInicio());
			super.addParameterIfNotNull("DATA_BAIXA_APOLICE_FIM", this.getPeriodoDeBaixaApolice().getFim());
		}
		if(this.getPeriodoDeLanctoEndosso() != null){
			super.addParameterIfNotNull("DATA_LANCAMENTO_ENDOSSO_INICIO", this.getPeriodoDeLanctoEndosso().getInicio());
			super.addParameterIfNotNull("DATA_LANCAMENTO_ENDOSSO_FIM", this.getPeriodoDeLanctoEndosso().getFim());
		}
		if(this.getPeriodoDeBaixaEndosso() != null){
			super.addParameterIfNotNull("DATA_BAIXA_ENDOSSO_INICIO", this.getPeriodoDeBaixaEndosso().getInicio());
			super.addParameterIfNotNull("DATA_BAIXA_ENDOSSO_FIM", this.getPeriodoDeBaixaEndosso().getFim());
		}
		if(this.getUsuarioId() != null && !this.getUsuarioId().trim().equals("")){
			super.addParameterIfNotNull("USUARIO_LANCTO_APOLICE_ID", Long.parseLong(this.getUsuarioId()));
			super.addParameterIfNotNull("USUARIO_BAIXA_APOLICE_ID", Long.parseLong(this.getUsuarioId()));
		}
		String retorno = super.execute();
		return retorno.equals(Action.SUCCESS) ? "report" : retorno;
	}

	public String relatorio(){
		return Action.SUCCESS;
	}

	/**
	 * Getters and Setters
	 **/
	public String getJasperName(){
		return "/WEB-INF/report/RelApolicesNaoBaixada.jasper";
	}

	public String getTitulo() {
		return "Relatório Baixa de Apólice/Endosso";
	}

	public Integer getStNroApolice() {
		return stNroApolice;
	}

	public void setStNroApolice(Integer stNroApolice) {
		this.stNroApolice = stNroApolice;
	}

	public Integer getStBaixaApolice() {
		return stBaixaApolice;
	}

	public void setStBaixaApolice(Integer stBaixaApolice) {
		this.stBaixaApolice = stBaixaApolice;
	}

	public Integer getStNroEndosso() {
		return stNroEndosso;
	}

	public void setStNroEndosso(Integer stNroEndosso) {
		this.stNroEndosso = stNroEndosso;
	}

	public Integer getStBaixaEndosso() {
		return stBaixaEndosso;
	}

	public void setStBaixaEndosso(Integer stBaixaEndosso) {
		this.stBaixaEndosso = stBaixaEndosso;
	}

	public Periodo getPeriodoDeLanctoApolice() {
		return periodoDeLanctoApolice;
	}

	public void setPeriodoDeLanctoApolice(Periodo periodoDeLanctoApolice) {
		this.periodoDeLanctoApolice = periodoDeLanctoApolice;
	}

	public Periodo getPeriodoDeBaixaApolice() {
		return periodoDeBaixaApolice;
	}

	public void setPeriodoDeBaixaApolice(Periodo periodoDeBaixaApolice) {
		this.periodoDeBaixaApolice = periodoDeBaixaApolice;
	}

	public Periodo getPeriodoDeLanctoEndosso() {
		return periodoDeLanctoEndosso;
	}

	public void setPeriodoDeLanctoEndosso(Periodo periodoDeLanctoEndosso) {
		this.periodoDeLanctoEndosso = periodoDeLanctoEndosso;
	}

	public Periodo getPeriodoDeBaixaEndosso() {
		return periodoDeBaixaEndosso;
	}

	public void setPeriodoDeBaixaEndosso(Periodo periodoDeBaixaEndosso) {
		this.periodoDeBaixaEndosso = periodoDeBaixaEndosso;
	}
	
	public Set<Usuario> getUsuarioList(){
		Set<Usuario> usuarioList = new HashSet<Usuario>();
		if(this.corretoraEmUso.getIsAssessorada()){
			if(!this.corretoraEmUso.equals(this.corretoraEmUso.getAssessoria())){
				usuarioList.addAll(this.corretoraEmUso.getAssessoria().getUsuarioCollection());
			}
		}
		usuarioList.addAll(this.corretoraEmUso.getUsuarioCollection());
		return usuarioList; 
	}

	public String getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(String usuarioId) {
		this.usuarioId = usuarioId;
	}

}