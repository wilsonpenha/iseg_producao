<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

		<fieldset style="margin-left: 0; margin-bottom: 1; margin-right: 4">
		<legend><b>Repasse de Comissões</b></legend>
		<div id="divRepasseComissao">
			<jsp:include page="dadosRepasseComissao.jsp" flush="false"></jsp:include>
		</div>
		</fieldset>
		
<% } catch (Exception e) {e.printStackTrace();}%>