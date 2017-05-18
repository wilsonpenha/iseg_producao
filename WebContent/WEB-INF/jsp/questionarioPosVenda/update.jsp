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
				  <td class="FieldGroupTitle_MaxSize">Questionario p/ Pos venda</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="descricaoId">Pergunta</label></td>
		  <td width="82%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_questionarioPosVenda.id" name="questionarioPosVenda.id" cssStyle="display:none" />
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="questionarioPosVenda.pergunta" maxlength="150"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText">Tipo Resposta:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="tipoResposta" name="questionarioPosVenda.tipoResposta" list="#{'0':'TEXTUAL', '1':'SIM ou NAO'}"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Ativa?</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="isAtiva" name="questionarioPosVenda.isAtivo" list="#{'true':'SIM', 'false':'NAO'}"/>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>

