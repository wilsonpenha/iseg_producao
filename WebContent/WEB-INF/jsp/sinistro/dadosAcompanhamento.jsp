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
		      <td>
			    <label for="acoDtLancamento">Data Lançamento</label><br />
			    <s:textfield theme="simple" id="acompanhamentoId" name="acompanhamento.id" cssStyle="display:none;" />
			    <s:textfield theme="simple" id="acoDtLancamento" name="acompanhamento.dataLancamento" onblur="isValidDate(this)" size="10" maxlength="10" />
			  </td>
			</tr>
			<tr>
			  <td>
			    <label for="acoDetalhamento">Detalhamento</label><br />
			    <s:textarea theme="simple" id="acoDetalhamento" name="acompanhamento.detalhamento" rows="3" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 255);" />
			  </td>
		    </tr>
		  </table>



 
<script>
$(document).ready(function(){
	MaskInput($('#acoDtLancamento')[0], "99/99/9999");
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>