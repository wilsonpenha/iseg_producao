package iseg.app.smsagent;

import iseg.app.business.SmsEventosCorretoraService;

import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.ServletContextAware;


public class SMSAgenteEventos extends HttpServlet implements ServletContextAware {


		private static final long serialVersionUID = 1L;
	    private static Log log = LogFactory.getLog(SMSAgenteEventos.class.getName());

	    public static Map sessionControl = new Hashtable<String, Object>();
	    
	    private Machine machine;
	    private ServletContext servletContext;
	    private int timeout = 86400000;
	    private SmsEventosCorretoraService service;
	    
		/**
		* @see javax.servlet.GenericServlet#void ()
		*/
		public void destroy() {
	        log.info("Servlet destroyed");
		}
		
		public void init() throws ServletException{
	        log.info("Servlet created");
			try{
			    log.info("Iniciando Agente Eventos SMS : "+this.servletContext.getContextPath());
	            machine= new Machine(this.service, this.servletContext.getContextPath(), this.servletContext.getRealPath("/WEB-INF"));
			    this.machine.start();
			}
			catch(Exception ex){
			    ex.printStackTrace();
			}
		}

		/**
		* @see javax.servlet.http.HttpServlet#void (javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
		*/
		public SMSAgenteEventos(SmsEventosCorretoraService service) {
			this.service = service;
		}
		
		class Machine extends Thread{

		    private int cont = 0;
		    private boolean error = false;
		    private Map session;
		    private SmsEventosCorretoraService service;
		    private String contextPath;
		    private String realPath;
		    int intervalo = 1;
		    
		    public Machine(SmsEventosCorretoraService service, String contextPath, String realPath) {
				this.service = service;
				this.contextPath = contextPath.replaceAll("/", "");
				this.realPath = realPath;
				
			}
			public void run(){
				try{
					while (true){
				        Thread.sleep(timeout);
				        try{
				        	this.service.agenteDeEventosSms();
				        }catch (Exception e) {
							e.printStackTrace();
						}
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
	    	}
		}


		public void setServletContext(ServletContext context) {
			this.servletContext = context;
		}
		

		public void setTimeout(int timeout){
			this.timeout = timeout;
		}
	}