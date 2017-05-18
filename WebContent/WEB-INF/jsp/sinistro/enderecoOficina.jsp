<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>



	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="15%">
			<label for="cepOficina">CEP</label><br />
			<s:textfield theme="simple" cssClass="clCep readonly" id="cepOficina" name="enderecoOficina.cep" size="11" maxlength="9" readonly="true" />
		  </td>
		  <td width="35%">
			<label for="lograOficina">Logradouro</label><br />
			<s:textfield theme="simple"  id="lograOficina" name="enderecoOficina.logradouro" cssStyle="width:98%" maxlength="60" cssClass="readonly" readonly="true" />
		  </td>
		  <td width="35%">
			<label for="compOficina">Complemento</label><br />
			<s:textfield theme="simple" id="compOficina" name="enderecoOficina.complemento" cssStyle="width:98%" maxlength="60" cssClass="readonly" readonly="true" />
		  </td>
		  <td width="15%">
			<label for="numeroOficina">Número</label><br />
			<s:textfield theme="simple" id="numeroOficina" name="enderecoOficina.numero" maxlength="6" size="8" cssClass="readonly" readonly="true" />
		  </td>
		</tr>
		<tr>
		  <td colspan="2">
			<label for="bairroOficina">Bairro</label><br />
			<s:textfield theme="simple" id="bairroOficina" name="enderecoOficina.bairro" cssStyle="width:98%" maxlength="50" cssClass="readonly" readonly="true" />
		  </td>
		  <td>
			<label for="cidadeOficina">Cidade</label><br />
			<s:textfield theme="simple" id="cidadeOficina" name="enderecoOficina.cidade" cssStyle="width:98%" maxlength="35" cssClass="readonly" readonly="true" />
		  </td>
		  <td>
			<label for="ufOficina">UF</label><br />
			<s:textfield theme="simple" id="ufOficina" name="enderecoOficina.uf" cssClass="readonly" readonly="true" />
		  </td>
		</tr>
	</table>



 
<script>
$(document).ready(function(){
	MaskInput($('#acoDtLancamento')[0], "99/99/9999");
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>