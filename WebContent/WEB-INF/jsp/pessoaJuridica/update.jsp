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
				  <td class="FieldGroupTitle_MaxSize">Pessoa Jurídica</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CNPJ:</label></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="cpfOuCnpjId" name="pessoaJuridica.cpfOuCnpj"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
		    <s:textfield id="corretoraId" name="pessoaJuridica.corretora.id" cssStyle="display:none" theme="simple" />
			<s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="pessoaJuridica.nome" maxlength="60"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Site:</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="siteHomePageId" name="pessoaJuridica.siteHomePage" maxlength="100"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="dominioEsp">Atividade Comercial:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="Combo  requiredField" id="dominioEsp" name="pessoaJuridica.atividadeComercial.id" list="dominioEspList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="razaoSocialId">Razão Social:</label></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="razaoSocialId" name="pessoaJuridica.razaoSocial" maxlength="60"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Inscrição Estadual:</span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="inscrEstadualId" name="pessoaJuridica.inscrEstadual" maxlength="14"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Data de Fundação:</span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="dataFundacaoId" name="pessoaJuridica.dataFundacao" onkeypress="return formatStr('data', event,this)" onblur="isValidDate(this)"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Valor do Patrimônio:</span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid  currency" id="formEdit_pessoaJuridica.valorPatrimonio" name="pessoaJuridica.valorPatrimonio" onkeypress="return formatNumber(this, event, 2);" maxlength="15"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Pessoa Contato:</span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="pessoaContatoId" name="pessoaJuridica.pessoaContato" maxlength="60"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Inscrição Municipal:</span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="inscricaoMunicipalId" name="pessoaJuridica.inscricaoMunicipal" maxlength="15"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Telefone Preferencial: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneRecadosId" name="pessoaJuridica.telefonePreferencial" maxlength="30"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Telefone Alternativo: </span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneAlternativoId" name="pessoaJuridica.telefoneAlternativo" maxlength="30"/>
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Telefone Celular: </span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneCelularId" name="pessoaJuridica.telefoneCelular" maxlength="30"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">E-mail: </span></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid " id="emailId" name="pessoaJuridica.email" onblur="isValidEmail(this)" maxlength="50"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda Padrão: </label></td>
		  <td width="32%"class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="dojoValidateValid " id="grupoDeVendaId" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
 		  </td>
		</tr>
		<tr>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsIsAtivo">Ativar Serviço SMS?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="smsIsAtivo" name="pessoaJuridica.smsIsAtivo" list="#{'true':'SIM','false':'NÃO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  <td width="18%" class="TitleCell"><span class="LabelText">Pessoa de referência: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="referenciaPessoal" name="pessoaJuridica.referenciaPessoal" maxlength="50"/>
		  </td>				
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form name="formPessoaJuridicaTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="pessoaJuridica.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="pessoaJuridica.id"/>"/>
	<input type="hidden" name="grupo.pessoa.id" value="<s:property value="pessoaJuridica.id"/>"/>
	
	
<script type="text/javascript">

$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpjId'),"99.999.999/9999-99");
	MaskInput(document.getElementById('dataEmissaoId'),"99/99/9999");
	MaskInput(document.getElementById('enderecoCep'),"99999999");
	MaskInput(document.getElementById('dataFundacaoId'),"99/99/9999");
});
</script>