<script language="JavaScript">

$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clSusep").setMask({mask : '9999999'});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
 	//$('.clTextoRestrito').bestupper({semPontuacao : true});
 	//$('.clTextoRestritoModal').bestupper({semPontuacao : true});
    $(".clValor4").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"000"});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor51").setMask({mask : '9,999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clValor3").setMask({mask : '999',  type : 'reverse',defaultValue:"0"});
    $(".clValor5").setMask({mask : '99999', type : 'reverse',defaultValue:"0"});
 	
 })

</script>
