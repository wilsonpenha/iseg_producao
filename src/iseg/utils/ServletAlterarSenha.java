package iseg.utils;

import iseg.app.business.PropostaService;
import iseg.app.model.Usuario;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @version -	1.0
 * @author - Wilson M. da Penha Jr.
 * @Date  - 05/13/2005
 * 
 * @Description - Servlet to builder the reports files from JasperReport feature.  
 */
@Service
public class ServletAlterarSenha extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1L;

	String cnpjLogin;
	String nomeLogin;
	String senhaAtual;
	String novaSenha;
	String confirmaSenha;
	
	String statusAlterarSenha;

	@Autowired 
	private PropostaService service;
	
	public void init(ServletConfig config) throws ServletException {
		this.service = (PropostaService)config.getServletContext().getAttribute("service");
	}
	
	/**
	 * @see 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = null;
		try {
			String nomeLogin = request.getParameter("nomeLogin");
			String senhaAtual = request.getParameter("senhaAtual");
			String novaSenha = request.getParameter("novaSenha");
			String confirmaSenha = request.getParameter("confirmaSenha");
			
			if (nomeLogin==null || senhaAtual==null || novaSenha==null || confirmaSenha==null)
				response.sendRedirect("/login/doLogin.action?target=blank");
			
			String userName = nomeLogin.substring(0,nomeLogin.indexOf("@"));
			String cnpj = nomeLogin.substring(nomeLogin.indexOf("@")+1);

			usuario = this.service.genericFindFirstResultByNamedQueryWithoutApplyFilter("getUsuarioByNomeLogin", new Object[] { userName, cnpj });
			
			if (usuario==null){
				this.statusAlterarSenha = "Usuário inválido!";
			}
				
			if (!usuario.getSenha().equals(senhaAtual)){
				this.statusAlterarSenha = "Senha atual inválida!";
			}
			if (!novaSenha.equals(confirmaSenha)){
				this.statusAlterarSenha = "Nova senha não confere!";
			}
			
			usuario.setSenha(novaSenha.toUpperCase());
			this.service.save(usuario);
			this.statusAlterarSenha = "*** Senha alterada com sucesso! ***";
			response.setContentType("text/html");
		    PrintWriter out = response.getWriter();

		    out.println(this.statusAlterarSenha);
		} catch (Exception e) {      
			throw new ServletException(e);   
		}
		
	}

	public PropostaService getService() {
		return service;
	}

	@Autowired 
	public void setService(PropostaService service) {
		this.service = service;
	}

	public String getCnpjLogin() {
		return cnpjLogin;
	}

	public void setCnpjLogin(String cnpjLogin) {
		this.cnpjLogin = cnpjLogin;
	}

	public String getNomeLogin() {
		return nomeLogin;
	}

	public void setNomeLogin(String nomeLogin) {
		this.nomeLogin = nomeLogin;
	}

	public String getSenhaAtual() {
		return senhaAtual;
	}

	public void setSenhaAtual(String senhaAtual) {
		this.senhaAtual = senhaAtual;
	}

	public String getNovaSenha() {
		return novaSenha;
	}

	public void setNovaSenha(String novaSenha) {
		this.novaSenha = novaSenha;
	}

	public String getConfirmaSenha() {
		return confirmaSenha;
	}

	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}

	public String getStatusAlterarSenha() {
		return statusAlterarSenha;
	}

	public void setStatusAlterarSenha(String statusAlterarSenha) {
		this.statusAlterarSenha = statusAlterarSenha;
	}

}
