package iseg.filters;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

public class ResponseHeaderFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1L;

	boolean initialized = false;

	FilterConfig config;

	public void setFilterConfig(FilterConfig config) {
		this.config = config;
	}

	public FilterConfig getFilterConfig() {
		return config;
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpResp = (HttpServletResponse) resp;
		try {
	
			if(!initialized) {
				initialized = true;
			}

			Enumeration e = config.getInitParameterNames();
	
			while (e.hasMoreElements()) {
				
				String headerName = (String) e.nextElement();
				String headerValue = config.getInitParameter(headerName);
				httpResp.addHeader(headerName, headerValue);
			}
			
			chain.doFilter(req, resp);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

}