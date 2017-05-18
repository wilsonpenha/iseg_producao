<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>


  <table id="tableCoberturaItens" class="listItens">
	<tr class="listItensHeader">
	  <td width="5%">&nbsp;</td>
	  <td width="35%">Cobertura</td>
	  <td width="20%">Prêmio</td>
	  <td width="20%">LMI</td>
	  <td width="20%">Franquia</td>
	</tr>
	<s:iterator value="riscoCoberturaList" status="stat">
	<tr>
	  <td nowrap="nowrap" class="small_image">
	    <img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeRiscoCobertura('<s:property value="id"/>');}"/>
	    <img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarRiscoCobertura('<s:property value="id"/>');}"/>
	  </td>
	  <td><s:property value="cobertura"/>&nbsp;</td>
	  <td><s:property value="premio"/>&nbsp;</td>
	  <td><s:property value="lmi"/>&nbsp;</td>
	  <td><s:property value="franquia"/>&nbsp;</td>
	</tr>
	</s:iterator>
  </table>


<% } catch (Exception e) {e.printStackTrace();}%>