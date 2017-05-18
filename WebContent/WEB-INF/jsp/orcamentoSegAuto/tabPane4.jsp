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

	 <jsp:include page="tabPane4_noJs.jsp" flush="false"></jsp:include>
     <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
	
<script>
	disabilitarCamposEnviadoParaCalculo();
	MaskInput($('#dataGeracao').get(0), "99/99/9999");
	MaskInput($('#dataTransmissao').get(0), "99/99/9999");
	
	$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
	
	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$('#mycarousel').jcarousel();

	setTimeout(function(){carregarPropostaAnexos();},500);
	init();
	if(!isEmpty('#orcamentoSeguroId')){
		raisePanel('<s:property value="currentTab"/>');
	}
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    //$(".clValor").setMask({mask : '99', defaultValue:"0"});
 	
 });
 if($('#tipoProposta').val() != 6){
	desabilitarCamposTela('formularioRenovacao');
}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>