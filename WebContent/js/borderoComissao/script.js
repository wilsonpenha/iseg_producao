ArrNomeCampo     = [];
ArrLabelCampo    = [];
ArrTipoCampo     = [];
ArrOperacaoCampo = [];

/************/
/* Proposta */
/************/

function criarLote(){
	submitForm($('#formLista').get(0), getContextApp()+'/borderoComissao/novo.action', false);
}

function salvarBordero(){
	if(isEmpty('#dataExtrato')){
		$("#dataExtrato").focus();
		alert("A data do extrato é obrigatoria!");
		return;
	}
	submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/salvarEditar.action', '#allForms', '#saveProgress');
}

function efetivarBaixa(){
	if(isEmpty('#dataExtrato')){
		$("#dataExtrato").focus();
		alert("A data do extrato é obrigatoria!");
		return;
	}
	if(isEmpty('#nroExtrato')){
		$("#nroExtrato").focus();
		alert("O numero do extrato é obrigatorio!");
		return;
	}
	if(isEmpty('#valorTotal')){
		$("#valorTotal").focus();
		alert("O valor total do extrato é obrigatorio!");
		return;
	}
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/efetivarBaixa.action', false);
}

function fecharLote(){
	if(isEmpty('#dataExtrato')){
		$("#dataExtrato").focus();
		alert("A data do extrato é obrigatoria!");
		return;
	}
	if(isEmpty('#nroExtrato')){
		$("#nroExtrato").focus();
		alert("O numero do extrato é obrigatorio!");
		return;
	}
	if(isEmpty('#valorTotal')){
		$("#valorTotal").focus();
		alert("O valor total do extrato é obrigatorio!");
		return;
	}
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/fecharLote.action', false);
}

function copiarLote(){
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/copiarLote.action', false);
}

function gerarLoteEstorno(){
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/gerarLoteEstorno.action', false);
}

function inserirLancamento(){
	if(isEmpty('#tipoLancamento')){
		$("#tipoLancamento").focus();
		alert("O Tipo de lancamento é obrigatorio!");
		return;
	}
	if(isEmpty('#valorComissao') || $('#valorComissao').val().trim()=='0,00'){
		$("#valorComissao").focus();
		alert("O valor do lancamento é obrigatorio!");
		return;
	}

	submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/inserirLancamento.action', '#divListaComissoes');
	$("#lancamentoId").val("");
	$("#tipoLancamento").val("0");
	$("#nroParcela").val("");
	$("#referenciaParcela").val("");
	$("#percentualComissao").val("0,00");
	$("#valorComissao").val("0,00");
	$("#tipoLancamento").focus();
}
function inserirLancamentoLimpar(){
	if(isEmpty('#tipoLancamento')){
		$("#tipoLancamento").focus();
		alert("O Tipo de lancamento é obrigatorio!");
		return;
	}
	if(isEmpty('#valorComissao') || $('#valorComissao').val().trim()=='0,00'){
		$("#valorComissao").focus();
		alert("O valor do lancamento é obrigatorio!");
		return;
	}

	submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/inserirLancamento.action', '#divListaComissoes');
	$("#lancamentoId").val("");
	$("#ramoId").val("");
	$("#subRamoId").val("");
	$("#sRamoId").val("");
	$("#sSubRamoId").val("");
	$("#nomeSegurado").val("");
	$("#nroApolice").val("");
	$("#premioLiquido").val("0,00");
	$("#saldoComissao").val("");
	$("#tipoLancamento").val("0");
	$("#nroParcela").val("");
	$("#referenciaParcela").val("");
	$("#percentualComissao").val("0,00");
	$("#valorComissao").val("0,00");
	$("#nomeSegurado").focus();
}

function limpar(){
	$("#lancamentoId").val("");
	$("#ramoId").val("");
	$("#subRamoId").val("");
	$("#sRamoId").val("");
	$("#sSubRamoId").val("");
	$("#nomeSegurado").val("");
	$("#nroApolice").val("");
	$("#premioLiquido").val("0,00");
	$("#saldoComissao").val("0,00");
	$("#tipoLancamento").val("0");
	$("#nroParcela").val("");
	$("#referenciaParcela").val("");
	$("#percentualComissao").val("0,00");
	$("#valorComissao").val("0,00");
	$("#nomeSegurado").focus();
}

function inserirBonus(){
	if ($("#valorBonus").val()!="" || $("#valorISS").val()!="" || $("#valorIR").val()!=""){
		submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/inserirLancamento.action', '#divDadosBaixa');
		$("#lancamentoId").val("");
	}else{
		alert("Você deve informar o valor!");
	}
}

function removeLancamento(id){
	$("#lancamentoId").val(id);
	submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/removerLancamento.action', '#divListaComissoes');
	$("#sRamoId").focus();
	$("#lancamentoId").val("");
}

function editarLancamento(id){
	$("#lancamentoId").val(id);
	submitFormAjax('#formEdit', getContextApp()+'/borderoComissao/editarLancamento.action', '#divDadosBaixaDeComissao');
}

function limparCampos(){
	$('#nomeSegurado').flushCache();
	$('#nroApolice').flushCache();
	$('#nomeSegurado').val('');
	$('#nroApolice').val('');
	$('#saldoComissao').val('');
}

function carregaSubRamosLote() {
	$("#gpRamoId").val($("#sRamoId").val());
	submitFormAjaxAllArgs('#formLookup', getContextApp()+'/objlookup/getRamosBySubRamoLote.action', null, null, null, null, 
		    function(response){
				$(response).find("#sSubRamoId option").each(function(){
			           if($(this).val() == $('#subRamoId').val()){
			               $(this).attr('selected',true);
			           }
			       });
				$('#divRamos').html(response);
			}
	);
	setTimeout(function(){
		mudaTipoParcela();
	},500);
}

function mudaTipoParcela(){
	if ($("#sSubRamoId option").size()>1){
		if ($("#isFatura").val() == 'true'){
			$("#divParcelaReferencia").show();
			$("#divNroParcela").hide();
			$('#parcelaReferencia').attr('disabled',false);
			$('#nroParcela').attr('disabled',true);
		}else{
			$("#divParcelaReferencia").hide();
			$("#divNroParcela").show();
			$('#parcelaReferencia').attr('disabled',true);
			$('#nroParcela').attr('disabled',false);
		}
	}else{
		if ($("#isFatura").val() == 'true'){
			$("#divParcelaReferencia").show();
			$("#divNroParcela").hide();
			$('#parcelaReferencia').attr('disabled',false);
			$('#nroParcela').attr('disabled',true);
		}else{
			$("#divParcelaReferencia").hide();
			$("#divNroParcela").show();
			$('#parcelaReferencia').attr('disabled',true);
			$('#nroParcela').attr('disabled',false);
		}
	}
}

function showDivs(opcao){
	if (opcao=='0' || opcao=='4' || opcao=='5' || opcao=='6' ){
		$("#lancamento1").show();
		$("#lancamento2").hide();
		$("#lancamento3").hide();
		$("#lancamento4").hide();
		$("#lancamento5").hide();
		$("#lancamento6").hide();
		$('#vistoriaImp').attr('disabled',true);
		$('#valorVistoriaImp').attr('disabled',true);
		$('#custoApolice').attr('disabled',true);
		$('#valorCustoApolice').attr('disabled',true);
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#ISS').attr('disabled',true);
		$('#valorISS').attr('disabled',true);
		$('#IR').attr('disabled',true);
		$('#valorIR').attr('disabled',true);
		$('#valorComissao').attr('disabled',false);
		$('#nomeSegurado').attr('disabled',false);
	}else if (opcao=='1'){
		$("#lancamento1").hide();
		$("#lancamento2").show();
		$("#lancamento3").hide();
		$("#lancamento4").hide();
		$("#lancamento5").hide();
		$("#lancamento6").hide();
		$('#vistoriaImp').attr('disabled',true);
		$('#valorVistoriaImp').attr('disabled',true);
		$('#custoApolice').attr('disabled',true);
		$('#valorCustoApolice').attr('disabled',true);
		$('#bonus').attr('disabled',false);
		$('#valorBonus').attr('disabled',false);
		$('#ISS').attr('disabled',true);
		$('#valorISS').attr('disabled',true);
		$('#IR').attr('disabled',true);
		$('#valorIR').attr('disabled',true);
		$('#valorComissao').attr('disabled',true);
		$('#nomeSegurado').attr('disabled',true);
	}else if (opcao=='2'){
		$("#lancamento1").hide();
		$("#lancamento2").hide();
		$("#lancamento3").show();
		$("#lancamento4").hide();
		$("#lancamento5").hide();
		$("#lancamento6").hide();
		$('#vistoriaImp').attr('disabled',true);
		$('#valorVistoriaImp').attr('disabled',true);
		$('#custoApolice').attr('disabled',true);
		$('#valorCustoApolice').attr('disabled',true);
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#ISS').attr('disabled',false);
		$('#valorISS').attr('disabled',false);
		$('#IR').attr('disabled',true);
		$('#valorIR').attr('disabled',true);
		$('#valorComissao').attr('disabled',true);
		$('#nomeSegurado').attr('disabled',true);
	}else if (opcao=='3'){
		$("#lancamento1").hide();
		$("#lancamento2").hide();
		$("#lancamento3").hide();
		$("#lancamento4").show();
		$("#lancamento5").hide();
		$("#lancamento6").hide();
		$('#vistoriaImp').attr('disabled',true);
		$('#valorVistoriaImp').attr('disabled',true);
		$('#custoApolice').attr('disabled',true);
		$('#valorCustoApolice').attr('disabled',true);
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#ISS').attr('disabled',true);
		$('#valorISS').attr('disabled',true);
		$('#IR').attr('disabled',false);
		$('#valorIR').attr('disabled',false);
		$('#valorComissao').attr('disabled',true);
		$('#nomeSegurado').attr('disabled',true);
	}else if (opcao=='7'){
		$("#lancamento1").hide();
		$("#lancamento2").hide();
		$("#lancamento3").hide();
		$("#lancamento4").hide;
		$("#lancamento5").show();
		$("#lancamento6").hide();
		$('#vistoriaImp').attr('disabled',false);
		$('#valorVistoriaImp').attr('disabled',false);
		$('#custoApolice').attr('disabled',true);
		$('#valorCustoApolice').attr('disabled',true);
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#ISS').attr('disabled',true);
		$('#valorISS').attr('disabled',true);
		$('#IR').attr('disabled',true);
		$('#valorIR').attr('disabled',true);
		$('#valorComissao').attr('disabled',true);
		$('#nomeSegurado').attr('disabled',true);
	}else if (opcao=='8'){
		$("#lancamento1").hide();
		$("#lancamento2").hide();
		$("#lancamento3").hide();
		$("#lancamento4").hide();
		$("#lancamento5").hide();
		$("#lancamento6").show();
		$('#vistoriaImp').attr('disabled',true);
		$('#valorVistoriaImp').attr('disabled',true);
		$('#custoApolice').attr('disabled',false);
		$('#valorCustoApolice').attr('disabled',false);
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#ISS').attr('disabled',true);
		$('#valorISS').attr('disabled',true);
		$('#IR').attr('disabled',true);
		$('#valorIR').attr('disabled',true);
		$('#valorComissao').attr('disabled',true);
		$('#nomeSegurado').attr('disabled',true);
	}
}

function editarBorderoLancamento(){
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formLinkProposta', getContextApp()+'/borderoComissao/editarBorderoLancamento.action', null, null, null, null, 
	    function(response){
			$('#divListaComissoes').html(response);
			closeModal();
			$("#loadProgressModal").css({'display':'none'});
		}
	);
}

function setAlterado(b){
	alterado = b;
}

function abrirModal(id){
	$("#modalLancamentoId").val(id);
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divModalLinkProposta').width() / 2);
	$('#divModalLinkProposta').modal({onOpen: openModalLinkProposta, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (400/ 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formLinkProposta', getContextApp()+'/borderoComissao/consultarBorderoLancamento.action', null, null, null, null, 
	    function(response){
			$('#divLinkProposta').html($(response).find("#divLinkProposta").html());
			$("#loadProgressModal").css({'display':'none'});
		}
	);
}
function openModalLinkProposta(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}
function closeModal(){
	$('#closeDivLink').click();
}

function consultaBorderoLancamento(){
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formLinkProposta', getContextApp()+'/borderoComissao/consultarBorderoLancamento.action', null, null, null, null, 
		    function(response){
				$('#tableListaPropostas').html($(response).find("#tableListaPropostas").html());
				$("#loadProgressModal").css({'display':'none'});
			}
		);
}

function carregarProposta(){
	submitFormAjaxAllArgs('#formLinkProposta', getContextApp()+'/borderoComissao/consultarProposta.action', null, null, null, null, 
		    function(response){
				$('#propostaNroLocalizador').html(response);
			}
	);
}
function editProposta(idProposta){
	$("#modalPropostaId").val(idProposta);
    submitForm($('#formLinkProposta').get(0), getContextApp()+'/proposta/editar.action', false);
}