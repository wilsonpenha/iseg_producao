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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="formEdit_vistoriadora.id" name="vistoriadora.id" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="nomeId" name="vistoriadora.nome" maxlength="60"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CNPJ:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="cpfOuCnpjId" name="vistoriadora.cpfOuCnpj"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Site:</span></td>
		  <td width="45%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="siteHomePageId" name="vistoriadora.siteHomePage" maxlength="100"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="razaoSocialId">Razão Social:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="razaoSocialId" name="vistoriadora.razaoSocial" maxlength="60"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Inscrição Estadual:</span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="inscrEstadualId" name="vistoriadora.inscrEstadual" maxlength="14"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Data de Fundação:</span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="dataFundacaoId" name="vistoriadora.dataFundacao" onkeypress="return formatStr('data', event,this)" onblur="isValidDate(this)"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Valor do Patrimônio:</span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width currency" id="formEdit_vistoriadora.valorPatrimonio" name="vistoriadora.valorPatrimonio" onkeypress="return formatNumber(this, event, 2);" maxlength="15"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Pessoa Contato:</span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="pessoaContatoId" name="vistoriadora.pessoaContato" maxlength="60"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Inscrição Municipal:</span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="inscricaoMunicipalId" name="vistoriadora.inscricaoMunicipal" maxlength="15"/>
		  </td>
		  <td class="TitleCell"><span class="LabelText">Grupo de Venda Padrão: </span></td>
		  <td class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="grupoDeVendaId" name="vistoriadora.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" onchange="alert('Esta alteração não tem efeito sobre proposta existentes!\n');"/>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form name="formVistoriadoraTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="vistoriadora.id"/>"/>
	
	
<script type="text/javascript">

function openWindowCidade(){
	url ='<s:url value="/cidade/novoPopup.action" includeParams="none"/>?cidade.id=';
	openWin(url, 'cidadeEdicao', '750', '500', 'resizable=yes');
}
function openWindowBairro(){
	url ='<s:url value="/bairro/novoPopup.action" includeParams="none"/>?bairro.id=';
	openWin(url, 'bairroEdicao', '750', '500', 'resizable=yes');
}

$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpjId'),"99.999.999/9999-99");
	MaskInput(document.getElementById('dataFundacaoId'),"99/99/9999");


	$("#enderecoCep").autocomplete('<s:url value ="/objlookup/getEnderecoCepAC.action" includeParams="none"/>',{name:"endereco.cep.valor",mustMatch:0,minChars:6,width:300,autoFill:false,idFieldsToUpdate:["#enderecoCep","#complementoId","#enderecoLogradouro","#estadoSigla","#enderecoCidadeId","#enderecoBairroId"]});

});
</script>