package iseg.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class ResponseNoCacheFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1L;

	boolean initialized = false;

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		if(!initialized) {
			initialized = true;
		}

		chain.doFilter(req, resp);
	}

	public void init(FilterConfig config) throws ServletException {
	}

}