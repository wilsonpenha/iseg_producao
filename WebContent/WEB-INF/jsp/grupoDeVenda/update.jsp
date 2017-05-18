<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>


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
				  <td class="FieldGroupTitle_MaxSize">Grupo de Venda</td>
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
				<td width="20%" class="TitleCell"><label class="LabelText" for="grupoNome">Nome do Grupo: </label></td>
				<td width="30%" class="TextBox_ContentCell">
				  <s:textfield id="grupoDeVendaId" name="grupoDeVenda.id" cssStyle="display:none" theme="simple" />
				  <s:textfield id="corretoraId" name="grupoDeVenda.corretora.id" cssStyle="display:none" theme="simple" />
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="grupoNome" name="grupoDeVenda.nomeDoGrupo" />
				</td>
				<td width="20%" class="TitleCell"><label class="LabelText" for="produtorId">Produtor: </label></td>
		  		<td width="30%" class="Combo_ContentCell">
				  <s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="produtoId" name="grupoDeVenda.produtorGerente.id" list="produtorList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  		</td>
			  </tr>
			  <tr>
				<td class="TitleCell"><label class="LabelText" for="grupoNome">Quebra Exclusividade: </label></td>
				<td class="TextBox_ContentCell">
				  <s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_OneCells_width" id="quabraExclusividade" list="#{'SIM':'SIM', 'NAO':'NÃO'}" name="grupoDeVenda.quebraExclusividade" headerKey="" headerValue="-- Selecione --" />
				</td>
				<td class="TitleCell"><span class="LabelText">Desconto %: </span></td>
				<td class="TextBox_ContentCell">
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width clValor2 currency" id="formEdit_produtor.desconto" name="grupoDeVenda.desconto" maxlength="12"/>
				</td>
			  </tr>
			  <tr>
				<td colspan="4">
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0" style="padding-top: 10px;">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
						<td class="FieldGroupTitle">Lista de Comissionados</td>
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
				<div id="divDadosProdutor">
				  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
				    <tr>
				    	<td>
	 					    <label for="clienteCpf"><a href="#" class="LabelLink" onclick="editarProdutor($('#produtorId').val());" tabindex="-1" title="Alterar/Incluir dados do Produtor">Produtor</a></label><br />
				    	</td>
				    </tr>
					<tr>
 					  <td width="42%"><span class="LabelText">Produtor:</span></td>
					  <td width="25%"><span class="LabelText"> % / Valor do Repasse:</span></td>
					  <td width="25%"><span class="LabelText">Tipo Repasse:</span></td>
					  <td width="8%">&nbsp;</td>
					</tr>
					<tr>
					  <td class="TextBox_ContentCell"> 
						<s:textfield theme="simple" id="produtorId" name="grupoProdutor.produtor.id" cssStyle="display:none;"/>
						<s:textfield theme="simple" id="produtorNome" cssClass="dojoValidateValid TextBox_100percent_width" name="grupoProdutor.produtor.pessoa.nome" />
					  </td>
					  <td class="TextBox_ContentCell">
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clValor2 currency" id="comissao" name="grupoProdutor.comissao" />
					  </td>
					  <td class="TextBox_ContentCell">
					    <s:select theme="simple" cssClass="requiredField" id="tipoComissao" cssStyle="width:95%" emptyOption="false" list="tipoComissaoList" name="grupoProdutor.tipoComissao"/>
					  </td>
					  <td>
					  	<a href="#" class="button" onclick="if(!usuarioAlreadyAdd($('#produtorNome').val())){inserirProdutor();}" title="Adicionar Comissionado">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Inserir</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
						</a>
					  </td>
					</tr>
				  </table>
				</div>
				<div id="divListProdutores">
				  <table id="tableProdutorItens" class="listItens">
					<tr class="listItensHeader">
					  <td width="42%">Produtor</td>
					  <td width="25%">%/Valor do Repasse</td> 
					  <td width="25%">Tipo Repasse</td>
					  <td width="8%">Excluir</td>
					</tr>
					<s:iterator value="grupoProdutores" status="stat">
					  <tr height="20px">
						<td>
						  <s:property value="produtor.pessoa.nome"/>
						</td>
						<td align="right"><s:property value="comissao"/></td>
					    <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
						<td nowrap="nowrap" class="small_image" width="2%"><a href="#" onClick="if (confirm('Confirma a exclusão do comissionado?')) {removerProdutor('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Comissionado"></a></td>				            	
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

	<input type="hidden" name="id"/>
	<input type="hidden" name="grupoDeVenda.id" value="<s:property value="grupoDeVenda.id"/>"/>
</form>
<form name="formProdutor" id="formProdutor">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="foGrupoProdutorId" name="grupoProdutor.id"/>
	<input type="hidden" id="foProdutorId" name="grupoProdutor.produtor.id"/>
	<input type="hidden" id="foGrupoDeVendaId" name="grupoProdutor.grupoDeVenda.id"/>
	<input type="hidden" id="foComissao" name="grupoProdutor.comissao"/>
	<input type="hidden" id="foTipoComissao" name="grupoProdutor.tipoComissao"/>

<script>
jQuery(document).ready(function(){

	$("#produtorNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#produtorId","#comissao"],mustMatch:0});
});

function inserirProdutor(){
	$("#foProdutorId").val($("#produtorId").val());
	$("#foGrupoDeVendaId").val($("#grupoDeVendaId").val());
	$("#foComissao").val($("#comissao").val());
	$("#foTipoComissao").val($("#tipoComissao").val());
	submitFormAjax('#formProdutor', getContextApp()+'/grupoDeVenda/inserirProdutor.action', '#divListProdutores');
	$("#foProdutorIdId").val("");
	$("#foGrupoDeVendaId").val("");
	$("#foComissao").val("");
	$("#foTipoComissao").val("")
	$("#produtorNome").val("");
	$("#produtorId").val("");
	$("#comissao").val("");
	$("#tipoComissao").val("");
}

function removerProdutor(id){
	$("#foGrupoProdutorId").val(id);
	$("#foGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formProdutor', getContextApp()+'/grupoDeVenda/excluirProdutor.action', '#divListProdutores');
	$("#foGrupoProdutorId").val();
	$("#foGrupoDeVendaId").val();
}

function adicionaProdutor(value){
	setTimeout(function(){if(!usuarioAlreadyAdd(value)){inserirProdutor();}},200);
	return value;
}
	
function usuarioAlreadyAdd(nome){
	var name = nome; 
	var tableItens = document.getElementById("tableProdutorItens");

	if ($("#tipoComissao").val()==''){
		alert('Informe o tipo de repasse!');
		$("#tipoComissao").focus();
		return true;
	}
	
	if ($("#produtorNome").val()=='' || $("#produtorId").val() == ''){
		alert('Informe o Produtor!');
		$("#produtorNome").focus();
		return true;
	}
	
	if(tableItens.innerHTML.match(name.toUpperCase())){
		alert("Produtor já adicionado como comissionado!");
		$("#produtorNome").val("");
		$("#produtorId").val("")
		return true;
	}

	return false;
}

</script>