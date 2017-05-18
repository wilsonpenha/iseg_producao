<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<div id="divModalLinkProposta" style="display:none; z-index: 1000; width:760px;" >
	<div id="divLinkProposta">
		<form id="formLinkProposta" name="formLinkProposta">
			<s:textfield theme="simple" name="borderoLancamento.dataLancamento"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.nroDocumento"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.nroProposta"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.nroEndosso"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.cpfOuCnpj"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.segurado.id"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.nroParcela"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.referenciaParcela"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.percentualComissao"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.valorComissao"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.borderoComissao.id"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.sequencia"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.situacao"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.tipoLancamento.id"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.usuario.id"  cssStyle="display: none;"/>
			<s:textfield theme="simple" name="borderoLancamento.isRepasse"  cssStyle="display: none;"/>
		  	<s:textfield theme="simple" name="borderoLancamento.id" id="modalLancamentoId" cssStyle="display: none;"/>
		  	<s:textfield theme="simple" name="borderoLancamento.ramo.id" id="modalLancamentoId" cssStyle="display: none;"/>
		  	<s:textfield theme="simple" name="borderoLancamento.ramo.subRamo.id" id="modalLancamentoId" cssStyle="display: none;"/>
		  	<s:textfield theme="simple" name="proposta.id" id="modalPropostaId" cssStyle="display: none;"/>
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
			<tr id="paramParentTabContainer">
			  <td class="tabBackGroundInit" style="background-color: #505050"></td>
			</tr>
			<tr id="paramMainTabContainer">
			  <td class="tabBackGroundInit" style="background-color: #505050">
				<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
					Referenciar a Proposta
				</span>
			  </td>
			</tr>
		  </table>
		  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		  	<fieldset>
				<table width="100%" cellpadding="0" cellspacing="0" border="0" >
					<tr>
					    <td width="50%" class="TitleCell" style="text-align: left">
					    	<label class="LabelText" for="ramoId">Ramo</label><br />
					    	<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" disabled="true" cssStyle="width: 180px" tabindex="0" id="modalRamoId" name="borderoLancamento.ramo.id" list="ramosList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/>
					    </td>
					    <td width="30%" class="TitleCell" style="text-align: left">
					    	<label class="LabelText" for="subRamoId">Sub-Ramo</label><br />
				    		<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" disabled="true" cssStyle="width: 180px" tabindex="0" id="modalSubRamo" name="borderoLancamento.ramo.subRamo.id" list="subRamoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/>
						</td>
					</tr>
					<tr>
					    <td class="TextBox_ContentCell"> 
					      <label class="LabelText" for="nomeSegurado">Nome do Segurado</label><br />
						  <s:textfield theme="simple" cssClass="dojoValidateValid" id="nomeSeguradoModal" name="borderoLancamento.nomeSegurado" style="width: 97%;"/>
					    </td> 
					    <td class="TextBox_ContentCell">
					      <label class="LabelText" for="nomeSegurado">Cpf/Cnpj Segurado</label><br />
						  <s:textfield theme="simple" cssClass="dojoValidateValid" id="nomeSeguradoModal" name="borderoLancamento.cpfOuCnpj.valor" style="width: 97%;"/>
					    </td> 
				    </tr>
				    <tr>
				    	<td class="TextBox_ContentCell">
					      <label class="LabelText" for="nroApolice">Nro da Apólice</label><br />
	<%--				      <s:textfield theme="simple" id="modalPropostaId" name="borderoLancamento.proposta.id" style="display:none"/>--%>
					      <s:textfield theme="simple" name="borderoLancamento.nroApoliceAnterior" value="%{borderoLancamento.nroApolice}" style="display:none"/>
					      <s:textfield theme="simple" cssClass="clTextoRestritoModal" id="nroApoliceModal" name="borderoLancamento.nroApolice"/>
					    </td>
						<td style="text-align: left; vertical-align: bottom;">
						  <label for="valorPagamento">Prêmio Líquido:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="15" name="borderoLancamento.premioLiquido" id="premioLiquido" readonly="true" />
						</td>
						<td>
						  <a href="#" class="button" onclick="consultaBorderoLancamento();" >
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Pesquisar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
				    </tr>
			    </table>
		    </fieldset>
		    <div style="height: 234px; overflow: auto;">
		    	<table id="tableListaPropostas" class="listItens">
					  <tr class="listItensHeader">
						<td width="5%" nowrap="nowrap">Ação</td>
						<td width="40%" nowrap="nowrap">Segurado</td>
						<td width="20%" nowrap="nowrap">CPF</td>
						<td width="5%" nowrap="nowrap">Apólice</td>
						<td width="5%" nowrap="nowrap">Proposta</td>
						<td width="5%" nowrap="nowrap">Loc</td>
						<td width="10%" nowrap="nowrap">Fase</td>
						<td width="10%" nowrap="nowrap">Situação</td>
					  </tr>
					  <s:iterator value="propostaList" status="stat">
					  	<tr style="display:none;">
					  		<td>
								<s:textfield name="id" value="%{id}"/>
					  		</td>
					  	</tr>
					  	<tr>
					  		<td ><input type="radio" name="borderoLancamento.proposta.id" value="<s:property value="%{id}"/>"/></td>
					  		<td ><s:property value="%{cliente.nome}"/></td>
					  		<td ><s:property value="%{cliente.cpfOuCnpj}"/></td>
					  		<td ><s:property value="%{nroApolice}"/></td>
					  		<td ><s:property value="%{nroPropostaSeg}"/></td>
					  		<td ><a href="#" onclick="editProposta(<s:property value="%{id}"/>);"><s:property value="%{numero}"/></a></td>
							<td ><s:property value="getStatusOperacionalDescricao(statusOperacional)"/></td>
							<td ><s:property value="getSituacaoOperacionalDescricao(situacaoOperacional,terminoVigencia)"/></td>
					  	</tr>
					  </s:iterator>
			    </table>
		    </div>
		  </div>
		</form>
		<table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100; left: 10px; width: 100%;">
		  <tr>
			<td align="right" width="50%">
			  <a href="#" class="button" onclick="editarBorderoLancamento();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Salvar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td align="left" width="50%">
			  <a href="#" class="button" onclick="closeModal();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
<%--		<script>--%>
<%--		$().ready(--%>
<%--					function() {--%>
<%--						$("#nroApoliceModal").autocomplete('<s:url value="/objlookup/getComissoesPorNroApoliceList.action" includeParams="none" />', {idFieldsToUpdate:[null,null,"#nomeSeguradoModal",null,"#modalPropostaId",null,null,null,null,null,null,null],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});--%>
<%--						$("#nomeSeguradoModal").autocomplete('<s:url value="/objlookup/getComissoesPorNomeSeguradoList.action" includeParams="none" />', {idFieldsToUpdate:["#ramoId","#subRamoId","#nomeSeguradoModal","#percentualComissao","#propostaId","#valorComissao","#nroParcela","#referenciaParcela","#saldoComissao","#premioLiquido","#referenciaParcela","#isFatura"],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});--%>
<%--						$("#nomeSeguradoModal").autocomplete('<s:url value="/objlookup/getComissoesPorNomeSeguradoList.action" includeParams="none" />', {idFieldsToUpdate:[null,null,"#nomeSeguradoModal",null,"#propostaId",null,null,null,null,null,null,null],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});--%>
<%--						$("#nomeSeguradoModal").autocomplete('<s:url value="/objlookup/getComissoesPorNomeSeguradoList.action" includeParams="none" />', {idFieldsToUpdate:[null,null,"#nroApoliceModal","#modalPropostaId",null,null,null,null,null,null,null,null],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){carregarProposta();},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});--%>
<%--					}--%>
<%--				 );--%>
<%--		</script>--%>
	</div>
	<input class="modalClose" id="closeDivLink" style="display:none;" />
</div>
<% } catch (Exception e) {e.printStackTrace();}%>