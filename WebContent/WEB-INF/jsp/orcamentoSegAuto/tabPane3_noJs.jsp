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
    <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab2" style="padding-bottom: 10px;">
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
		  <fieldset>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td width="15%">
					<label for="dataOrcamento">Data</label><br/>
					<s:textfield theme="simple" cssClass="readonly" id="dataOrcamento" disabled="true" value="%{orcamentoSeguro.dataOrcamento}" onblur="isValidDate(this)" size="13" onchange="setAlterado(true);" />
				  </td>
				  <td width="20%">
				    <label for="situacaoOperacionalId">Situação</label><br/>
				    <s:select theme="simple" cssClass="Combo readonly" id="statusOrcamentoId" disabled="true" emptyOption="false" listKey="id" listValue="descricao" value="%{orcamentoSeguro.situacao.id}" list="statusOrcamentoList" name="statusOrcamento[]"/>
				  </td>
				  <td width="20%">
					<label for="ramoNome">Ramo</label><br />
					<s:textfield theme="simple" size="30" id="ramoNome" value="%{orcamentoSeguro.ramo.nome}" cssClass="readonly" disabled="true" readonly="true" tabindex="-1" />	
				  </td>
				  <td width="15%">
				  	<label for="ramoNome">Versão da Cotação</label><br />
				  	<s:textfield theme="simple" size="15" id="ramoNome" value="%{orcamentoSeguro.numero}" cssClass="readonly" readonly="true" />
				  </td>
				</tr>
			  </table>
		  </fieldset>
	    </td>
	  </tr>
	  <tr>
	  	<td>
			<fieldset>
				<legend>Coberturas</legend>
				<div id="divTableCoberturas">
				<table width="100%" id="tableCoberturas">
					<tr>
						<td>
							<label>TIPO DE COBERTURA</label>
						</td>
						<td>
							<s:select headerKey="" headerValue="-- Selecione --" list="tipoCobertura" name="orcamentoSeguro.tipoCobertura.id" listKey="id" listValue="descricao" cssClass="Combo_OneCell_width" />
						</td>
					</tr>
					<tr>
						<td width="23%" valign="bottom">
							<label>COBERTURA CASCO:</label>
						</td>
						<td width="12%" valign="bottom">
							<s:select theme="simple"  list="#{'VR':'VALOR REFERENCIADO','VD':'VALOR DETERMINADO'}" name="orcamentoSeguro.automovelOrcamentoCollection[0].tipoIndenizacao" cssClass="Combo_OneCell_width" />
						</td>
						<td width="12%">
							<label>Percentual/LMI</label><br />
							<s:textfield theme="simple" id="percentuaLmiCasco" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.automovelOrcamentoCollection[0].valorCasco"/>
						</td>
						<td>
							<label>Observações</label><br />
							<s:textfield theme="simple" name="orcamentoSeguro.automovelOrcamentoCollection[0].observacao" style="width: 80%;"/>
						</td>
					</tr>
					<s:iterator value="orcamentoCoberturaIsegList" var="orcamentoCoberturaIseg" status="i">
						<tr style="display: none;">
							<td>
								<s:textfield name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].orcamentoSeguro.id"/>
								<s:textfield name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].id" value="%{id}" onchange="setAlterado(true);"/>
								<s:textfield name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].orcamentoSeguro.proposta.id" value="%{orcamentoSeguro.proposta.id}" onchange="setAlterado(true);"/>
								<s:textfield name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].sequencia" value="%{sequencia}" onchange="setAlterado(true);"/>
							</td>
						</tr>
						<s:if test="#orcamentoCoberturaIseg.coberturasIseg.id != null">
				  			<tr>
								<td>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].coberturasIseg.id" value="%{#orcamentoCoberturaIseg.coberturasIseg.id}" onchange="setAlterado(true);"/>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].descricao" value="%{#orcamentoCoberturaIseg.coberturasIseg.descricao}" onchange="setAlterado(true);"/>
									<label><s:property value="#orcamentoCoberturaIseg.coberturasIseg.descricao"/>:</label>
								</td>
								<td></td>
									<td>
										<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].lmi" onchange="setAlterado(true);"/>
									</td>
								<td>
									<s:textfield theme="simple" style="width: 80%;" id="orcCobIsegObs%{#i.index}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].textoFranquia" onchange="setAlterado(true);"/>
								</td>
							</tr>
						</s:if>
						<s:elseif test="%{orcamentoSeguro.proposta.id != null}">
							<tr>
								<td>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].descricao" value="%{#orcamentoCoberturaIseg.descricao}" onchange="setAlterado(true);"/>
									<label><s:property value="#orcamentoCoberturaIseg.descricao"/>:</label>
								</td>
								<td></td>
									<td>
										<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].lmi" onchange="setAlterado(true);"/>
									</td>
								<td>
									<s:textfield theme="simple" style="width: 80%;" id="orcCobIsegObs%{#i.index}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].textoFranquia" onchange="setAlterado(true);"/>
								</td>
							</tr>
						</s:elseif>
						<s:else>
						  	<tr>
						  		<td>
						  			<s:textfield theme="simple" cssClass="TextBox_OneCells_width" id="orcCobIsegDescricao%{#i.index}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].descricao" onchange="setAlterado(true);" />
						  		</td>
						  		<td>
						  		</td>
						  		<td>
						  			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].lmi" onchange="setAlterado(true);"/>
						  		</td>
						  		<td>
						  			<s:textfield theme="simple" style="width: 80%;" cssClass="TextBox_OneCells_width" id="orcCobIsegObs%{#i.index}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{#i.index}].textoFranquia" onchange="setAlterado(true);" />
						  		</td>
						  	</tr>
					  	</s:else>
				  	</s:iterator>
				</table>
				</div>
				<table>
					<tr>
				  		<td></td>
				  		<td></td>
				  		<td></td>
				  		<td valign="bottom">
					      <a href="#" class="button" onclick="abrirDivNovaCobertura();">
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
			<fieldset>
				<legend>Serviços</legend>
				<table width="100%" id="tableServicos">
					<tr>
						<td width="23%">
						</td>
						<td width="12%">
						</td>
						<td>
							<label>Observações</label><br />
						</td>
					</tr>
					<s:iterator value="orcamentoServicosIsegList" var="orcamentoServicosIseg" status="j">
						<tr style="display: none;">
							<td>
								<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].orcamentoSeguro.id" value="%{orcamentoSeguro.id}" onchange="setAlterado(true);"/>
								<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].id" value="%{id}"/>
								<s:textfield name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].orcamentoSeguro.proposta.id" value="%{orcamentoSeguro.proposta.id}" onchange="setAlterado(true);"/>
								<s:textfield name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].sequencia" value="%{sequencia}" onchange="setAlterado(true);"/>
							</td>
						</tr>
						<s:if test="%{servicosIseg.id != null}">
							<tr>
								<td>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].servicosIseg.id" value="%{#orcamentoServicosIseg.servicosIseg.id}" onchange="setAlterado(true);"/>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].descricao" value="%{#orcamentoServicosIseg.servicosIseg.descricao}" onchange="setAlterado(true);"/>
									<label><s:property value="#orcamentoServicosIseg.servicosIseg.descricao"/>:</label>
								</td>
								<td><s:select theme="simple" cssClass="" headerKey="" id="isAtiva%{#j.index}" list="#{false:'NÃO', true:'SIM'}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].informaFranquia" style="width: 50px" onchange="setAlterado(true);"/></td>
								<td>
									<s:textfield theme="simple" style="width: 84%;" id="textoDescricao%{#j.index}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].textoDescricao" onchange="setAlterado(true);"/>
								</td>
							</tr>
						</s:if>
						<s:elseif test="orcamentoSeguro.proposta.id != null">
							<tr>
								<td>
									<s:textfield style="display: none;" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].descricao" value="%{#orcamentoServicosIseg.descricao}" onchange="setAlterado(true);"/>
									<label><s:property value="#orcamentoServicosIseg.descricao"/>:</label>
								</td>
								<td><s:select theme="simple" cssClass="" headerKey="" id="isAtiva%{#j.index}" list="#{false:'NÃO', true:'SIM'}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].informaFranquia" style="width: 50px" onchange="setAlterado(true);"/></td>
								<td>
									<s:textfield theme="simple" style="width: 84%;" id="textoDescricao%{#j.index}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].textoDescricao" onchange="setAlterado(true);"/>
								</td>
							</tr>
						</s:elseif>
						<s:else>
							<tr>
						  		<td>
									<s:textfield name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].descricao" onchange="setAlterado(true);"/>
								</td>
								<td><s:select theme="simple" cssClass="" headerKey="" id="isAtiva%{#j.index}"  list="#{false:'NÃO', true:'SIM'}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].informaFranquia" style="width: 50px" onchange="setAlterado(true);"/></td>
								<td>
									<s:textfield theme="simple" style="width: 84%;" id="textoDescricao%{#j.index}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{#j.index}].textoDescricao" onchange="setAlterado(true);"/>
								</td>
						  	</tr>
					  	</s:else>
				  	</s:iterator>
				</table>
				<table>
					<tr>
				  		<td valign="bottom">
					      <a href="#" class="button" onclick="abrirDivNovoServico();">
							  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
							    <tr>
								  <td class="wButton_left"></td>
								  <td class="wButton_text wButton_width">Adicionar Serviço</td>
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
<% } catch (Exception e) {e.printStackTrace();}%>