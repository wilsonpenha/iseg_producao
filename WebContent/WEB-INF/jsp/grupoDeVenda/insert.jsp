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
				  <s:textfield id="corretoraId" name="grupoDeVenda.corretora.id" value="%{corretoraEmUso.id}" cssStyle="display:none" theme="simple" />
				  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="grupoNome" name="grupoDeVenda.nomeDoGrupo" />
				</td>
				<td width="20%" class="TitleCell"><label class="LabelText" for="produtorId">Supervisor: </label></td>
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
			</table>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</div>

<script>
jQuery(document).ready(function(){

	$("#produtorNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#produtorId","#comissao"],onEnterPress:"listaLista()",mustMatch:0});
});
</script>