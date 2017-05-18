<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
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
				  <td class="FieldGroupTitle_MaxSize">Pessoa Física</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CPF: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="cpfOuCnpjId" name="pessoaFisica.cpfOuCnpj" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
		    <s:textfield id="corretoraId" name="pessoaFisica.corretora.id" cssStyle="display:none" theme="simple" />
		  	<s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="pessoaFisica.nome" maxlength="60"/></td>	
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Data de Nascimento:</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="dataNascimentoId" name="pessoaFisica.dataNascimento" onblur="isValidDate(this)"/>
		  </td>	
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pessoaSexoId">Sexo: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="pessoaSexoId" name="pessoaFisica.sexo" list="#{'MASCULINO':'MASCULINO','FEMININO':'FEMININO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Estado Civil: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText">Profissão: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
		  	<s:textfield theme="simple" id="profissaoId" name="pessoaFisica.profissao.id" style="display:none;"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width profissaoNome" id="formEdit_pessoaFisica.profissao" name="pessoaFisica.profissao.descricao" maxlength="30"/>
		  </td>				
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Referência pessoal: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="referenciaPessoal" name="pessoaFisica.referenciaPessoal" maxlength="50"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText">CNH: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="CnhId" name="pessoaFisica.cnh" maxlength="15"/>
		  </td>				
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data 1º Habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="data1aHabilitacao" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this)" />
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data Venc Habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataVencHabilitacao" name="pessoaFisica.dataVencHabilitacao" onblur="isValidDate(this)"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Identidade: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="formEdit_pessoaFisica.matricula" name="pessoaFisica.rg" maxlength="15"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Data de Emissão: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataEmissaoId" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Orgão Emissor: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="formEdit_pessoaFisica.orgaoEmissorId" name="pessoaFisica.orgaoEmissor" maxlength="15"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Telefone Preferencial: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneRecadosId" name="pessoaFisica.telefonePreferencial" maxlength="30"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Telefone Alternativo: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneAlternativoId" name="pessoaFisica.telefoneAlternativo" maxlength="30"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Telefone Celular: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneCelularId" name="pessoaFisica.telefoneCelular" maxlength="30"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">E-mail: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="emailId" name="pessoaFisica.email" onblur="isValidEmail(this)" maxlength="50"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda Padrão: </label></td>
		  <td class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="dojoValidateValid  requiredField" id="grupoDeVendaId" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
 		  </td>
		</tr>
		<tr>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsIsAtivo">Ativar Serviço SMS?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="Combo Combo_OneCells_width   requiredField" id="smsIsAtivo" name="pessoaFisica.smsIsAtivo" list="#{'true':'SIM','false':'NÃO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form name="formPessoaFisicaTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="pessoaFisica.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="pessoaFisica.id"/>"/>
	<input type="hidden" name="dependentes.pessoa.id" value="<s:property value="pessoaFisica.id"/>"/>
	
<script type="text/javascript">
$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpjId'),"999.999.999-99");
	MaskInput(document.getElementById('dataEmissaoId'),"99/99/9999");
	MaskInput(document.getElementById('dataNascimentoId'),"99/99/9999");
	MaskInput(document.getElementById('data1aHabilitacao'),"99/99/9999");
	MaskInput(document.getElementById('dataVencHabilitacao'),"99/99/9999");
	$(".profissaoNome").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#profissaoId"]});
});
</script>
