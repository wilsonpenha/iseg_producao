<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<table width="100%" border="0">
  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td colspan="6">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
				<tr class="FieldGroup_TopMargin"></tr>
				<tr>
				  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  <td class="FieldGroupTitle_MaxSize">Condutor</td>
				  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				</tr>
					<div id="divMessages" style="padding-bottom: 10px;">
			  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
			</div>
gin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <td colspan="4">
			<div id="divMessages"></div>
		  </td>
		</tr>
		<tr>
		  <td colspan="6">
			<table id="tableCondutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			  <tr>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorCPF">CPF:</label></td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" name="condutor.id" cssStyle="display:none;"/>
				  <s:textfield theme="simple" name="condutor.automovel.id" cssStyle="display:none;"/>
				  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="condutorCPF" name="condutor.cpf"/>
				</td>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorNome">Nome:</label></td>
				<td width="53%" class="TextBox_ContentCe				  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="condutorNome" name="condutor.nome" maxlength="60" />
maxlength="60"/>
				</td>
			  </tr>
			  <tr>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorDataNascimento">Data Nascimento:</label></td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="condutorDataNascimento" name="condutor.dataNascimento" onblur="isValidDate(this)" size="10"/>
				</td>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorIdade">Idade:</label></td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorIdade" name="condutor.idade"/>
				</td>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorTipo">Tipo Condutor:</label></td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorTipo" name="condutor.tipoCondutor"/>
				</td>
			  </tr>
			  <tr>
				<td class="TitleCell"><label class="LabelText" for="condutorUsoSemana">Uso Semana:</label></td>
				<td class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorUsoSemana" name="condutor.usoSemana"/>
				</td>
				<td class="TitleCell"><label class="LabelText" for="condutorDirige">Dirige:</label></td>
				<td class="TextBox_ContentCell">
				  <select class="ComboKeyNoUpdatable requiredField 100percent_width" id="condutorDirige" name="condutor.dirige">
					<option value="sim">SIM</option>
					<option value="nao">NÃO</option>
				  </select>
				</td>
				<td class="TitleCell"><label class="LabelText" for="condutorSexo">Sexo:</label></td>
				<td class="TextBox_ContentCell">
				  <select class="ComboKeyNoUpdatable Combo_TwoCells_width" id="condutorSexo" name="condutor.sexo">
					<option value="MASCULINO">MASCULINO</option>
					<option value="FEMININO">FEMININO</option>
				  </select>
				</td>
			  </tr>
			  <tr>
				<td class="TitleCell"><label class="LabelText" for="condutorEstadoCivil">Estado Civil:</label></td>
				<td class="TextBo				  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="condutorEstadoCivil" name="condutor.estadoCivil.id" list="estadoCivilList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --"/>
elecione --" />
				</td>
				<td class="TitleCell"><label class="LabelText" for="condutorProfissao">Profissão:</label></td>
				<td class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorProfissao" name="condutor.profissao.descricao"/>
				</td>
				<td class="TitleCell"><label class="LabelText" for="condutorTelefone">Telefone:</label></td>
				<td class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorTelefone" name="condutor.telefones"/>
				</td>
			  </tr>
			  <tr>
				<td width="13%" class="TitleCell"><label class="LabelText" for="condutorTempoHabilitacao">Tempo Habilitação:</label></td>
				<td width="20%" class="TextBox_ContentCell" colspan="3">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="condutorTempoHabilitacao" name="condutor.tempoHabilitacao"/>
				</td>
				<td width="13%" class="TitleCell"><label class="LabelText" for=""></label></td>
				<td width="20%" class="TextBox_ContentCell" colspan="3"></td>
				<td width="13%" class="TitleCell"><label class="LabelText" for=""></label></td>
				<td width="20%" class="TextBox_ContentCell" colspan="3"></td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
<script type="text/javascript" charset="UTF-8">

$(document).r
eady(function(){
	MaskInput($('#condutorCPF')[0], "999.999.999-99");
	MaskInput($('#condutorDataNascimento')[0], "99/99/9999");
	MaskInput($('#condutorIdade')[0], "999");
	MaskInput($('#condutorTempoHabilitacao')[0], "999");
	MaskInput($('#condutorUsoSemana')[0], "99");
});

</script>