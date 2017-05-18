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


				  <table id="tableParcelas" class="listItens"> 
						<tr class="listItensHeader">
							<td width="10%">Refer</td>
							<td width="8%">Prêmio Líq</td>
							<td width="8%">Cust Apólice</td>
							<td width="8%">Prêmio Tot</td>
							<td width="7%">Nro Fat</td>
							<td width="7%">Vencim</td>
							<td width="5%">% Comiss</td>
							<td width="8%">Comissão</td>
							<td width="8%">Repasse</td>
						</tr>
						<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
						<s:if test="referenciaParcela >= proposta.referenciaParcela">
							<tr>
								<td>
									<s:property value="referencia"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].id" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].referenciaParcela" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].proposta.id" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].desconto" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].grupoDeVenda.id" id="grupoDeVendaId_%{id}" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].baseCalculoComissao" theme="simple" cssStyle="display:none;"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].valorParcela" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].custoApolice" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].premioTotal" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].nroDocumento" theme="simple" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="vencimento%{#stat.index}" tabindex="10%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].vencimento" theme="simple" size="9" maxlength="10" onblur="isValidDate(this)" cssClass="clData"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="nroDocumento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].percentualComissao" cssClass="clValor2 currency" theme="simple" size="10" maxlength="15" />
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="percentualComissao%{#stat.index}" tabindex="10%{#stat.index+12}" name="proposta.parcelasPropostaCollection[%{#stat.index}].valorComissao" theme="simple"  size="8" readonly="true" cssClass="clValor2 currency" onchange="setAlterado(true);"/>
								</td>
								<td align="center" style="padding-right: 2px;">
								  <input title="Referência: <fmt:formatDate value="${referenciaParcela}" pattern="MM/yyyy"/>" class="button" type="button" name="repasse" value="Repasse" onclick="abrirDivRepasse('<s:property value="referenciaParcela"/>','<s:property value="id"/>','<s:property value="id"/>');"> 
								</td>
							</tr>
						</s:if>
						</s:iterator>
						<s:if test="proposta.parcelasPropostaCollection.isEmpty()"><tr class="emptyRow"><td colspan="12">Vazio</td></tr></s:if>
					  </table>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
 	//$('.clTextoRestrito').bestupper({semPontuacao : true});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',defaultValue:"0"});
 	
 })

</script>
	
<% } catch (Exception e) {e.printStackTrace();}%>