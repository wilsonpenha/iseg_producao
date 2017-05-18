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
					<td class="FieldGroupTitle_MaxSize">Borderô de Encaminhamento</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="dataAbertura">Data Abertura: </label></td>
			<td width="32%" class="TextBox_ContentCell">
              <s:textfield theme="simple" id="protocoloId" name="protocolo.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="corretoraId" name="protocolo.corretora.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass="clData requiredField TextBox_TwoCells_width" id="dataAbertura" name="protocolo.dataAbertura" onblur="isValidDate(this)" size="10" maxlength="10"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="dataAbertura">Data Envio: </label></td>
			  <td width="32%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="clData requiredField TextBox_TwoCells_width" id="dataAbertura" name="protocolo.dataEnvio" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
		  </tr>
		  <tr>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteNome">Destinatário :</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="origemDestinoNome" cssClass="TextBox_TwoCells_width" name="protocolo.destinoOrigem"/>
			  </td>
			  <td width="18%" class="TitleCell">&nbsp;</td>
			  <td width="32%" class="TextBox_ContentCell">&nbsp;
			  </td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="protocoloObeservacao">Observação</label></td>
			<td colspan="3">
			  <s:textarea theme="simple" cssClass="dojoValidateValid TextArea_FourCells_width TextArea_Small_height" rows="2" id="protocoloObeservacao" name="protocolo.observacao" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 1000);" />
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
<script type="text/javascript">

</script>
