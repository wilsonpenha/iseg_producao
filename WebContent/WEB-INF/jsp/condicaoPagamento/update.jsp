<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" type="text/css" href="../common/web/skins/Default/Main/Main_Edition.css" id="paramCSS"></link>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<table width="100%" border="0">
  <tr>
    <td>
      <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
	<tr>
	  <td colspan="6">
            <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr class="FieldGroup_TopMargin"></tr>
              <tr>
                <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="../common/web/images/blank.gif" border="0"></td>
                <td class="FieldGroupTitle_MaxSize">Proposta</td>
                <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="../common/web/images/blank.gif" border="0"></td>
              </tr>
              <tr class="FieldGroup_BottomMargin"></tr>
              </tbody>
            </table>
          </td>
	</tr>
	<tr>
		<td colspan="4">
			<div id="divMessages"></div>
		</td>
	</tr>
	         <tr>
            
             <!-- inicio -->
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
            <!-- final -->
          
   			<tr>
			<table width="100%" border="0" cellpadding="0" cellspacing="3">
			<tr>
				<!--td width="16%" class="TitleCell" style="text-align: right"><span class="LabelText">Tipo do Pagamento : </span></td-->
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