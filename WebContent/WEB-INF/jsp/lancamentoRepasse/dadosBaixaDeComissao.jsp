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
					  <td width="18%">Parcela</td>
					  <td width="12%">Valor Lançado</td>
					  <td width="8%">Natureza</td>
					  <td width="30%">Seguradora</td>
					</tr>
					<s:iterator value="proposta.propostaComissaoCollection" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].id" id="propostaComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].nroDaParcela" id="propostaComissaonroDaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].dataVencimento" id="propostaComissaoDataVencimento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].valorComissao" id="propostaComissaoValorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].natureza" id="propostaComissaoSituacao%{#stat.index}" cssStyle="display: none;"/>
					  </td>
					  <td align="right"><s:property value="dataVencimento"/>&nbsp;</td>
					  <td align="center"><s:property value="nroDaParcela"/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right">
					     <s:if test="%{natureza == 0}">COMISSAO</s:if>
    					 <s:elseif test="%{natureza == 1}">BAIXA</s:elseif>
    					 <s:elseif test="%{natureza == 2}">ESTORNO</s:elseif>
					     &nbsp;</td>
					  <td><s:property value="proposta.seguradora.nome"/>&nbsp;</td>
					</tr>
					</s:iterator>
					<tr height="20px" bgcolor="#A0CC84">
					  <td colspan="2" >&nbsp;</td>
					  <td><b>Saldo de Comissões:</b></td>
					  <td align="right"><b><fmt:formatNumber value="${totalValorComissao}" type="currency" currencySymbol=""/></b>&nbsp;</td>
					  <td colspan="2" >&nbsp;</td>
					</tr>
				  </table>

<% } catch (Exception e) {e.printStackTrace();}%>