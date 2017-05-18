
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
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

     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
  
<script>
	disabilitarCamposEnviadoParaCalculo();
	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataVistoria').get(0), "99/99/9999");
	
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
	$("#autorGeracaoNome").autocomplete('<s:url value="/objlookup/getPessoaList.action" includeParams="none" />', {idFieldsToUpdate:["#autorGeracaoId"]});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#profissaoNome").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#profissaoId"]});
	init();
	if(!isEmpty('#orcamentoSeguroId')){
		raisePanel('<s:property value="currentTab"/>');
	}
	if(!isEmpty('#outraProfissaoNome')){
		$('#checkProfissao').attr('checked',true);
		ativarOutraProfissao($('#checkProfissao')[0]);
	}
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
});

disableDadosClientes();
if($('#tipoProposta').val() != 6){
	desabilitarCamposTela('formularioRenovacao');
}

</script>

<% } catch (Exception e) {e.printStackTrace();}%>