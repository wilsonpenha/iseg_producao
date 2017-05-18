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
			  <td class="FieldGroupTitle_MaxSize">Estorno de lançamento</td>
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
				 <s:textfield theme="simple" id="repasseComissaoId" name="repasseComissao.id" cssStyle="display:none;"/>
				 <s:textfield theme="simple" id="origemLancamento" name="repasseComissao.origemLancamento" cssStyle="display:none;"/>
				 <s:textfield theme="simple" id="dataLancamento" name="repasseComissao.dataLancamento" readonly="true" onblur="isValidDate(this)" size="12" maxlength="10"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Produtor: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
				 <s:textfield theme="simple" id="produtorId" name="repasseComissao.produtor.id" cssStyle="display:none;"/>
			     <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="produtorNome" readonly="true" name="repasseComissao.produtor.pessoa.nome"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Descrição: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
			     <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="descricao" readonly="true" maxlength="100" name="repasseComissao.descricao"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Valor do lançamento: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
			     <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2" readonly="true" id="valorPago" name="repasseComissao.valorPago"/> 
			  </td>
			</tr>
		    <tr>
			  <td width="20%" class="TitleCell" align="left"><span class="LabelText">Crédito/Debito: </span></td>
		  	  <td width="30%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" id="tipoLancamentoId" name="repasseComissao.tipoLancamento" cssStyle="display:none;"/>
			      <s:select theme="simple" cssClass="Combo requiredField" id="tipoLancamento" disabled="true" name="repasseComissao.tipoLancamento" list="#{'':'-- Selecione --','0':'DEBITO','1':'CREDITO'}"/>
		  	  </td>
		    </tr>
		    <tr>
			  <td width="20%" class="TitleCell" align="left"><span class="LabelText">Situação: </span></td>
		  	  <td width="30%" class="TextBox_ContentCell">
				  <s:textfield theme="simple" id="situacaoId" name="repasseComissao.situacao" cssStyle="display:none;"/>
			      <s:select theme="simple" cssClass="Combo requiredField" id="situacao" disabled="true" name="repasseComissao.situacao" list="#{'0':'NAO PAGO','2':'PAGO','4':'ESTORNADO'}"/>
		  	  </td>
		    </tr>
			<tr>
			  <td width="20%" class="TitleCell"><span class="LabelText">Motivo do estorno: </span></td>
			  <td width="30%" class="TextBox_ContentCell">
			     <s:textfield theme="simple" cssClass="TextBox_TwoCells_width" id="motivoEstorno" maxlength="100" name="repasseComissao.motivoEstorno"/>
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
			<s:if test="repasseComissao.repasseOrigem==null && repasseComissao.dataEstorno==null">
			  <td>
				<input type="button" id="btnf3" style="display: none;" onclick="estornarLancamento();"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
				onclick="document.getElementById('btnf3').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Estornar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			</s:if>
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

function estornarLancamento(){
	if ($("#motivoEstorno").val().trim()==""){
		alert("Informe o Motivo do estorno p/ o lançamento!");
		$("#motivoEstorno").focus();
		return false;;
	}
	if (confirm('Confirma o estorno do lançamento no repasse do produtor?')){
		submitForm(document.formEdit, '<s:url action="salvarLista.action" includeParams="none" />', true);
	}
}

function listaLista(){
	$("#produtorId").val('');
	$("#produtorNome").val('');
	submitForm(document.formEdit, '<s:url action="displayList.action" includeParams="none" />', true);
}
</script>