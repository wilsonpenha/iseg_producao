<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
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
					<td class="FieldGroupTitle_MaxSize">Oficina</td>
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
			<td width="12%" class="TitleCell"><label class="LabelText" for="razaoSocialId">Razão Social:</span></td>
			<td width="38%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="formEdit_oficina.id" name="oficina.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="razaoSocialId" name="oficina.razaoSocial" maxlength="60"/>
			</td>
			<td width="12%" class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CNPJ:</label></td>
			<td width="38%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="cpfOuCnpjId" name="oficina.cpfOuCnpj"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><label class="LabelText" for="formEdit_oficinaId">Nome Fantasia:</label></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="formEdit_oficinaId" name="oficina.nome" maxlength="60"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Site:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="siteHomePageId" name="oficina.siteHomePage" maxlength="100"/>
			</td>				
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Inscrição Estadual:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_oficina.inscrEstadual" name="oficina.inscrEstadual" maxlength="14"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Data de Fundação:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="dataFundacaoId" name="oficina.dataFundacao" onblur="isValidDate(this)"/>
			</td>					
		 </tr>					
		  <tr>
			<td class="TitleCell"><span class="LabelText">Valor	do Patrimônio:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="TextBox_TwoCells_width currency" id="valorPatrimonioId" name="oficina.valorPatrimonio" onkeypress="return formatNumber(this, event, 2);"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Pessoa Contato:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="pessoaContatoId" name="oficina.pessoaContato" maxlength="60"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Inscrição	Municipal:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="inscricaoMunicipalId" name="oficina.inscricaoMunicipal" maxlength="15"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Telefone Preferencial: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="telefonesId" name="oficinas.telefonePreferencial" maxlength="40"/>
			</td>					
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Telefone Alternativo: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="alternativoId" name="oficinas.telefoneAlternativo" maxlength="40"/>
			</td>					
			<td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda Padrão: </label></td>
			<td class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="grupoDeVendaId" name="oficinas.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" onchange="alert('Esta alteração não tem efeito sobre proposta existentes!\n');"/>
	 		</td>
		  </tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Pessoa de referência: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="referenciaPessoal" name="oficinas.referenciaPessoal" maxlength="50"/>
		  </td>				
		</tr>
		  
		</table>
	  </td>
	</tr>
  </table>
</div>
</form>
<form name="formOficinasTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="oficina.id"/>"/>

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