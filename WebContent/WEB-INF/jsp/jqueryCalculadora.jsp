<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.calculator.css" includeParams="none"/>"></link>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.calculator-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.calculator-pt-BR.js?v=0" includeParams="none"/>"></script>

<script>
	$(document).ready(function(){
	    function OnOverflowChanged (event) { 
	    	setTimeout(function(){
	    		if (event.srcElement)
    	    		eval("window.divReadonly_"+event.srcElement.id+"_event=event;");
    	    	else
    	    		eval("window.divReadonly_"+event.target.id+"_event=event;");
	        },1000);
	    }
	});
$('.clCalculator').calculator({
	onOpen: function(value, inst) { 
		$(this).unsetMask(); 
        value = value.replace(/\./g,''); 
		$(this).val(value); 
    },	
	onClose: function(value, inst) {
	    valor = converte_numero(value);
		$(this).val(valor.toFixed(2)); 
		$(this).setMask({mask : '99,999.999.99', type : 'reverse',defaultValue:"+000"});
    },
    layout: [
    'BSCECA  ' + $.calculator.CLOSE, 
    '_1_2_3_*' + $.calculator.ERASE, 
    '_4_5_6_-' + $.calculator.USE, 
    '_7_8_9_+_%+-' , 
    '  _0_._=_/'],	
    showOn: 'button', 
	precision: 2, 
	buttonImageOnly: true, 
	buttonImage: '../common/calculator.png'
});

// define a mascara padrão para telefone  
$().ready(function() {
	// Mascara de telefone.
    $(".clPlaca").setMask({mask : 'aaa9999', autoTab: false});
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
    $(".clNumero4").setMask({mask : '9999',  type : 'reverse',defaultValue:"0"});
    $(".clReferenciaParcela").setMask({mask : '19/9999', autoTab: false});
    $(".clParcelaAtual").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
    $(".clPercentual").setMask({mask : '99,999', type : 'reverse',defaultValue:"+000"});
    $(".clNumerico").setMask({mask : '999999999999999'});
 	
 });

</script>