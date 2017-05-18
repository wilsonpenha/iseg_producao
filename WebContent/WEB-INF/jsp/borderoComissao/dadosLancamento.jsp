<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
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
						   <s:select theme="simple" cssClass="Combo Combo_OneCells_width" id="tipoLancamento" name="borderoLancamento.tipoLancamento.id" list="tipoLancamentoByCorretoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/>
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

<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>

<script>

$().ready(function() {
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
		//carregaSubRamosLote();
	},250);


	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    $(".clParcelaReferencia").setMask({mask : '19/9999', autoTab: false});
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"-000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});

})

</script>
<% } catch (Exception e) {e.printStackTrace();}%>