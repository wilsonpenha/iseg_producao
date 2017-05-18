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
  <div class="tabPane" id="tabPane0" style="height:auto; width:100%; visibility: hidden;">
	<div id="divForm1" style="overflow:auto; height:99%; width:100%">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 2px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <s:textfield theme="simple" name="borderoComissao.id" id="comissaoId" cssStyle="display: none;"/>
		  <s:textfield theme="simple" name="borderoComissao.situacao" id="situacao" cssStyle="display: none;"/>
		  <s:textfield theme="simple" name="borderoComissao.dataLancamento" id="bcDataLancamento" cssStyle="display: none;"/>
		  <fieldset>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<s:if test="borderoComissao.id != null">
				  <tr>
				    <td width="35%">
				      <label class="LabelText" for="seguradoraId">Seguradora</label><br />
					  <s:textfield theme="simple" name="borderoComissao.seguradora.id" id="seguradoraId" cssStyle="display: none;"/>
				      <s:select theme="simple" cssClass="dojoValidateValid requiredField" disabled="true" cssStyle="width: 95%" tabindex="0" id="seguradoraId" name="borderoComissao.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
				    </td>
				</s:if>
				<s:else>
				  <tr>
				    <td>
						<label class="LabelText" for="seguradoNome">Localize a seguradora por um segurado no extrato:</label><br />
						<s:textfield theme="simple" id="seguradoNome" cssClass="TextBox_TwoCells_width" name="seguradoNome" />
				    </td>
				  </tr>
				  <tr>
				    <td width="35%">
				      <label class="LabelText" for="seguradoraId">Seguradora</label><br />
					  <s:textfield theme="simple" name="seguradora.id" id="seguradoraId" cssStyle="display: none;"/>
				      <s:select theme="simple" cssClass="dojoValidateValid requiredField" cssStyle="width: 95%" tabindex="0" id="sSeguradoraId" name="borderoComissao.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
				    </td>
				</s:else>
				<td width="15%">
				   <label class="LabelText" for="dataExtrato">Data do Extrato</label><br />
				   <s:textfield theme="simple" cssClass="clData requiredField" id="dataExtrato" name="borderoComissao.dataDocumento" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
				</td>
				<td width="25%">
				  <label class="LabelText" for="nroExtrato">Nro do Extrato</label><br /> 
				  <s:textfield theme="simple" cssClass="requiredField" id="nroExtrato" name="borderoComissao.nroExtrato" />
				</td>
				<td width="25%">
				  <label class="LabelText" for="valorTotal">Total do Extrato</label><br />
				  <s:textfield theme="simple" cssClass="clValor2 TextBox_OneCells_width requiredField currency" id="valorTotal" name="borderoComissao.valorTotal" onchange="setAlterado(true);" />
				</td>
				<td style="text-align: left; vertical-align: bottom;">
				  <label for="valorPagamento">Total Parcial:</label><br/>
				  <s:textfield theme="simple" readonly="true" cssClass="clValor2 currency" size="15" name="totalParcial" id="totalParcial" />
				</td>
			  </tr>
			</table>
		  </fieldset>
	    </td>
	  </tr>
 	  <s:if test="borderoComissao.id != null">
      <tr>
	  <td>
	  <fieldset>
		  <legend><b>Lançamento</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td>
				<div id="divDadosBaixa">
				<div id="divDadosBaixaDeComissao">
				<table id="tableLancamento" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr><td>
				   <s:textfield theme="simple" name="borderoLancamento.proposta.isFatura" id="isFatura" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.id" id="lancamentoId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.borderoComissao.id" id="borderoComissaoId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.proposta.id" id="propostaId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.situacao" id="situacao" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.sequencia" id="sequencia" value="%{countLancamentos}" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.dataLancamento" id="blDataLancamento" cssStyle="display: none;"/>
				  <div id="lancamento1">
				  <table width="100%" cellpadding="0" cellspacing="0">
				  <tr>
				    <td colspan="6">
				    <fieldset>
		  			<legend><b>Apólice</b></legend>
				    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
					<tr>
						<td class="TextBox_ContentCell">
						  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
						    <td width="30%" class="TitleCell" style="text-align: left"><label class="LabelText" for="ramoId">Ramo</label></td>
						    <td width="70%">
							    <s:textfield theme="simple" name="ramo.subRamo.id" id="ramoId" cssStyle="display: none;"/>
						    	<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 180px" tabindex="0" id="sRamoId" name="borderoLancamento.ramo.subRamo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="limparCampos();carregaSubRamosLote();"/>
						    </td>
						  </tr>
						  <tr>
						  <td colspan="2">
						  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
						    <td width="30%" class="TitleCell" style="text-align: left"><label class="LabelText" for="subRamoId">Sub-Ramo</label>
							    <s:textfield theme="simple" name="ramo.id" id="subRamoId" cssStyle="display: none;"/>
						    </td>
						    <td width="70%"><div id="divRamos"><s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 180px" tabindex="0" id="sSubRamoId" name="borderoLancamento.ramo.id" list="subRamoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/></div></td>
						  </tr>
						  </table>
						  </td>
						  </tr>
						  </table>
						</td>
					    <td class="TextBox_ContentCell"> 
					      <label class="LabelText" for="nomeSegurado">Nome do Segurado</label><br />
						  <s:textfield theme="simple" cssClass="dojoValidateValid" id="nomeSegurado" name="borderoLancamento.nomeSegurado" size="30" />
					    </td> 
					    <td class="TextBox_ContentCell">
					      <label class="LabelText" for="nroApolice">Nro da Apólice</label><br />
						  <s:textfield theme="simple" id="nroApolice" name="borderoLancamento.nroApolice" />
					    </td>
						<td style="text-align: left; vertical-align: bottom;">
						  <label for="valorPagamento">Prêmio Líquido:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="15" name="borderoLancamento.premioLiquido" id="premioLiquido" />
						</td>
						<td class="TextBox_ContentCell">
						  <label for="valorPagamento">Saldo Comissões:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="15" name="saldoComissao" id="saldoComissao" />
						</td>
					    </tr>
				    </table>
				    </fieldset>
				    </td>
				  </tr>
				  <tr>
					<td colspan="6">
					<fieldset>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
						<td style="text-align: left; vertical-align: bottom; padding-bottom: 2px;" width="25%">
						   <label class="LabelText" for="tipoLancamento">Tipo Lanc.</label><br/>
						   <s:select theme="simple" cssClass="Combo Combo_OneCells_width" id="tipoLancamento" name="borderoLancamento.tipoLancamento.id" list="tipoLancamentoByCorretoraList" listKey="id" listValue="nome" value="0" headerKey="" headerValue="-- Selecione --"/>
						</td>
						<td colspan="2" style="text-align: left; vertical-align: bottom;  bottom; padding-bottom: 2px;">
						  <div id="divNroParcela">
						  <label for="nroDaParcela">Parcela:</label><br/>
						  <s:textfield theme="simple" cssClass="dojoValidateValid currency" name="borderoLancamento.nroParcela" id="nroParcela" size="10"/>
						  </div>
						  <div id="divParcelaReferencia" style="display: none;">
						  <label for="parcelaReferencia">Parcela Ref.:</label><br/>
						  <s:textfield theme="simple" cssClass="dojoValidateValid clParcelaReferencia" name="referencia" id="referenciaParcela" size="7"/> mm/aaaa
						  </div>
						</td>
						<td style="text-align: left; vertical-align: bottom;  bottom; padding-bottom: 2px;">
						  <label for="valorPagamento">% Comissão:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="10" name="borderoLancamento.percentualComissao" id="percentualComissao" />
						</td>
						<td style="text-align: left; vertical-align: bottom;  bottom; ">
						  <label for="valorPagamento">Valor/Comissão:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 clCalculator currency" size="13" name="borderoLancamento.valorComissao" id="valorComissao" />
						</td>
						<s:if test="borderoComissao.situacao == 0  && borderoComissao.id != null">
						<td style="text-align: left; vertical-align: bottom;" width="10%">&nbsp;<br />
						  <a href="#" class="button" onclick="inserirLancamento();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Adicionar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						<td style="text-align: left; vertical-align: bottom;" width="15%">&nbsp;<br />
						  <a href="#" class="button" onclick="inserirLancamentoLimpar();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Adicionar/Limpar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						<td style="text-align: left; vertical-align: bottom;" width="10%">&nbsp;<br />
						  <a href="#" class="button" onclick="limpar();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Limpar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						</s:if>
						<s:else>
						<td style="text-align: left; vertical-align: bottom;" width="35%">&nbsp;<br /></td>
						</s:else>
					  </tr>
					</table>
					</fieldset>
						</td>
					  </tr>
					  </table>
					  </div>
					</td>
				  </tr>
				  <tr>
				     <td>
				      <br/>
				  </td>
				  </tr>
				</table>
				</div>
				<div id="divListaComissoes">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="10%">Tipo</td>
					  <td width="15%">Ramo</td>
					  <td width="5%">Apólice</td>
					  <td width="25%">Segurado</td>
					  <td width="5%">Parc</td>
					  <td width="8%">Prêmio</td>
					  <td width="8%">% Comissão</td>
					  <td width="8%">Comissão</td>
					  <td width="8%">Situação</td>
					</tr>
					<s:iterator value="borderoLancamentoList" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].id" id="borderoLancamentoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].proposta.id" id="propostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].borderoComissao.id" id="borderoComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].ramo.id" id="ramoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroApolice" id="nroApolice%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nomeSegurado" id="nomeSegurado%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroParcela" id="nroParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].referenciaParcela" id="referenciaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].premioLiquido" id="premioLiquido%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].percentualComissao" id="percentualComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].valorComissao" id="valorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].sequencia" id="sequencia%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].situacao" id="situacao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].tipoLancamento.id" id="tipoLancamento%{#stat.index}" cssStyle="display: none;"/>
						<s:if test="situacao < 2">
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeLancamento('<s:property value="id"/>');}"/>
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarLancamento('<s:property value="id"/>');}"/>
						</s:if>
					  </td>
					  <td><s:property value="tipoLancamento.nome"/>&nbsp;</td>
					  <td ><s:property value="ramo.nomeRamoSubRamo"/>&nbsp;</td>
					  <td ><s:property value="nroApolice"/>&nbsp;</td>
					  <td ><s:property value="nomeSegurado"/>&nbsp;</td>
					  <s:if test="ramo.id==5 || ramo.subRamo.id=10">
						  <td align="center"><fmt:formatDate value="${referenciaParcela}" pattern="MM/yyyy"/></td>
					  </s:if>
					  <s:else>
						  <td align="right"><s:property value="nroParcela"/>&nbsp;</td>
					  </s:else>
					  <td align="right"><fmt:formatNumber value="${premioLiquido}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${percentualComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td ><s:property value="situacaoDesc"/>&nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>
				</div>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
		  </td>
		</tr>
		</s:if>
	</table>
	</div>
  </div>
  
<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>

<script>

$().ready(function() {

	//$("#nroApolice").autocomplete('<s:url value="/objlookup/getComissoesPorNroApoliceList.action" includeParams="none" />', {idFieldsToUpdate:["#nomeSegurado","#percentualComissao","#valorComissao","#premioLiquido","#nroParcela","#propostaId"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#nroApolice").autocomplete('<s:url value="/objlookup/getComissoesPorNroApoliceList.action" includeParams="none" />', {idFieldsToUpdate:["#ramoId","#subRamoId","#nomeSegurado","#percentualComissao","#propostaId","#valorComissao","#nroParcela","#referenciaParcela","#saldoComissao","#premioLiquido","#referenciaParcela","#isFatura"],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});
	$("#nomeSegurado").autocomplete('<s:url value="/objlookup/getComissoesPorNomeSeguradoList.action" includeParams="none" />', {idFieldsToUpdate:["#ramoId","#subRamoId","#nroApolice","#propostaId","#percentualComissao","#valorComissao","#nroParcela","#referenciaParcela","#saldoComissao","#premioLiquido","#referenciaParcela","#isFatura"],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});

	setTimeout(function(){
		if ($("#isFatura").val() == 'true'){
			$("#divParcelaReferencia").show();
			$("#divNroParcela").hide();
			$('#parcelaReferencia').attr('disabled',false);
			$('#nroParcela').attr('disabled',true);
		}else{
			$("#divParcelaReferencia").hide();
			$("#divNroParcela").show();
			$('#parcelaReferencia').attr('disabled',true);
			$('#nroParcela').attr('disabled',false);
		}
	},250);

	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clParcelaReferencia").setMask({mask : '19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"-000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});

	showDivs('0'); 	
});


	init();
 	focusFirst();	
	showDivs('0'); 	

</script>
<% } catch (Exception e) {e.printStackTrace();}%>