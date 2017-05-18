
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

  <table id="tableCobertura" width="100%" cellspacing="3" cellpadding="3" class="Main_Client_TableEdition" style="padding:4px;">
	<tr>
	  <td colspan="5">
		<div id="divMessagesCoberturas"></div>
	  </td>
	</tr>
	<tr>
	  <td width="37%">
		<label for="cobertura">Cobertura</label><br />
		<s:textfield theme="simple" id="riscoCoberturaId" name="riscoCobertura.id" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="riscoCoberturaNome" cssClass="dojoValidateValid requiredField" cssStyle="width:96%" maxlength="80" name="riscoCobertura.cobertura"/>
	  </td>
	  <td width="20%">
		<label for="coberturaPremio">Prêmio</label><br />
		<s:textfield theme="simple" id="riscoCoberturaPremio" cssClass="dojoValidateValid requiredField currency" cssStyle="width:96%" maxlength="18" name="riscoCobertura.premio" onkeypress="return Mascara('numero1', event, document.getElementById('riscoCoberturaPremio'));" onblur="javascript:valida_numero(this,15,2,'riscoCoberturaPremio');"/>
	  </td>
	  <td width="20%">
		<label for="coberturaLMI">LMI</label><br />
		<s:textfield theme="simple" id="riscoCoberturaLMI" cssClass="dojoValidateValid requiredField currency" cssStyle="width:96%" maxlength="18" name="riscoCobertura.lmi" onkeypress="return Mascara('numero1', event, document.getElementById('riscoCoberturaLMI'));" onblur="javascript:valida_numero(this,15,2,'riscoCoberturaLMI');"/>
	  </td>
	  <td width="20%">
		<label for="coberturaFranquia">Franquia</label><br />
		<s:textfield theme="simple" id="riscoCoberturaFranquia" cssClass="dojoValidateValid requiredField currency" cssStyle="width:96%" maxlength="18" name="riscoCobertura.franquia" onkeypress="return Mascara('numero1', event, document.getElementById('riscoCoberturaFranquia'));" onblur="javascript:valida_numero(this,15,2,'riscoCoberturaFranquia');"/>
	  </td>
	  <td width="3%">
		<img alt="Loading..." id="loadingMiniAddCob" align="left" src="<s:url value="/common/web/images/loadingMini.gif" includeParams="none" />" style="display:none;"/>
	  </td>
	</tr>
	<tr>
	  <td colspan="3">
		<label for="cobertura">Texto Franquia</label><br />
		<s:textfield theme="simple" id="riscoCoberturaTextoFranquia" cssClass="dojoValidateValid requiredField" cssStyle="width:96%" maxlength="100" name="riscoCobertura.textoFranquia"/>
	  </td>
	  <td colspan="2">
		<a href="#" class="button" onclick="inserirRiscoCobertura();">
		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
		  <tr>
		    <td class="wButton_left"></td>
		    <td class="wButton_text wButton_width">Adicionar</td>
		    <td class="wButton_right"/>
		  </tr>
	    </table>
		</a>
	  </td>
	</tr>
  </table>
  
  
<% } catch (Exception e) {e.printStackTrace();}%>