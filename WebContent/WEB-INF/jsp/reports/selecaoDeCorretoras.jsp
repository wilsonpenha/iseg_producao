<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" />

		  <tr>
			<td width="20%" class="TitleCell" align="left"><span class="LabelText">Quebrar por Corretora ? </span></td>
		  	<td width="30%" class="TextBox_ContentCell">
		  	    <s:textfield id="idRelatorio" name="idRelatorio" cssStyle="display:none"/>
			    <s:select cssClass="Combo requiredField" id="quebraCorretora" name="quebraCorretora" emptyOption="false" list="#{'false':'NÃO','true':'SIM'}"/>
		  	</td>
		  	<td width="30%" class="TextBox_ContentCell">&nbsp;
		  	</td>
		  </tr>
		  <tr>
			<td width="20%" class="TitleCell" align="left"><span class="LabelText">Selecione as Corretoras</span></td>
		  	<td width="30%" class="TextBox_ContentCell">
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
		  	<td width="30%" class="TextBox_ContentCell">&nbsp;
		  	</td>
		  </tr>
		  <tr>
			<td width="20%" class="TitleCell" align="left">&nbsp;</td>
		  	<td width="30%" class="TextBox_ContentCell">
		  	<div id="divCorretorasList" class="divCorretorasList">
		  		<table id="tCorretorasList" width="100%"><tr><td>
				<s:select size="10" id="corretorasList" name="corretorasList" list="{}" multiple="true" cssClass="Combo requiredField Combo_TwoCells_width"/></td>
				</tr>
				</table>
			</div>				
		  	</td>
			<td width="20%" class="TitleCell" align="left">&nbsp;</td>
		  	<td width="30%" class="TextBox_ContentCell">&nbsp;
		  	</td>
		  </tr>

<script type="text/javascript">
$(document).ready(function(){

	$('.divCorretorasList').readonly(true);

	$("#corretoraNome").autocomplete('<s:url value="/objlookup/getCorretorasListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#corretoraId"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
});
function openWinReport(){
	openWin('', 'report', '800', '600', 'resizable=yes');
	submitForm($('#formLista').get(0), getContextApp()+'/jasperreportRepasse/runjasper.action', false, "report");
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
</script>
