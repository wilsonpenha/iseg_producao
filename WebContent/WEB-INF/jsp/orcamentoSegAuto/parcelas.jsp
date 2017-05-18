<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
	<tr class="listItensHeader">
		<td colspan="2" width="25%">
			Debito em Conta
		</td>
		<td colspan="2" width="25%">
			Carnê
		</td>
		<td colspan="2" width="25%">
			Cartão de Crédito
		</td>
		<td colspan="2" width="25%">
			Cheque Pré-Datado
		</td>
	</tr>
	<s:iterator value="parcelasOrcamentoList" status="i">
		<tr style="display:none;">
			<td>
				<s:textfield style="display:none" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].orcamentoFranquias.id" value="%{parcelasOrcamentoList[#i.index].orcamentoFranquias.id}"/>
				<s:textfield style="display:none" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].qtdParcelas" value="%{#i.index+1}"/>
			</td>
		</tr>
		<tr>
			<td><s:property value="%{#i.index+1}"/>x</td>
			<td>
				<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaDebito" value="%{parcelasOrcamentoList[#i.index].valorParcelaDebito}"/>
			</td>
			<td><s:property value="%{#i.index+1}"/>x</td>
			<td>
				<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCarne" value="%{parcelasOrcamentoList[#i.index].valorParcelaCarne}"/>
			</td>
			<td><s:property value="%{#i.index+1}"/>x</td>
			<td>
				<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCredito" value="%{parcelasOrcamentoList[#i.index].valorParcelaCredito}"/>
			</td>
			<td><s:property value="%{#i.index+1}"/>x</td>
			<td>
				<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{itemCorrente}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCheque" value="%{parcelasOrcamentoList[#i.index].valorParcelaCheque}"/>
			</td>
		</tr>
	</s:iterator>
	<script>
		$().ready(function() {
		    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
		 });
	</script>
<% } catch (Exception e) {e.printStackTrace();}%>