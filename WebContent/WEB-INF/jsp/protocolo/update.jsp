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
					<td class="FieldGroupTitle_MaxSize">Borderô de Encaminhamento</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="dataAbertura">Data Abertura: </label></td>
			<td width="32%" class="TextBox_ContentCell">
              <s:textfield theme="simple" id="protocoloId" name="protocolo.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="corretoraId" name="protocolo.corretora.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass="clData requiredField TextBox_TwoCells_width" id="dataAbertura" name="protocolo.dataAbertura" onblur="isValidDate(this)" size="10" maxlength="10"/>
			</td>
			<td width="18%" class="TitleCell"><label class="LabelText" for="dataAbertura">Data Envio: </label></td>
			  <td width="32%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="clData requiredField TextBox_TwoCells_width" id="dataAbertura" name="protocolo.dataEnvio" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
		  </tr>
		  <tr>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteNome">Destinatário :</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="origemDestinoNome" cssClass="TextBox_TwoCells_width" name="protocolo.destinoOrigem"/>
			  </td>
			  <td width="18%" class="TitleCell">&nbsp;</td>
			  <td width="32%" class="TextBox_ContentCell">&nbsp;
			  </td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="protocoloObeservacao">Observação</label></td>
			<td colspan="3">
			  <s:textarea theme="simple" cssClass="dojoValidateValid TextArea_FourCells_width TextArea_Small_height" rows="2" id="protocoloObeservacao" name="protocolo.observacao" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 1000);" />
			</td>
		  </tr>

		  <tr>
		  	<td colspan="4">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle_MaxSize">Propostas enviadas</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			  <table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
			      <td>
			      <div id="divPropostas">
					  <table border="0" cellpadding="0" cellspacing="0" width="100%">
					  <tr>
						<td width="25%" class="TextBox_ContentCell"><label class="LabelText" for="baixaApolice">Data Digitação: </label><br />
						  <s:textfield theme="simple" cssClass="clData requiredField " id="dataProposta" name="protocoloSearch.proposta.dataProposta" onblur="isValidDate(this)" size="12" maxlength="10"/>
						</td>
						<td width="25%" class="TextBox_ContentCell"><label class="LabelText" for="baixaApolice">Data Baixa Apólice: </label><br />
						  <s:textfield theme="simple" cssClass="clData requiredField " id="dataBaixaApolice" name="protocoloSearch.proposta.dataBaixaApolice" onblur="isValidDate(this)" size="12" maxlength="10"/>
						</td>
						<td width="25%" class="TextBox_ContentCell"><label class="LabelText" for="lanctoApolice">Data Lancto Apólice: </label><br />
						  <s:textfield theme="simple" cssClass="clData requiredField " id="dataLanctoApolice" name="protocoloSearch.proposta.dataLanctoApolice" onblur="isValidDate(this)" size="12" maxlength="10"/>
						</td>
						<td width="25%" class="TextBox_ContentCell"><label class="LabelText" for="inicioVigencia">Data Inicio Vigência: </label><br />
						  <s:textfield theme="simple" cssClass="clData requiredField " id="inicioVigencia" name="protocoloSearch.proposta.inicioVigencia" onblur="isValidDate(this)" size="12" maxlength="10"/>
						</td>
						<td width="25%" class="TextBox_ContentCell"><span class="LabelText">Grupo de Venda: </span><br />
						  <s:select cssClass="Combo " id="grupoVendaId" name="protocoloSearch.proposta.grupoDeVenda.id" list="grupoVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
						</td>
					  </tr>
					  <tr>
					  	  <td width="25%">&nbsp;</td>
					      <td width="25%" class="TitleCell">
			   				  <input type="button" id="btnf3" style="display: none;"/>
						      <a href="#" class="button" onclick="pesquisarPropostas();" >
							  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
							    <tr>
								  <td class="wButton_left"></td>
								  <td class="wButton_text wButton_width">Pesquisar</td>
								  <td class="wButton_right"/>
							    </tr>
							  </table>
							  </a>
						  </td>
					      <td width="25%" class="TitleCell">
			   				  <input type="reset" id="btnf10" style="display: none;" onclick="openWinReport(1);"/>
			   				  <a href="#" class="button" onclick="$('#btnf10').click();">
			   				  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
								  <tr>
								  	<td class="wButton_left"></td>
								  	<td class="wButton_text wButton_width">Imprimir Borderô</td>
								  	<td class="wButton_right"/>
								  </tr>
							  </table>
							  </a>
					      </td>
					      <td width="25%" class="TitleCell">
			   				  <input type="reset" id="btnf11" style="display:none;" onclick="openWinReport(2);"/>
			   				  <a href="#" class="button" onclick="$('#btnf11').click();">
			   				  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';window.status='Entrar';return true;" onmouseup="this.className='wButton';return true;" onmousedown="this.className='wButton_active';return true;" class="wButton" onclick="">
								  <tr>
								  	<td class="wButton_left"></td>
								  	<td class="wButton_text wButton_width">Imprimir Recibo(s)</td>
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
			  </table>
			</td>
		  </tr>
		  <tr>
			  <td colspan="4">
				  <div id="divListaDocumentos" style="width: 100%">
					  <jsp:include page="rowProtocoloItem.jsp"></jsp:include>
				  </div>
			  </td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
</form>
<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="gpGrupoDeVendaId" name="proposta.grupoDeVenda.id" />
	<input type="hidden" id="gpDataProposta" name="proposta.dataProposta" />
	<input type="hidden" id="gpDataBaixaApolice" name="proposta.dataBaixaApolice" />
	<input type="hidden" id="gpDataLanctoApolice" name="proposta.dataLanctoApolice" />
	<input type="hidden" id="gpInicioVigencia" name="proposta.inicioVigencia" />
	<input type="hidden" id="gpProtocoloItensId" name="protocoloItens.id" />
	<input type="hidden" id="gpProtocoloId" name="protocolo.id" />
	<input type="hidden" id="gpOpcao" name="opcao" />
</form>

<div id="paramProposta" style="display:none" >
   <div style="width: 700px;">
	  <table border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td valign="bottom">
	      <a href="#" class="button" onclick="marcarTodas();" >
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
		    <tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width" nowrap="nowrap">Marcar/Desmarcar todos</td>
			  <td class="wButton_right"/>
		    </tr>
		  </table>
		  </a>
	    </td>
		<td valign="bottom">
	      <a href="#" class="button" onclick="if (confirm('Confirma a inclusão dos itens selecionados?')){adicionarPropostas();$('#btnf9').click();}" >
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
		    <tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">Adicionar</td>
			  <td class="wButton_right"/>
		    </tr>
		  </table>
		  </a>
	    </td>
		<td valign="bottom">
		  <input type="button" class="modalClose" id="btnf9" style="display: none;"/>
	      <a href="#" class="button" onclick="$('#btnf9').click();" >
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
		    <tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">Fechar</td>
			  <td class="wButton_right"/>
		    </tr>
		  </table>
		  </a>
	    </td>
	    </tr>
	  </table>
   </div>	
   <div id="listaPropostas" style="width: 700px;">
   </div>
</div>
  
<form id="formPendencia" name="formPendencia">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

    <s:textfield theme="simple" id="paramPendenciaDescricao" name="pendenciaPosVenda.descricao" cssStyle="display:none"/>
    <s:textfield theme="simple" id="paramPosVendaId" name="pendenciaPosVenda.posVenda.id" cssStyle="display:none"/>

<script type="text/javascript">

function pesquisarPropostas(){
	if ($("#grupoVendaId").val()=="" && $("#dataBaixaApolice").val()=="" && $("#dataProposta").val()=="" && 
	    $("#dataLanctoApolice").val()=="" && $("#inicioVigencia").val()==""){
	    alert("Informe pelo menos um argumento de pesquisa!");
	    $("#dataProposta").focus();
	    return;
	}
	$('#gpGrupoDeVendaId').val($("#grupoVendaId").val());
	$('#gpDataProposta').val($("#dataProposta").val());
	$('#gpDataBaixaApolice').val($("#dataBaixaApolice").val());
	$('#gpDataLanctoApolice').val($("#dataLanctoApolice").val());
	$('#gpInicioVigencia').val($("#inicioVigencia").val());
	submitFormAjax('#formLookup', getContextApp()+'/protocolo/pesquisarPropostas.action', '#listaPropostas');
	$('#paramProposta').modal({onOpen: openModalPropostas, close: false});
	formNavigateAlterado = false;
}

function openWinReport(opcao){
	openWin('', 'report', '800', '600', 'resizable=yes');
	$('#gpProtocoloId').val($('#protocoloId').val());
	$('#gpOpcao').val(opcao);
	submitForm($('#formLookup').get(0), getContextApp()+'/jasperreportProtocolo/protocoloReport.action', false, "report");
}

function openModalPropostas (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}

function removerItem(itemId){
	$('#gpProtocoloItensId').val(itemId);
	$('#gpProtocoloId').val($('#protocoloId').val());
	submitFormAjaxAllArgs('#formLookup', getContextApp()+'/protocolo/removerItemProtocolo.action', '#divListaDocumentos');
}

function adicionarPropostas(){
	$('#itensProtocoloId').val($('#protocoloId').val());
	$('#tipoDocumentoProposta').val($('#tipoDocumento').val());
	submitFormAjaxAllArgs('#paramFormProposta', getContextApp()+'/protocolo/inserirItensProposta.action', '#divListaDocumentos');
}

function clearPessoaId(){
	if(isEmpty('#origemDestinoCpfCnpj') && isEmpty('#origemDestinoNome')){
		$('#origemDestinoId').val('');
	}
}

function marcarTodas(){
	if (document.paramFormProposta.propostaIds){
		checkbox = document.paramFormProposta.propostaIds;
		var qtde = checkbox.length;
		
		var marcados = false;
		if (qtde > 0){
			for (var i = 0; i < qtde; i++) {
 			    if (checkbox[i].checked == true){
			       marcados = true;
			       break;
			    }
			}
			if (!marcados){
				for (var i = 0; i < qtde; i++) {
				    checkbox[i].checked = true;
				}
			}else{
				for (var i = 0; i < qtde; i++) {
				    checkbox[i].checked = false;
				}
			}
		}else{
			if (checkbox.checked)
				checkbox.checked = false;
			else
				checkbox.checked = true;
		}
	}
}

</script>
