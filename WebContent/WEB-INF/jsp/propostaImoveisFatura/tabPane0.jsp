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

     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
  
<script>

	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataVistoria').get(0), "99/99/9999");
	
	if(isEmpty('#propostaId')){
		MaskInput($('#dataFundacao').get(0), "99/99/9999");
		MaskInput($('#dataNascimento').get(0), "99/99/9999");
		MaskInput($('#dataEmissao').get(0), "99/99/9999");
		MaskInput($('#data1aHabilitacao').get(0), "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	}

	$("#autorGeracaoNome").autocomplete('<s:url value="/objlookup/getPessoaList.action" includeParams="none" />', {idFieldsToUpdate:["#autorGeracaoId"]});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#pfProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#pfProfissaoId"]});

	disableDadosClientes();
	
	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}
// define a mascara padrão para telefone  
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"000"});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clNumero4").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
 	
 });

</script>

<% } catch (Exception e) {e.printStackTrace();}%>