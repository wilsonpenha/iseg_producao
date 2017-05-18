<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>
	<table id="tableComissoesItens" class="listItens">
		<tr class="listItensHeader">
			<td width="50%">Pessoa</td>
			<td width="5%">PC</td>
			<td width="15%">Valor R$</td>
			<td width="15%">Resto R$</td>
			<td width="15%">Vencimento</td>
		</tr>
		<s:iterator value="propostaComissaoList" status="stat">
			<tr>
				<td><s:property value="pessoa.nome"/>&nbsp;</td>
				<td><s:property value="nroDaParcela"/>&nbsp;</td>
				<td><s:property value="valorComissao"/>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</s:iterator>
	</table>
<% } catch (Exception e) {e.printStackTrace();}%>