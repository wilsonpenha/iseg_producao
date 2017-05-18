<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

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
				<td class="FieldGroupTitle_MaxSize">Pedido</td>
				<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			  </tr>
			  <tr class="FieldGroup_BottomMargin"></tr>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="dataProposta">Data do Pedido:</label></td>
		  <td width="32%" class="TextBox_ContentCell" >
			<s:textfield theme="simple" id="id" name="proposta.id" cssStyle="display:none"/>
			<s:textfield theme="simple" name="proposta.tipoLancamento" cssStyle="display:none"/>
			<s:textfield theme="simple" name="proposta.statusOperacional" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="dataProposta" readonly="true" name="proposta.dataProposta" onblur="isValidDate(this)" size="10"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="ramoId">Ramo:</label></td>
		  <td width="32%" class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="ramoId" name="proposta.ramo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/>
		  </td>
		</tr>
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
			  <tr class="FieldGroup_TopMargin"></tr>
			  <tr>
				<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				<td class="FieldGroupTitle">Vistoria</td>
				<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				<td class="FieldGroupContent"></td>
			  </tr>
			  <tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="vistoriadoraNome">Vistoriadora:</label></td>
		  <td class="Combo_ContentCell">
		  	<s:textfield theme="simple" id="vistoriadoraId" name="proposta.vistoriadora.id" cssStyle="display:none;" />
			<s:textfield theme="simple" id="vistoriadoraNome" cssClass="dojoValidateValid requiredField TextBox_100percent_width" name="proposta.vistoriadora.nome"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="propostaNroVistoria">Número Vistoria:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="propostaNroVistoria" name="proposta.nroVistoria" maxlength="20"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="propostaNomeVistoriador">Nome Vistoriador:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="propostaNomeVistoriador" name="proposta.nomeVistoriador" maxlength="30"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="propostaDataVistoria">Data da Vistoria:</label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid" id="propostaDataVistoria" name="proposta.dataVistoria" onblur="isValidDate(this)" size="10"/>
		  </td>
		</tr>
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
			  <tr class="FieldGroup_TopMargin"></tr>
			  <tr>
				<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupTitle">Cliente</td>
				<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupContent"></td>
			  </tr>
			  <tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText"><a class="LabelLink" style="cursor:pointer;" onclick="openWindowCliente();">Nome:</a></span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
			<s:textfield theme="simple" id="clienteNome" cssClass="dojoValidateValid requiredField TextBox_100percent_width" name="proposta.cliente.nome"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="clienteCpfCnpj">CPF/CNPJ:</label></td>
		  <td class="Combo_ContentCell">
			<s:textfield theme="simple" id="clienteCpfCnpj" cssClass="dojoValidateValid requiredField TextBox_100percent_width" name="proposta.cliente.cpfOuCnpj"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText"><a class="LabelLink" style="cursor:pointer;" onclick="openWindowGrupoDeVenda();">Grupo de Venda:</a></span></td>
		  <td class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="grupoVendaId" name="proposta.grupoDeVenda.id" list="grupoVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for=""></label></td>
		  <td class="Combo_ContentCell"></td>
		</tr>
	  </table>
	  <sx:div id="divDadosCliente"></sx:div>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
			  <tr class="FieldGroup_TopMargin"></tr>
			  <tr>
				<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupTitle">Outros Dados</td>
				<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupContent"></td>
			  </tr>
			  <tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nroApolice">Nro da Apólice:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple"  cssClass="dojoValidateValid TextBox_TwoCells_width" id="nroApolice" name="proposta.nroApolice" maxlength="20"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="dataEmissaoApolice">Data de Emissão Apólice:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="dataEmissaoApolice" cssClass="clData" name="proposta.dataEmissaoApolice" onblur="isValidDate(this)" size="10"/>
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="seguradoraId">Seguradora</label></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="seguradoraId" name="proposta.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="nroPropostaSeg">Nro Proposta na Seguradora:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="nroPropostaSeg" name="proposta.nroPropostaSeg" maxlength="15"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="tipoSeguroId">Tipo Seguro:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="tipoSeguroId" name="proposta.tipoSeguro.id" list="tipoSeguroList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --"/>
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="corretoraId">Corretora</label></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="corretoraId" name="proposta.corretora.id" list="corretoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/>
		  </td>
		</tr>
		<tr>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="inicioVigencia">Início Vigência:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="inicioVigencia" name="proposta.inicioVigencia" onblur="isValidDate(this)" size="10" onkeyup="if ($('#propostaOriginalId').val()==''){addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));}"/>
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="terminoVigencia">Término Vigência:</label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="terminoVigencia" name="proposta.terminoVigencia" onblur="isValidDate(this)" size="10"/>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form id="formId">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:url var="urlDadosCliente" value="/objlookup/getDadosCliente.action" includeParams="none"/>
	<s:textfield theme="simple" id="gpPessoaId" name="pessoa.id" cssStyle="display:none"/>
	<sx:submit type="button" href="%{#urlDadosCliente}" validate="true" targets="divDadosCliente" formId="formId" id="bindBtnDadosClientes" cssStyle="display:none"/>

<script>

$(document).ready(function(){

	MaskInput($('#dataProposta')[0], "99/99/9999");
	MaskInput($('#dataEmissaoApolice')[0], "99/99/9999");
	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");
	MaskInput($('#dataVencim1aParcela')[0], "99/99/9999");
	MaskInput($('#propostaDataVistoria')[0], "99/99/9999");
	MaskInput($('#nroApolice')[0], "99999999999999999999");
	MaskInput($('#nroPropostaSeg')[0], "999999999999999");

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId","#clienteCpfCnpj","#grupoVendaId"], onItemSelect:carregaEndereco, cacheLength:0, onClear:apagaDivDadosCliente});
	$("#clienteCpfCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCpfCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId","#clienteNome","#grupoVendaId"], onItemSelect:carregaEndereco, cacheLength:0, onClear:apagaDivDadosCliente});
	$("#vistoriadoraNome").autocomplete('<s:url value="/objlookup/getVistoriadoraList.action" includeParams="none" />', {idFieldsToUpdate:["#vistoriadoraId"]});
});
</script>