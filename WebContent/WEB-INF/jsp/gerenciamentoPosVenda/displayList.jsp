<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

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
				  <td class="FieldGroupTitle_MaxSize">Configurar Pos Venda</td>
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
		  <td>
			<table width="100%" cellpadding="3" cellspacing="0" align="center">
			  <tr>
				<td colspan="4">
				  <s:textfield id="grupoDeVendaId" name="grupoDeVenda.id" cssStyle="display:none" theme="simple" />
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" style="padding-top: 10px;">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
						<td class="FieldGroupTitle">Operadores do Pos Venda</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td colspan="4">
				<div id="divDadosOperador">
				  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
					<tr>
 					  <td width="50%"><span class="LabelText">Usuario Operador:</span></td>
					  <td width="42%">&nbsp;</td>
					  <td width="8%">&nbsp;</td>
					</tr>
					<tr>
					  <td class="TextBox_ContentCell"> 
						<s:textfield theme="simple" id="usuarioId" name="usuario.id" cssStyle="display:none;"/>
						<s:textfield theme="simple" id="operadorNome" cssClass="dojoValidateValid TextBox_100percent_width" name="usuario.nomeLogin" />
					  </td>
					  <td width="42%">&nbsp;</td>
					  <td width="8%">&nbsp;</td>
					</tr>
				  </table>
				  </div>
				  <div id="divListOperadores">
				  <table id="tableOperadores" class="listItens">
					<tr class="listItensHeader">
					  <td width="50%">Usuario Operador</td>
					  <td width="2%">Excluir</td>
					</tr>
					<s:iterator value="operadoresPosVenda" status="stat">
					  <tr height="20px">
						<td>
						  <s:property value="usuario.nomeLogin"/>
						</td>
						<td nowrap="nowrap" class="small_image" width="2%"><a href="#" onClick="if (confirm('Confirma a exclusão do operador?')) {removerOperador('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Operador"></a></td>				            	
					  </tr>
					</s:iterator>
				  </table>
				  </div>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
			<table width="100%" cellpadding="3" cellspacing="0" align="center">
			  <tr>
				<td colspan="4">
				  <s:textfield id="grupoDeVendaId" name="grupoDeVenda.id" cssStyle="display:none" theme="simple" />
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" style="padding-top: 10px;">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
						<td class="FieldGroupTitle">Observadores do Pos Venda</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td colspan="4">
				<div id="divDadosObservador">
				  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
					<tr>
 					  <td width="50%"><span class="LabelText">Usuario Observador:</span></td>
					  <td width="42%">&nbsp;</td>
					  <td width="8%">&nbsp;</td>
					</tr>
					<tr>
					  <td class="TextBox_ContentCell"> 
						<s:textfield theme="simple" id="usuarioObservadorId" name="usuario.id" cssStyle="display:none;"/>
						<s:textfield theme="simple" id="observadorNome" cssClass="dojoValidateValid TextBox_100percent_width" name="usuario.nomeLogin" />
					  </td>
					  <td width="42%">&nbsp;</td>
					  <td width="8%">&nbsp;</td>
					</tr>
				  </table>
				  </div>
				  <div id="divListObservadores">
				  <table id="tableObservadores" class="listItens">
					<tr class="listItensHeader">
					  <td width="50%">Usuario Observador</td>
					  <td width="2%">Excluir</td>
					</tr>
					<s:iterator value="observadoresPosVenda" status="stat">
					  <tr height="20px">
						<td>
						  <s:property value="usuario.nomeLogin"/>
						</td>
						<td nowrap="nowrap" class="small_image" width="2%"><a href="#" onClick="if (confirm('Confirma a exclusão do observador?')) {removerObservador('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Observador';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Observador"></a></td>				            	
					  </tr>
					</s:iterator>
				  </table>
				  </div>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>
</form>
<form name="formGrupoDeVendaTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

    <s:textfield name="grupoDeVenda.id" cssStyle="display:none" theme="simple" />
</form>
<form name="formOperador" id="formOperador">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="foOperadorPosVendaId" name="operadorPosVenda.id"/>
	<input type="hidden" id="foUsuarioId" name="operadorPosVenda.usuario.id"/>
	<input type="hidden" id="foGrupoDeVendaId" name="operadorPosVenda.grupoDeVenda.id"/>
	<input type="hidden" id="foIsAtivo" name="operadorPosVenda.isAtivo" value="true"/>
	<input type="hidden" id="foIsAtivarNotificacao" name="operadorPosVenda.isAtivarNotificacao" value="true"/>
</form>
<form name="formObservador" id="formObservador">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="foObservadorPosVendaId" name="observadorPosVenda.id"/>
	<input type="hidden" id="foUsuarioObservadorId" name="observadorPosVenda.usuario.id"/>
	<input type="hidden" id="foObservadorGrupoDeVendaId" name="observadorPosVenda.grupoDeVenda.id"/>
	<input type="hidden" id="foObservadorIsAtivo" name="observadorPosVenda.isAtivo" value="true"/>
	<input type="hidden" id="foObservadorIsAtivarNotificacao" name="observadorPosVenda.isAtivarNotificacao" value="true"/>

<script>
jQuery(document).ready(function(){

	$("#operadorNome").autocomplete('<s:url value="/objlookup/getUsuarioList.action" includeParams="none" />', {idFieldsToUpdate:["#usuarioId"],mustMatch:0,formatItemOnSelect:adicionaOperador});
	$("#observadorNome").autocomplete('<s:url value="/objlookup/getUsuarioList.action" includeParams="none" />', {idFieldsToUpdate:["#usuarioObservadorId"],mustMatch:0,formatItemOnSelect:adicionaObservador});
});

function inserirOperador(){
	$("#foUsuarioId").val($("#usuarioId").val());
	$("#foGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formOperador', getContextApp()+'/grupoDeVenda/inserirOperador.action', '#divListOperadores');
	$("#foUsuarioId").val("");
	$("#foGrupoDeVendaId").val("");
	$("#operadorNome").val("");
	$("#usuarioId").val("")
}

function removerOperador(id){
	$("#foOperadorPosVendaId").val(id);
	$("#foGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formOperador', getContextApp()+'/grupoDeVenda/excluirOperador.action', '#divListOperadores');
	$("#foUsuarioId").val();
	$("#foGrupoDeVendaId").val();
}

function adicionaOperador(value){
	setTimeout(function(){if(!usuarioAlreadyAdd(value)){inserirOperador();}},200);
	return value;
}
	
function adicionaObservador(value){
	setTimeout(function(){if(!usuarioAlreadyAdd(value)){inserirObservador();}},200);
	return value;
}
	
function usuarioAlreadyAdd(nome){
	var name = nome; 
	var tableItens = document.getElementById("tableOperadores");

	if(tableItens.innerHTML.match(name.toUpperCase())){
		alert("Usuario já adicionado como operador!");
		$("#operadorNome").val("");
		$("#usuarioId").val("")
		$("#observadorNome").val("");
		$("#usuarioObservadorId").val("");
		return true;
	}

	var tableItens = document.getElementById("tableObservadores");

	if(tableItens.innerHTML.match(name.toUpperCase())){
		alert("Usuario já adicionado como observador!");
		$("#operadorNome").val("");
		$("#usuarioId").val("")
		$("#observadorNome").val("");
		$("#usuarioObservadorId").val("");
		return true;
	}

	return false;
}

function inserirObservador(){
	$("#foUsuarioObservadorId").val($("#usuarioObservadorId").val());
	$("#foObservadorGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formObservador', getContextApp()+'/grupoDeVenda/inserirObservador.action', '#divListObservadores');
	$("#foUsuarioObservadorId").val("");
	$("#foObservadorGrupoDeVendaId").val("");
	$("#observadorNome").val("");
	$("#usuarioObservadorId").val("");
}

function removerObservador(id){
	$("#foObservadorPosVendaId").val(id);
	$("#foObservadorGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formObservador', getContextApp()+'/grupoDeVenda/excluirObservador.action', '#divListObservadores');
	$("#foUsuarioObservadorId").val();
	$("#foObservadorGrupoDeVendaId").val();
}

</script>