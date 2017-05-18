package iseg.utils;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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

/**
 * @version -	1.0
 * @author - Wilson M. da Penha Jr.
 * @Date  - 05/13/2005
 * 
 * @Description - Servlet to builder the reports files from JasperReport feature.  
 */
public class ServletReportBuilder extends HttpServlet implements Servlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String jasperName = "";
		Long ramoId = request.getParameter("ramoId")==null ? new Long("0") : new Long((String)request.getParameter("ramoId"));
		if(ramoId.equals(2L)){ // Seguro Auto
			jasperName = "/RelPedidoSeguroAuto.jasper";
		}else if(ramoId.equals(1L)){ // Seguro Riscos Diversos
			jasperName = "/RelPedidoSeguroRiscosDiversos.jasper";
		}
		
		byte[] output = null;
		try {
			
			String imagemFile = "";
			String nomeCorretora = "";

			this.dataSource = request.getParameter("dataSource");
			nomeCorretora = request.getParameter("nomeCorretora");
			imagemFile = request.getParameter("imagemFile");

			//JasperPrint jasperPrint = (JasperPrint) request.getSession().getAttribute("JASPER_PRINT");
	
			//System.out.println("Session is new = "+request.getSession().isNew());
			
			File reportFile = new File(request.getSession().getServletContext().getRealPath("WEB-INF/report") + jasperName);
	
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());
			
			Map<String, Object>parameters = new HashMap<String, Object>();
			Long propostaId = request.getParameter("propostaId")==null ? new Long("0") : new Long((String)request.getParameter("propostaId")); 
			parameters.put("IMAGEM_DIR", request.getSession().getServletContext().getRealPath("common/images")+"//");
			parameters.put("NOME_CORRETORA", nomeCorretora);
			parameters.put("IMAGEM_FILE", imagemFile);
			parameters.put("PROPOSTA_ID", propostaId);
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
			ds = ServiceLocator.getInstance("java:comp/env").getDataSource("jdbc/"+this.dataSource);
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
