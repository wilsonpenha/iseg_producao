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
  
     <jsp:include page="../propostaWizard/tabPane1_noJsProposta.jsp" flush="false"></jsp:include>
  	
<script>
	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
	MaskInput($('#nroBanco').get(0), "9999");
	MaskInput($('#contaCorrente').get(0), "999999999999999");
	
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
    //$(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $("#condutorNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#condutorCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#condutorProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#condutorProfissaoId"]});
	$("#escolaridadeCondutor").autocomplete('<s:url value="/objlookup/getEscolaridade.action" includeParams="none" />', {idFieldsToUpdate:["#escolaridadeCondutorId"]});
// 	$('input[name=bancosRelacionamentoIds]:checked').each(function(){
//		objeto = $(this)[0];
//		habilitaDesabilitaCamposBanco(objeto);
//	});
 	
 });

$(document).ready(function() {
	//$('input[name="campo_cc"]').setMask('cc'); // cartão de crédito
	//$('input[name="campo_numero"]').setMask('integer'); // números inteiros
	//$('input[name="campo_money"]').setMask('decimal'); // dinheiro
	$('input[name="desconto"]').setMask('signed-decimal'); // dinheiro com valores negativos
});
</script>

<% } catch (Exception e) {e.printStackTrace();}%>