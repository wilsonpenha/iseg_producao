package iseg.app.report;

import iseg.app.business.PropostaService;

import java.io.File;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import br.com.hwork.persistencia.ServiceLocator;
import br.com.hwork.persistencia.exception.ServiceLocatorException;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport implements SessionAware, ServletResponseAware, ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private DriverManagerDataSource dataSource;
	private Map<String, Object> parameters;

	private Map session;
	private HttpServletResponse response;
	private HttpServletRequest request;
	private Connection conn = null;
	private PropostaService service;

	public ReportAction(PropostaService service) {
		this.service = service;
	}
	
/*	public ReportAction(DriverManagerDataSource dataSource) {
		this.dataSource = dataSource;
	}
*/	
	protected String gerarReport(String pathRelatorio,	Map<String, Object> parameters) {

		URL pathJasper = this.getClass().getResource(pathRelatorio);
		File fileReport = new File(pathJasper.getPath());

		try {

			response.setContentType("application/pdf");
			response.setHeader("Pragma", "");
			response.setHeader("Cache-Control","");
			response.setHeader("Expires", "-1");
			response.setHeader("Content-Disposition","inline; filename=report.pdf");
			
			ServletOutputStream outputStream = response.getOutputStream();

			Integer topMargin = (parameters.get("topmargin") == null) ? null : (Integer) parameters.get("topmargin");
			Integer rightMargin = (parameters.get("rightmargin") == null) ? null : (Integer) parameters.get("rightmargin");
			if (topMargin != null || rightMargin != null) {
				parameters.put("SUBREPORT_DIR", (fileReport.getPath().replaceAll("%20", " ").lastIndexOf("\\") > 0) ? fileReport.getPath().replaceAll("%20", " ").substring(0, fileReport.getPath().replaceAll("%20", " ").lastIndexOf("\\")+1) : fileReport.getPath().replaceAll("%20", " ").substring(0, fileReport.getPath().replaceAll("%20", " ").lastIndexOf("/")+1));
				JasperReport _jr = (JasperReport)JRLoader.loadObject(fileReport.getPath().replaceAll("%20", " "));
				JasperPrint _jp = JasperFillManager.fillReport(_jr, parameters, this.getConnection());
				JRPdfExporter jpdfx = new JRPdfExporter();
				jpdfx.setParameter(JRPdfExporterParameter.JASPER_PRINT, _jp);
				if (topMargin != null)
					jpdfx.setParameter(JRPdfExporterParameter.OFFSET_Y, topMargin);
				if (rightMargin != null)
					jpdfx.setParameter(JRPdfExporterParameter.OFFSET_X, topMargin);
				jpdfx.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, outputStream);
				jpdfx.exportReport();
			} else {
				byte[] bytes = JasperRunManager.runReportToPdf(fileReport.getPath().replaceAll("%20", " "), parameters, this.getConnection());
				response.setContentLength(bytes.length);
				outputStream.write(bytes, 0, bytes.length);
			}

			outputStream.flush();
			outputStream.close();
			if (conn!=null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public Map<String, Object> getParameters() {
		return parameters;
	}

	public void setParameters(Map<String, Object> parameters) {
		this.parameters = parameters;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Connection getConnection() {

		DataSource ds;

		try {
			ds = ServiceLocator.getInstance("java:comp/env").getDataSource("jdbc/iseg");
			conn = ds.getConnection();
		} catch (ServiceLocatorException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}