<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<s:select theme="simple" id="comboVistoriadora" name="proposta.vistoriadora.id" headerKey="" headerValue="-- Selecione --" list="vistoriadorasList" listKey="id" listValue="nome" onchange="setAlterado(true);"/>
 ou <s:textfield theme="simple" id="propostaNomeVistoriadora" name="proposta.nomeVistoriadora" size="40" maxlength="40" onchange="setAlterado(true);"/>
	
