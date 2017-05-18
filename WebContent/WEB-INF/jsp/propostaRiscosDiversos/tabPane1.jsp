<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<script language="javascript">

$(function() {
	$("#accordion").accordion({
		active: false, 
        collapsible: true, 
        autoHeight: true 
	});
});

</script>

<div id="divForm2" style="width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td colspan="4">
			<s:textfield theme="simple" id="itemCorrente" name="itemCorrente" cssStyle="display:none;" />
			<s:textfield theme="simple" id="itens" name="itens" cssStyle="display:none;" />
			<div class="demo" id="demo">
			<div id="accordion" style="height: 0px;width: 100%; line-height: 0px;">
			<a id="itensSegurados" href="#" style="display:none; padding: 0.0em 0.0em 0.0em 0.0em; height: 0px;" onclick="setTimeout(function(){if (navigator.userAgent.indexOf('Chrome') > -1){$('#accordionContent').css('height',$('#divListaImoveis').css('height'))}},400);"></a>
			  <div id="accordionContent" style="margin-top: 1px; padding: 1px;background: #E8E8E8 none repeat scroll 0 0; -moz-border-radius: 4px; border: 1px solid #AAAAAA; z-index: 100;">
			  <div id="divListaImoveis" style="padding: 0px; background: #E8E8E8 none repeat scroll 0 0;">
				<table id="tableRiscoItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="5%" nowrap="nowrap">Ações</td>
					<td width="25%" nowrap="nowrap">Risco</td>
					<td width="5%" nowrap="nowrap">CEP</td>
					<td width="30%" nowrap="nowrap">Logradouro</td>
					<td width="15%" nowrap="nowrap">Bairro</td>
					<td width="15%" nowrap="nowrap">Cidade</td>
					<td width="5%" nowrap="nowrap">UF</td>
				  </tr>
				  <s:iterator value="riscoDiversosList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerItem('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarRisco('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="descricaoRiscoCurto"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cep"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="logradouro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="bairro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cidade"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="uf"/>&nbsp;</td>
					</tr>
				  </s:if>
				  </s:iterator>
				</table>
			  	<table style="margin-left:10px; -moz-border-radius: 4px;">
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="$('#itensSegurados').click();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Fechar</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  	<td>
				      <a href="#" class="button" onclick="novoItem();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo Item</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  </tr>
				</table>
			  </div>
			  </div>
			</div><!-- End accordion -->
			</div><!-- End demo -->
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
      <table style="height: 32px; -moz-border-radius: 4px; border: 1px solid #AAAAAA;" class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
        <tr>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="novoItem();" class="Main_ToolBar_Button" onMouseOver="window.status='Novo Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNew"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New" src="<s:url value="/common/web/images/blank.gif" />" title="Novo Registro" border="0" id="buttonNew"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="if(confirma('Confirma exclusão?')){removerItem();}" class="Main_ToolBar_Button" onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Registro"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="$('#itensSegurados').click();" class="Main_ToolBar_Button" onMouseOver="window.status='Efetuar uma Busca';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Efetuar uma busca"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="primeiroItem();" class="Main_ToolBar_Button" onmouseover="window.status='Primeiro Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonPrevious" title="Primeiro item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="itemAnterior();" class="Main_ToolBar_Button" onmouseover="window.status='Item Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Item anterior"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="proximoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Próximo Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Proximo Item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="ultimoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Último Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonNext" title="Ultimo Item"/></a></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark">${itemCorrente+1} / ${itens}</nobr></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td class="Main_ToolBar_Space"></td>
        </tr>
      </table>
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 1px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="R"><b>Dados do <u>R</u>isco</b></legend>
		  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label for="cepRis"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');">CEP</a></label><br />
				<s:textfield theme="simple" id="riscoAlterado" name="riscoAlterado" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoId" name="proposta.riscoDiversosCollection[%{itemCorrente}].id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoPropostaId" name="proposta.riscoDiversosCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoLinhaVazia" name="proposta.riscoDiversosCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
				<s:textfield theme="simple" id="endRisTipoEndereco" name="proposta.riscoDiversosCollection[%{itemCorrente}].tipoEndereco" value="R" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].cep" size="11" maxlength="9" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="lograRis">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].logradouro" cssStyle="width:98%" maxlength="60" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compRis">Complemento</label><br />
				<s:textfield theme="simple" id="compRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].complemento" cssStyle="width:98%" maxlength="60" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRis">Número</label><br />
				<s:textfield theme="simple" id="numeroRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].numero" maxlength="6" size="8"/>
			  </td>
			  <td width="15%">
				<label for="foneRis">Fone Residencial</label><br />
				<s:textfield theme="simple" id="foneRis" cssClass="clFone" name="proposta.riscoDiversosCollection[%{itemCorrente}].telefone" size="16" maxlength="20" onchange="setRiscoAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroRis">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].bairro" cssStyle="width:98%" maxlength="50" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeRis">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].cidade" cssStyle="width:98%" maxlength="35" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufRis">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufRis" headerKey="" headerValue="-- Selecione --" name="proposta.riscoDiversosCollection[%{itemCorrente}].uf" list="ufList" listKey="uf" listValue="nome" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="faxRis">Fax</label><br />
				<s:textfield theme="simple" id="faxRis" cssClass="clFone" name="proposta.riscoDiversosCollection[%{itemCorrente}].fax" size="16" maxlength="20" onchange="setRiscoAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			<td colspan="5">
			    <a href="#" class="button" onclick="importarEnderecoCliente();" tabindex="-1">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Importar Dados Cliente</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>   
		<tr>
		  <td colspan="5">
			<fieldset>
			<legend accesskey="o"><b><u>D</u>escricao do Risco</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				  Observações:<br/>
				  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="5" id="descricaoRisco" name="proposta.riscoDiversosCollection[%{itemCorrente}].descricaoRisco" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setRiscoAlterado(true);" />
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  <tr>
		<td colspan="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td>
				<fieldset>
				<legend accesskey="o"><b>Coberturas Contratadas</b></legend>
				  
				  <div id="divListaCoberturas">
				<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="25%">Descrição</td>
					<td width="30%">Observações</td>
					<td width="15%">LMI</td>
					<td width="15%">Prêmio Cobertura</td>
					<td width="15%">Franquia</td>
				  </tr>
				  <s:iterator value="riscoCoberturaList" status="stat">
				  <s:if test="coberturas.id != null">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="riscoCoberturasId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].riscoDiversos.id" value="%{riscoDiversos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].descricao" value="%{coberturas.descricao}" disabled="true" size="30" onchange="setRiscoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="riscoCoberturasId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].riscoDiversos.id" value="%{riscoDiversos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setRiscoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>            
				  </div>
				  <table>
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>                                
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
  </div>
  
   
<script>

	//$('#itensSegurados').click();
	$("#cepRis").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRis", "#cidadeRis","#ufRis","#lograRis"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	//enableDisableDadosCobertura();

	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}
	
// define a mascara padrão para telefone  
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"000"});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clNumero4").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
 	
 });
	
</script>

<% } catch (Exception e) {e.printStackTrace();}%>