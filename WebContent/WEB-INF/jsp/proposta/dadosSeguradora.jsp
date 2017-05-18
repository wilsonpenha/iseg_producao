<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>
	<label for="seguradoraId">Seguradora</label><br />
	<s:textfield theme="simple" id="seguradoraId" name="proposta.seguradora.id" cssStyle="display:none;" />
	<s:textfield theme="simple" size="50" id="seguradoraNome" name="proposta.seguradora.nome" cssClass="readonly" readonly="true" tabindex="-1" />

<% } catch (Exception e) {e.printStackTrace();}%>