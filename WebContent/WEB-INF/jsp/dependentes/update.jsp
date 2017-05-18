<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

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
				  <td class="FieldGroupTitle_MaxSize">Dependentes</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
		  	<s:textfield theme="simple" id="dependentesId" name="dependentes.id" cssStyle="display:none;" />
		  	<s:textfield theme="simple" id="pessoaFisicaId" name="dependentes.pessoa.id" cssStyle="display:none;" />
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="dependentes.nome" maxlength="60"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Parentesco:</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" id="parentesco" headerKey="" headerValue="-- Selecione --" name="dependentes.parentesco" list="{'CÔNJUGE','FILHO','ENTEADO','MÃE','PAI','IRMÃO'}"/>
		  </td>	
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Data Nascimento:</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="dataNascimentoId" name="dependentes.dataNascimento" onblur="isValidDate(this)"/>
		  </td>	
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pessoaSexoId">Sexo: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_OneCell_width requiredField" id="pessoaSexoId" name="dependentes.sexo" list="#{'MASCULINO':'MASCULINO','FEMININO':'FEMININO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Estado Civil: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="dependentes.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText">Profissao: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="formEdit_dependentes.profissao" name="dependentes.profissao" maxlength="30"/>
		  </td>				
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CPF: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="cpfId" name="dependentes.cpf" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Identidade: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="formEdit_dependentes.matricula" name="dependentes.rg" maxlength="15"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Data de Emissão: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataEmissaoId" name="dependentes.dataEmissao" onblur="isValidDate(this)"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Orgão Emissor: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="formEdit_dependentes.orgaoEmissorId" name="dependentes.orgaoEmissor" maxlength="15"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">CNH: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="CnhId" name="dependentes.cnh" maxlength="15"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data 1º habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="data1aHabilitacao" name="dependentes.data1aHabilitacao" onblur="isValidDate(this)"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data Venc habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataVencHabilitacao" name="dependentes.dataVencHabilitacao" onblur="isValidDate(this)"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Telefone: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="telefoneRecadosId" name="dependentes.telefoneRecados" maxlength="30"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Telefone Celular: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="telefoneCelularId" name="dependentes.telefoneCelular" maxlength="30"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">E-mail: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="emailId" name="dependentes.email" onblur="isValidEmail(this)" maxlength="50"/>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form name="formDependentes">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="dependentes.pessoa.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="dependentes.pessoa.id"/>"/>
	<input type="hidden" name="pessoaFisica.id" value="<s:property value="dependentes.pessoa.id"/>"/>
	
<script type="text/javascript">

$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpjId'),"999.999.999-99");
	MaskInput(document.getElementById('dataEmissaoId'),"99/99/9999");
	MaskInput(document.getElementById('dataNascimentoId'),"99/99/9999");
	MaskInput(document.getElementById('data1aHabilitacao'),"99/99/9999");
	MaskInput(document.getElementById('dataVencHabilitacao'),"99/99/9999");
});
</script>
