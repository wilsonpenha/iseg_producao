<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>
				<div id="divListaComissoes">
				  <table>
				    <tr>
					  <td colspan="4">
					    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 2px;">
					  	  <s:actionerror/>
						  <s:actionmessage/>
						  <s:fielderror/>
					    </div>
					  </td>
				    </tr>
				  </table>
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="10%">Tipo</td>
					  <td width="15%">Ramo</td>
					  <td width="5%">Apólice</td>
					  <td width="25%">Segurado</td>
					  <td width="5%">Parc</td>
					  <td width="8%">Prêmio</td>
					  <td width="8%">% Comissão</td>
					  <td width="8%">Comissão</td>
					  <td width="8%">Situação</td>
					</tr>
					<s:iterator value="borderoLancamentoList" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].id" id="borderoLancamentoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].proposta.id" id="propostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].borderoComissao.id" id="borderoComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].ramo.id" id="ramoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].ramo.subRamo.id" id="ramoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroApolice" id="nroApolice%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nomeSegurado" id="nomeSegurado%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroParcela" id="nroParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].referenciaParcela" id="referenciaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].premioLiquido" id="premioLiquido%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].percentualComissao" id="percentualComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].valorComissao" id="valorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].sequencia" id="sequencia%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].situacao" id="situacao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].tipoLancamento.id" id="tipoLancamento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].dataLancamento" id="dataLancamento%{#stat.index}" cssStyle="display: none;"/>
						<s:if test="situacao < 2">
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeLancamento('<s:property value="id"/>');}"/>
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarLancamento('<s:property value="id"/>');}"/>
						</s:if>
						<s:if test="%{proposta == null}">
							<img alt="Referenciar a uma proposta" title="Referenciar a uma proposta" style="cursor:pointer;width: 26px;" src="<s:url value="/common/web/images/link.png" includeParams="none"/>" onclick="abrirModal('<s:property value="id"/>');"/>
						</s:if>
						<s:else>
							<img alt="Referenciar a uma proposta" title="Referenciar a uma proposta" style="width: 26px;" src="<s:url value="/common/web/images/link-disable.png" includeParams="none"/>"/>
						</s:else>
					  </td>
					  <td><s:property value="tipoLancamento.nome"/>&nbsp;</td>
					  <td ><s:property value="ramo.nomeRamoSubRamo"/>&nbsp;</td>
					  <td ><s:property value="nroApolice"/>&nbsp;</td>
					  <td ><s:property value="nomeSegurado"/>&nbsp;</td>
					  <s:if test="ramo.id==5 || ramo.subRamo.id=10">
						  <td align="center"><fmt:formatDate value="${referenciaParcela}" pattern="MM/yyyy"/></td>
					  </s:if>
					  <s:else>
						  <td align="right"><s:property value="nroParcela"/>&nbsp;</td>
					  </s:else>
					  <td align="right"><fmt:formatNumber value="${premioLiquido}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${percentualComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td ><s:property value="situacaoDesc"/>&nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>

<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>

<script>
$().ready(function() {

	$('#totalParcial').val('<s:property value="totalParcial"/>');
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    $(".clParcelaReferencia").setMask({mask : '19/9999', autoTab: false});
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"-000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});

})
</script>
<% } catch (Exception e) {e.printStackTrace();}%>