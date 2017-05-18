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
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="10%">Vencimento</td>
					  <td width="15%">Parcela</td>
					  <td width="15%">Valor a Receber</td>
					  <td width="15%">Valor Recebido</td>
					  <td width="25%">Seguradora</td>
					  <td width="10%">Situação</td>
					</tr>
					<s:iterator value="proposta.propostaComissaoCollection" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].id" id="propostaComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].nroDaParcela" id="propostaComissaonroDaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].dataVencimento" id="propostaComissaoDataVencimento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].valorComissao" id="propostaComissaoValorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].valorPagamento" id="propostaComissaoValorPagamento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].situacao" id="propostaComissaoSituacao%{#stat.index}" cssStyle="display: none;"/>
    					 <s:if test="%{situacao < 2 }">
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" 
							onclick="editarComissao($('#propostaComissaoId${stat.index}').val(), $('#propostaComissaonroDaParcela${stat.index}').val(), $('#propostaComissaoDataVencimento${stat.index}').val(), $('#propostaComissaoValorComissao${stat.index}').val(), $('#propostaComissaoSituacao${stat.index}').val(), $('#propostaComissaoValorPagamento${stat.index}').val())"/>
						</s:if>
					  </td>
					  <td align="right"><s:property value="dataVencimento"/>&nbsp;</td>
					  <td align="right"><s:property value="nroDaParcela"/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorPagamento}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><s:property value="proposta.seguradora.nome"/>&nbsp;</td>
					  <td align="right">
					     <s:if test="%{situacao == 0}">Em aberto</s:if>
    					 <s:elseif test="%{situacao == 1}">Baixa parcial</s:elseif>
    					 <s:elseif test="%{situacao == 2}">Baixado</s:elseif>
					     &nbsp;</td>
					</tr>
					</s:iterator>
				  </table>

<% } catch (Exception e) {e.printStackTrace();}%>