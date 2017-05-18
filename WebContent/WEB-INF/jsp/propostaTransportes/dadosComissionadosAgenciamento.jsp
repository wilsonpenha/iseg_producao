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
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPropostaId" name="comissionadoAgenciamentoPropostaId" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPropostaPessoaId" name="comissionadoAgenciamentoPropostaPessoaId" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPropostaPessoaNome" cssClass="dojoValidateValid requiredField clTextoRestrito" cssStyle="width:95%" name="comissionadoAgenciamentoPropostaPessoaNome"/>
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaTipoComissao">Tipo Repasse:</label><br/>
					  <s:select theme="simple" cssClass="requiredField" id="comissionadoAgenciamentoTipoComissao" cssStyle="width:95%" headerValue="-- Selecione --" headerKey="" list="tipoComissaoList" name="comissionadoAgenciamentoTipoComissao" onchange="liberaCamposComissao(this.value);"/>
					</td>
					<td width="15%">
					  <label for="comissionadoAgenciamentoComissao">Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoAgenciamentoComissao" id="comissionadoAgenciamentoComissao" onblur="javascript:calculaVlrComissaoComissionado(this.value);" />
					</td>
					<td width="18%">
					  <label for="comissionadoAgenciamentoVlrComissao">Valor Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoAgenciamentoVlrComissao" id="comissionadoAgenciamentoVlrComissao"  />
					</td>
					<td width="10%" align="right">
					  <a href="#" class="button" onclick="inserirComissionadoAgenciamento();">
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