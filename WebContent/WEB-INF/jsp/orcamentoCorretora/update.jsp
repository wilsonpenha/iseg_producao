<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<input type="hidden" name="corretora.id" value="<s:property value="corretora.id"/>"/>
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
					<td class="FieldGroupTitle_MaxSize">Configuração do Orçamento</td>
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
						<td width="50%" valign="top">
							<fieldset>
								<legend>Coberturas</legend>
								<table width="100%">
									<tr>
										<td>
											<div style="width:140px">
												<a href="#" class="button" onclick="resetForm($('#formCobertura'));abrirDivNovaCobertura();">
												  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
												    <tr>
													  <td class="wButton_left"></td>
													  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
													  <td class="wButton_right"/>
												    </tr>
												  </table>
												 </a>
											 </div>
										</td>
									</tr>
									<tr>
										<td id="listaDeCoberturas">
											<table id="tableCoberturasCorretora" class="listItens">
											  <tr class="listItensHeader">
												<td width="70%" nowrap="nowrap">Descrição</td>
												<td width="10%" nowrap="nowrap">Lmi</td>
												<td colspan="2" width="20%" nowrap="nowrap">Ações</td>
											  </tr>
											  <s:iterator value="corretoraCoberturasIsegList" status="stat">
												<tr>
												  <td nowrap="nowrap"><s:property value="%{coberturasIseg.descricao}"/>&nbsp;</td>
												  <td nowrap="nowrap"><s:property value="%{lmi}"/>&nbsp;</td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirCoberturas('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
												    </a>
												  </td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma edição?')){editarCoberturas('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
												    </a>
												  </td>
												</tr>
											  </s:iterator>
											</table>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
						<td width="50%" valign="top">
							<fieldset>
								<legend>Serviços</legend>
								<table width="100%">
									<tr>
										<td>
											<div style="width:130px">
												<a href="#" class="button" onclick="abrirDivNovoServico();">
												  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
												    <tr>
													  <td class="wButton_left"></td>
													  <td class="wButton_text wButton_width">Adicionar Servicos</td>
													  <td class="wButton_right"/>
												    </tr>
												  </table>
												 </a>
											 </div>
										</td>
									</tr>
									<tr>
										<td id="listaDeServicos">
											<table id="tableServicosCorretora" class="listItens">
											  <tr class="listItensHeader">
												<td width="90%" nowrap="nowrap">Descrição</td>
												<td width="10%" nowrap="nowrap">Ações</td>
											  </tr>
											  <s:iterator value="corretoraServicosIsegList" status="stat">
												<tr>
												  <td nowrap="nowrap"><s:property value="%{servicosIseg.descricao}"/>&nbsp;</td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirServicos('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
												    </a>
												  </td>
												</tr>
											  </s:iterator>
											</table>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>Seguradoras</legend>
								<table width="100%">
									<tr>
										<td>
											<div style="width:142px">
												<a href="#" class="button" onclick="resetForm($('#formSeguradora'));abrirDivNovaSeguradora();">
												  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
												    <tr>
													  <td class="wButton_left"></td>
													  <td class="wButton_text wButton_width">Adicionar Seguradora</td>
													  <td class="wButton_right"/>
												    </tr>
												  </table>
												 </a>
											 </div>
										</td>
									</tr>
									<tr>
										<td id="listaDeSeguradoras">
											<table id="tableSeguradoraCorretora" class="listItens">
											  <tr class="listItensHeader">
												<td width="80%" nowrap="nowrap">Nome</td>
												<td colspan="2" width="20%" nowrap="nowrap">Ações</td>
											  </tr>
											  <s:iterator value="seguradorasPreferenciaisList" status="stat">
												<tr>
												  <td nowrap="nowrap"><s:property value="%{seguradora.nome}"/>&nbsp;</td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirSeguradoras('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
												    </a>
												  </td>
												  <td nowrap="nowrap" class="small_image" align="center">
												    <a href="#" onclick="if(confirma('Confirma edição?')){editarSeguradoras('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
								 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
												    </a>
												  </td>
												</tr>
											  </s:iterator>
											</table>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>E-mail</legend>
								<table width="100%">
									<tr>
										<td>
											<label class="LabelText">Modelo e-mail:</label><br/>
			  								<s:select headerKey="" headerValue="-- Selecione --" theme="simple" cssClass="Combo" style="width: 300px" emptyOption="false" listKey="id" listValue="assunto" list="templateEmailList" name="templateMensagemId"/>
										</td>
										<td>
											<label>Visualizar Coberturas e Serviços?</label><br />
											<s:select theme="simple" cssClass="" headerKey="" list="#{false:'NÃO', true:'SIM'}" name="corretora.isOrcamentoCobertura" style="width: 50px" onchange="setAlterado(true);"/>
										</td>
										<td>
											<label>Cópia para o Produtor?</label><br />
											<s:select theme="simple" cssClass="" headerKey="" list="#{false:'NÃO', true:'SIM'}" name="" style="width: 50px" onchange="setAlterado(true);"/>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>SMS</legend>
								<table width="100%">
									<tr>
										<td>
											<label class="LabelText">Modelo SMS:</label><br/>
			  								<s:select headerKey="" headerValue="-- Selecione --" theme="simple" cssClass="Combo" style="width: 300px" emptyOption="false" listKey="id" listValue="assunto" list="templateSmsList" name="templateMensagemId"/>
										</td>
										<td>
											<label>Envia sms p/ Cliente?</label><br />
											<s:select theme="simple" cssClass="" headerKey="" list="#{false:'NÃO', true:'SIM'}" name="corretora.isOrcamentoSmsCliente" style="width: 50px" onchange="setAlterado(true);"/>
										</td>
										<td>
											<label>Enviar sms p/ Produtor?</label><br />
											<s:select theme="simple" cssClass="" headerKey="" list="#{false:'NÃO', true:'SIM'}" name="corretora.isOrcamentoPorEmail" style="width: 50px" onchange="setAlterado(true);"/>
										</td>
									</tr>
								</table>
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
<jsp:include page="modalAddCobertura.jsp" flush="false"></jsp:include>
<jsp:include page="modalAddServicos.jsp" flush="false"></jsp:include>
<jsp:include page="modalAddSeguradora.jsp" flush="false"></jsp:include>
<script language="javascript">
	$(document).ready(function() {
		$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
		$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
	});
</script>
<form name="formOrcamentoCorretoraTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="corretora.id" id="corretoraId" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="corretora.id"/>"/>
	<input type="hidden" name="corretoraTipoLancamento.corretora.id" value="<s:property value="corretora.id"/>"/>
	