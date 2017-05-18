<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<img align="middle" src='${pageContext.request.contextPath}/proposta/mostrarAnexo.action?propostaAnexo.id=<s:property value="propostaAnexo.id"/>' border="0" />

<% } catch (Exception e) {e.printStackTrace();}%>