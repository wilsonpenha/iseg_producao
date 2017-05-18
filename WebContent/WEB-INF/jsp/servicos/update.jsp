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
				  <td class="FieldGroupTitle_MaxSize">Servico</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="descricaoId">Descrição:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_servicos.id" name="servicos.id" cssStyle="display:none" />
			<s:textfield theme="simple" id="formEdit_servicos.seguradoraId" name="servicos.seguradora.id" cssStyle="display:none"/>
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="descricaoId" name="servicos.descricao" maxlength="80"/>
		  </td>
		  <td width="18%" class="TitleCell">&nbsp;</td>
		  <td width="32%" class="TextBox_ContentCell">&nbsp;</td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText">Ramo:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="ramoId" name="servicos.ramo.id" list="ramoSubRamoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText">Informa Franquia?</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="informaFranquia" name="servicos.blnInformaFranquia" list="#{'true':'SIM', 'false':'NAO'}"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Ativa?</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="isAtiva" name="servicos.isAtiva" list="#{'true':'SIM', 'false':'NAO'}"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText">Sequência:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="sequencia" cssClass="TextBox_100percent_width" name="servicos.sequencia" />
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText">Serviço ISEG:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="servicosIseg" name="servicos.servicosIseg.id" list="servicosIsegByRamo" listKey="id" listValue="descricao" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText">Cod. na Seguradora:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="codigoNaSeguradora" cssClass="TextBox_100percent_width" name="servicos.codigoNaSeguradora" />
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>

</form>
<form name="formServicosTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="servicos.seguradora.id"/>"/>
	<input type="hidden" name="seguradora.id" value="<s:property value="servicos.seguradora.id" />" />
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="servicos.seguradora.id" />" />
	<input type="hidden" name="perfil.seguradora.id" value="<s:property value="servicos.seguradora.id" />" />
	<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="servicos.seguradora.id" />" />