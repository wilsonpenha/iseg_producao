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
  
     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
  	
<script>

	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
	$("#nroBanco").autocomplete('<s:url value="/objlookup/getBancoByCodigoOrNome.action" includeParams="none" />', {idFieldsToUpdate:["#nroBanco"]});
	MaskInput($('#contaCorrente').get(0), "999999999999999");
	
	showHideDadosFormaPagamento();
	showHideDadosDemaisParcelas();
	
	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}

$(document).ready(function() {
	//$('input[name="campo_cc"]').setMask('cc'); // cartão de crédito
	//$('input[name="campo_numero"]').setMask('integer'); // números inteiros
	//$('input[name="campo_money"]').setMask('decimal'); // dinheiro
	$('input[name="desconto"]').setMask('signed-decimal'); // dinheiro com valores negativos
});
</script>

<% } catch (Exception e) {e.printStackTrace();}%>