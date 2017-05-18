<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
				  <td class="FieldGroupTitle_MaxSize">Perfil</td>
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
		<td>
		<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			<td width="10%" class="TitleCell"><label class="LabelText" for="perguntaId">Nome : </label></td>
			  <td width="20%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="formEdit_perfil.id" name="perfil.id" cssStyle="display:none"/>
				<s:textfield theme="simple" id="formEdit_perfil.perfilSeguradora" name="perfil.seguradora.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomePerfil" name="perfil.nome" maxlength="50"/>
			  </td>
			</tr>
			<tr>
			<td width="10%" class="TitleCell"><label class="LabelText" for="perguntaId">Situação : </label></td>
			  <td width="20%" class="TextBox_ContentCell">
				  <s:select theme="simple" cssClass="Combo requiredField" id="isAtivo" name="perfil.isAtivo" list="#{'true':'ATIVO', 'false':'INATIVO'}"/>
			  </td>
			</tr>
			</table>
			</td>
			</tr>
		</table>
			</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>

</form>
<form name="formPerfilTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="perfil.seguradora.id"/>"/>
	<input type="hidden" name="seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="servicos.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
