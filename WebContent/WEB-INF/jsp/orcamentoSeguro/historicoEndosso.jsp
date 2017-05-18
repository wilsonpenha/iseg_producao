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
    
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages"id="divMessagesTab6" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		<legend><b>Histórico de Endossos e Renovações</b></legend>
		<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
			<tr height="20px" bgcolor="#A0CC84">
			<td id="" width="2%" nowrap="nowrap"><b>&nbsp;</b></td>
			<td width="5%" nowrap="nowrap"><b>Nro</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
			<td width="8%" nowrap="nowrap"><b>Ini Vig</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','1');"></td>
			<td width="28%" nowrap="nowrap"><b>Cliente</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'ad','1');"></td>
			<td width="13%" nowrap="nowrap"><b>CPF/CNPJ</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'ad','1');"></td>
			<td width="10%" nowrap="nowrap"><b>Ramo</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','1');"></td>
			<td width="15%" nowrap="nowrap"><b>Tp Endosso</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','1');"></td>
			<td width="5%" nowrap="nowrap"><b>Prop Ante</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
			<td width="15%" nowrap="nowrap"><b>Fase</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
			<td width="15%" nowrap="nowrap"><b>Situação</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
			</tr>
			<s:if test="historicoList.size > 0">
			<s:iterator value="historicoList" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr style="{cursor:pointer}" id="linha<s:property value="id"/>" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4">
				</s:if>
				<s:else>
					<tr style="{cursor:pointer}" id="linha<s:property value="id"/>" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
				</s:else>
					<td id="<s:property value="id"/>" >
						<input type="checkbox" class="checkList" name="id" value="<s:property value="id"/>">
					</td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="numero"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="inicioVigencia"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="cliente.nomeCurto"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="cliente.cpfOuCnpj"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="ramo.nome"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="tipoEndosso.nome"/></td>
					<td style="font-size: 10px;  text-align: center" id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="propostaEndossada.numero"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="getStatusOperacionalDescricao(statusOperacional)"/></td>
					<td id="<s:property value="id"/>" onClick="javascript:$('#hiPropostaId').val('<s:property value="id"/>'); editHistorico();"><s:property value="getSituacaoOperacionalDescricao(situacaoOperacional,terminoVigencia)"/></td>
				</tr>
			</s:iterator>
			</s:if>
			<s:else>
			  <tr height="20" bgcolor="#CBE3BB"><td colspan="8" style="text-align:center;font-style:italic;">Nenhum registro</td></tr>
			</s:else>
		</table>
		
	  </fieldset>
	  
<% } catch (Exception e) {e.printStackTrace();}%>