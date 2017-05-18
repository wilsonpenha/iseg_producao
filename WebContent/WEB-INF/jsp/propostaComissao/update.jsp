<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<table width="100%" border="0">
<tr>
  <td>
	<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
	  <tr>
		<td colspan="6">
		  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			<tbody>
			<tr class="FieldGroup_TopMargin"></tr>
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			  <td class="FieldGroupTitle_MaxSize">Comissão</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			</tr>
			<tr class="FieldGroup_BottomMargin"></tr>
			</tbody>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td colspan="4">
		  <div id="divMessages"></div>
		</td>
	  </tr>
	  <tr>
		<td width="100%" colspan="4">
		  <table id="tableItemSegurado" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="percComissaoMax">Comissão Máxima (%):</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" id="propostaId"  name="proposta.id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_OneCell_width" id="percComissaoMax"  name="proposta.seguradora.percComissaoMax" readonly="true"/>
			  </td>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="percComissaoMin">Comissão Mínima (%):</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_OneCell_width" id="percComissaoMin"  name="proposta.seguradora.percComissaoMin" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="grupoVendaNome">Grupo de Venda:</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="grupoVendaNome" name="proposta.grupoDeVenda.nomeDoGrupo" readonly="true"/>
			  </td>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="produtorGerenteNome">Supervisor</label></td>
			  <td width="32%" class="TextBox_ContentCell">
			  	<s:textfield theme="simple" name="grupoDeVenda.produtorGerente.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="produtorGerenteNome" name="proposta.grupoDeVenda.produtorGerente.nome" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="grupoVendaNome">Prêmio Líquido:</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="premioLiquido" name="proposta.premioLiquido" readonly="true"/>
			  </td>
			  <td width="18%" class="TitleCell"><label class="LabelText" for=""></label></td>
			  <td width="32%" class="TextBox_ContentCell"></td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td colspan="4">
		  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			<tbody>
			<tr class="FieldGroup_TopMargin"></tr>
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupTitle">Produtores</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupContent"></td>
			</tr>
			<tr class="FieldGroup_BottomMargin"></tr>
			</tbody>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td colspan="4">
		  <div id="divMessagesComissionados"></div>
		</td>
	  </tr>
	  <tr>
		<td colspan="4">
		  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			  <td width="18%" class="TitleCell"><span class="LabelText">Pessoa:</span></td>
			  <td width="32%" class="TextBox_ContentCell" nowrap="nowrap">
				<s:textfield theme="simple" id="propostaComissaoPessoaId" name="proposta.propostaComissaoCollection[].pessoa.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="propostaComissaoPessoaNome" cssClass="dojoValidateValid requiredField TextBox_100percent_width" name="proposta.propostaComissaoCollection[].pessoa.nome"/>
			  </td>
			  <td width="18%">
				<img alt="Loading..." id="loadingMiniAdd" align="left" src="<s:url value="/common/web/images/loadingMini.gif" includeParams="none" />" style="display:none;"/>
			  </td>
			  <td width="32%" class="TextBox_ContentCell"></td>
			  <td class="TitleCell">
			  	<a href="#" class="button" onclick="adicionarComissionado();">
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
			<tr></tr>
		  </table>
		  <sx:div id="divComissionados"></sx:div>
		  <div id="pageloader" style="display:none;">Carregando...<br/></div>
		</td>
	  </tr>
	</table>
  </td>
</tr>
</table>
</div>
</form>
<form id="formComissionados">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:url var="urlCarregarComissionados" action="carregarComissionados.action" includeParams="none"/>
	<s:url var="urlAdicionarComissionado" action="adicionarComissionado.action" includeParams="none"/>
	<s:url var="urlRemoverComissionado" action="removerComissionado.action" includeParams="none"/>
	<s:textfield theme="simple" id="gpPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="gpComissionadoId" name="propostaComissao.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="gpComissaoId" name="propostaComissao.id" cssStyle="display:none"/>
	<sx:submit  type="button" href="%{#urlCarregarComissionados}" validate="true" label="Update Content" targets="divComissionados" formId="formComissionados" id="bindBtnCarregarComissionados" cssStyle="display:none" indicator="pageloader" />
	<sx:submit type="button" href="%{#urlAdicionarComissionado}" validate="true" label="Update Content" targets="divComissionados" formId="formComissionados" id="bindBtnAdicionarComissionado" cssStyle="display:none" indicator="loadingMiniAdd"/>
	<sx:submit type="button" href="%{#urlRemoverComissionado}" validate="true" label="Update Content" targets="divComissionados" formId="formComissionados" id="bindBtnRemoverComissionado" cssStyle="display:none" />

<script type="text/javascript">
$(document).ready(function(){
	setTimeout('carregarComissionados()',1100);
	$("#propostaComissaoPessoaNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#propostaComissaoPessoaId"]});
});
</script>