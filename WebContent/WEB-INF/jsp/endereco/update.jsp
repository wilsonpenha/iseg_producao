<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<input type="hidden" name="endereco.pessoa.id" value="<s:property value="endereco.pessoa.id"/>" />
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
				  <td class="FieldGroupTitle_MaxSize">Endereço</td>
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
		  <td width="15%" class="TitleCell"><label class="LabelText" for=enderecoCep>CEP: </label></td>
		  <td width="35%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="enderecoId" name="endereco.id" cssStyle="display:none;" /> 
			<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="enderecoCep" name="endereco.cep.valor" maxlength="9" />
		  </td>
		  <td width="15%" class="TitleCell"><span class="LabelText">Logradouro: </span></td>
		  <td width="35%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="enderecoLogradouro" name="endereco.logradouro" maxlength="60" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="enderecoNumero">Número: </label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="enderecoNumero" name="endereco.numero" maxlength="6" size="11" />
		  </td>							
		  <td class="TitleCell"><label class="LabelText" for="complementoId">Complemento: </label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="complementoId" name="endereco.complemento" maxlength="60" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="enderecoBairroId">Bairro:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple"	cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="enderecoBairroId" name="endereco.bairro" maxlength="50" />
		  </td>			
		  <td class="TitleCell" align="left"><label class="LabelText" for="enderecoCidadeId">Cidade:</label></td>
		  <td class="Textbox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="enderecoCidadeId" name="endereco.cidade" maxlength="35" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell" align="left"><label class="LabelText" for="estadoSigla">UF: </label></td>
		  <td class="Textbox_ContentCell">
			<s:select theme="simple" cssClass="requiredField" id="estadoSigla" headerKey="" headerValue="-- Selecione --" name="endereco.uf" list="ufs" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
		  </td>
		  <td class="TitleCell" align="left"><label class="LabelText"	for="enderecoTipoBairro">Tipo Endereço: </label></td>
		  <td class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_OneCell_width requiredField" id="enderecoTipoBairro" name="endereco.tipoEndereco" list="#{'C':'COMERCIAL','R':'RESIDENCIAL'}" emptyOption="false" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell" align="left"><span class="LabelText">Telefone: </span></td>
		  <td class="Textbox_ContentCell">
	  		<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_100percent_width" id="foneId" name="endereco.telefone" maxlength="30"/>
	  	  </td>
	  	  <td class="TitleCell"><span class="LabelText">Fax: </span></td>
	  	  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_100percent_width" id="faxId" name="endereco.fax" maxlength="30"/>
	  	  </td>
		</tr>
		<tr>
	  	  <td class="TitleCell" align="left"><span class="LabelText">Correspondência ?: </span></td>
	  	  <td class="Textbox_ContentCell">
		    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondencia" name="endereco.correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />
	  	  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>

</form>
<form name="formEnderecoTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<input type="hidden" name="seguradora.id" value="<s:property value="endereco.pessoa.id"/>" />
<input type="hidden" name="perfil.seguradora.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="servicos.seguradora.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="pessoaFisica.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="pessoaJuridica.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="produtor.id" value="<s:property value="endereco.pessoa.id"/>" />
<input type="hidden" name="oficina.id" value="<s:property value="endereco.pessoa.id"/>" /> 
<input type="hidden" name="corretora.id" value="<s:property value="endereco.pessoa.id"/>" />
<input type="hidden" name="smsEventosCorretora.corretora.id" value="<s:property value="endereco.pessoa.id"/>"/>
<input type="hidden" name="smsTelefonesProdutor.produtor.id" value="<s:property value="endereco.pessoa.id"/>"/>
<input type="hidden" name="vistoriadora.id" value="<s:property value="endereco.pessoa.id"/>" />
<input type="hidden" name="dependentes.pessoa.id" value="<s:property value="endereco.pessoa.id"/>"/>
<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="endereco.pessoa.id"/>"/>
<input type="hidden" name="corretoraTipoLancamento.corretora.id" value="<s:property value="endereco.pessoa.id"/>"/>

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
	$("#enderecoCep").autocomplete('<s:url value="/objlookup/getEnderecoCepAC.action" includeParams="none" />',{idFieldsToUpdate:["#enderecoBairroId", "#enderecoCidadeId","#estadoSigla","#enderecoLogradouro"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
});

</script>