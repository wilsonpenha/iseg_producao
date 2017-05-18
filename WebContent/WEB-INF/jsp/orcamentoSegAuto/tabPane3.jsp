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

     <jsp:include page="tabPane3_noJs.jsp" flush="false"></jsp:include>
	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
  	
<script>
	disableDadosClientes();
	disabilitarCamposEnviadoParaCalculo();
	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#regiaoTarifacao").autocomplete('<s:url value="/objlookup/getCepOrCidadeList.action" includeParams="none" />', {mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,minChars:2,width:300,formatItemOnSelect:splitResultGetFirst});

// 	enableDisableDadosCobertura();
// 	enableDisableDadosServico();
	tooglePercValorCoberturaCasco($('#tipoIndenizacao').val());
	
	init();
	if(!isEmpty('#orcamentoSeguroId')){
		raisePanel('<s:property value="currentTab"/>');
	}

// define a mascara padrão para telefone
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