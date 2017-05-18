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
	     <td width="30%">
	    <label for="indenizacaoDataPagamento">Data Pagamento</label><br />
	    <s:textfield theme="simple" id="indenizacaoId" name="indenizacao.id" cssStyle="display:none;" />
	    <s:textfield theme="simple" id="indenizacaoDataPagamento" name="indenizacao.dataPagamento" onblur="isValidDate(this)" size="10" maxlength="10" />
	  </td>
	     <td width="30%;">
	    <label for="indenizacaoValor">Valor</label><br />
	    <s:textfield theme="simple" id="indenizacaoValor" cssClass="currency" name="indenizacao.valorIndenizado" onkeypress="return Mascara('numero1', event, document.getElementById('indenizacaoValor'));" onblur="javascript:valida_numero(this,15,2,'indenizacaoValor');" size="15" onchange="setAlterado(true);"/>
	  </td>
	     <td width="40%;">
	    <label for="indenizacaoTipo">Tipo</label><br />
	    <s:select theme="simple" id="indenizacaoTipo" list="tipoIndenizacaoList" name="indenizacao.tipoIndenizacao" headerKey="" headerValue="- Selecione -" />
	  </td>
	</tr>
	 </table>



 
<script>
$(document).ready(function(){
	MaskInput($('#indenizacaoDataPagamento')[0], "99/99/9999");
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>