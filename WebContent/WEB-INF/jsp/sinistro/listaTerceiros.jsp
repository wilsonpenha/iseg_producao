<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

	<table id="tableTerceirosItens" class="listItens">
	  <tr class="listItensHeader">
		<td width="8%" nowrap="nowrap">Ações</td>
		<td width="40%" nowrap="nowrap">Nome</td>
		<td width="22%" nowrap="nowrap">CPF</td>
		<td width="30%" nowrap="nowrap">Veículo</td>
	  </tr>
	  <s:iterator value="terceiroEnvolvidoList" status="stat">
		<tr id="rowTerceiroEnvolvido<s:property value="#stat.index"/>" title="<s:url value="/sinistro/showDadosTerceiroEnvolvido?terceiroEnvolvido.id=" includeParams="none"/><s:property value="id"/>">
		  <td nowrap="nowrap" class="small_image">
			<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeTerceiroEnvolvido('<s:property value="id"/>');}"/>
			<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarTerceiroEnvolvido('<s:property value="id"/>');}"/>
		  </td>
		  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
		  <td nowrap="nowrap"><s:property value="cpfOuCnpj"/>&nbsp;</td>
		  <td nowrap="nowrap"><s:property value="veiculoEnvolvido"/>&nbsp;</td>
		</tr>
	  </s:iterator>
	  <s:if test="terceiroEnvolvidoList.isEmpty()"><tr><td colspan="4" style="text-align: center;"><i>Vazio</i></td></tr></s:if>
	</table>

<script language="javascript">

$('#tableTerceirosItens tr').filter('[id^="rowTerceiroEnvolvido"]').tooltip({ 
	track: true, 
	delay: 0, 
	showURL: false, 
	opacity: 1, 
	fixPNG: true, 
	showBody: " - ", 
	extraClass: "fancy", 
	top: -15, 
	left: 5 
});

</script>
<% } catch (Exception e) {e.printStackTrace();}%>