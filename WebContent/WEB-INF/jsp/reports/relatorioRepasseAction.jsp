<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
					<td class="FieldGroupTitle_MaxSize"><s:text name="titulo"/></td>
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
			<td width="20%" class="TitleCell"><span class="LabelText">Data Extrato: </span></td>
			<td width="30%" class="TextBox_ContentCell" nowrap="nowrap">
				<span class="LabelText" style="font-weight:bold;">a partir de&nbsp;</span>
			  	<s:textfield cssClass="dojoValidateValid TextBox_OneCells_width" id="inicioInicioVigencia" disabled="false" name="periodoDoLancamento.inicio" onblur="isValidDate(this)" size="9"/>
			  	<span class="LabelText" style="font-weight:bold;">&nbsp;até&nbsp;</span>
			  	<s:textfield cssClass="dojoValidateValid TextBox_OneCells_width" id="fimInicioVigencia" disabled="false" name="periodoDoLancamento.fim" onblur="isValidDate(this)" size="9"/>
			</td>
			<td width="20%" class="TitleCell"><span class="LabelText">Data da Quitação: </span></td>
			<td width="30%" class="TextBox_ContentCell" nowrap="nowrap">
				<span class="LabelText" style="font-weight:bold;">a partir de&nbsp;</span>
			  	<s:textfield cssClass="dojoValidateValid TextBox_OneCells_width" id="inicioDataPagamento" name="periodoDoPagamento.inicio" onblur="isValidDate(this)" size="9"/>
			  	<span class="LabelText" style="font-weight:bold;">&nbsp;até&nbsp;</span>
			  	<s:textfield cssClass="dojoValidateValid TextBox_OneCells_width" id="fimDataPagamento" name="periodoDoPagamento.fim" onblur="isValidDate(this)" size="9"/>
			</td>
		  </tr>
		  <tr>
			<td width="20%" class="TitleCell"><span class="LabelText">Ramo: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="Combo Combo_TwoCells_width" id="ramoId" name="ramo.id" list="ramoSubRamoList" listKey="id" listValue="nomeRamoSubRamo" headerKey="" headerValue="-- Selecione --"/>
			</td>
			<td width="20%" class="TitleCell"><span class="LabelText">Seguradora: </span></td>
		    <td width="30%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="seguradoraId" name="seguradora.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="seguradoraNome" cssClass="TextBox_TwoCells_width" name="seguradora.nome" />
		    </td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Grupo de Venda: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="Combo Combo_TwoCells_width" id="grupoVendaId" name="grupoDeVenda.id" list="grupoVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Comissionado: </span></td>
			<td width="30%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="produtorId" name="produtorId" cssStyle="display:none;"/>
			    <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="produtorNome" name="produtorNome"/>
			</td>
		  </tr>
		  <tr>
			<td width="20%" class="TitleCell" align="left"><span class="LabelText">Situação</span></td>
		  	<td width="30%" class="TextBox_ContentCell">
			    <s:select theme="simple" cssClass="Combo requiredField" id="situacao" name="situacao" list="#{'0':'A PAGAR', '2':'PAGOS', '-1':'TODOS'}"/>
		  	</td>
			<td width="20%" class="TitleCell" align="left"><span class="LabelText">Imprimir Recibo</span></td>
		  	<td width="30%" class="TextBox_ContentCell">
			    <s:select theme="simple" cssClass="Combo requiredField" id="imprimirRecibo" name="imprimirRecibo" list="#{'false':'NAO','true':'SIM'}"/>
		  	</td>
		  </tr>
		  <tr>
		  	<td width="20%" class="TitleCell"><span class="LabelText">Cliente: </span></td>
			<td width="30%" class="TextBox_ContentCell">
 				<s:textfield theme="simple" id="clienteId" name="clienteId" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="clienteNome" cssClass="TextBox_100percent_width" name="clienteNome" />
			</td>
			<td width="20%" class="TitleCell" align="left"><span class="LabelText">Ordenação</span></td>
		  	<td width="30%" class="TextBox_ContentCell">
		  	    <s:textfield theme="simple" id="idRelatorio" name="idRelatorio" cssStyle="display:none"/>
			    <s:select theme="simple" cssClass="Combo requiredField" id="ordem" name="ordem" list="#{'cliente_nome':'CLIENTE', 'proposta_numero':'NRO PROPOSTA', 'numero_apolice':'NRO APOLICE', 'produtor_nome':'PRODUTOR', 'data_lancamento':'DATA LANCAMENTO', 'data_pagamento':'DATA RECEBIMENTO'}"/>
		  	</td>
		  </tr>
		  <tr>
		  	<td width="20%" class="TitleCell" align="left"><span class="LabelText">Quebra</span></td>
		  	<td width="30%" class="TextBox_ContentCell">
			    <s:select cssClass="Combo requiredField" id="quebra" name="quebra" list="opcoesDeQuebraDoRelatorio" listValue="nome" emptyOption="- Sem quebra -"/>
		  	</td>
			<td width="20%" class="TitleCell" align="left"></td>
		  	<td width="30%" class="TextBox_ContentCell"></td>
		  </tr>
		  <s:if test="isAssessoria()">
			  <jsp:include page="selecaoDeCorretoras.jsp"  flush="false"></jsp:include>
		  </s:if>
		</table>
	  </td>
	</tr>
	<tr>
	
	<table width="100%" cellspacing="0" cellpadding="0" align="center" >
	<tr>
	   <td class="Button_RightAlign_ContentCell">
		<div align="center">
		  <a class="ButtonLink" href="#" onclick="validaDatas();">
			<table class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; return true;" onmouseout="this.className='Button'; return true;">
			  <tr>
				<td class="Button_left"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" alt="Pesquisar" width="1" height="1" border="0" class="Button_Icon Button_Icon_search" title="Gerar report"></img></td>
				<td class="Button_text Button_width">Gerar</td>
				<td class="Button_right"></td>
			  </tr>
			</table>
		  </a>
		</div>
	  </td>
	   <td class="Button_RightAlign_ContentCell">
		<div align="center">
		  <a class="ButtonLink" href="#" onclick="var relatorioId = $('#idRelatorio').val();clearForm('#formLista');$('#idRelatorio').val(relatorioId);">
			<table class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; return true;" onmouseout="this.className='Button'; return true;">
			  <tr>
				<td class="Button_left"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" alt="Pesquisar" width="1" height="1" border="0" class="Button_Icon Button_Icon_search" title="Limpar todos os filtros"></img></td>
				<td class="Button_text Button_width2">Limpar Filtro</td>
				<td class="Button_right"></td>
			  </tr>
			</table>
		  </a>
		</div>
	  </td>
	</tr>
  </table>
  </tr>
  </table>
</div>
</form>

<script type="text/javascript">
$(document).ready(function(){

	MaskInput(document.getElementById('inicioInicioVigencia'),"99/99/9999");
	MaskInput(document.getElementById('fimInicioVigencia'),"99/99/9999");
	MaskInput(document.getElementById('inicioDataPagamento'),"99/99/9999");
	MaskInput(document.getElementById('fimDataPagamento'),"99/99/9999");
	MaskInput(document.getElementById('produtorId'),"999999");
	MaskInput(document.getElementById('clienteId'),"999999");	

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#produtorNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#produtorId"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
});
function openWinReport(){
	openWin('', 'report', '800', '600', 'resizable=yes');
	submitForm($('#formLista').get(0), getContextApp()+'/jasperreportRepasse/runjasper.action', false, "report");
}

function validaDatas(){
	var retorno = true;
	
	if (($('#inicioInicioVigencia').val() == '') && ($('#inicioDataPagamento').val() == '')) {
		alert('É obrigatório informar uma período inicial!');
		return;
	}
	
	if (($('#fimInicioVigencia').val() == '') && ($('#fimDataPagamento').val() == '')) {
		alert('É obrigatório informar um período final!');
		return;
	}
	
	if ($('#inicioInicioVigencia').val() != '' || $('#fimInicioVigencia').val() != '')
		retorno = comparaDatas($('#inicioInicioVigencia').val(), $('#fimInicioVigencia').val());
	
	if ($('#inicioDataPagamento').val() != '' || $('#fimDataPagamento').val() != '')
		retorno = comparaDatas($('#inicioDataPagamento').val(), $('#fimDataPagamento').val());
		
	if (retorno)
		openWinReport();
	
}

function comparaDatas(data1, data2){
	var regex = new RegExp(/^((((0?[1-9]|1\d|2[0-8])\/(0?[1-9]|1[0-2]))|((29|30)\/(0?[13456789]|1[0-2]))|(31\/(0?[13578]|1[02])))\/((19|20)?\d\d))$|((29\/0?2\/)((19|20)?(0[48]|[2468][048]|[13579][26])|(20)?00))$/);
	dataInicial = regex.test(data1);
	dataFinal = regex.test(data2);
	
	if(!dataInicial) {
		alert("Período Inical inválido!");
		return false;
	}
	
	if (!dataFinal) {
		alert("Período Final inválido!");
		return false;
	}
	
	dataInicial = new Date(data1.substr(3,2) + '/' + data1.substr(0,2) +'/' + data1.substr(6,4)).getTime();
	dataFinal = new Date(data2.substr(3,2) + '/' + data2.substr(0,2) +'/' + data2.substr(6,4)).getTime();
	
	if (eval(dataFinal - dataInicial) < 0){
	  alert("Informe um período válido!"); 
	  return false;
	}
	
	anoMesInicial = data1.substr(6,4) + data1.substr(3,2) + data1.substr(0,2);
	anoMesFinal = data2.substr(6,4) + data2.substr(3,2) + data2.substr(0,2);
	
	if (eval(anoMesFinal - anoMesInicial) >= 10000){
	  alert("O período informado não pode ser superior a 12 meses!"); 
	  return false;
	}
	
	return true;
}
</script>
