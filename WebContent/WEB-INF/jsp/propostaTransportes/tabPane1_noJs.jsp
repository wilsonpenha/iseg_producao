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

	<div id="divForm2" style="width:100%">
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	  <td colspan="5">
		<fieldset>
		<legend accesskey="o"><b><u>D</u>escricao do Risco</b></legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td>
			  Observações:<br/>
			  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="5" id="descricaoRisco" name="proposta.riscoTransportesCollection[0].descricaoRisco" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setAlterado(true);" />
			  <s:textfield theme="simple" id="riscoTransportesAlterado" name="riscoTransportesAlterado" cssStyle="display:none;" />
			  <s:textfield theme="simple" id="riscoTransportesId" name="proposta.riscoTransportesCollection[0].id" cssStyle="display:none;" />
			  <s:textfield theme="simple" id="riscoTransportesPropostaId" name="proposta.riscoTransportesCollection[0].proposta.id" cssStyle="display:none;" />
			</td>
		  </tr>
		</table>
		</fieldset>
	  </td>
	</tr>
	  <tr><td colspan="5">
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="R"><b>Dados da <u>R</u>enovação</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="30%">
				  <label for="automovelSeguradoraId">Seguradora Anterior</label><br />
				  <s:select theme="simple" id="riscoTransportesSeguradoraId" headerKey="" headerValue="-- Selecione --" name="proposta.riscoTransportesCollection[0].seguradora.id" list="seguradoraList" listKey="id" listValue="nome" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label for="nroApoliceAnterior">Nro da Apólice Anterior</label><br />
				  <s:textfield theme="simple" id="nroApoliceAnterior" name="proposta.riscoTransportesCollection[0].nroApoliceAnterior" size="15" maxlength="20" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  </table>
	  </td>
	</tr>
	  <tr>
		<td colspan="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
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
				  <s:iterator value="transporteCoberturaList" status="stat">
				  <s:if test="coberturas.id != null">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="transporteCoberturasId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].riscoTransportes.id" value="%{riscoTransportes.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].descricao" value="%{coberturas.descricao}" disabled="true" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="transporteCoberturasId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].riscoTransportes.id" value="%{riscoTransportes.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>
				</div>
				<table>
				  <tr>
				  	<td>
  					<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
				    </a></label></td></tr>
				    </table>
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
  	
<% } catch (Exception e) {e.printStackTrace();}%>