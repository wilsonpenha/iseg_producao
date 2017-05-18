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
				  <td class="FieldGroupTitle_MaxSize">Domínio Esp.</td>
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
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="dominioEspValorId">Valor: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_dominioEsp.id" name="dominioEsp.id" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="dominioEspValorId" name="dominioEsp.valor" maxlength="60"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Veicular: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_dominioEsp.isVeicular" name="dominioEsp.isVeicular" maxlength="22"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Domínio Esp. Pai: </span></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="dominioEspPaiId" name="dominioEsp.dominioEspPai.id" list="dominioEspPaiList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" disabled="true"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="dominioEspId">Domínio: </label></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="dominioEspId" name="dominioEsp.dominio.id" list="dominioList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Exclusãodo: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_dominioEsp.excluido" name="dominioEsp.excluido" maxlength="22"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Data Exclussãoo: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="excluidoId" name="dominioEsp.dataExclusao" onkeypress="return formatStr('data', event,this)" onblur="isValidDate(this)"/>
		  </td>
		</tr>
      </table>
    </td>
  </tr>
</table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	MaskInput(document.getElementById('excluidoId'),'99/99/9999');
});
</script>