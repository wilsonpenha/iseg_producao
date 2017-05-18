package iseg.utils;

import iseg.app.model.Corretora;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;
import br.com.hwork.persistencia.ServiceLocator;
import br.com.hwork.persistencia.exception.ServiceLocatorException;
import br.com.hwork.servlet.PropertiesManager;

/**
 * @version -	1.0
 * @author - Wilson M. da Penha Jr.
 * @Date  - 05/13/2005
 * 
 * @Description - Servlet to builder the reports files from JasperReport feature.  
 */
@PersistenceContext(name="jdbc/apoliseg", unitName="punit")
public class ServletReportPropostas extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1L;

	public static final String TASK_PRINT = "print";
	public static final String TASK_PDF = "pdf";
	public static final String TASK_XML = "xml";
	public static final String TASK_HTML = "html";
	public static final String TASK_XLS = "xls";
	public static final String TASK_CSV = "csv";

	private Connection conn = null;
	private String dataSource = "iseg";

	String format = TASK_PDF;

	/**
	 * @see 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see 
	 */
	private EntityManager em;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Corretora corretora = null;
		try {
			Context ic = new InitialContext();   
			this.em = (EntityManager) ic.lookup ("java:comp/env/jdbc/apoliseg");
			corretora = (Corretora)this.em.find(Corretora.class, new Long(PropertiesManager.getString("idCorretora")));     
		} catch (Exception e) {      
			throw new ServletException(e);   
		}
		
		String jasperName = "";
		String usuario = "";
		Date dataInicio = null;
		Date dataTermino = null;
		Date dataPropostaInicio = null;
		Date dataPropostaTermino = null;
		Date inicioVigencia = null;
		Date terminoVigencia = null;
		Double ramoId = null;
		Double seguradoraId = null;
		Double grupoVendaId = null;
		Double produtorId = null;
		Double clienteId = null;
		String imagemFile = "";
		String nomeCorretora = "";

		try {
			dataInicio = request.getParameter("dataInicio").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("dataInicio"))).getTime());
			dataTermino = request.getParameter("dataTermino").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("dataTermino"))).getTime());
			dataPropostaInicio = request.getParameter("dataPropostaInicio").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("dataPropostaInicio"))).getTime());
			dataPropostaTermino = request.getParameter("dataPropostaTermino").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("dataPropostaTermino"))).getTime());
			inicioVigencia = request.getParameter("inicioVigencia").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("inicioVigencia"))).getTime());
			terminoVigencia = request.getParameter("terminoVigencia").equals("") ? null : new Date(((new SimpleDateFormat("dd/MM/yyyy")).parse(request.getParameter("terminoVigencia"))).getTime());
			ramoId = request.getParameter("ramoId").equals("") ? null : new Double(request.getParameter("ramoId"));
			seguradoraId = request.getParameter("seguradoraId").equals("") ? null : new Double(request.getParameter("seguradoraId"));
			grupoVendaId = request.getParameter("grupoVendaId").equals("") ? null : new Double(request.getParameter("grupoVendaId"));
			produtorId = request.getParameter("produtorId").equals("") ? null : new Double(request.getParameter("produtorId"));
			clienteId = request.getParameter("clienteId").equals("") ? null : new Double(request.getParameter("clienteId"));
			imagemFile = corretora.getImagemLogo()==null ? "logo_iSeg.png" : corretora.getImagemLogo().equals("") ? "logo_iSeg.png" : corretora.getImagemLogo();
			this.dataSource = PropertiesManager.getString("jndiName");
			nomeCorretora = corretora.getNome();
			usuario = "LUIZ"; //obter usuario da sessão
		}catch (Exception e) {
			e.printStackTrace();
		}

		Long codigoRel = request.getParameter("codigo").equals("") ? new Long("0") : new Long(request.getParameter("codigo"));

		if(codigoRel.equals(1L)){
			jasperName = "/RelVendasDetalhado.jasper";
		}else if(codigoRel.equals(2L)){
			jasperName = "/RelVendasResumido.jasper";
		}else if(codigoRel.equals(3L)){
			jasperName = "/RelPropostaSemApolices.jasper";
		}else if(codigoRel.equals(4L)){
			jasperName = "/RelProducaoDetalhado.jasper";
		}else if(codigoRel.equals(5L)) {
			jasperName = "/RelClientesPropostasVigentes.jasper";
		}else if(codigoRel.equals(6L)){
			jasperName = "/RelListagemRenovacoes.jasper";
		}else if(codigoRel.equals(7L)){
			jasperName = "/RelComissoesAPagar.jasper"; 
		}else if(codigoRel.equals(8L)){
			jasperName = "/RelExtratoRepasse.jasper";
		/*}else if(codigoRel.equals(8L)){
			jasperName = "/RelResumoRenovacoes.jasper";*/
		}


		byte[] output = null;
		try {

			File reportFile = new File(request.getSession().getServletContext().getRealPath("WEB-INF/report") + jasperName);

			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());

			/*********************----- Par�metros comuns para os relat�rios referentes a proposta  -----************************/

			Map<String,Object>parameters = new HashMap<String, Object>();

			if(dataInicio != null)
				parameters.put("PERIODO_INICIO", dataInicio);
			if(dataTermino != null)
				parameters.put("PERIODO_TERMINO", dataTermino);
			if(dataPropostaInicio != null)
				parameters.put("DATA_PROPOSTA_INICIO", dataPropostaInicio);
			if(dataPropostaTermino != null)
				parameters.put("DATA_PROPOSTA_TERMINO", dataPropostaTermino);
			if(inicioVigencia != null)
				parameters.put("DATA_VIGENCIA_INICIO", inicioVigencia);
			if(terminoVigencia != null)
				parameters.put("DATA_VIGENCIA_TERMINO", terminoVigencia);
			if(ramoId != null)
				parameters.put("RAMO_ID", ramoId);
			if(seguradoraId != null)
				parameters.put("SEGURADORA_ID", seguradoraId);
			if(grupoVendaId != null)
				parameters.put("GRUPO_VENDA_ID", grupoVendaId);
			if(produtorId != null)
				parameters.put("PRODUTOR_ID", produtorId);
			if(clienteId != null)
				parameters.put("CLIENTE_ID", clienteId);			

			parameters.put("USUARIO",usuario);
			parameters.put("IMAGEM_DIR", request.getSession().getServletContext().getRealPath("common/images")+"//");
			parameters.put("NOME_CORRETORA", nomeCorretora);
			parameters.put("IMAGEM_FILE", imagemFile);
			parameters.put("SUBREPORT_DIR", request.getSession().getServletContext().getRealPath("WEB-INF/report")+"//");			

			/******************************************************************* 
			 * Here we are Loading the *.jasper(compiled report) Using 
			 * JasperFillManager.fillReport method we are filling the compiled 
			 * report with data from our data source. we get the JasperPrint 
			 * object which is the filled report. This JasperPrint object can 
			 * then be exported to any format 
			 ******************************************************************/
			//System.out.println(jasperReport.getQuery().getText());
			//jasperPrint = (JasperPrint) JasperFillManager.fillReport(jasperReport, parameters, getConnection());


			/******************************************************************* 
			 * From here we are processing according to the format requested by 
			 * the user. Depending on the format requested we are exporting the 
			 * JasperPrint object to various formats like html,csv,xls,pdf,xml. 
			 * Before sending the output stream to the browser, we are setting 
			 * the content type and content-dispostion. Content-disposition 
			 * seems to be nice way of informing the browser about the 
			 * application to be used to accept the stream being sent from 
			 * server 
			 ******************************************************************/
			/******************************************************************* 
			 * Processing to generate the pdf format, content type is 
			 * application/pdf, content-disposition is report.pdf 
			 ******************************************************************/

			output = JasperRunManager.runReportToPdf(jasperReport, parameters, getConnection());
			//output = JasperExportManager.exportReportToPdf(jasperPrint);
			response.setHeader("Pragma","");  
			response.setHeader("Cache-Control","");  
			response.setHeader("Expires","");  
			response.setHeader("Content-Disposition", "inline; filename=report.pdf");
			response.setContentType("application/pdf");
			response.setContentLength(output.length);
			ServletOutputStream outputStream = response.getOutputStream();
			outputStream = response.getOutputStream();
			outputStream.write(output, 0, output.length);
			outputStream.flush();
			outputStream.close();
		} catch (JRException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	/*    private JRParameter getJRParam(String paramName, JasperReport jasperReport){
		JRParameter[] jrParams = jasperReport.getParameters();

		for (int i=0;i<jrParams.length;i++){
			if (paramName.equals(jrParams[i].getName()))
				return jrParams[i];
		}
		return null;
    }
	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws
		ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/" + path);
		response.setHeader("Pragma", "no-cache");
		rd.forward(request, response);
	}
	 */
	public String getContentType() {
		String returnString = "";
		if (format.equals("pdf"))
			returnString = "application/pdf";
		if (format.equals("html"))
			returnString = "text/html";
		if (format.equals("xsl"))
			returnString = "application/vnd.ms-excel";
		if (format.equals("csv"))
			returnString = "text/plain";
		if (format.equals("xml"))
			returnString = "text/xml";
		return returnString;
	}

	/*	private byte[] exportReportToBytes(JasperPrint jasperPrint, JRExporter exporter) throws JRException {
		byte[] output;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
		exporter.exportReport();
		output = baos.toByteArray();
		return output;
	}*/
	/***************************************************************** 
	 * This method will forward the control to interaktiv_error.jsp 
	 * The jsp will then display the reason for error and all 
	 * the input parameters. 
	 * This is a faster way of showing the user and developer what 
	 * happenned to thier request if an error occurs. 
	 * This will make the development easy as they need not go through 
	 * the process of going through the logs. 
	 *****************************************************************/
	/*	private void forwardToErrorJSP(HttpServletRequest req, HttpServletResponse res, Exception e) {
		try {

			System.out.println("See the Error in erroLog.log file");

			HttpSession session = req.getSession();
			if (session != null) {
				session.setAttribute("Interaktiv_error", (Exception) e);
			}
			System.out.println("reached here");
			RequestDispatcher rd = req.getRequestDispatcher("jsp/common/errorpge.jsp");
			System.out.println("reached here too");
			rd.forward(req, res);
			System.out.println("should not reached here");

			ServletOutputStream outputStream = res.getOutputStream();
			outputStream = res.getOutputStream();
			outputStream.println(e.toString());

		} catch (Exception ex) {

		}
	}*/

	private Connection getConnection() {

		DataSource ds;

		try {
			ds = ServiceLocator.getInstance("java:comp/env").getDataSource(dataSource);
			conn = ds.getConnection();
		} catch (ServiceLocatorException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	@Override
	public void destroy() {

		try {
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		super.destroy();
	}
}
