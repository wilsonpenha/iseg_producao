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
  	
<script>
	selectDadosArrendatario($('#segPropArrend').val());
	selectFinanciado($('#finan').val());
	disabilitarCamposEnviadoParaCalculo();
	disableDadosClientes();
	MaskInput($('#condutorDataNascimento').get(0), "99/99/9999");
	MaskInput($('#condutorData1aHabilitacao').get(0), "99/99/9999");

	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});

	init();
	if(!isEmpty('#orcamentoSeguroId')){
		raisePanel('<s:property value="currentTab"/>');
	}
	setTipoPessoa($("#arrTipoPessoa").val());
	
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clCNPJ").setMask({mask : '99.999.999/9999-99', autoTab: false});
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $("#placaVeiculo").setMask({mask : 'aaa9999', autoTab: false});
    selectRastreador($("#selectRastreadorId").val());
	selectBloqueador($("#selectBloqueadorId").val());
});
if($('#tipoProposta').val() != 6){
	desabilitarCamposTela('formularioRenovacao');
}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>