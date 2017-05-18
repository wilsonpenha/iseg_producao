<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/nicEdit.js" includeParams="none"/>"></script>
<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
  <input type="hidden" name="corretora.id" value="<s:property value="corretora.id"/>"/>
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
					<td class="FieldGroupTitle_MaxSize">Modelos de Mensagens</td>
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
				<table width="100%">
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>E-mail</legend>
								<div>
									<div style="width:130px">
										<a href="#" class="button" onclick="abrirDivNovoTemplateEmail();">
										  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
										    <tr>
											  <td class="wButton_left"></td>
											  <td class="wButton_text wButton_width">Adicionar Modelo</td>
											  <td class="wButton_right"/>
										    </tr>
										  </table>
										 </a>
									</div>
									<div id="listaTemplateEmail">
										<table id="tableServicosCorretora" class="listItens">
											  <tr class="listItensHeader">
												<td width="60%" nowrap="nowrap">Assunto</td>
												<td width="20%" nowrap="nowrap">Tipo</td>
												<td colspan="2" width="20%" nowrap="nowrap">Ações</td>
											  </tr>
											  <s:iterator value="templateEmailList" status="stat">
												<tr>
												  <td nowrap="nowrap"><s:property value="%{assunto}"/>&nbsp;</td>
												  <td nowrap="nowrap"><s:property value="%{tipoMensagem.descricao}"/>&nbsp;</td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirTemplateEmail('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
												    </a>
												  </td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma edição?')){editarTemplateEmail('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
												    </a>
												  </td>
												</tr>
											  </s:iterator>
										</table>
									</div>
								</div>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>SMS</legend>
								<div>
									<div style="width:130px">
										<a href="#" class="button" onclick="abrirDivNovoTemplateSms();">
										  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
										    <tr>
											  <td class="wButton_left"></td>
											  <td class="wButton_text wButton_width">Adicionar Modelo</td>
											  <td class="wButton_right"/>
										    </tr>
										  </table>
										 </a>
									</div>
									<div id="listaTemplateSms">
										<table id="tableServicosCorretora" class="listItens">
											  <tr class="listItensHeader">
												<td width="60%" nowrap="nowrap">Descricao</td>
												<td width="20%" nowrap="nowrap">Tipo</td>
												<td colspan="2" width="20%" nowrap="nowrap">Ações</td>
											  </tr>
											  <s:iterator value="templateSmsList" status="stat">
												<tr>
												  <td nowrap="nowrap"><s:property value="%{assunto}"/>&nbsp;</td>
												  <td nowrap="nowrap"><s:property value="%{tipoMensagem.descricao}"/>&nbsp;</td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirTemplateSms('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
												    </a>
												  </td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma edição?')){editarTemplateSms('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
												    </a>
												  </td>
												</tr>
											  </s:iterator>
										</table>
									</div>
								</div>
							</fieldset>
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
<jsp:include page="modalAddTemplateEmail.jsp" flush="false"></jsp:include>
<jsp:include page="modalAddTemplateSms.jsp" flush="false"></jsp:include>
<script language="javascript">
	$(document).ready(function() {
		$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
		$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
	});
</script>
<form name="formModeloMensagem">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="corretora.id" id="corretoraId" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="corretoraTipoLancamento.corretora.id" value="<s:property value="corretora.id"/>"/>
	