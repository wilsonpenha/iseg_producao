package iseg.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.struts2.dispatcher.Dispatcher;

import com.opensymphony.xwork2.conversion.impl.XWorkConverter;

public class StrutsConversionBugFilter implements Filter {

	boolean initialized = false;

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		if(!initialized) {
			initXWorkConverter();
			initialized = true;
		}

		filterChain.doFilter(request, response);
	}

	public void initXWorkConverter() throws ServletException {
		try {
			XWorkConverter xworkConverter = Dispatcher.getInstance().getContainer().getInstance(XWorkConverter.class);
			xworkConverter.loadConversionProperties("xwork-conversion-hack.properties");
		} catch(Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {} 
}