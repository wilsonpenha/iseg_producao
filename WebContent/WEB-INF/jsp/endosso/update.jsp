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
				  <td class="FieldGroupTitle_MaxSize">Tipo de Endosso</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="descricaoId">Nome</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_endosso.id" name="endosso.id" cssStyle="display:none" />
			<s:textfield theme="simple" id="endosso_ramoId" name="endosso.ramo.id" cssStyle="display:none" />
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="endosso.nome" maxlength="50"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText">Descrição::</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_100percent_width" id="descricaoId" name="endosso.descricao" maxlength="200"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText">Ramo:</label></td>  
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="subRamoId" name="ramo.subRamo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="carregarSubRamos()"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText">Sub-Ramo:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <div id="divRamos"><s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="ramoId" name="ramo.id" list="{}" listKey="{}" listValue="nome" headerKey="" headerValue="-- Selecione --" /></div>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Ativa?</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="isAtiva" name="endosso.isAtivo" list="#{'true':'SIM', 'false':'NAO'}"/>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>

</form>
<form name="formLookup" id="formLookup">
  <s:textfield theme="simple" id="gpRamoId" name="ramo.id" cssStyle="display:none;"/>
   
<script>

$(document).ready(function () {
	$("#gpRamoId").val($("#subRamoId").val());
	submitFormAjax('#formLookup', getContextApp()+'/objlookup/getSubRamosByRamo.action', '#divRamos');
	setTimeout(function(){
		$('#ramoId').val($('#endosso_ramoId').val());
	},500);
});

</script>
