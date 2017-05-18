<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="condicaoPagamentoId" name="proposta.condicaoPagamento.id" 
	emptyOption="false" list="condicaoPagamentoList" listKey="id" listValue="descricao+', '+qtdeDeParcelas+' parcelas'" headerKey="" headerValue="-- Selecione --" onchange="carregaParcelas();setAlterado(true);" />
	
