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
  	<s:if test="%{proposta.versao == 2 || proposta.tipoProposta == 4 || proposta.tipoProposta == 6}">
  	 <jsp:include page="tabPane1_noJsProposta.jsp" flush="false"></jsp:include>
  	</s:if>
  	<s:else>
     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
    </s:else>
<script>

	MaskInput($('#condutorDataNascimento').get(0), "99/99/9999");
	MaskInput($('#condutorData1aHabilitacao').get(0), "99/99/9999");
	$(".clCep").setMask({mask : '99999-999', autoTab: false});

	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});

	init();
	if(!isEmpty('#propostaId')){
		raisePanel('<s:property value="currentTab"/>');
	}
	$('input[name=bancosRelacionamentoIds]:checked').each(function(){
		objeto = $(this)[0];
		habilitaDesabilitaCamposBanco(objeto);
	});
	
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