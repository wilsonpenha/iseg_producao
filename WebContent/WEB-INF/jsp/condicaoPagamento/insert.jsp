<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<table width="100%" border="0">
  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
				<tr class="FieldGroup_TopMargin"></tr>
				<tr>
				  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  <td class="FieldGroupTitle_MaxSize">Condição de Pagamento</td>
				  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				</tr>
				<tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <td colspan="4">
			<div id="divMessages" style="padding-bottom: 10px;">
			  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
			</div>
		  </td>
		</tr>
		<tr>		  <td width="18%" class="TitleCell"><label class="LabelText" for="formEdit_condicaoPagamentoId">Descrição: </label></td>		  <td width="32%" class="TextBox_ContentCell">			<s:textfield theme="simple" id="formEdit_condicaoPagamento.id" name="condicaoPagamento.id" cssStyle="display:none"/>			<s:textfield theme="simple" id="formEdit_condicaoPagamento.seguradoraId" name="condicaoPagamento.seguradora.id" cssStyle="display:none"/>			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="formEdit_condicaoPagamentoId" name="condicaoPagamento.descricao" maxlength="50"/>		  </td>		  <td width="18%" class="TitleCell"><span class="LabelText">Qtde de parcelas: </span></td>		  <td width="32%" class="TextBox_ContentCell">			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="qtdeDeParcelasID" name="condicaoPagamento.qtdeDeParcelas" maxlength="22"/>		  </td>		</tr>		<tr>		  <td class="TitleCell"><span class="LabelText">Dia preferencial: </span></td>		  <td class="TextBox_ContentCell">			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="diaPreferencialID" name="condicaoPagamento.diaPreferencial" maxlength="22"/>		  </td>		  <td class="TitleCell"><span class="LabelText">Pagamento Comissão: </span></td>		  <td class="TextBox_ContentCell">			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="pagamentoComissaoId" name="condicaoPagamento.pagamentoComissao"/>		  </td>		</tr>		<tr>		  <td class="TitleCell"><span class="LabelText">Perc Acréscimo Desconto: </span></td>		  <td class="TextBox_ContentCell">			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width currency" id="formEdit_condicaoPagamento.percAcrescimoDesconto" name="condicaoPagamento.percAcrescimoDesconto" onkeypress="return formatNumber(this, event, 2, 5);" />		  </td>		  <td class="TitleCell"><span class="LabelText">Acréscimo Desconto: </span></td>		  <td class="TextBox_ContentCell">			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_condicaoPagamento.acrescimoDesconto" name="condicaoPagamento.acrescimoDesconto" maxlength="1"/>		  </td>		</tr>
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
				<tr class="FieldGroup_TopMargin"></tr>
			  	<tr>
				  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				  <td class="FieldGroupTitle">Forma de Pagamento</td>
				  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				  <td class="FieldGroupContent"></td>
			  	</tr>
			  	<tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <table width="100%" border="0" cellpadding="0" cellspacing="3">
			<tr>
			  <td width="20%" colspan="0" class="LabelText" style="text-align: center">
				<s:radio theme="simple" cssClass="dojoValidateValid" name="condicaoPagamento.tipoPagamento" list="#{0:'Dinheiro'}"/>
			  </td>
			  <td width="20%" colspan="0" class="LabelText" style="text-align: left">
				<s:radio theme="simple" cssClass="dojoValidateValid" name="condicaoPagamento.tipoPagamento" list="#{1:'Cheque'}"/>
			  </td>
			  <td width="20%" colspan="0" class="LabelText" style="text-align: left">
				<s:radio theme="simple" cssClass="dojoValidateValid" name="condicaoPagamento.tipoPagamento" list="#{2:'Boleto'}"/>
			  </td>
			  <td width="20%" colspan="0" class="LabelText" style="text-align: left">
				<s:radio theme="simple" cssClass="dojoValidateValid" name="condicaoPagamento.tipoPagamento" list="#{3:'Cart. de Crédito'}"/>
			  </td>
			  <td width="20%" colspan="0" class="LabelText" style="text-align: left">
				<s:radio theme="simple" cssClass="dojoValidateValid" name="condicaoPagamento.tipoPagamento" list="#{4:'Débito em Conta'}"/>
			  </td>
			</tr>
		  </table>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	MaskInput(document.getElementById('qtdeDeParcelasID'),"9999");
	MaskInput(document.getElementById('diaPreferencialID'),"99");
	MaskInput(document.getElementById('pagamentoComissaoId'),"9");
});
</script>

</form>
<form name="formCondPagamentoTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="condicaoPagamento.seguradora.id"/>"/>
	<input type="hidden" name="seguradora.id" value="<s:property value="condicaoPagamento.seguradora.id" />" />
	<input type="hidden" name="perfil.seguradora.id" value="<s:property value="condicaoPagamento.seguradora.id" />" />
	<input type="hidden" name="servicos.seguradora.id" value="<s:property value="condicaoPagamento.seguradora.id" />" />
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="condicaoPagamento.seguradora.id" />" />
	

