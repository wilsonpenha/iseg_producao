<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
				  <td class="FieldGroupTitle_MaxSize">Cidade</td>
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
		  <td width="12%" class="TitleCell"><label class="LabelText" for="nome">Nome: </label></td>
		  <td width="38%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_Cidade.id" name="cidade.id" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nome" name="cidade.nome" maxlength="40"/>
		  </td>
		  <td width="12%" class="TitleCell"><label class="LabelText" for="cidadeUf">Unidade da Federação: </label></td>
		  <td width="38%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width requiredField" id="cidadeUf" name="cidade.uf.id" list="ufList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>