<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

<s:if test="itensSegurados != null">
<table id="tableItemSeguradoItens" class="listItens">
  <tr class="listItensHeader">
	<td width="30%">Código Identificação</td>
	<td width="30%">Modelo</td>
	<td width="30%">Número Placa</td>
	<td width="3%">X</td>
  </tr>
  <s:iterator value="itensSegurados" status="stat">
	<tr style="cursor:pointer;" onclick="window.open('${pageContext.request.contextPath}/automovel/editar.action?automovel.id=<s:property value="id"/>','','width=800,height=600,resizable=yes');">
	  <td><s:property value="codigoIdentificacao"/></td>
	  <td><s:property value="modeloVeiculo.valor"/></td>
	  <td><s:property value="nroPlaca"/></td>
	  <td>
		<input type="hidden" name="proposta.automovelCollection[<s:property value="#stat.index"/>].id" value="<s:property value="id"/>" />
		<img align="middle" alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="removeRow(tableItemSeguradoItens, this.parentNode.parentNode.rowIndex);"/>
	  </td>
	</tr>
  </s:iterator>
</table>
</s:if>
<% } catch (Exception e) {e.printStackTrace();}%>