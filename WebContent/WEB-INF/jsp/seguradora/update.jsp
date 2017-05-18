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
					<td class="FieldGroupTitle_MaxSize">Seguradora</td>
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
			<td width="12%" class="TitleCell"><label class="LabelText" for="razaoSocialId">Razão Social:</span></td>
			<td width="38%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="formEdit_seguradora.id" name="seguradora.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="formEdit_seguradora.isGeneric" name="seguradora.isGeneric" value="true" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="razaoSocialId" name="seguradora.razaoSocial" maxlength="60"/>
			</td>
			<td width="12%" class="TitleCell"><label class="LabelText" for="cpfOuCnpjId">CNPJ:</label></td>
			<td width="38%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="cpfOuCnpjId" name="seguradora.cpfOuCnpj"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><label class="LabelText" for="formEdit_seguradoraId">Nome:</label></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="formEdit_seguradoraId" name="seguradora.nome" maxlength="60"/>
			</td>
			<td class="TitleCell"><label class="LabelText" for="inscricaoSusepId">Inscrição SUSEP: </label></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="inscricaoSusepId" name="seguradora.inscricaoSusep" maxlength="25"/>
			</td>				
		  </tr>
			<tr>
		      <td width="18%" class="TitleCell"><label class="LabelText" for="paramSeguradoraId">CIA Agrupadora:</label></td>
		      <td width="32%" class="Combo_ContentCell">
				<s:textfield theme="simple" id="ciaAgrupadoraId" name="seguradora.ciaAgrupadora.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="ciaAgrupadoraNome" cssClass="TextBox_TwoCells_width" name="seguradora.ciaAgrupadora.nome" onblur="javascript:if (isEmpty('#ciaAgrupadoraNome')){$('#ciaAgrupadoraId').val('');}"/>
		      </td>
			  <td width="18%" class="TitleCell"><label class="LabelText" for="">&nbsp;</label></td>
			  <td width="32%" class="TextBox_ContentCell">
				&nbsp;
			  </td>
			</tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Inscrição Estadual:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_seguradora.inscrEstadual" name="seguradora.inscrEstadual" maxlength="14"/>
			</td>					
			<td class="TitleCell"><span class="LabelText">Site:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="siteHomePageId" name="seguradora.siteHomePage" maxlength="100"/>
			</td>
		  </tr>					
		  <tr>
			<td class="TitleCell"><span class="LabelText">Data de Fundação:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="dataFundacaoId" name="seguradora.dataFundacao" onblur="isValidDate(this)"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Valor	do Patrimônio:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="TextBox_TwoCells_width currency" id="formEdit_seguradora.valorPatrimonio" name="seguradora.valorPatrimonio" onkeypress="return formatNumber(this, event, 2);"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Pessoa Contato:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="pessoaContatoId" name="seguradora.pessoaContato" maxlength="60"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Inscrição	Municipal:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="inscricaoMunicipalId" name="seguradora.inscricaoMunicipal" maxlength="15"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Telefone: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_seguradora.telefones" name="seguradora.telefones" maxlength="40"/>
			</td>					
			<td class="TitleCell"><label class="LabelText" for="dominioEsp">Atividade Comercial:</label></td>
			<td class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width requiredField" id="dominioEsp" name="seguradora.atividadeComercial.id" list="dominioEspList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Comissão Mínima:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clValor2 dojoValidateValid TextBox_TwoCells_width" id="percComissaoMin" name="seguradora.percComissaoMin" maxlength="7"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Comissão Máxima:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clValor2 dojoValidateValid TextBox_TwoCells_width" id="percComissaoMax" name="seguradora.percComissaoMax" maxlength="7"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Custo de Apólice:</span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="clValor2 dojoValidateValid TextBox_TwoCells_width" id="custoApolice" name="seguradora.custoApolice" maxlength="12"/>
			</td>
			<td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda Padrão: </label></td>
			<td class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="grupoDeVendaId" name="seguradora.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" onchange="alert('Esta alteração não tem efeito sobre proposta existentes!\n');"/>
	 		</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><span class="LabelText">Telefone 0800: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_seguradora.telefones" name="seguradora.telefone0800" maxlength="15"/>
			</td>					
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
</form>
<form name="formSeguradoraTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="id"/>
	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="seguradora.id"/>"/>
	<input type="hidden" name="perfil.seguradora.id" value="<s:property value="seguradora.id"/>"/>
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="seguradora.id"/>"/> 
	<input type="hidden" name="servicos.seguradora.id" value="<s:property value="seguradora.id"/>"/> 
	<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="seguradora.id"/>"/>


<script type="text/javascript">

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});
 	
 })

$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpjId'),"99.999.999/9999-99");
	MaskInput(document.getElementById('dataFundacaoId'),"99/99/9999");
	
	$("#ciaAgrupadoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#ciaAgrupadoraId"],mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	
});
</script>