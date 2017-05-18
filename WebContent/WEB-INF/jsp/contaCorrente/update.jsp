<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:textfield theme="simple" id="formEdit_contaCorrente.pessoaId" name="contaCorrente.pessoa.id" cssStyle="display:none" />

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
                <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
                <td class="FieldGroupTitle_MaxSize">Conta Corrente</td>
                <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
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
     	<tr>
          <td width="18%" class="TitleCell"><label class="LabelText" for="bancoId">Nro Banco: </label></td>
          <td width="32%" class="Combo_ContentCell">
            <s:textfield theme="simple" id="formEdit_contaCorrente.id" name="contaCorrente.id" cssStyle="display:none"/>
            <s:textfield theme="simple" cssClass="requiredField" id="nroBanco" name="contaCorrente.nroBanco" maxlength="5" size="5"/>
          </td>
          <td width="18%" class="TitleCell">&nbsp;</td>
          <td width="32%" class="TextBox_ContentCell">
            &nbsp;
          </td>
        </tr>
     	<tr>
          <td width="18%" class="TitleCell"><label class="LabelText" for="bancoId">Nome Banco: </label></td>
          <td width="32%" class="Combo_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomeBanco" name="contaCorrente.nomeBanco" maxlength="40"/>
          </td>
          <td width="18%" class="TitleCell"><label class="LabelText" for="codigoAgenciaId">Côdigo da Agência: </label></td>
          <td width="32%" class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="codigoAgenciaId" name="contaCorrente.codigoAgencia" maxlength="10"/>
          </td>
        </tr>
        <tr>
          <td class="TitleCell"><label class="LabelText" for="contaCorrenteId">Conta Corrente: </span></td>
          <td class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="contaCorrenteId" name="contaCorrente.contaCorrente" maxlength="15"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>

</form>
<form name="formContaCorrenteTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<input type="hidden" name="pessoaFisica.id" value="<s:property value="contaCorrente.pessoa.id"/>" /> 
<input type="hidden" name="endereco.pessoa.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="dependentes.pessoa.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="corretora.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="smsEventosCorretora.corretora.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="smsTelefonesProdutor.produtor.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="produtor.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>
<input type="hidden" name="corretoraTipoLancamento.corretora.id" value="<s:property value="contaCorrente.pessoa.id"/>"/>

<script type="text/javascript">
$(document).ready(function(){
	MaskInput(document.getElementById('validadeCartaoId'),"99/99/9999");
});
</script>