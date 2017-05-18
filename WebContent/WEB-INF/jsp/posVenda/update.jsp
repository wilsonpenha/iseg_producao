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
					<td class="FieldGroupTitle_MaxSize">Pós Venda</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="posVendaNomeId">Localizador: </label></td>
			<td width="32%" class="TextBox_ContentCell">
              <s:textfield theme="simple" id="posVendaId" name="posVenda.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="propostaId" name="posVenda.proposta.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="propostaId" name="posVenda.corretora.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="propostaId" name="posVenda.usuario.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass=" TextBox_TwoCells_width requiredField" id="posVendaProposta" name="posVenda.proposta.numero" readonly="true"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="posVendaNomeId">Data Abertura: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="dataAbertura" name="posVenda.dataAbertura" maxlength="10"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="segurado">Segurado : </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="TextBox_100percent_width" id="segurado" name="posVenda.proposta.cliente.nomeCurto" readonly="true"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="dataEncerramento">Data Encerramento: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass=" TextBox_100percent_width requiredField" id="dataEncerramento" readonly="true" name="posVenda.dataEncerramento" maxlength="7"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="posVendaNomeId">Contato : </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="posVendaContato" name="posVenda.nomeContato"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="telefoneContato">Telefone : </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clFone" id="telefoneContato" name="posVenda.telefoneContato" maxlength="20"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="celularContato">Celular : </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clFone" id="celularContato" name="posVenda.celularContato"  maxlength="20"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="faxContato">Fax: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clFone" id="faxContato" name="posVenda.telefoneContato" maxlength="20"/>
			</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="Fie ldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle_MaxSize">Questionário</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
				<div id="divListaPendencias">
				<table id="tableServicos" class="listItens">
				  <tr>
					<td width="30%">Pergunta</td>
					<td width="20%">Resposta</td>
					<td width="30%">Observação</td>
					<td width="10%">Respondido?</td>
					<td width="10%">Usuario</td>
				  </tr>
				  <s:iterator value="posVenda.respostaPosVendaCollection" status="stat">
					<tr>
					  <td>
						<s:property value="questionario.pergunta"/>
					  </td>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="questionarioId%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].posVenda.id" value="%{posVenda.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="questionarioId%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].questionario.id" value="%{questionario.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="respostaId%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="isRespondido%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].isRespondido" value="%{isRespondido}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="usuario%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].usuario.id" value="%{usuario.id}" cssStyle="display:none"/>
					    <s:if test="%{isRespondido}">
						    <s:if test="%{questionario.tipoResposta == 1}">
							  <s:textfield theme="simple" cssClass="requiredField" id="resposta%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].resposta" cssStyle="display:none" />
							  <s:select theme="simple" cssClass="requiredField" id="resposta%{#stat.index}" headerKey="" headerValue="-- Selecione --" disabled="true" name="posVenda.respostaPosVendaCollection[%{#stat.index}].resposta" list="{'SIM','NAO'}" cssStyle="width:120px;"/>
						    </s:if>
						    <s:else>
							  <s:textfield theme="simple" cssClass="requiredField" id="resposta%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].resposta" cssStyle="height:14px;width:220px;" readonly="true" />
						    </s:else>
					    </s:if>
					    <s:else>
						    <s:if test="%{questionario.tipoResposta == 1}">
							  <s:select theme="simple" cssClass="requiredField" id="resposta%{#stat.index}" headerKey="" headerValue="-- Selecione --" name="posVenda.respostaPosVendaCollection[%{#stat.index}].resposta" list="{'SIM','NAO'}" cssStyle="width:120px;"/>
						    </s:if>
						    <s:else>
							  <s:textfield theme="simple" cssClass="requiredField" id="resposta%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].resposta" cssStyle="height:14px;width:220px;" />
						    </s:else>
					    </s:else>
					  </td>
					  <td>
						  <s:textfield theme="simple" cssClass="requiredField" id="observacoes%{#stat.index}" name="posVenda.respostaPosVendaCollection[%{#stat.index}].observacoes" cssStyle="height:14px;width:220px;" />
					  </td>
					  <td>
					    <s:if test="%{isRespondido}">
					       SIM
					    </s:if>
					    <s:else>
						  NÃO
					    </s:else>
					  </td>
					  <td>
						<s:property value="usuario.nomeLogin"/>
					  </td>
					</tr>
				  </s:iterator>
				</table>
				</div>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle_MaxSize">Pendências</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			  <table border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td ><label class="LabelText" for="pendenciaDescricao">Descrição : </label><br/>
				  <s:textfield theme="simple" id="pendenciaDescricao" name="pendenciaDescricao"  size="90" maxlength="2000"/>
				</td>
				<td width="15px">&nbsp;</td>
				<td valign="bottom">
			      <a href="#" class="button" onclick="adicionarPendencia();" >
				  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Adicionar Pendência</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a>
			    </td>
			    </tr>
			  </table>
			</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
				<div id="divListaPendencias">
				<table id="tablePendencias" class="listItens">
				  <tr>
					<td width="10%">Dt criação</td>
					<td width="30%">Descrição</td>
					<td width="20%">Ação tomada</td>
					<td width="15%">Dt Baixa</td>
					<td width="15%">Usuario</td>
				  </tr>
				  <s:iterator value="posVenda.pendenciaPosVendaCollection" status="stat">
					<tr>
					  <td>
						<s:property value="dataAbertura"/>
					  </td>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="pendenciaId%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="posVendaId%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].posVenda.id" value="%{posVenda.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoId%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].descricao" value="%{descricao}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="posVendaId%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].usuario.id" value="%{usuario.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoSequencia%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].dataAbertura" value="%{dataAbertura}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoSequencia%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].dataBaixa" value="%{dataBaixa}" cssStyle="display:none"/>
						<s:property value="descricao"/>
					  </td>
					  <td>
					    <s:if test="%{dataBaixa == null}">
						  <s:textfield theme="simple" cssClass="requiredField" id="acao%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].acao" cssStyle="height:14px;width:220px;" />
						</s:if>
						<s:else>
						  <s:textfield theme="simple" cssClass="requiredField" id="acao%{#stat.index}" name="posVenda.pendenciaPosVendaCollection[%{#stat.index}].acao" readonly="true" cssStyle="height:14px;width:220px;" />
						</s:else>
					  </td>
					  <td>
						<s:property value="dataBaixa"/>
					  </td>
					  <td>
						<s:property value="usuario.nomeLogin"/>
					  </td>
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
</div>
</form>

<form id="formPendencia" name="formPendencia">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

    <s:textfield theme="simple" id="paramPendenciaDescricao" name="pendenciaPosVenda.descricao" cssStyle="display:none"/>
    <s:textfield theme="simple" id="paramPosVendaId" name="pendenciaPosVenda.posVenda.id" cssStyle="display:none"/>

<script type="text/javascript">

function adicionarPendencia(){
	if ($("#pendenciaDescricao").val().length==0){
		alert('A Descrição da Pendencia de ser informada!');
		$("#pendenciaDescricao").focus();
		return;
	}
	//submitFormAjax('#formServico', getContextApp()+'/wizard/inserirServico.action', '#divListaServicos');
	//$("#paramServAutomovelId").val($("#automovelId").val());
	$('#paramPendenciaDescricao').val($("#pendenciaDescricao").val());
	$('#paramPosVendaId').val($("#posVendaId").val());
	submitFormAjaxAllArgs('#formPendencia', getContextApp()+'/posVenda/inserirPendencia.action', null, null, null, null, function(response){$('#tablePendencias tbody').append(response);});
	$("#paramPendenciaDescricao").val('');
	$("#pendenciaDescricao").val('');
}

</script>
