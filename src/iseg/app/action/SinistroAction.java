/************************************************************/
//Versao.....: 0.1
//Alterado em: 24/10/2008
/************************************************************/
package iseg.app.action;

import iseg.app.business.SinistroService;
import iseg.app.model.Acompanhamento;
import iseg.app.model.Automovel;
import iseg.app.model.Endereco;
import iseg.app.model.GrupoDeVenda;
import iseg.app.model.Indenizacoes;
import iseg.app.model.Oficina;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.Sinistro;
import iseg.app.model.SinistroAnexo;
import iseg.app.model.TerceiroEnvolvido;
import iseg.app.model.Vistoriadora;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.validation.SkipValidation;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class SinistroAction extends BaseAction implements Preparable {

	private static final long serialVersionUID = 1L;
	private Sinistro sinistro;
	private Sinistro sinistroSearch;
	private PessoaFisica pessoaFisica;
	private PessoaJuridica pessoaJuridica;
	private Proposta proposta;
	private TerceiroEnvolvido terceiroEnvolvido;
	private Acompanhamento acompanhamento;
	private Indenizacoes indenizacao;
	private Oficina oficina;
	private Endereco enderecoOficina;
	private SinistroAnexo sinistroAnexo;
	private List<Sinistro> sinistros;
	private List<Proposta> propostas;
	private List<TerceiroEnvolvido>terceiroEnvolvidoList = new ArrayList<TerceiroEnvolvido>();
	private List<Acompanhamento>acompanhamentoList = new ArrayList<Acompanhamento>();
	private List<Indenizacoes>indenizacaoList = new ArrayList<Indenizacoes>();
	private List<SinistroAnexo>sinistroAnexoList = new ArrayList<SinistroAnexo>();
	private Long currentTab;
	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadContentType;
	private InputStream imageStream;

	private Integer tipoCliente;

	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;

	protected SinistroService service;

	//@Autowired
	public SinistroAction(SinistroService service) {
		super(service);
		this.service = service;
	}

	public void prepare() throws Exception {
		super.prepare();

		if(this.getSession().get("sinistroSearch") != null){
			this.sinistroSearch = (Sinistro) this.getSession().get("sinistroSearch");
		}
	}

	protected void setPObjectInstance() {
		try {
			this.sinistro = (Sinistro)this.pobject;
			this.service.refresh(pobject);

			this.proposta = this.sinistro.getProposta();
			if (HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente()) instanceof PessoaFisica)
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente());
			else
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente());
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
	}

	@Override
	protected void persistPObjects(){
		if (sinistro.getNroVistoria() == null || sinistro.getNroVistoria().equals("")){
			sinistro.setVistoriadora(null);
			sinistro.setDataVistoria(null);
			sinistro.setNomeVistoriador(null);
			sinistro.setNomeVistoriadora(null);
		}
		if (sinistro.getOficina() == null){
			sinistro.setOficina(null);
		}
	}

	@SkipValidation
	public String novo() {
		try{

			Proposta proposta = (Proposta)this.service.find(this.proposta);

			this.sinistro = new Sinistro();
			this.sinistro.setProposta(proposta);
			this.sinistro.setNroProposta(proposta.getNumero());
			this.sinistro.setNroApolice(proposta.getNroApolice());

			if(HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
				this.pessoaFisica = (PessoaFisica)HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente());
			}else if(HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
				this.pessoaJuridica = (PessoaJuridica)HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente());
			}

			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editar() {

		try{
			if (this.pobject.getId()==null){
				if(id==null)//Posteriormente fazer a controle atrav�s de Exception
					return Action.SUCCESS;
				this.pobject.setId(id[0]);
			}

			this.pobject = service.find(this.pobject);
			this.setPObjectInstance();

			if(HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.sinistro.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}
			this.oficina = this.sinistro.getOficina();
			if(this.oficina != null && this.oficina.getId() != null){
				carregaEnderecoOficina();
			}
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String salvarEditar(){
		try{

			if(this.sinistro.getOficina() == null || this.sinistro.getOficina().getId() == null){
				this.sinistro.setOficina(null);
			}
			return super.salvarEditar();

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String carregaEnderecoOficina(){
		try{

			List<Endereco>enderecos = this.service.genericFindByNamedQuery("getEnderecoByPessoaIdOrderedDesc", new Object[]{this.oficina.getId()});
			this.enderecoOficina = enderecos == null || enderecos.isEmpty() ? null : enderecos.get(0);
			return Action.SUCCESS;

		}catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public Sinistro getSinistro() {
		return sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
		this.pobject = this.sinistro;
	}

	public List<Sinistro> getSinistros(){
		try {
			return sinistros;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return new ArrayList<Sinistro>();
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String lista() {
		try{
			this.getSession().put("sinistroSearch", sinistroSearch);
			if(this.sinistroSearch != null){
				this.listCount = this.service.getCountSinistroForSearch(sinistroSearch).intValue();
				this.sinistros = this.service.getSinistroForSearch(sinistroSearch, page, pageSize);
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirTerceiroEnvolvido(){
		try{
			this.service.save(terceiroEnvolvido);
			terceiroEnvolvidoList = (List<TerceiroEnvolvido>)this.service.genericFindBySQLQuery("Select te From TerceiroEnvolvido te where te.sinistro.id = ?0 ", new Object[]{terceiroEnvolvido.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarTerceiroEnvolvido(){
		try {

			this.terceiroEnvolvido = (TerceiroEnvolvido)this.service.find(this.terceiroEnvolvido);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirTerceiroEnvolvido(){
		try {

			this.service.remove(terceiroEnvolvido);
			terceiroEnvolvidoList = (List<TerceiroEnvolvido>)this.service.genericFindBySQLQuery("Select te From TerceiroEnvolvido te where te.sinistro.id = ?0 ", new Object[]{terceiroEnvolvido.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public void validate() {

		if (this.getFileUpload() != null) {

			if (getFileUpload().length() > 2048000){

				try {
					this.sinistroAnexoList = (List<SinistroAnexo>)this.service.genericFindBySQLQuery("Select san From SinistroAnexo san where san.sinistro.id = ?0 ", new Object[]{getSinistro().getId()});
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				addActionError("ERRO: Arquivo anexo maior que 2048000 bytes (2MB)!");
				
			} else {

				addActionMessage("Upload concluido com sucesso!");

			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public String inserirAnexo(){
		try{

			SinistroAnexo sinistroAnexo = new SinistroAnexo();
			sinistroAnexo.setSinistro(this.sinistro);
			sinistroAnexo.setNome(this.fileUploadFileName.toLowerCase());
			sinistroAnexo.setContentType(this.fileUploadContentType.toLowerCase());
			
			if (sinistroAnexo.getContentType().indexOf("jpeg")<0 && fileUpload.length() > 2048000)
				throw new Exception("Arquivo anexo que não for de extensão .jpeg/.jpg, deve ser menor que 2048000 bytes (2MB)");
			
			if(fileUpload.length()/1024 > 300 && sinistroAnexo.getContentType().indexOf("jpeg")>=0){
				sinistroAnexo.setAnexo(Util.compressJpegFile(fileUpload));
			}else{
				sinistroAnexo.setAnexo(Util.getBytesFromFile(fileUpload));
			}

			this.service.save(sinistroAnexo);

			this.sinistroAnexoList = (List<SinistroAnexo>)this.service.genericFindBySQLQuery("Select san From SinistroAnexo san where san.sinistro.id = ?0 ", new Object[]{sinistroAnexo.getSinistro().getId()});

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			
			try {
				this.sinistroAnexoList = (List<SinistroAnexo>)this.service.genericFindBySQLQuery("Select san From SinistroAnexo san where san.sinistro.id = ?0 ", new Object[]{sinistroAnexo.getSinistro().getId()});
			} catch (Exception e1) {}
			
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirAnexo(){
		try {

			this.service.remove(this.sinistroAnexo);
			this.sinistroAnexoList = (List<SinistroAnexo>)this.service.genericFindBySQLQuery("Select san From SinistroAnexo san where san.sinistro.id = ?0 ", new Object[]{getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String mostrarAnexo(){
		try{ 
			//System.out.println("Mostra anexo");
			this.sinistroAnexo = (SinistroAnexo)this.service.find(sinistroAnexo);

			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}
	
	@SkipValidation
	public String preparaMostrarAnexo(){
		try{

			//return Action.SUCCESS;
			return "popup";

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String carregarAnexos(){
		try {

			this.sinistroAnexoList = (List<SinistroAnexo>)this.service.genericFindBySQLQuery("Select san From SinistroAnexo san where san.sinistro.id = ?0 ", new Object[]{getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirAcompanhamento(){
		try{
			this.service.save(this.acompanhamento);
			acompanhamentoList = (List<Acompanhamento>)this.service.genericFindBySQLQuery("Select a From Acompanhamento a where a.sinistro.id = ?0 order by a.dataLancamento desc", new Object[]{acompanhamento.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarAcompanhamento(){
		try {

			this.acompanhamento = (Acompanhamento)this.service.find(this.acompanhamento);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirAcompanhamento(){
		try {

			this.service.remove(acompanhamento);
			acompanhamentoList = (List<Acompanhamento>)this.service.genericFindBySQLQuery("Select a From Acompanhamento a where a.sinistro.id = ?0 order by a.dataLancamento desc", new Object[]{acompanhamento.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String inserirIndenizacao(){
		try{
			this.service.save(this.indenizacao);
			indenizacaoList = (List<Indenizacoes>)this.service.genericFindBySQLQuery("Select i From Indenizacoes i where i.sinistro.id = ?0 order by i.dataPagamento desc", new Object[]{indenizacao.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.ERROR;
		}
	}

	@SkipValidation
	public String editarIndenizacao(){
		try {

			this.indenizacao = (Indenizacoes)this.service.find(this.indenizacao);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String excluirIndenizacao(){
		try {

			this.service.remove(indenizacao);
			indenizacaoList = (List<Indenizacoes>)this.service.genericFindBySQLQuery("Select i From Indenizacoes i where i.sinistro.id = ?0 order by i.dataPagamento desc", new Object[]{indenizacao.getSinistro().getId()});
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public Map<String, String>getDescricaoDano(){
		HashMap<String, String>selectList = new HashMap<String, String>();
		selectList.put("0","ROUBO");
		selectList.put("1","FURTO");
		selectList.put("2","PERDA PARCIAL - COLIsão");
		selectList.put("3","PERDA TOTAL - COLIsão");
		selectList.put("4","DANOS A TERCEIROS");
		selectList.put("5","PERDA TOTAL - FURTO");
		return selectList;
	}

	public int getRowCount(){
		try {
			return this.service.getRowCount("getCountSinistro", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
			return 0;
		}
	}

	public Sinistro getSinistroSearch() {
		return sinistroSearch;
	}

	public void setSinistroSearch(Sinistro sinistroSearch) {
		this.sinistroSearch = sinistroSearch;
	}

	@SuppressWarnings("unchecked")
	public List<Seguradora> getSeguradoraList(){
		try{
			return (List<Seguradora>)this.service.genericFindBySQLQuery("Select s From Seguradora s", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Seguradora>();
	}

	@SuppressWarnings("unchecked")
	public List<Ramo> getRamoList(){
		try{
			return (List<Ramo>)this.service.genericFindBySQLQuery("Select r From Ramo r", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Ramo>();
	}

	@SuppressWarnings("unchecked")
	public List<GrupoDeVenda> getGrupoDeVendaList(){
		try{
			return (List<GrupoDeVenda>)this.service.genericFindBySQLQuery("Select g From GrupoDeVenda g", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<GrupoDeVenda>();
	}

	@SkipValidation
	public List<Automovel> getItensSeguradosList(){
		try{
			return this.service.genericFindByNamedQuery("getAutomovelByProposta", new Object[] { this.proposta.getId() });
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Automovel>();
	}

	@SuppressWarnings("unchecked")
	public List<Vistoriadora> getVistoriadorasList(){
		try{
			return (List<Vistoriadora>)this.service.genericFindBySQLQuery("Select v From Vistoriadora v", null);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return new ArrayList<Vistoriadora>();
	}

	public Map<Long, String> getTipoIndenizacaoList(){
		return new HashMap<Long, String>();
	}

	@SkipValidation
	public String getDadosCliente(){
		try {

			this.proposta = (Proposta)this.service.find(this.proposta);
			if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaFisica){
				this.tipoCliente = CLIENTE_PF;
			}else if(HibernateUtil.initializeAndUnproxy(this.getProposta().getCliente()) instanceof PessoaJuridica){
				this.tipoCliente = CLIENTE_PJ;
			}

			if (this.proposta.getCliente() != null && this.proposta.getCliente().getId() != null){
				if(this.tipoCliente.equals(CLIENTE_PF)){
					this.pessoaFisica = new PessoaFisica();
					this.pessoaFisica.setId(this.proposta.getCliente().getId());
					this.pessoaFisica = (PessoaFisica)this.service.find(this.pessoaFisica);
					this.proposta.setCliente(pessoaFisica);
				}else if(this.tipoCliente.equals(CLIENTE_PJ)){
					this.pessoaJuridica = new PessoaJuridica();
					this.pessoaJuridica.setId(this.proposta.getCliente().getId());
					this.pessoaJuridica = (PessoaJuridica)this.service.find(this.pessoaJuridica);
					this.proposta.setCliente(pessoaJuridica);
				}
			}
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String showDadosTerceiroEnvolvido(){
		try {

			this.terceiroEnvolvido = (TerceiroEnvolvido)this.service.find(this.terceiroEnvolvido);
			return Action.SUCCESS;

		} catch (Exception ge) {
			addActionError(ge.getMessage());
			return Action.ERROR;
		}
	}

	public String enderecoTerceiroEnvolvidoText(){
		if(this.terceiroEnvolvido != null){
			return (this.terceiroEnvolvido.getLogradouro() != null && !this.terceiroEnvolvido.getLogradouro().equals("") ? this.terceiroEnvolvido.getLogradouro() : "") +
			(this.terceiroEnvolvido.getNumero() != null && !this.terceiroEnvolvido.getNumero().equals("") ? ", "+this.terceiroEnvolvido.getNumero() : "") +
			(this.terceiroEnvolvido.getComplemento() != null && !this.terceiroEnvolvido.getComplemento().equals("") ? ", "+this.terceiroEnvolvido.getComplemento() : "") +
			(this.terceiroEnvolvido.getBairro() != null && !this.terceiroEnvolvido.getBairro().equals("") ? ", "+this.terceiroEnvolvido.getBairro() : "") +
			(this.terceiroEnvolvido.getCep() != null && !this.terceiroEnvolvido.getCep().equals("") ? ", CEP "+this.terceiroEnvolvido.getCep() : "") +
			(this.terceiroEnvolvido.getCidade() != null && !this.terceiroEnvolvido.getCidade().equals("") ? ", "+this.terceiroEnvolvido.getCidade() : "") +
			(this.terceiroEnvolvido.getUf() != null && !this.terceiroEnvolvido.getUf().equals("") ? ", "+this.terceiroEnvolvido.getUf() : "");
		}
		return "";
	}

	public String telefoneTerceiroEnvolvidoText(){
		if(this.terceiroEnvolvido != null){
			return (this.terceiroEnvolvido.getTelefonePreferencial() != null && !this.terceiroEnvolvido.getTelefonePreferencial().equals("") ? this.terceiroEnvolvido.getTelefonePreferencial() : "") +
			(this.terceiroEnvolvido.getTelefoneAlternativo() != null && !this.terceiroEnvolvido.getTelefoneAlternativo().equals("") ? ", "+this.terceiroEnvolvido.getTelefoneAlternativo() : "") +
			(this.terceiroEnvolvido.getTelefoneCelular() != null && !this.terceiroEnvolvido.getTelefoneCelular().equals("") ? ", "+this.terceiroEnvolvido.getTelefoneCelular() : "");
		}
		return "";
	}

	public String veiculoTerceiroEnvolvidoText(){
		if(this.terceiroEnvolvido != null){
			return (this.terceiroEnvolvido.getVeiculoEnvolvido() != null && !this.terceiroEnvolvido.getVeiculoEnvolvido().equals("") ? this.terceiroEnvolvido.getVeiculoEnvolvido() : "") +
			(this.terceiroEnvolvido.getCor() != null && !this.terceiroEnvolvido.getCor().equals("") ? ", "+this.terceiroEnvolvido.getCor() : "") +
			(this.terceiroEnvolvido.getAnoFabricacao() != null && !this.terceiroEnvolvido.getAnoFabricacao().equals("") ? ", "+this.terceiroEnvolvido.getAnoFabricacao() : "") +
			(this.terceiroEnvolvido.getAnoModelo() != null && !this.terceiroEnvolvido.getAnoModelo().equals("") ? "/"+this.terceiroEnvolvido.getAnoModelo() : "") +
			(this.terceiroEnvolvido.getPlaca() != null && !this.terceiroEnvolvido.getPlaca().equals("") ? ", "+this.terceiroEnvolvido.getPlaca() : "");
		}
		return "";
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Long getCurrentTab() {
		return currentTab;
	}

	public void setCurrentTab(Long currentTab) {
		this.currentTab = currentTab;
	}

	public Integer getTipoCliente() {
		return tipoCliente;
	}

	public void setTipoCliente(Integer tipoCliente) {
		this.tipoCliente = tipoCliente;
	}

	public List<Proposta> getPropostas() {
		return propostas;
	}

	public void setPropostas(List<Proposta> propostas) {
		this.propostas = propostas;
	}

	public TerceiroEnvolvido getTerceiroEnvolvido() {
		return terceiroEnvolvido;
	}

	public void setTerceiroEnvolvido(TerceiroEnvolvido terceiroEnvolvido) {
		this.terceiroEnvolvido = terceiroEnvolvido;
	}

	public List<TerceiroEnvolvido> getTerceiroEnvolvidoList() {
		return terceiroEnvolvidoList;
	}

	public void setTerceiroEnvolvidoList(List<TerceiroEnvolvido> terceiroEnvolvidoList) {
		this.terceiroEnvolvidoList = terceiroEnvolvidoList;
	}

	public Acompanhamento getAcompanhamento() {
		return acompanhamento;
	}

	public void setAcompanhamento(Acompanhamento acompanhamento) {
		this.acompanhamento = acompanhamento;
	}

	public Endereco getEnderecoOficina() {
		return enderecoOficina;
	}

	public void setEnderecoOficina(Endereco enderecoOficina) {
		this.enderecoOficina = enderecoOficina;
	}

	public Oficina getOficina() {
		return oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
	}

	public List<Acompanhamento> getAcompanhamentoList() {
		return acompanhamentoList;
	}

	public void setAcompanhamentoList(List<Acompanhamento> acompanhamentoList) {
		this.acompanhamentoList = acompanhamentoList;
	}

	public Indenizacoes getIndenizacao() {
		return indenizacao;
	}

	public void setIndenizacao(Indenizacoes indenizacao) {
		this.indenizacao = indenizacao;
	}

	public List<Indenizacoes> getIndenizacaoList() {
		return indenizacaoList;
	}

	public void setIndenizacaoList(List<Indenizacoes> indenizacaoList) {
		this.indenizacaoList = indenizacaoList;
	}

	public List<SinistroAnexo> getSinistroAnexoList() {
		return sinistroAnexoList;
	}

	public void setSinistroAnexoList(List<SinistroAnexo> sinistroAnexoList) {
		this.sinistroAnexoList = sinistroAnexoList;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public SinistroAnexo getSinistroAnexo() {
		return sinistroAnexo;
	}

	public void setSinistroAnexo(SinistroAnexo sinistroAnexo) {
		this.sinistroAnexo = sinistroAnexo;
	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}
}