<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    
try {
%>


  <table id="tableParcelas" class="listItens"> 
	<tr class="listItensHeader">
		<td width="10%">Parcela</td>
		<td width="10%">Banco</td>
		<td width="10%">Agência</td>
		<td width="10%">Nro Conta</td>
		<td width="15%">Nro Cheque</td>
		<td width="15%">Valor</td>
		<td width="15%">Vencimento</td>
		<td width="15%">Nro Documento</td>
	</tr>
	<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
		<tr>
			<td>
				<s:property value="nroParcela"/>
				<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].id" theme="simple" cssStyle="display:none;"/>
				<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].nroParcela" theme="simple" cssStyle="display:none;"/>
				<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].proposta.id" theme="simple" cssStyle="display:none;"/>
			</td>
			<td align="right">
			  <s:textfield id="banco%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroBanco" cssStyle="width:100%;" theme="simple" />
			</td>
			<td align="right">
			  <s:textfield id="agencia%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].codigoAgencia" cssStyle="width:100%;" theme="simple" />
			</td>
			<td align="right">
			  <s:textfield id="nroConta%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].contaCorrente" cssStyle="width:100%;" theme="simple" />
			</td>
			<td align="right">
			  <s:textfield id="nroCheque%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroCheque" cssStyle="width:100%;" theme="simple" />
			</td>
			<td align="right">
			  <s:textfield id="valorParcela%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].valorParcela" cssClass="clValor2" cssStyle="width:100%;text-align:right;" theme="simple"/>
			</td>
			<td align="right">
			  <s:textfield id="vencimento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].vencimento" cssClass="clData" cssStyle="width:100%;" theme="simple" size="10" maxlength="10" onblur="isValidDate(this)" />
			</td>
			<td align="right">
			  <s:textfield id="nroDocumento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroDocumento" cssStyle="width:100%;" theme="simple" maxlength="100"/>
			</td>
		</tr>
	</s:iterator>
	<s:if test="proposta.parcelasPropostaCollection.isEmpty()"><tr class="emptyRow"><td colspan="4">Vazio</td></tr></s:if>
  </table>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
 	//$('.clTextoRestrito').bestupper({semPontuacao : true});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    //$(".clValor").setMask({mask : '99',defaultValue:"0"});
 	
 })

</script>
	
<% } catch (Exception e) {e.printStackTrace();}%>