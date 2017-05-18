<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    
try {
%>
<s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="ramoId" name="ramo.id" list="ramos" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />	
<% } catch (Exception e) {e.printStackTrace();}%>