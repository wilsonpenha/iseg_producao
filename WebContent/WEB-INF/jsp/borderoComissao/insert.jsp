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
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="grupoVendaNome" name="grupoDeVenda.nomeDoGrupo" readonly="true"/>
			  </td>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="produtorGerenteNome">Supervisor</label></td>
			  <td width="32%" class="TextBox_ContentCell">
			  	<s:textfield theme="simple" name="grupoDeVenda.produtorGerente.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="produtorGerenteNome" name="grupoDeVenda.produtorGerente.nome" readonly="true"/>			  
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
		  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			  <td width="18%" class="TitleCell"><span class="LabelText">Pessoa:</span></td>
			  <td width="28%" class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="propostaComissaoPessoaId" name="proposta.propostaComissaoCollection[].pessoa.id" list="clienteList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
			  </td>
			  <td width="18%" class="TitleCell"><span class="LabelText">Comissão:</span></td>
			  <td width="28%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width requiredField" id="propostaComissaoPercComissao" name="proposta.propostaComissaoCollection[].percentualComissao" onkeypress="return formatNumber(this, event, 2, 5);" cssStyle="text-align: right;" />
			  </td>
			  <td width="8%">
				<a href="#" class="button" onclick="addPropostaComissao();" title="Adicionar Observador">
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
		  <table id="tableProdutorItens" class="listItens">
			<tr class="listItensHeader">
			  <td width="57%">Nome</td>
			  <td width="40%">Perc. Comissão</td>
			  <td width="3%">X</td>
			</tr>
			<s:iterator value="grupoDeVenda.grupoProdutorCollection" status="stat">
			  <tr>
				<td>
					<input type="hidden" id="pessoaId" name="proposta.propostaComissaoCollection[${stat.index}].pessoa.id" value="<s:property value="pessoa.id"/>" />
					<input type="hidden" id="pessoaId" name="proposta.propostaComissaoCollection[${stat.index}].proposta.id" value="${proposta.id}" />
					<s:property value="pessoa.nome"/>
				</td>
				<td class="element">
					<input type="text" class="dojoValidateValid TextBox_100percent_width" id="percentualComissao" name="proposta.propostaComissaoCollection[${stat.index}].percentualComissao" value="<s:property value="pessoa.comissao"/>" onkeypress="return formatNumber(this, event, 2, 5);" onchange="alert('change')" style="text-align: right;"/>
				</td>
				<td class="small_image"><img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none" />" onclick="removeRow(tableProdutorItens, this.parentNode.parentNode.rowIndex);"/></td>
			  </tr>
			</s:iterator>
		  </table>
		</td>
	  </tr>
	</table>
  </td>
</tr>
</table>
</div>
<script type="text/javascript"></script>