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
					<td class="FieldGroupTitle_MaxSize">Ramo</td>
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
		  <tr>			<td width="18%" class="TitleCell"><label class="LabelText" for="ramoNomeId">Nome: </label></td>			<td width="32%" class="TextBox_ContentCell">              <s:textfield theme="simple" id="id" name="ramo.id" cssStyle="display:none"/>			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="ramoNome" name="ramo.nome" maxlength="20"/>
			</td>
		  </tr>		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="ramoNomeId">Código SUSEP: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid clSusep TextBox_TwoCells_width requiredField" id="codigoSusep" name="ramo.codigoSusep" maxlength="7"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="statusId">Pagto via Faturas: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="isPagtoViaFatura" name="ramo.isPagtoViaFatura" list="#{'false':'NÃO','true':'SIM'}" emptyOption="false"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	MaskInput(document.getElementById('ramoNome'),"********************");
});
</script>
