<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<s:select theme="simple" id="comboModeloVeiculo" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" name="automovel.modeloVeiculo.id" emptyOption="true"  list="modelosList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --"/>
	
