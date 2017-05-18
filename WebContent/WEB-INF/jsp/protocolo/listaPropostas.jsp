<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" href="<s:url value="/common/jquery.tooltip.css" includeParams="none"/>" />
<script language="javascript" src="<s:url value="/common/jquery.tooltip.js?v=0" includeParams="none"/>"></script>
<script type="text/javascript">
var linhas = "";
var count = 0;
</script>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

  <form id="paramFormProposta" name="paramFormProposta">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
    <s:textfield theme="simple" id="itensProtocoloId" name="protocolo.id" cssStyle="display:none"/>
    <s:textfield theme="simple" id="tipoDocumentoProposta" name="protocoloItens.tipoDocumento.id" cssStyle="display:none"/>
  
	<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr height="20px" bgcolor="#A0CC84">
		<td id="" width="2%" nowrap="nowrap"><b>&nbsp;</b></td>
		<td width="5%" nowrap="nowrap"><b>Loc.</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
		<td width="8%" nowrap="nowrap"><b>I Vigência</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','1');"></td>
		<td width="42%" nowrap="nowrap"><b>Cliente</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'ad','1');"></td>
		<td width="14%" nowrap="nowrap"><b>CPF/CNPJ</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'ad','1');"></td>
		<td width="10%" nowrap="nowrap"><b>Ramo</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','1');"></td>
		<td width="13%" nowrap="nowrap"><b>Fase</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
		<td width="8%" nowrap="nowrap"><b>Situação</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
		</tr>
		<s:if test="propostas.size > 0">
		<s:iterator value="propostas" status="rowstatus">
			<s:if test="#rowstatus.odd == true">
			  <tr class="tablerow0" title="<s:url value="/proposta/getProposta?proposta.id=" includeParams="none"/><s:property value="id"/>" style="{cursor:pointer;}" id="linha<s:property value="id"/>" >
			</s:if>
			<s:else> 
			  <tr class="tablerow1" title="<s:url value="/proposta/getProposta?proposta.id=" includeParams="none"/><s:property value="id"/>" style="{cursor:pointer;}" id="linha<s:property value="id"/>" >
			</s:else>
	
				<td id="<s:property value="id"/>" >
					<input type="checkbox" class="checkList" id="propostaIds" name="propostaIds" value="<s:property value="id"/>">
				</td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="numero"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="inicioVigencia"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="clienteNome"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="cpfOuCnpj"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();" nowrap="nowrap"><s:property value="ramo.nome"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="getStatusOperacionalDescricao(statusOperacional)"/></td>
				<td id="<s:property value="id"/>" onClick="javascript:$('#propostaId').val('<s:property value="id"/>'); editRecord();"><s:property value="getSituacaoOperacionalDescricao(situacaoOperacional,terminoVigencia)"/></td>
				<script type="text/javascript">
				linhas = linhas+'#linha<s:property value="id"/>,';
				count = count + 1;
				</script>
			</tr>
		</s:iterator>
		</s:if>
		<s:else>
		  <tr height="20" bgcolor="#CBE3BB"><td colspan="8" style="text-align:center;font-style:italic;">Nenhum registro</td></tr>
		</s:else>
	</table>
  </form>

<% } catch (Exception e) {e.printStackTrace();}%>