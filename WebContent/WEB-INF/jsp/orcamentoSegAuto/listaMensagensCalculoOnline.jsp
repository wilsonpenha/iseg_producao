<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<fieldset>
 	<table width="98%" border="0" cellpadding="0" cellspacing="0">
    <s:iterator value="listOfCalculoVo" status="i">
    teste<br/>
	   <s:iterator value="listaAlertas.mensagemAlertaVo" status="j">
		  <tr>
			<td>
		   		<s:property value="cdAlerta"/>
			</td>
			<td>
		   		<s:property value="dsAlerta"/>
			</td>
		  </tr>
	   </s:iterator>
    </s:iterator>
	</table>
</fieldset>

<% } catch (Exception e) {e.printStackTrace();}%>