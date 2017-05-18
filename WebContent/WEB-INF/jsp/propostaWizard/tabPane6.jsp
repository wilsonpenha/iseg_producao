<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
    
     <jsp:include page="../proposta/historicoEndosso.jsp" flush="false"></jsp:include>
	
<script>

	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>