package iseg.app.action;

import iseg.app.business.ProcessarIntegracaoService;
import iseg.app.constants.Constants;
import iseg.app.model.ArquivoByte;
import iseg.app.model.EdiImportacaoAnexo;
import iseg.app.model.ImportacaoEdiConfig;
import iseg.app.model.LoteImportacao;
import iseg.app.model.Seguradora;
import iseg.app.persistence.LogType;
import iseg.utils.Util;

import java.io.File;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ProcessarIntegracaoAction extends BaseAction implements Preparable {
	
	private static final long serialVersionUID = -8411550449348657799L;
	
	private String[] fileUploadContentType;
	private InputStream imageStream;
	private File[] fileUpload;
	private String[] fileUploadFileName;
	private Integer[] tipoArquivo;
	private ProcessarIntegracaoService service;
	private LoteImportacao loteImportacao;
	private ImportacaoEdiConfig importacaoEdiConfig;
	private List<EdiImportacaoAnexo> ediImportacaoAnexoList = new ArrayList<EdiImportacaoAnexo>();
	
	private Seguradora seguradora;
	private Date dataInicial;
	private Date dataFinal;
	private Integer tipo;
	
	@SkipValidation
	public String imporarEdiImportacaoAnexo(){
		try{
			this.importacaoEdiConfig = (ImportacaoEdiConfig)this.service.genericFindFirstResultByNamedQuery("getImportacaoEdiConfigById",new Object[]{this.importacaoEdiConfig.getId()});
			this.loteImportacao = new LoteImportacao();
			this.loteImportacao.setSeguradora(this.importacaoEdiConfig.getSeguradora());
			for(int i = 0 ; i < fileUpload.length ; i++){
				EdiImportacaoAnexo ediImportacaoAnexo  = new EdiImportacaoAnexo();
				ArquivoByte arquivoByte = new ArquivoByte();
				arquivoByte.setAnexo(Util.getBytesFromFile(fileUpload[i]));
				this.service.save(arquivoByte);
				ediImportacaoAnexo.setArquivoByte(arquivoByte);
				ediImportacaoAnexo.setLoteImportacao(this.loteImportacao);
				ediImportacaoAnexo.setTipoArquivo(tipoArquivo[i]);
				ediImportacaoAnexo.setExtArquivo(fileUploadContentType[i]);
				ediImportacaoAnexo.setNomeArquivo(fileUploadFileName[i]);
				this.loteImportacao.getEdiImportacaoAnexoCollection().add(ediImportacaoAnexo);
			}
			loteImportacao.setDescricao("Lote"+new SimpleDateFormat("dd/mm/yyyy hh:mm").format(new Date())+"");
			this.loteImportacao.setCorretora(this.corretoraEmUso);
			this.loteImportacao.setLog(new LogType());
			this.loteImportacao.getLog().setAutor(this.usuario);
			this.loteImportacao.setDtInicioProcessamento(new Timestamp(new Date().getTime()));
			this.loteImportacao.setSituacao(Constants.LOTE_IMPORTACAO_SITUACAO_IMPORTADO);
			this.service.save(this.loteImportacao);
			return Action.SUCCESS;
		} catch (Exception e) {
			return Action.ERROR;
		}
	}
	
	public ProcessarIntegracaoAction(ProcessarIntegracaoService service){
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
	
	public List<EdiImportacaoAnexo> getEdiImportacaoAnexoList(){
		try {
			List<LoteImportacao> list = null;
			if(this.seguradora != null || this.dataInicial != null || this.dataFinal != null || this.tipo != null){
				this.ediImportacaoAnexoList =  this.service.ediImportacaoAnexoListSearch(this.seguradora, this.dataInicial, this.dataFinal, this.tipo, this.corretoraEmUso);
			}else{
				list = this.service.pesquisaLoteImportacao(this.corretoraEmUso);
				for(LoteImportacao loteImportacao : list){
					for(EdiImportacaoAnexo ediImportacaoAnexo : loteImportacao.getEdiImportacaoAnexoCollection()){
						this.ediImportacaoAnexoList.add(ediImportacaoAnexo);
					}
				}
			}
			return this.ediImportacaoAnexoList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String atualizarSituacaoLotesImportacao(){
		try{
			getEdiImportacaoAnexoList();
			return Action.SUCCESS;
		} catch (Exception e) {
			return Action.ERROR;
		}
	}

	@Override
	public void setPObjectInstance() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<ImportacaoEdiConfig> getSeguradorasByImportacaoEdiConfigList(){
		try {
			return this.service.genericFindByNamedQuery("getImportacaoEdiConfig", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String[] getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String[] fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

	public File[] getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File[] fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String[] getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String[] fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public LoteImportacao getLoteImportacao() {
		return loteImportacao;
	}

	public void setLoteImportacao(LoteImportacao loteImportacao) {
		this.loteImportacao = loteImportacao;
	}

	public ImportacaoEdiConfig getImportacaoEdiConfig() {
		return importacaoEdiConfig;
	}

	public void setImportacaoEdiConfig(ImportacaoEdiConfig importacaoEdiConfig) {
		this.importacaoEdiConfig = importacaoEdiConfig;
	}

	public Integer[] getTipoArquivo() {
		return tipoArquivo;
	}

	public void setTipoArquivo(Integer[] tipoArquivo) {
		this.tipoArquivo = tipoArquivo;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}
	
}
