<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
			  <td class="FieldGroupTitle_MaxSize">Lançamento no Conta Corrente do Produtor</td>
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
			  <td width="20%" class="TitleCell"><span class="LabelText">Data: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
				 <s:textfield theme="simple" id="origemLancamento" name="repasseComissao.origemLancamento" value="1" cssStyle="display:none;"/>
				 <s:textfield theme="simple" id="situacao" name="repasseComissao.situacao" value="0" cssStyle="display:none;"/>
				 <s:textfield theme="simple" id="dataLancamento" name="repasseComissao.dataLancamento" onblur="isValidDate(this)" size="12" maxlength="10"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Produtor: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
				 <s:textfield theme="simple" id="produtorId" name="repasseComissao.produtor.id" cssStyle="display:none;"/>
			     <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="produtorNome" name="repasseComissao.produtor.pessoa.nome"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Descrição: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
			     <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="descricao" maxlength="100" name="repasseComissao.descricao"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Valor do lançamento: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
			     <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor4" id="valorPago" name="repasseComissao.valorPago"/> 
			  </td>
			</tr>
		    <tr>
			  <td width="20%" class="TitleCell" align="left"><span class="LabelText">Crédito/Debito: </span></td>
		  	  <td width="30%" class="TextBox_ContentCell">
			      <s:select theme="simple" cssClass="Combo requiredField" id="tipoLancamento" name="repasseComissao.tipoLancamento" list="#{'':'-- Selecione --','0':'DEBITO','1':'CREDITO'}"/>
		  	  </td>
		    </tr>
		  </table>
		</td>
	  </tr>
	<tr>
	  <td colspan="4" class="Button_RightAlign_ContentCell">
		<div align="center">
		  <table>
			<tr>
			  <td>
				<input type="button" id="btnf3" style="display: none;" onclick="salvarLancamento();"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
				onclick="document.getElementById('btnf3').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Salvar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			  <td>
				<input type="button" id="btnf4" style="display: none;" onclick="listaLista();"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
				onclick="document.getElementById('btnf4').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</div>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
</div>
<script type="text/javascript">

function salvarLancamento(){
	camposOK = true;
	if (camposOK && $("#produtorId").val()==""){
		alert("Informe o Produtor p/ lançamento!");
		$("#produtorNome").focus();
		camposOK=false;
	}
	if (camposOK && $("#descricao").val().trim()==""){
		alert("Informe uma descrição para o lançamento!");
		$("#descricao").focus();
		camposOK=false;
	}
	if (camposOK && converte_numero($("#valorPago").val())==0.00){
		alert("Informe um valor maior que zero p/ lançamento!");
		$("#valorPago").focus();
		camposOK=false;
	}
	if (camposOK && $("#tipoLancamento").val()==""){
		alert("Informe se é Debito ou Credito ao Produtor selecionado!");
		$("#tipoLancamento").focus();
		camposOK=false;
	}
	if (camposOK && confirm('Confirma a inclusão do lançamento no repasse do produtor?')){
		submitForm(document.formEdit, '<s:url action="salvarLista.action" includeParams="none" />', true);
	}
}

function listaLista(){
	$("#produtorId").val('');
	$("#produtorNome").val('');
	submitForm(document.formEdit, '<s:url action="displayList.action" includeParams="none" />', true);
}
jQuery(document).ready(function(){

	$("#produtorNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#produtorId"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
});
</script>