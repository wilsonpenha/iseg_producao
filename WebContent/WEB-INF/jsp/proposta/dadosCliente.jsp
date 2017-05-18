<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

<s:if test="endereco != null">
<table width="100%" border="0">
  <tr>
	<td colspan="4">
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupTitle">Endereço</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupContent"></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		</tbody>
	  </table>
	</td>
  </tr>
  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="enderecoCep">CEP: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoCep" name="endereco.cep" readonly="true" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="enderecoLogradouro">Logradouro:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoLogradouro" name="endereco.logradouro" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="enderecoComplemento">Complemento:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoComplemento" name="endereco.complemento" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="enderecoNumero">Numero:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoNumero" name="endereco.numero" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="enderecoBairro">Bairro:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoBairro" name="endereco.bairro.nome" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="enderecoCidade">Cidade:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoCidade" name="endereco.bairro.cidade.nome" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="enderecoUf">UF:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="enderecoUf" name="endereco.bairro.cidade.uf.nome" readonly="true" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="tipoEndereco">Tipo Endereco:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="tipoEndereco" name="endereco.tipoEndereco.valor" readonly="true" />
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</s:if>
<s:if test="pessoaFisica != null">
<table width="100%" border="0">
  <tr>
	<td colspan="4">
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupTitle">Pessoa Física</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupContent"></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		</tbody>
	  </table>
	</td>
  </tr>
  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pfRG">RG: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pfRG" name="pessoaFisica.rg" readonly="true" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pfEmail">E-mail:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pfEmail" name="pessoaFisica.email" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="pfDataEmissao">Data Emissão:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pfDataEmissao" name="pessoaFisica.dataEmissao" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="pfOrgaoEmissor">Órgão Emissor:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pfOrgaoEmissor" name="pessoaFisica.orgaoEmissor" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="pfTelefoneCelular">Telefone Celular:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pfTelefoneCelular" name="pessoaFisica.telefoneCelular" readonly="true" />
		  </td>
		  <td class="TitleCell"></td>
		  <td class="Textbox_ContentCell"></td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</s:if>
<s:if test="pessoaJuridica != null">
<table width="100%" border="0">
  <tr>
	<td colspan="4">
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupTitle">Pessoa Jurídica</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupContent"></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		</tbody>
	  </table>
	</td>
  </tr>
  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pjRazaoSocial">Razão Social: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjRazaoSocial" name="pessoaJuridica.razaoSocial" readonly="true" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pjInscricaoEstadual">Inscrição Estadual:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjInscricaoEstadual" name="pessoaJuridica.inscrEstadual" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="pjDataFundacao">Data Fundação:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjDataFundacao" name="pessoaJuridica.dataFundacao" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="pjValorPatrimonio">Valor Patrimônio:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjValorPatrimonio" name="pessoaJuridica.valorPatrimonio" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="pjPessoaContato">Pessoa Contato:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjPessoaContato" name="pessoaJuridica.pessoaContato" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="pjInscricaoMunicipal">Inscrição Municipal:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjInscricaoMunicipal" name="pessoaJuridica.inscricaoMunicipal" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="pjSite">Site:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjSite" name="pessoaJuridica.siteHomePage" readonly="true" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="pjAtividadeComercial">Atividade Comercial:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_TwoCells_width" id="pjAtividadeComercial" name="pessoaJuridica.atividadeComercial.valor" readonly="true" />
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</s:if>
<% } catch (Exception e) {e.printStackTrace();}%>