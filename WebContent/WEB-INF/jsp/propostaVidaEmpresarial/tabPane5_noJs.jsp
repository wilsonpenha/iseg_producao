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
  
	<div id="divForm6" style="overflow-x:hidden; overflow-y:auto; height:98%; width:100%">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab4" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="P"><b>Histórico de Parcelas Geradas</b></legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td colspan="5">
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupTitle">Resumo Parcelas</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
				  <div id="divParcelas">
				  	  <table id="tableParcelas" class="listItens"> 
						<tr class="listItensHeader">
							<td width="10%">Referência</td>
							<td width="12%">Prêmio Líquido</td>
							<td width="12%">IOF</td>
							<td width="12%">Prêmio Total</td>
							<td width="12%">Vencimento</td>
							<td width="12%">Nro Fatura</td>
							<td width="12%">Código Operação</td>
						</tr>
						<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
						<s:if test="referenciaParcela <= proposta.referenciaParcela">
							<tr>
								<td>
									<s:property value="referenciaParcela"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="valorParcela"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="iof"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="premioTotal"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:property value="vencimento"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:property value="nroDocumento"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:property value="percentualComissao"/>
								</td>
							</tr>
						</s:if>
						</s:iterator>
						<s:if test="proposta.parcelasPropostaCollection.isEmpty()">
						  <tr class="emptyRow"><td colspan="7">Vazio</td></tr></s:if>
					  </table>

				  </div>
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  </table>
	</div>
  	
<% } catch (Exception e) {e.printStackTrace();}%>