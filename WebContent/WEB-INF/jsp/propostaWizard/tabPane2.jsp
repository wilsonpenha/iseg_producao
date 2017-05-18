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

<script language="javascript">

$(function() {
	$("#accordion").accordion({
		active: false, 
        collapsible: true, 
        autoHeight: true 
	});
});
</script>

<input id="totalRegistros" type="text" value="${itemCorrente+1} / ${itens}" style="display:none;"/>
  
     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
  	
<script>

	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#regiaoTarifacao").autocomplete('<s:url value="/objlookup/getCepOrCidadeList.action" includeParams="none" />', {mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,minChars:2,width:300,formatItemOnSelect:splitResultGetFirst});

	bloquearHabilitarDadosCaminhao($('#tipoVeiculoId')[0]);
	enableDisableDadosCobertura();
	enableDisableDadosServico();
	tooglePercValorCoberturaCasco($('#tipoIndenizacao').val());
	
	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}

 setTimeout(function(){
	$('#bookmark')[0].innerHTML = $('#totalRegistros').val();
}
,300);
 

</script>

<% } catch (Exception e) {e.printStackTrace();}%>