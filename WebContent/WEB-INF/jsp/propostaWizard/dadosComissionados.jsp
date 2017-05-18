<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>



				<table id="tableProdutor" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="35%">
					  <label for="comissionadoPropostaPessoaNome">Produtor:</label><br/>
					  <s:textfield theme="simple" id="comissionadoPropostaId" name="proposta.propostaComissaoCollection[].id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaId" name="proposta.propostaComissaoCollection[].pessoa.id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaNome" cssClass="dojoValidateValid requiredField" cssStyle="width:95%" name="proposta.propostaComissaoCollection[].pessoa.nome"/>
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaTipoComissao">Tipo Repasse:</label><br/>
					  <s:select theme="simple" cssClass="requiredField" id="comissionadoPropostaTipoComissao" cssStyle="width:95%" headerValue="-- Selecione --" headerKey="" list="tipoComissaoList" name="proposta.propostaComissaoCollection[].tipoComissao" onchange="liberaCamposComissao(this.value);"/>
					</td>
					<td width="15%">
					  <label for="comissionadoPropostaComissao">Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid currency" name="proposta.propostaComissaoCollection[].comissao" id="comissionadoPropostaComissao" onkeypress="return Mascara('numero1', event, this);" onblur="javascript:valida_numero(this,15,2,'comissionadoPropostaComissao');calculaVlrComissaoComissionado(this.value);" />
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaVlrComissao">Valor Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid currency" name="proposta.propostaComissaoCollection[].valorComissao" id="comissionadoPropostaVlrComissao" onkeypress="return Mascara('numero1', event, this);" onblur="javascript:valida_numero(this,15,2,'comissionadoPropostaVlrComissao');" />
					</td>
					<td width="10%" align="right">
					  <a href="#" class="button" onclick="inserirComissionado();">
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
				  <tr><td><br/></td></tr>
				</table>



<script>
	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>