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
					<td class="FieldGroupTitle_MaxSize">Usuário</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="nomeLoginId">Nome de Login: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="usuarioId" name="usuario.id" cssStyle="display:none;"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomeLoginId" name="usuario.nomeLogin" maxlength="15"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="corretoraId">Corretora: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="corretoraId" name="usuario.corretora.id" list="corretorasList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="senhaId">Senha: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="senhaId" name="usuario.senha" maxlength="15"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="privilegioId">Privilégio: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="privilegioId" name="usuario.privilegio.id" list="privilegiosList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="statusId">Situação: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:textfield theme="simple" id="formEdit_usuario.dataUltimoAcesso" name="usuario.dataUltimoAcesso" cssStyle="display:none"/>
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="statusId" name="usuario.status" list="#{'ATIVO':'ATIVO','INATIVO':'INATIVO'}" headerKey="" headerValue="-- Selecione --" maxlength="15"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>