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

	  <div class="tabPane" id="tabPane0" style="overflow:auto; height:auto; width:100%; visibility: hidden;">
	     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane1" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane2" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane3" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane3_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane4" style="overflow:auto; height:auto;visibility: hidden">
	     <jsp:include page="tabPane4_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane5" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane5_noJs.jsp" flush="false"></jsp:include>
	  </div>

	
<script>
	disableDadosClientes();
	MaskInput($('#dataOrcamentoSeguro').get(0), "99/99/9999");
	MaskInput($('#dataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataEmissaoApolice').get(0), "99/99/9999");
	MaskInput($('#orcamentoCondutorDataNascimento').get(0), "99/99/9999");
	MaskInput($('#orcamentoCondutorData1aHabilitacao').get(0), "99/99/9999");
	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#orcamentoSeguroDataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataGeracao').get(0), "99/99/9999");
	MaskInput($('#dataTransmissao').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
	MaskInput($('#nroBanco').get(0), "9999");
	MaskInput($('#contaCorrente').get(0), "999999999999999");
	
// 	if(isEmpty('#orcamentoSeguroId')){
		MaskInput($('#dataFundacao').get(0), "99/99/9999");
		MaskInput($('#dataNascimento').get(0), "99/99/9999");
		MaskInput($('#dataEmissao').get(0), "99/99/9999");
		MaskInput($('#data1aHabilitacao').get(0), "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

// 	}

	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"],width:400,max:300,scroll:true,scrollHeight:150});
	$("#autorGeracaoNome").autocomplete('<s:url value="/objlookup/getPessoaList.action" includeParams="none" />', {idFieldsToUpdate:["#autorGeracaoId"]});
	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#regiaoTarifacao").autocomplete('<s:url value="/objlookup/getCepOrCidadeList.action" includeParams="none" />', {mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,minChars:2,width:300,formatItemOnSelect:splitResultGetFirst});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
	$("#profissaoNome").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#profissaoId"]});
	
	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	$('#comissionadoPropostaComissao').addClass('readonly');
	$('#comissionadoPropostaVlrComissao').addClass('readonly');
	$('#comissionadoPropostaComissao').attr('readonly',true);
	$('#comissionadoPropostaVlrComissao').attr('readonly',true);

	init();
	if(!isEmpty('#orcamentoSeguroId')){
		raisePanel('<s:property value="currentTabSaved"/>');
	}

// define a mascara padrão para telefone
$().ready(function() {
// 		Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCNPJ").setMask({mask : '99.999.999/9999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
//     Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
});

$(document).ready(function() {
	$('input[name="campo_cc"]').setMask('cc'); // cartão de crédito
	$('input[name="campo_numero"]').setMask('integer'); // números inteiros
	$('input[name="campo_money"]').setMask('decimal'); // dinheiro
	$('input[name="desconto"]').setMask('signed-decimal'); // dinheiro com valores negativos
});
if($('#tipoProposta').val() != 6){
	desabilitarCamposTela('formularioRenovacao');
}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>