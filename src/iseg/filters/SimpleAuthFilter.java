package iseg.filters;

import iseg.app.model.Corretora;
import iseg.app.model.SessionLog;
import iseg.app.smsagent.SMSAgente;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;


public class SimpleAuthFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		RequestWrapper wrapper=new RequestWrapper((HttpServletRequest)request);
		String user = wrapper.getRemoteUser();
		String ip = wrapper.getRemoteIP();
		
		HttpSession session = wrapper.getSession(); 
		HttpServletResponse localResp = (HttpServletResponse)response;
		
		boolean usuarioAutenticado = (wrapper.getSession().getAttribute("user")!=null);
		Integer accessCount = (Integer)wrapper.getSession().getAttribute("accessCount");

		if (accessCount==null){
			wrapper.getSession().setAttribute("accessCount", new Integer(1));
			accessCount=1;
		}else{
			accessCount++;
			wrapper.getSession().setAttribute("accessCount", accessCount);
		}
			

		Corretora associado = (Corretora)wrapper.getSession().getAttribute("corretoraEmUso");

		if (!usuarioAutenticado){
			SessionLog sessionObj = (SessionLog)SMSAgente.sessionControl.get(user);
			String sessionID = null;
			if (sessionObj!=null)
				sessionID = sessionObj.getSessionId();
			
			String currentSessionID = session.getId();

			SessionLog sessionLog = new SessionLog();
			sessionLog.setUsuarioId(user);
			sessionLog.setSessionId(currentSessionID);
			sessionLog.setHoraLogin(session.getCreationTime());
			sessionLog.setUltimoRequest(session.getLastAccessedTime());
			if (associado!=null){
				sessionLog.setCorretoraId(associado.getId());
				sessionLog.setAssessoriaId(associado.getAssessoriaId());
			}
			sessionLog.setQueryStr(wrapper.getRequestURL().toString());
			
			if (sessionID!=null){
				if (!currentSessionID.equals(sessionID)){
					SMSAgente.sessionControl.remove(user);
					SMSAgente.sessionControl.put(user,sessionLog);
				}
			}else{
				SMSAgente.sessionControl.put(user,sessionLog);
			}
		}else{
			SessionLog sessionObj = (SessionLog)SMSAgente.sessionControl.get(user);
			String sessionID = null;
			if (sessionObj!=null)
				sessionID = sessionObj.getSessionId();

			String currentSessionID = session.getId();
			if (sessionID!=null){
				if (!currentSessionID.equals(sessionID)){
					session.invalidate();
					user=null;
				}else{
					SessionLog sessionLog = new SessionLog();
					sessionLog.setUsuarioId(user);
					sessionLog.setSessionId(currentSessionID);
					sessionLog.setHoraLogin(session.getCreationTime());
					sessionLog.setUltimoRequest(session.getLastAccessedTime());
					if (associado!=null){
						sessionLog.setCorretoraId(associado.getId());
						sessionLog.setAssessoriaId(associado.getAssessoriaId());
					}
					sessionLog.setQueryStr(wrapper.getRequestURL().toString());
					
					SMSAgente.sessionControl.put(user,sessionLog);
				}
			}else{
				SessionLog sessionLog = new SessionLog();
				sessionLog.setUsuarioId(user);
				sessionLog.setSessionId(currentSessionID);
				sessionLog.setHoraLogin(session.getCreationTime());
				sessionLog.setUltimoRequest(session.getLastAccessedTime());
				if (associado!=null){
					sessionLog.setCorretoraId(associado.getId());
					sessionLog.setAssessoriaId(associado.getAssessoriaId());
				}
				sessionLog.setQueryStr(wrapper.getRequestURL().toString());
				
				SMSAgente.sessionControl.put(user,sessionLog);
			}
		}
		
		String paramAssociadoId = (String)wrapper.getParameter("associadoId");
		Long associadoEmUso = (paramAssociadoId!=null && !paramAssociadoId.equals("null") && !paramAssociadoId.equals("")) ? new Long((String)wrapper.getParameter("associadoId")) : null;
		
		if (associado!=null)
			wrapper.setAttribute("associadoId", associado.getId());
			
		if ((associado!=null && associadoEmUso!=null) && accessCount.intValue()>3){
			if (!associado.getId().equals(associadoEmUso)){
				session.invalidate();
				user=null;
			}
		}
			
		wrapper.getSession().setAttribute("user", user);
		wrapper.getSession().setAttribute("userIp", ip);
		wrapper.getSession().setAttribute("session", session);
		
		if (user==null || (wrapper.getRequestURI().indexOf("showLogin")>=0 && user==null)){
			String URL = wrapper.getRequestURL().toString();
			String protocol = URL.substring(0,URL.indexOf(":"));
			localResp.sendRedirect(this.getRedirUrl(wrapper, protocol, "/forceLogout.jsp"));
		}else
			chain.doFilter(wrapper, response);
    }

    public void destroy() {
    }

	public String getRedirUrl(HttpServletRequest request, String protocol, String namespace) {
		StringBuffer redirUrl = new StringBuffer();
		redirUrl.append(protocol);
		redirUrl.append("://");
		redirUrl.append(request.getServerName());
		redirUrl.append(":"+request.getServerPort());
		redirUrl.append(request.getContextPath());
		redirUrl.append(namespace);
		if (request.getQueryString() != null) {
			redirUrl.append("?");
			redirUrl.append(request.getQueryString());
		}
		return redirUrl.toString();
	}

   class RequestWrapper extends HttpServletRequestWrapper {
        private String remoteUser=null;
        private String remoteIP=null;

        public RequestWrapper(HttpServletRequest req) {
            super(req);
    	    this.remoteUser = req.getRemoteUser();
    	    this.remoteIP = req.getRemoteAddr();
        }

        public void setRemoteUser(String user) {
            remoteUser=user;
        }

        public String getRemoteUser() {
            return remoteUser;
        }

		public String getRemoteIP() {
			return remoteIP;
		}
		
		public void setRemoteIP(String remoteIP) {
			this.remoteIP = remoteIP;
		}

   }

   class ResponseWrapper extends HttpServletResponseWrapper {
       public ResponseWrapper(HttpServletResponse response) {
    	   super(response);
       }
   }

} 