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
					<td class="FieldGroupTitle_MaxSize">Tipo de Lancamento</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="privilegio">Tipo de Lancamento: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="corretoraTipoLancamentoId" name="corretoraTipoLancamento.id" cssStyle="display:none" />
			  <s:textfield theme="simple" id="corretoraId" name="corretoraTipoLancamento.corretora.id" cssStyle="display:none" />
			  <s:select theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="corretoraTipoLancamentoId" name="corretoraTipoLancamento.tipoLancamento.id" list="tipoLancamentoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
			</td>
			<td width="18%" class="TitleCell"></td>
			<td width="32%" class="TextBox_ContentCell">
			  &nbsp;
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="statusId">Gerar Repasse: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="isRepasse" name="corretoraTipoLancamento.isRepasse" list="#{'true':'SIM','false':'NÃO'}" emptyOption="false"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>

</form>

<form name="formCorretoraTipoLancTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="corretora.id" value="<s:property value="corretoraTipoLancamento.corretora.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="corretoraTipoLancamento.corretora.id"/>"/>
	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="corretoraTipoLancamento.corretora.id"/>"/>
	<input type="hidden" name="smsEventosCorretora.corretora.id" value="<s:property value="corretoraTipoLancamento.corretora.id"/>"/>

