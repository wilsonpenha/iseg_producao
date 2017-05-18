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

	  <div class="tabPane" id="tabPane0" style="height:auto; width:100%; visibility: hidden;">
	     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane1" style="height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane2" style="height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane3" style="height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="../proposta/tabApolice_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane4" style="height:auto;visibility:hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane4_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane5" style="height:auto;visibility:hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane5_noJs.jsp" flush="false"></jsp:include>
	  </div>   
	  <div class="tabPane" id="tabPane6" style="height:auto;visibility:hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane6_noJs.jsp" flush="false"></jsp:include>
	  </div>   
	  <div class="tabPane" id="tabPane7" style="height:auto; visibility: hidden;overflow: auto;">
	     <jsp:include page="../proposta/historicoEndosso.jsp" flush="false"></jsp:include>
	  </div>
  	
	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>

<script>

	MaskInput($('#dataProposta')[0], "99/99/9999");
	MaskInput($('#dataVistoria')[0], "99/99/9999");
	MaskInput($('#dataEmissaoApolice')[0], "99/99/9999");
	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");
	MaskInput($('#dataVencim1aParcela')[0], "99/99/9999");
	MaskInput($('#propostaDataVistoria')[0], "99/99/9999");
	MaskInput($('#nroCheque1Parcela')[0], "9999999999");
	MaskInput($('#nroBanco1Parcela')[0], "9999");
	$("#nroBanco").autocomplete('<s:url value="/objlookup/getBancoByCodigoOrNome.action" includeParams="none" />', {idFieldsToUpdate:["#nroBanco"]});
	MaskInput($('#contaCorrente')[0], "999999999999999");
	MaskInput($('#dataFundacao')[0], "99/99/9999");
	MaskInput($('#dataNascimento')[0], "99/99/9999");
	MaskInput($('#dataEmissao')[0], "99/99/9999");

	if(isEmpty('#propostaId')){
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente , mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />',     {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	}

	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoCepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoBairroRes", "#seguradoCidadeRes","#seguradoUfRes","#seguradoLograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst,onblur:function(){validaCPF('#seguradoCpf')}});

	$('#comissionadoPropostaComissao').addClass('readonly');
	$('#comissionadoPropostaVlrComissao').addClass('readonly');
	$('#comissionadoPropostaComissao').attr('readonly',true)
	$('#comissionadoPropostaVlrComissao').attr('readonly',true)

	handleReadonly();
	disableDadosClientes();
	showHideDadosDemaisParcelas();
	showHideDadosFormaPagamento();
	showOptionsRecebimentoComissao();
	enableDisableDadosCobertura();

	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTabSaved"/>');
	}

$(document).ready(function() {
	//$('input[name="campo_cc"]').setMask('cc'); // cartão de crédito
	//$('input[name="campo_numero"]').setMask('integer'); // números inteiros
	//$('input[name="campo_money"]').setMask('decimal'); // dinheiro
	$('input[name="desconto"]').setMask('signed-decimal'); // dinheiro com valores negativos
});
</script>

<% } catch (Exception e) {e.printStackTrace();}%>