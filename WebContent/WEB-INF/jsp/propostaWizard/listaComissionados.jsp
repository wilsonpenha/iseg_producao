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
		  <td width="30%">Nome</td>
		  <td width="25%">Tipo Repasse</td>
		  <td width="20%">Percentual Repasse</td>
		  <td width="20%">Valor Repasse</td>
		</tr>
		<s:iterator value="comissionadoPropostaList" status="stat">
		<tr style="height: 20px;">
		  <td nowrap="nowrap" class="small_image">
			<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);removerComissionado('<s:property value="id" />');}"/>
		  </td>
		  <td>
		  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].id" id="comissionadoPropostaId%{#stat.index}" cssStyle="display: none;"/>
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.id" id="comissionadoPropostaPessoaId%{#stat.index}" cssStyle="display: none;"/>
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.nome" id="comissionadoPropostaPessoaNome%{#stat.index}" cssStyle="display: none;"/>
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].proposta.id" id="comissionadoPropostaPropostaId%{#stat.index}" cssStyle="display: none;"/>
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissao" id="comissionadoPropostaComissao%{#stat.index}" cssStyle="display: none;"/>
			<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].tipoComissao" id="comissionadoPropostaTipoComissao%{#stat.index}" cssStyle="display: none;"/>
		    <s:property value="pessoa.nome"/>&nbsp;
		  </td>
		  <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
		  <td align="right"><fmt:formatNumber value="${comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
		  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
		</tr>
		</s:iterator>
		<tr style="height: 20px;">
		  <td><b>Total:</b></td>
		  <td colspan="4" align="right"><b><fmt:formatNumber value="${totalValorComissao}" type="currency" currencySymbol=""/></b></td>
		</tr>
	  </table>



<script>
</script>
<% } catch (Exception e) {e.printStackTrace();}%>