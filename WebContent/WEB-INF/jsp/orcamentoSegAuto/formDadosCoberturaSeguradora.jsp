<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr style="display:none;">
		<td>
			<s:textfield style="display:none" name="orcamentoSeguradora.id" id="paramOrcamentoSeguradoraCob"/>
		</td>
	</tr>
	<tr>
		<td>
			<label>Cobertura</label><br />
			<s:select headerKey="" headerValue="-- Selecione --" list="coberturasList" name="orcamentoCobertura.coberturas.id" listKey="id" listValue="descricao" cssClass="Combo_OneCell_width" />
		</td>
		<td>
			<label>Percentual/LMI</label><br />
			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoCobertura.lmi" size="14" maxlength="14"/>
		</td>
		<td valign="top">
			<label class="LabelText" for="fator">Franquia</label><br />
			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoCobertura.franquia" size="14" maxlength="14"/>
		</td>
	</tr>
	<tr>
		<td>
			<label>Observações</label><br />
			<s:textfield theme="simple" name="orcamentoCobertura.textoFranquia"/>
		</td>
		<td>
			<label>Premio Líquido</label><br />
			<s:textfield theme="simple" name="orcamentoCobertura.premio" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
		</td>
	</tr>
</table>
<script>
  	 $().ready(function() {
  	 	$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
  	 });
</script>