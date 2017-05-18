<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<style>
fieldset {
	padding: 5px;
	margin-bottom: 8px;
}

div {background-color: #E8E8E8;}

a.button:link {text-decoration: none}
a.button:visited {text-decoration: none}
a.button:hover {text-decoration: none;}
a.button:active {text-decoration: none}

label{
	color:#404040;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
}

select{
	background-color:#E8E8E8;
	border:1px solid #888888;
	color:#606060;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:bold;
}  

input{ 
	background-color:#FFFFFF;          
	border:1px solid #888888;
	color:#303030;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
	height:18px;
	text-transform: none;
}

.transparent
{
   filter:alpha(opacity=60); 
   -moz-opacity: 0.6; 
   opacity: 0.6; 
}
</style>

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
					<td class="FieldGroupTitle_MaxSize">Menus</td>
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
		<s:if test="%{menu.pai.id != null}">
		  <tr>
			<td width="18%" class="TitleCell"></td>
			<td>
 			  <a href="#" class="button" onclick="$('#menuId').val($('#paiId').val());submitForm(document.formEdit, '<s:url action="editar.action" includeParams="none" />', false);" >
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
			    <tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width"><s:property value="menu.pai.nome"/></td>
				  <td class="wButton_right"/>
			    </tr>
			  </table>
			  </a>
			</td>
			<td width="18%" class="TitleCell"></td>
			<td width="18%" class="TitleCell"></td>
		  </tr>
		</s:if>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="ordem">Ordem: </label></td>
			<td width="32%" class="Combo_ContentCell">
 			  <s:textfield theme="simple" id="menuId" name="menu.id" cssStyle="display:none" />
 			  <s:textfield theme="simple" id="paiId" name="menu.pai.id" cssStyle="display:none" />
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField clValor" id="ordem" name="menu.ordem" size="3" maxlength="2"/>
			</td>
			<td width="18%" class="TitleCell"></td>
			<td width="32%" class="TextBox_ContentCell"></td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="nome">Nome: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nome" name="menu.nome" maxlength="40"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="descricao">Descrição: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="descricao" name="menu.descricao" maxlength="80"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="isRestrito">É Restrito: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="Combo requiredField" id="isRestrito" name="menu.isRestrito" list="#{'true':'SIM','false':'NÃO'}" emptyOption="false"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="acao">Action: </label></td>
			<td width="32%" class="TextBox_ContentCell" colspan="3">
			  <s:textfield theme="simple" cssClass="TextBox_100percent_width" id="acao" name="menu.acao" maxlength="500"/>
			</td>
		  </tr>
		<s:if test="%{(menu.acao == null || menu.acao == '') && menu.id != null}">
		  <tr>
		    <td colspan="4" align="center">
		      <a href="#" class="button" onclick="submitForm(document.formEdit, '<s:url action="novo.action" includeParams="none" />', false);" >
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
			    <tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">Adicionar Filho</td>
				  <td class="wButton_right"/>
			    </tr>
			  </table>
			  </a>
		    </td>
		  </tr>
		  <tr>
			  <td colspan="4">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" width="100%">
				  <tbody>
					<tr class="FieldGroup_TopMargin"></tr>
					<tr>
					  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					  <td class="FieldGroupTitle_MaxSize">Menus Filhos</td>
					  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					</tr>
					<tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
		  </tr>
		  <tr>
			  <td colspan="4">
				<div id="divListaFilhos">
				<table id="tableFilhos" width="100%" class="listItens">
				  <tr class="listItensHeader">
					<td width="8%" nowrap="nowrap">Ações</td>
					<td width="5%">Ordem</td>
					<td width="35%">Nome</td>
					<td width="30%">Descricao</td>
					<td width="15%">Sub or Action</td>
					<td width="10%">Restrito</td>
				  </tr>
				  <s:iterator value="menu.menuCollection" status="stat">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){$('#menuId').val('<s:property value="id"/>');document.formEdit.action='excluir.action';document.formEdit.submit();}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onClick="javascript:$('#menuId').val('<s:property value="id"/>');document.formEdit.action='editar.action';document.formEdit.submit();"/>
					  </td>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="menuId%{#stat.index}" name="menu.menuCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="menuPaiId%{#stat.index}" name="menu.menuCollection[%{#stat.index}].pai.id" value="%{pai.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="nivel%{#stat.index}" name="menu.menuCollection[%{#stat.index}].nivel" value="%{nivel}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="ordem%{#stat.index}" name="menu.menuCollection[%{#stat.index}].ordem" value="%{ordem}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="nome%{#stat.index}" name="menu.menuCollection[%{#stat.index}].nome" value="%{nome}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="descricao%{#stat.index}" name="menu.menuCollection[%{#stat.index}].descricao" value="%{descricao}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="action%{#stat.index}" name="menu.menuCollection[%{#stat.index}].acao" value="%{acao}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="isRestrito%{#stat.index}" name="menu.menuCollection[%{#stat.index}].isRestrito" value="%{isRestrito}" cssStyle="display:none"/>
						<s:property value="ordem"/>
					  </td>
					  <td>
						<s:property value="nome"/>
					  </td>
					  <td>
						<s:property value="descricao"/>
					  </td>
					  <td>
						<s:if test="%{acao == null || acao == ''}">
							SubMenu
						</s:if>
						<s:else>
							Action
						</s:else>
					  </td>
					  <td>
						<s:if test="%{isRestrito == true}">
							SIM
						</s:if>
						<s:else>
							NÃO
						</s:else>
					  </td>
					</tr>
				  </s:iterator>
				</table>
				</div>
			  </td>
		  </tr>
		</s:if>
		<s:else>
		  <tr>
		    <td colspan="4" align="center">
		      <a href="#" class="button" onclick="submitForm(document.formEdit, '<s:url action="novoBotao.action" includeParams="none" />', false);" >
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
			    <tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">Adicionar Botão</td>
				  <td class="wButton_right"/>
			    </tr>
			  </table>
			  </a>
		    </td>
		  </tr>
		  <tr>
			  <td colspan="4">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" width="100%">
				  <tbody>
					<tr class="FieldGroup_TopMargin"></tr>
					<tr>
					  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					  <td class="FieldGroupTitle_MaxSize">Lista de Botões</td>
					  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					</tr>
					<tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
		  </tr>
		  <tr>
			  <td colspan="4">
				<div id="divListaBotoes">
				<table id="tableBotoes" width="100%" class="listItens">
				  <tr class="listItensHeader">
					<td width="8%" nowrap="nowrap">Ações</td>
					<td width="35%">Nome</td>
					<td width="30%">Descricao</td>
					<td width="10%">Restrito</td>
				  </tr>
				  <s:iterator value="menu.acaoCollection" status="stat">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){$('#fbAcaoId').val('<s:property value="id"/>');document.formAcao.action='excluirBotao.action';document.formAcao.submit();}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onClick="javascript:$('#fbAcaoId').val('<s:property value="id"/>');document.formAcao.action='editarBotao.action';document.formAcao.submit();"/>
					  </td>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="acaoId%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="menuId%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].menu.id" value="%{menu.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="nome%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].nome" value="%{nome}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="descricao%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].descricao" value="%{descricao}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="action%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].actionName" value="%{actionName}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="isRestrito%{#stat.index}" name="menu.acaoCollection[%{#stat.index}].isRestrito" value="%{isRestrito}" cssStyle="display:none"/>
						<s:property value="nome"/>
					  </td>
					  <td>
						<s:property value="descricao"/>
					  </td>
					  <td>
						<s:if test="%{isRestrito == true}">
							SIM
						</s:if>
						<s:else>
							NÃO
						</s:else>
					  </td>
					</tr>
				  </s:iterator>
				</table>
				</div>
			  </td>
		  </tr>
		</s:else>
		</table>
	  </td>
	</tr>
  </table>
</div>
</form>
<form name="formAcao" id="formAcao">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

   <input type="hidden" id="fbAcaoId" name="acao.id"/>
   <input type="hidden" id="fbAcaoNome" name="acao.nome"/>
   <input type="hidden" id="fbAcaoDescricao" name="acao.descricao"/>
   <input type="hidden" id="fbAcaoMenuId" name="acao.menu.id"/>
   <input type="hidden" id="fbAcaoAction" name="acao.actionName"/>
   <input type="hidden" id="fbAcaoIsRestrito" name="acao.isRestrito"/>
   
<script>
$().ready(function() {
	// Mascara de telefone.
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })
</script>