<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" />

	<tr>
	  <td>
		<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableRelation">
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
			<td class="TitleCell"><span class="LabelText">Periodo de Produção: </span></td>
			<td class="TextBox_ContentCell" nowrap="nowrap">
				<span class="LabelText" style="font-weight:bold;">a partir de&nbsp;</span>
		  	    <s:textfield id="idRelatorio" name="idRelatorio" cssStyle="display:none"/>
			  	<s:textfield cssClass="dojoValidateValid clMesAno TextBox_OneCells_width" id="inicioDataProposta" disabled="false" name="mesAnoInicio" size="7" onblur="isValidMesAno(this);"/>
			  	<span class="LabelText" style="font-weight:bold;">&nbsp;até&nbsp;</span>
			  	<s:textfield cssClass="dojoValidateValid clMesAno TextBox_OneCells_width" id="fimDataProposta" disabled="false" name="mesAnoTermino" size="7" onblur="isValidMesAno(this);"/>
			</td>
		  </tr>
		  <s:if test="isUsuarioDeAssessoria()">
			  <tr>
			<td width="30%" class="TitleCell" align="left"><span class="LabelText">Selecione as Corretoras: </span></td>
		  	<td width="400px" class="TextBox_ContentCell">
				<s:textfield id="corretoraId" name="corretoraId" cssStyle="display:none;"/>
				<s:textfield id="corretoraNome" cssClass="TextBox_100percent_width" name="corretoraNome" onkeyup="populaListaCorretoras(event);"/>

		  	</td>
			<td width="20%" class="TitleCell" align="left">
			    <a href="#" class="button" onclick="LimpaLista();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Limpar lista</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a>
			</td>
		  	<td width="10%" class="TextBox_ContentCell">&nbsp;
		  	</td>
		  </tr>
		  <tr>
			<td width="30%" class="TitleCell" align="left">&nbsp;</td>
		  	<td width="400px" class="TextBox_ContentCell">
		  	<div id="divCorretorasList" class="divCorretorasList">
		  		<table id="tCorretorasList" width="100%"><tr><td>
				<s:select size="10" id="corretorasList" name="corretorasList" list="{}" multiple="true" cssClass="Combo requiredField Combo_TwoCells_width"/></td>
				</tr>
				</table>
			</div>				
		  	</td>
			<td width="20%" class="TitleCell" align="left">&nbsp;</td>
		  	<td width="10%" class="TextBox_ContentCell">&nbsp;
		  	</td>
		  </tr>
		  </s:if>
		</table>
	  </td>
	</tr>
	<tr>
	
	<table width="80%" cellspacing="0" cellpadding="0" align="center" >
	<tr>
	   <td class="Button_RightAlign_ContentCell">
		<div align="center">
		  <a class="ButtonLink" href="#" onclick="if ($('#inicioDataProposta').val()=='' || $('#fimDataProposta').val()==''){alert('O periodo deve ser informado!');$('#inicioDataProposta').focus();}else{comparaDatas($('#inicioDataProposta').val(), $('#fimDataProposta').val());}">
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
				<td class="Button_left"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" alt="Limpar Filtro" width="1" height="1" border="0" class="Button_Icon Button_Icon_search" title="Limpar todos os filtros"></img></td>
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

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clMesAno").setMask({mask : '19/9999'});
 	
 })

$(document).ready(function(){

	$('.divCorretorasList').readonly(true);

	$("#corretoraNome").autocomplete('<s:url value="/objlookup/getCorretorasListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#corretoraId"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
});

function openWinReport(){
	openWin('', 'report', '800', '600', 'resizable=yes');
	submitForm($('#formLista').get(0), getContextApp()+'/jasperreportCompMensal/runjasper.action', false, "report");
}

function populaListaCorretoras(event){
	if (key(event)==13 || key(event)==1){
		if (!isEmpty('#corretoraNome')){
			for (i = 0; i < $('#corretorasList')[0].options.length; i ++){
				if ($("#corretorasList option:eq("+i+")").val()==$('#corretoraId').val()){
					$('#corretoraNome').val('');
					$('#corretoraId').val('');
					return;
				}
			}
			$('#corretorasList').append(new Option($('#corretoraNome').val(), $('#corretoraId').val(), true, true));
			$('#corretoraNome').val('');
			$('#corretoraId').val('');
		}
	}
}

function LimpaLista(){
	$('#corretoraNome').val('');
	$('#corretoraId').val('');
    len = $('#corretorasList')[0].options.length;
	for (i = 0; i < len; i ++){
		$("#corretorasList option:eq(0)").remove();
	}
}

function comparaDatas(data1, data2){
	
	var regex = new RegExp(/^((((0?[1-9]|1\d|2[0-8])\/(0?[1-9]|1[0-2]))|((29|30)\/(0?[13456789]|1[0-2]))|(31\/(0?[13578]|1[02])))\/((19|20)?\d\d))$|((29\/0?2\/)((19|20)?(0[48]|[2468][048]|[13579][26])|(20)?00))$/);
	dataInicial = regex.test('01/' + data1);
	dataFinal = regex.test('01/' + data2);
	
	if(!dataInicial) {
		alert("Período Inical inválido!");
		return false;
	}
	
	if (!dataFinal) {
		alert("Período Final inválido!");
		return false;
	}
	
	dataInicial = new Date(data1.substr(0,2) + '/01/' + data1.substr(3,4)).getTime();
	dataFinal = new Date(data2.substr(0,2) + '/01/' + data2.substr(3,4)).getTime();
	
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
	
	openWinReport();
}

setTimeout(function(){
	$('#inicioDataProposta').focus();
},300);

</script>
