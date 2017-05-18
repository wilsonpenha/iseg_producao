<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

  <tr>
	<td>
	  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tbody>
				<tr class="FieldGroup_TopMargin"></tr>
				<tr>
				  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  <td class="FieldGroupTitle_MaxSize">Perfil</td>
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
		  <td colspan="4">
			<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			<td width="10%" class="TitleCell"><label class="LabelText" for="perguntaId">Nome : </label></td>
			  <td width="20%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="perfilId" name="perfil.id" cssStyle="display:none"/>
				<s:textfield theme="simple" id="formEdit_perfil.perfilSeguradora" name="perfil.seguradora.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomePerfil" name="perfil.nome" maxlength="50"/>
			  </td>
			</tr>
			<tr>
			<td width="10%" class="TitleCell"><label class="LabelText" for="perguntaId">Situação : </label></td>
			  <td width="20%" class="TextBox_ContentCell">
				  <s:select theme="simple" cssClass="Combo requiredField" id="isAtivo" name="perfil.isAtivo" list="#{'true':'ATIVO', 'false':'INATIVO'}"/>
			  </td>
			</tr>
			</table>
		</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
	  <td>
		<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody>
			<tr class="FieldGroup_TopMargin"></tr>
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			  <td class="FieldGroupTitle_MaxSize">Perguntas</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			</tr>
			<tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
	<tr>
	  <td>
		<div id="divDadosPergunta">
		  <table cellspacing="3" cellpadding="0" width="100%" align="center">
			<tr>
				<td width="8%" class="TitleCell"><label class="LabelText" for="pergunta">Pergunta: </label></td>
				<td width="*" class="TextBox_ContentCell">
					<s:textfield theme="simple" id="perguntasPerfilId" name="perguntasPerfil.id" cssStyle="display:none"/>
					<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="pergunta" name="perguntasPerfil.pergunta" maxlength="100"/>
				</td>
				<td width="20%" class="TitleCell"><label class="LabelText" for="tipoResposta">Tipo de Resposta: </label></td>
				<td width="15%" class="TextBox_ContentCell">
					<s:select theme="simple" cssClass="requiredField" id="tipoResposta" name="perguntasPerfil.tipoResposta" list="#{'0':'SIM ou NAO', '1':'Texto ou Valor'}"/>
				</td>
				<td width="8%" class="TitleCell"><label class="LabelText" for="ordem">Ordem: </label></td>
				<td width="5%" class="TextBox_ContentCell">
					<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="ordem" name="perguntasPerfil.ordem" size="3" maxlength="3"/>
				</td>
				<td width="8%" class="TitleCell"><label class="LabelText" for="ordem">Ativo: </label></td>
				<td width="12%" class="TextBox_ContentCell">
					<s:select theme="simple" cssClass="requiredField" id="ativa" name="perguntasPerfil.ativa" list="#{'true':' SIM ', 'false':' NÃO '}"/>
				</td>
			</tr>
			<tr>
			    <td colspan="6" align="right">
			      <a href="#" class="button" onclick="inserirPergunta();" >
				  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Adicionar</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a>
			    </td>
			  </tr>
			  </table>
		  </div>
		</td>
	</tr>
	<tr>
		<td>
		  <div id="divListaPerguntas">
		<table id="tablePerguntas" width="100%" class="listItens">
		  <tr class="listItensHeader">
			<td width="8%" nowrap="nowrap" colspan="2">Ação</td>
			<td width="8%">Ordem</td>
			<td width="*">Pergunta</td>
			<td width="15%">Tipo de Resposta</td>
			<td width="7%" align="center">Ativo</td>
		  </tr>
		  <s:iterator value="perguntasPerfils" status="stat">
			<tr>
			  <td nowrap="nowrap" class="small_image">
			    <a href="#" onclick="if(confirma('Confirma exclusão?')){removePergunta('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Pergunta';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Pergunta"></a>
			  </td>
			  <td nowrap="nowrap" class="small_image">
			    <a href="#" onclick="if(confirma('Confirma edição?')){editarPergunta('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Pergunta';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEdit"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEdit" title="Editar Pergunta"></a>
			  </td>
			  <td nowrap="nowrap">
				<s:textfield theme="simple" id="perguntaPerfilId%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
				<s:textfield theme="simple" id="perfilId%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].perfil.id" value="%{perfil.id}" cssStyle="display:none"/>
				<s:textfield theme="simple" id="ordem%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].ordem" value="%{ordem}" cssStyle="display:none"/>
				<s:property value="ordem"/>
			  </td>
			  <td>
				<s:textfield theme="simple" id="pergunta%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].pergunta" value="%{pergunta}" cssStyle="display:none"/>
				<s:property value="pergunta"/>
			  </td>
			  <td>
				<s:if test="%{tipoResposta == 0}">
					SIM ou NAO
				</s:if>
				<s:else>
					Texto ou Valor
				</s:else>
				<s:textfield theme="simple" id="tipoResposta%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].tipoResposta" value="%{tipoResposta}" cssStyle="display:none"/>
			  </td>
			  <td align="center">
				<s:if test="%{ativa == null || not ativa}">
					&nbsp;
				</s:if>
				<s:else>
					S
				</s:else>
			  </td>			  
			</tr>
		  </s:iterator>
		</table>
		</div>
		</td>
	</tr>
</table>
</div>

</form>
<form id="formPerguntas" name="formPerguntas">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="ppPerguntasPerfilId" name="perguntasPerfil.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="ppPerfilId" name="perguntasPerfil.perfil.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="ppPergunta" name="perguntasPerfil.pergunta" cssStyle="display:none"/>
	<s:textfield theme="simple" id="ppOrdem" name="perguntasPerfil.ordem" cssStyle="display:none"/>
	<s:textfield theme="simple" id="ppTipoResposta" name="perguntasPerfil.tipoResposta" cssStyle="display:none"/>
	<s:textfield theme="simple" id="ppAtiva" name="perguntasPerfil.ativa" cssStyle="display:none"/>
</form>
<form name="formPerfilTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="perfil.seguradora.id"/>"/>
	<input type="hidden" name="seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="servicos.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
	<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="perfil.seguradora.id" />" />
