// script vida empresarial v1

ArrNomeCampo     = ["#dataProposta", "#ramoId", "#seguradoraId", "#clientePFNome", "#pfGrupoDeVendaId", "#clientePJNome", "#pjGrupoDeVendaId"];
ArrLabelCampo    = ["Data da Proposta", "Ramo de Seguro", "Seguradora","Nome do Cliente","Grupo de Venda","Nome do Cliente","Grupo de Venda"];
ArrTipoCampo     = [TIPOFORM_DATA, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT];
ArrOperacaoCampo = [OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE];

var corpo = null;
var allForms = null;
var navegador = null;
var central = null;
var tdleftTabs = null;
var tdtopButtons = null;
var tdBottomSeparetor = null;
var client = null;
var tdDivCentral = null;
var tabFiller = null;

var stlCorpo   = null;
var stlNavegador   = null;
var stlCentral   = null;
var stlTdleftTabs   = null;
var stlTdtopButtons   = null;
var stlTdBottomSeparetor   = null;
var stlClient = null;
var stlTdDivCentral = null;
var stlTabFiller = null;

var windowHeight = null;
var windowWidth = null;

var wrapped = false;

function toggleDebug(debugging){
  if (debugging.value == '1')
    xbDEBUG.on = true;
  else 
    xbDEBUG.on = false;
}

function init() {

	allForms = xbGetElementById('allForms');
	corpo = xbGetElementById('corpo');
	navegador = xbGetElementById('navegador');
	central = xbGetElementById('central');
	client = xbGetElementById('client');
	tdleftTabs = xbGetElementById('tdleftTabs');
	tdtopButtons = xbGetElementById('tdtopButtons');
	tdBottomSeparetor = xbGetElementById('tdbottomSeparator');
	tdDivCentral = xbGetElementById('tdDivCentral');
	tabFiller = xbGetElementById('tabFiller');
	
	
	if (!corpo) {
		alert('corpo not found during init()');
		return;
	}

	if (!navegador) {
		alert('navegador not found during init()');
		return;
	}

	stlAllForms = new xbStyle(allForms);
	stlCorpo = new xbStyle(corpo);
	stlNavegador = new xbStyle(navegador);
	stlCentral = new xbStyle(central);
	stlClient = new xbStyle(client);
	stlTdleftTabs = new xbStyle(tdleftTabs);
	stlTdtopButtons = new xbStyle(tdtopButtons);
	stlTdBottomSeparetor = new xbStyle(tdBottomSeparetor);
	stlTdDivCentral = new xbStyle(tdDivCentral);
	stlTabFiller = new xbStyle(tabFiller);

	
/*	if (window.innerHeight){
		windowHeight=window.innerHeight;
		windowWidth=window.innerWidth;
//		stlCentral.setWidth(xbToInt(windowWidth - 16 )); 
		//alert(stlCorpo.getClientWidth());
		//alert(stlCorpo.getEffectiveValue('scroll'));
	}
	else if (document.body.clientHeight){*/
		windowHeight=document.documentElement.clientHeight;
	//}
	
	stlTdleftTabs.setHeight(windowHeight);
	stlClient.setHeight(xbToInt(windowHeight - stlTdtopButtons.getHeight() - stlTdBottomSeparetor.getHeight()));
	stlCorpo.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 -10)); 
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 15)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 34)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 37)); 
	stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth()-6)); 
//	stlTabFiller.setWidth(xbToInt(stlClient.getWidth()-100)); 

	bodyOnLoad();
	
    document.getElementById("currentTabId").value=tabCount;

//	alert(parent.divIndex);
	// need this for NN4 since our form is in a relative div...
	if (xbDEBUG.on && !wrapped)
	{
		xbDebugTraceObject('window', 'xbStyle');
		xbDebugTraceObject('window', 'xbClipRect');
		wrapped = true;
	}
	if (xbDEBUG.on)
	{
		xbDebugDumpProfile();
	}
}
/************/
/* Proposta */
/************/
function novaProposta(){

	var error = "";

    if($('#paramSeguradoraId').val() == ""){
		error = "Selecione uma Seguradora!";
		$('#paramSeguradoraId').focus();
	}else if($('#paramRamoId').val() == ""){
		error = "Selecione um Ramo!";
		$('#paramRamoId').focus();
	}

	if(error == ""){
		$("#gpSeguradoraId").val($('#paramSeguradoraId').val());
		$("#gpRamoId").val($('#paramRamoId').val());
		$("#gpTipoCliente").val($("#tipoCliente0").get(0).checked ? $("#tipoCliente0").val() : $("#tipoCliente1").val());
		submitForm($('#formLookup').get(0), getContextApp()+'/proposta/novo.action', false);
	}else{
		alert(error);
	}
}

function listaPropostas(){
	submitForm($('#formEdit').get(0), getContextApp()+'/proposta/displayList.action', false);
	mostrarMenu('buttonMenu');
	resizeArea(true);
}

function setarPedidoValidado(){
	if ($('#statusOperacional').val()=='0')
		$('#statusOperacional').val('1');
	if ($('#statusOperacional').val()=='5')
		$('#statusOperacional').val('51');
	if ($('#statusOperacional').val()=='8')
		$('#statusOperacional').val('81');
	
	submitForm($('#formEdit').get(0), getContextApp()+'/propostaTransportes/efetivarProposta.action', false);
}

function gerarProposta(){
	if ($('#statusOperacional').val()=='0' || $('#statusOperacional').val()=='1')
		$('#statusOperacional').val('4');
	if ($('#statusOperacional').val()=='5' || $('#statusOperacional').val()=='51')
		$('#statusOperacional').val('6');
	if ($('#statusOperacional').val()=='8' || $('#statusOperacional').val()=='81')
		$('#statusOperacional').val('9');
	
	submitForm($('#formEdit').get(0), getContextApp()+'/propostaTransportes/efetivarProposta.action', false);
}


function gerarApolice(){
	if ($('#statusOperacional').val()=='4')
		$('#statusOperacional').val('2');
	if ($('#statusOperacional').val()=='6')
		$('#statusOperacional').val('7');
	if ($('#statusOperacional').val()=='9')
		$('#statusOperacional').val('10');

	submitForm($('#formEdit').get(0), getContextApp()+'/propostaTransportes/efetivarProposta.action', false);
}

function salvarProposta(){
	if ($("#referenciaParcela").val()=='')
		$("#referenciaParcela").val($("#inicioVigencia").val().substring(3,10));
	
	if ($("#propostaId").val()=='')
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/salvarEditar.action', '#allForms', '#saveProgress');
	else
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/salvarEditar.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress');
	setSeguradoAlterado(false);
	formNavigateAlterado = false;

}

function excluirProposta(){
	var propostaId = $('#propostaId').val();
	if(propostaId != "" && $('#statusOperacional').val() == '0'){
		$("#gpPropostaId").val(propostaId);
		submitForm($('#formLookup').get(0), getContextApp()+'/propostaTransportes/excluir.action', false);
	}
}

/**************/
/* Seguradora */
/**************/
function carregaComboVistoriadora(seguradoraId) {
	$("#gpSeguradoraId").val(seguradoraId);
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/vistoriadoraPorSeguradora.action', '#divVistoriadora');
}

/**************/
/*  Clientes  */
/**************/
function carregaSegurado() {

	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpItemCorrente").val($("#itemCorrente").val());
	$("#gpClienteId").val($("#seguradoClienteId").val());
	$("#gpClienteCpf").val($("#seguradoCpf").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/propostaTransportesDadosSegurado.action', '#divDadosSegurado');
	alterado = true;
}

function carregaCliente() {

	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpTipoCliente").val($("#tipoCliente").val());
	$("#gpClienteId").val($("#clienteId").val());
	$("#gpClienteCpf").val($("#clienteCpf").val());
	$("#gpClienteCnpj").val($("#clienteCnpj").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/propostaTransportesDadosCliente.action', '#divDadosCliente');
	alterado = true;
	setTimeout(function(){
		if (!isEmpty('#clienteId')){
			if ($("#tipoCliente").val()==0){
				$("#cepRes").focus();
			}else{
				$("#cepCom").focus();
			}
		}else
			if ($("#tipoCliente").val()==0){
				$("#clientePFNome").focus();
			}else{
				$("#clientePJNome").focus();
			}
	}
	,200);
}

function carregaEstipulante() {
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpEstipulanteId").val($("#estipulanteId").val());
	$("#gpEstipulanteCnpj").val($("#estipulanteCnpj").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/propostaTransportesDadosEstipulante.action', '#divDadosEstipulante');
	alterado = true;
	setTimeout(function(){
		if (!isEmpty('#estipulanteId')){
			$("#cepEstipulante").focus();
		}else
			$("#estipulantePJNome").focus();
	}
	,200);
}

function apagarDadosBeneficiario(){
	$('#beneficiarioEmpresarialId').val('');
	$('#beneficiarioNome').val('');
	$('#beneficiarioDataNasc').val('');
	$('#beneficiarioSexo').val('');
	$('#beneficiarioParentesco').val('');
	$('#beneficiarioPercentual').val('');
}

function apagarDadosCliente(){
	$('#formLookup #currentTabId').val('0');
	$("#gpTipoCliente").val($("#tipoCliente").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/novoDadosClienteForm.action', '#divDadosCliente');
}

function apagarDadosEstipulante(){
	$('#formLookup #currentTabId').val('0');
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/novoDadosEstipulanteForm.action', '#divDadosEstipulante');
}

function editarCliente(){
	var clienteId = $('#clienteId').val(); 
	if(clienteId != ''){
		openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId, 'clienteEdicao', '750', '500', 'resizable=yes');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
}

function editarEstipulante(){
	var clienteId = $('#estipulanteId').val(); 
	if(clienteId != ''){
		openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId, 'clienteEdicao', '750', '500', 'resizable=yes');
	}else{
		alert('Esta Pessoa Juridica não possui registro no sistema!');
	}
}

function calculaParcelas(){

	var valor1aParcela = converte_numero($("#valor1aParcela").val());
	var premioTotal = converte_numero($("#premioTotal").val());
	var qtdeParcelas = converte_numero($("#quantParc").val());

	if(valor1aParcela == 0 || qtdeParcelas == 1 || valor1aParcela > premioTotal){
		
		if(qtdeParcelas == 0){
			qtdeParcelas = 1;
			$("#quantParc").val(1);
		}
		
		var valorParcela = premioTotal;
		
		$("#valor1aParcela").val(valorParcela.toFixed(2));
		valida_numero($("#valor1aParcela").get(0),15,2,'valor1aParcela');
		$("#valorDemaisParcelas").val(valorParcela.toFixed(2));
		valida_numero($("#valorDemaisParcelas").get(0),15,2,'valorDemaisParcelas');
	}else{
		calculaDemaisParcelas();
	}
	
}

function calculaDemaisParcelas(){

	var premioTotal = converte_numero($("#premioTotal").val());
	var qtdeParcelas = converte_numero($("#quantParc").val());
	var valor1aParcela = converte_numero($("#valor1aParcela").val());

	if(qtdeParcelas == 0){
		qtdeParcelas = 1;
		$("#quantParc").val(1);
	}

	var valorParcela = (premioTotal).toFixed(2);
	var valor1aParcela = (premioTotal).toFixed(2);
	$("#valorDemaisParcelas").val(valorParcela);
	valida_numero($("#valorDemaisParcelas").get(0),15,2,'valorDemaisParcelas');
	$("#valor1aParcela").val(valorParcela);
	valida_numero($("#valor1aParcela").get(0),15,2,'valor1aParcela');
}

function checarReferencia(referencia){
	
	if (referencia!=""){
		var splitRef = referencia.split("/");
		var mesRef = splitRef[0];
		var anoRef = parseInt(splitRef[1]);
		var inicioVigencia = $('#inicioVigencia').val();
		var splitVigIni = inicioVigencia.split("/");
		var mesVigIni = splitVigIni[1];
		var anoVigIni = parseInt(splitVigIni[2]);
		var terminoVigencia = $('#terminoVigencia').val();
		var splitVigTer = terminoVigencia.split("/");
		var mesVigTer = splitVigTer[1];
		var anoVigTer = parseInt(splitVigTer[2]);
		var msg='';
		
		if (mesRef<mesVigIni && anoRef==anoVigIni)
			msg='Mês da referencia menor que inicio vigência';
		if (mesRef>mesVigTer && anoRef==anoVigTer)
			msg='Mês da referencia maior que término vigência';
		if (anoRef<anoVigIni)
			msg='Ano da referencia menor que inicio vigência';
		if (anoRef>anoVigTer)
			msg='Ano da referencia maior que término vigência';
		
		if(msg != ''){ 
			alert(msg);
			$('#referenciaParcela').val("");
			$('#referenciaParcela').focus();
		}
	}
}

function calculaTotalComissao(){

	var premioLiquido = converte_numero($("#premioLiquido").val());
	var fator = converte_numero($("#fator").val());

	if(fator != 0 && premioLiquido != 0){
		$("#totalComissao").val((premioLiquido*fator/100).toFixed(2));
		valida_numero($("#totalComissao").get(0),15,2,'totalComissao');
	}
}

//Percentual sobre percentual da ComissÃ£o
var TP_COM_PERC_SOBRE_COMISSAO = 0;
// Percentual sobre Prêmio Líquido
var TP_COM_PERC_SOBRE_PREMIO_LIQ = 1;
// Valor fixo
var TP_COM_VALOR = 2;

function calculaVlrComissaoComissionado(comissao){
	if($('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_COMISSAO){
		var valorComissaoPrincipal = converte_numero($("#totalComissao").val());
		var fator = converte_numero(comissao);

		if(fator != 0 && valorComissaoPrincipal != 0){
			$("#comissionadoPropostaVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));
			valida_numero($("#comissionadoPropostaVlrComissao").get(0),15,2,'comissionadoPropostaVlrComissao');
		}
	}else if($('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_PREMIO_LIQ){
		var valorComissaoPrincipal = converte_numero($("#premioLiquido").val());
		var fator = converte_numero(comissao);

		if(fator != 0 && valorComissaoPrincipal != 0){
			$("#comissionadoPropostaVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));
			valida_numero($("#comissionadoPropostaVlrComissao").get(0),15,2,'comissionadoPropostaVlrComissao');
		}
	}

}

function calculaFator(){

	var premioLiquido = converte_numero($("#premioLiquido").val());
	var totalComissao = converte_numero($("#totalComissao").val());

	if(totalComissao != 0 && premioLiquido != 0){
		$("#fator").val((totalComissao*100/premioLiquido).toFixed(2));
		valida_numero($("#fator").get(0),15,2,'fator');
	}
}

/**************/
/*  Parcelas  */
/**************/
function carregaParcelas(){

	if(alterado){
		$("#blnGerarParcelas").val("true");
		salvarProposta();
	}else{
		$("#gpPropostaId").val($("#propostaId").val());
		$("#gpPropostaParcelaAtual").val($("#parcelaAtual").val());
		$("#gpQuantParc").val($('#quantParc').val());
		$("#gpFormaPagamento").val($('#formaPagamento').val());
		$("#gpFormaPagamento1aParcela").val($('#formaPagamento1aParcela').val());
		$("#gpValorDemaisParcelas").val($('#valorDemaisParcelas').val());
		$("#gpDataVencim1aParcela").val($("#dataVencim1aParcela").val());
		$("#gpValorTransportado").val($("#valorTransportado").val());
		$("#gpTaxaFaturaAtual").val($("#taxaFaturaAtual").val());
		$("#gpCustoApolice").val($("#custoApolice").val());
		$("#gpNroFatura").val($("#nroFatura").val());
		$("#gpValor1aParcela").val($("#valor1aParcela").val());
		$("#gpPremioTotal").val($("#premioTotal").val());
		$("#gpNroBanco").val($("#nroBanco").val());
		$("#gpCodigoAgencia").val($("#codigoAgencia").val());
		$("#gpContaCorrente").val($("#contaCorrente").val());
		$("#gpContaDigito").val($("#contaDigito").val());
		submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/gerarParcelas.action', '#divParcelas');
	}
}

/***************/
/*  Comissões  */
/***************/
function carregarComissionados(){

	var propostaId = $('#propostaId').val();
	if(propostaId != ""){
		$("#comPropostaId").val(propostaId);
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/carregarComissionados.action', '#divDadosComissao');
	}
}

function inserirComissionado(){
	if(validaComissionadoComissao()){
		$("#comPropId").val($('#comissionadoPropostaId').val());
		$("#comPropPropostaId").val($("#propostaId").val());
		$("#comPropPessoaId").val($("#comissionadoPropostaPessoaId").val());
		$("#comPropComissionadoParcelaId").val($("#comissionadoPropostaParcelaId").val());
		$("#comPropComissao").val($("#comissionadoPropostaComissao").val());
		$("#comPropTipoComissao").val($("#comissionadoPropostaTipoComissao").val());
		$("#comPropVlrComissao").val($("#comissionadoPropostaVlrComissao").val());
		$("#comDemaisParcelas").val($("#demaisParcelas").val());
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/inserirComissionado.action', '#divListaComissionados');
		$('#comissionadoPropostaPessoaId').val('');
		$('#comissionadoPropostaPessoaNome').val('');
		$("#comissionadoPropostaComissao").val('');
		$("#comissionadoPropostaTipoComissao").val('');
	}
}

function removerComissionado(id){
	$("#comPropId").val(id);
	$("#comPropPropostaId").val($("#propostaId").val());
	$("#comDemaisParcelas").val($("#demaisParcelas").val());
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/removerComissionado.action', '#divListaComissionados');
	salvarProposta();
}

function editarComissionado(id){
	$("#comPropId").val(id);
	$("#comDemaisParcelas").val($("#demaisParcelas").val());
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/editarComissionado.action', '#divDadosComissionados');
}

function alterarGrupoDeVenda(){
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/alterarGrupoVenda.action', '#divDadosComissao');
}

function alterarGrupoDeVendaParcelaSelecionada(){
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpGrupoDeVendaId").val($("#comissoesGrupoDeVendaId").val());
	$("#gpParcelaSelecionadaId").val($("#comissionadoPropostaParcelaId").val());
	$("#gpDemaisParcelas").val($("#demaisParcelas").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaTransportes/alterarGrupoVendaComissao.action', '#divRepasseComissao');
}

/*****************/
/*   Cobertura   */
/*****************/

/**************/
/* Coberturas */
/**************/
function removeRiscoCobertura(id){
	$("#rcRiscoCoberturaId").val(id);
	$("#rcRiscoDiversoId").val($("#riscoId").val());
	submitFormAjax('#formRiscoCobertura', getContextApp()+'/propostaRiscosDiversos/excluirRiscoCobertura.action', '#divListaCoberturas');
	$("#riscoCoberturaNome").focus();
}

function inserirRiscoCobertura(){
	$("#rcRiscoDiversoId").val($("#riscoId").val());
	$("#rcRiscoCoberturaId").val($("#riscoCoberturaId").val());
	$("#rcRiscoCoberturaNome").val($("#riscoCoberturaNome").val());
	$("#rcRiscoCoberturaPremio").val($("#riscoCoberturaPremio").val());
	$("#rcRiscoCoberturaFranquia").val($("#riscoCoberturaFranquia").val());
	$("#rcRiscoCoberturaLMI").val($("#riscoCoberturaLMI").val());
	$("#rcRiscoCoberturaTextoFranquia").val($("#riscoCoberturaTextoFranquia").val());
	submitFormAjax('#formRiscoCobertura', getContextApp()+'/propostaRiscosDiversos/inserirRiscoCobertura.action', '#divListaCoberturas');
	$("#riscoCoberturaId").val('');
	$("#riscoCoberturaNome").val('');
	$("#riscoCoberturaPremio").val('');
	$("#riscoCoberturaFranquia").val('');
	$("#riscoCoberturaLMI").val('');
	$("#riscoCoberturaTextoFranquia").val('');
	$("#riscoCoberturaNome").focus();
}

function editarRiscoCobertura(id){
	$("#rcRiscoCoberturaId").val(id);
	$("#riscoCoberturaNome").focus();
	submitFormAjax('#formRiscoCobertura', getContextApp()+'/propostaRiscosDiversos/editarRiscoCobertura.action', '#divDadosCobertura');
}

function abrirDivNovaCobertura(){
	$('#novaCobertura').modal({onOpen: openModalNovaCobertura, close: false});
}

function openModalNovaCobertura (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	
	$("#paramCobPropostaId").val($('#propostaId').val());		
	setTimeout(function(){
		$("#paramCobDescricaoCobertura").focus();
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	},2000);
}

function inserirCobertura(){
	$('#paramCobItemCorrente').val(0);
	submitFormAjax('#formCobertura', getContextApp()+'/propostaTransportes/inserirCobertura.action', '#divListaCoberturas');
	$("#paramCobDescricaoCobertura").val('');
	$("#paramCobInformaFranquia").val('');
}

function proximoItem(){
	var _itens = converte_numero($("#itens").val());
	var _item  = converte_numero($("#itemCorrente").val());
	_item  = _item + 1;

	if (_item<_itens){
		$("#itemCorrente").val(_item);
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/editarSegurado.action', '#tabPane1');
	}else
		return false;
}

function ultimoItem(){
	var _item  = converte_numero($("#itens").val());

	if (_item>1){
		$("#itemCorrente").val(_item-1);
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/editarSegurado.action', '#tabPane1');
	}else
		return false;
}

function itemAnterior(){
	var _item = converte_numero($("#itemCorrente").val());
	_item = _item - 1;
	if (_item>=0){
		$("#itemCorrente").val(_item);
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/editarSegurado.action', '#tabPane1');
	}else
		return false;
}

function primeiroItem(){
	var _item = converte_numero($("#itemCorrente").val());

	if (_item>0){
		$("#itemCorrente").val(0);
		submitFormAjax('#formEdit', getContextApp()+'/propostaTransportes/editarSegurado.action', '#tabPane1');
	}else
		return false;
}

/***************/
/*             */
/***************/
function buildReport(url){
	frmLOV = window.open(url , "winReport", "left=0,top=0,scrollbars=yes,resizable=yes,width=800,height=600");
	frmLOV.focus();
	if (frmLOV.opener == null) {
		frmLOV.opener = self;
	}
}

function showHideDadosFormaPagamento(){
	
	var formaPagamento = $('#formaPagamento').val();
	var formaPagamento1aParcela = $('#formaPagamento1aParcela').val();
	
	$('#tableDadosDebitoConta').hide();

	if (formaPagamento == '4' || formaPagamento1aParcela == '4'){ // DÃ©bito em Conta
	    $('#tableDadosDebitoConta').show();
	}
}

function openWindowCliente(){
	var url = '';
	if($('#clienteNome')[0].value != ''){
		if($('#pfRG')[0] != null){
			url = contextApp+'/pessoaFisica/editar.action?pessoaFisica.id='+$('#clienteId')[0].value;
		}else if($('#pjRazaoSocial')[0] != null){
			url = contextApp+'/pessoaJuridica/editar.action?pessoaJuridica.id='+$('#clienteId')[0].value;
		}
	}else{
		url = contextApp+'/pessoa/displayList.action';
	}
	if(url != ''){
		openWin(url, 'clienteEdicao', '750', '500', 'resizable=yes');
	}
}

function openWindowGrupoDeVenda(){
	var grupoDeVendaId = $('#grupoVendaId')[0];
	if(grupoDeVendaId.value != ''){
		url = contextApp+'/grupoDeVenda/editar.action?grupoDeVenda.id='+$('#grupoVendaId')[0].value;
		if(url != ''){
			openWin(url, 'grupoDeVendaEdicao', '750', '500', 'resizable=yes');
		}
	}else{
		alert('Selecione um Grupo de Venda.');
	}
}

function nextTab(event){

	// Tecla TAB pressionada.
	if(event.keyCode == 9 || event.keyCode == 13){
		navigate('proximo');
		return false;
	}
	return true;
}

function handleReadonly(){
	if(!isEmpty('#propostaId') || !isEmpty('#clienteId')){
		$('#tableDadosCliente input').attr('readonly','true');
		$('#tableDadosCliente input').addClass('readonly');
		$('#tableDadosCliente select').attr('disabled','true');
		$('#tableDadosCliente select').addClass('readonly');
	}
}

function setAlterado(b){
	$("#blnReloaded").val('false');
	alterado = b;
}

function setSeguradoAlterado(b){
	alterado = b;
	seguradoAlterado = b;
	$('#seguradoAlterado').val(b);
}

function showOptionsRecebimentoComissao(){

	var tipoRecebimentoComissao = $('#tipoRecebimentoComissao').val();

	if(tipoRecebimentoComissao == '0'){
		$('#labelOpcoesRecebComissao').html('Nro Parcelas');
		$('#labelOpcoesRecebComissao').html('');
		$('#labelOpcoesRecebComissao').attr('for','');
		$('#quantParcComissao').addClass('readonly');
		$('#descontaCustoApoliceIof').hide();
	}else if(tipoRecebimentoComissao == '1'){
		$('#labelOpcoesRecebComissao').html('Nro Parcelas');
		$('#labelOpcoesRecebComissao').html('');
		$('#labelOpcoesRecebComissao').attr('for','');
		$('#quantParcComissao').addClass('readonly');
		$('#descontaCustoApoliceIof').hide();
	}else if(tipoRecebimentoComissao == '2'){
		$('#labelOpcoesRecebComissao').html('Nro Parcelas');
		$('#labelOpcoesRecebComissao').attr('for','quantParcComissao');
		$('#quantParcComissao').removeClass('readonly');
		$('#quantParcComissao').focus();
		$('#descontaCustoApoliceIof').hide();
	}
}

function showHideDadosDemaisParcelas(){
	
	var qtdeParcelas = converte_numero($("#quantParc").val());
	if(qtdeParcelas == 0 || qtdeParcelas == 1){
		$('#formaPagamento').val('');
		$('#formaPagamento').hide();
		$('#valorDemaisParcelas').val('');
		$('#valorDemaisParcelas').hide();
		$('#labelFormaPagamento').hide();
		$('#labelValorDemaisParcelas').hide();
	}else{
		$('#formaPagamento').show();
		$('#valorDemaisParcelas').show();
		$('#labelFormaPagamento').show();
		$('#labelValorDemaisParcelas').show();
	}
}

function disableDadosClientes(){
	if(!isEmpty('#propostaId') || !isEmpty('#clienteId')){
		$('#tableDadosCliente input[type=text]').attr('disabled','true');
		$('#tableDadosCliente input[type=text]').addClass('readonly');
		$('#tableDadosCliente select').attr('disabled','true');
		$('#tableDadosCliente select').addClass('readonly');
	}
}

function enableDisableDadosCobertura(rowNumber){
	if(rowNumber == null || rowNumber == ''){
		var lmiElements = $('#tableCoberturas tr input').filter('[id^="coberturaLmi"]');
		for(var i=0 ; i<lmiElements.length ; i++){
			if(converte_numero(lmiElements[i].value) == 0){
				$('#coberturaFranquia'+i).attr('disabled',true);
				$('#coberturaFranquia'+i).addClass('readonly');
				$('#coberturaTextoFranquia'+i).attr('disabled',true);
				$('#coberturaTextoFranquia'+i).addClass('readonly');
				$('#coberturaPremio'+i).attr('disabled',true);
				$('#coberturaPremio'+i).addClass('readonly');
			}else{
				$('#coberturaFranquia'+i).attr('disabled',false);
				$('#coberturaFranquia'+i).removeClass('readonly');
				$('#coberturaTextoFranquia'+i).attr('disabled',false);
				$('#coberturaTextoFranquia'+i).removeClass('readonly');
				$('#coberturaPremio'+i).attr('disabled',false);
				$('#coberturaPremio'+i).removeClass('readonly');
			}
		}
	}else{
		if(converte_numero($('#coberturaLmi'+rowNumber).val()) == 0){
			$('#coberturaFranquia'+rowNumber).attr('disabled',true);
			$('#coberturaFranquia'+rowNumber).addClass('readonly');
			$('#coberturaTextoFranquia'+rowNumber).attr('disabled',true);
			$('#coberturaTextoFranquia'+rowNumber).addClass('readonly');
			$('#coberturaPremio'+rowNumber).attr('disabled',true);
			$('#coberturaPremio'+rowNumber).addClass('readonly');
		}else{
			$('#coberturaFranquia'+rowNumber).attr('disabled',false);
			$('#coberturaFranquia'+rowNumber).removeClass('readonly');
			$('#coberturaTextoFranquia'+rowNumber).attr('disabled',false);
			$('#coberturaTextoFranquia'+rowNumber).removeClass('readonly');
			$('#coberturaPremio'+rowNumber).attr('disabled',false);
			$('#coberturaPremio'+rowNumber).removeClass('readonly');
		}
	}
}

var fieldErrors = '';
var msgErrors = '';
var errors = '';

function validacaoGerarProposta(apolice){

	if(isEmpty('#dataProposta')){
		fieldErrors += '- Data da Proposta<br/>';
	}
	if(isEmpty('#seguradoraId')){
		fieldErrors += '- Seguradora<br/>';
	}
	if(isEmpty('#ramoId')){
		fieldErrors += '- Ramo<br/>';
	}
	
	if(isEmpty('#telefonePreferencial')){
		fieldErrors += '- Telefone Preferencial do Segurado<br/>';
	}
	if(isEmpty('#cepRes')){
		fieldErrors += '- CEP<br/>';
	}
	if(isEmpty('#lograRes')){
		fieldErrors += '- Logradouro<br/>';
	}
	if(isEmpty('#bairroRes')){
		fieldErrors += '- Bairro<br/>';
	}
	if(isEmpty('#cidadeRes')){
		fieldErrors += '- Cidade<br/>';
	}
	if(isEmpty('#ufRes')){
		fieldErrors += '- Estado<br/>';
	}

	if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size() == 0){
		msgErrors += '';
	}
	if(isEmpty('#premioLiquido')){
		fieldErrors += '- Prêmio Líquido<br/>';
	}
	if(isEmpty('#premioTotal')){
		fieldErrors += '- Prêmio Total<br/>';
	}
	if(isEmpty('#fator')){
		fieldErrors += '- Fator<br/>';
	}
	if(isEmpty('#inicioVigencia')){
		fieldErrors += '- Início Vigência<br/>';
	}
	if(isEmpty('#terminoVigencia')){
		fieldErrors += '- Têrmino Vigência<br/>';
	}
	if(isEmpty('#formaPagamento1aParcela')){
		fieldErrors += '- Forma de Pagamento<br/>';
	}
	if(isEmpty('#formaPagamento') && $('quantParc').val() > 1){
		fieldErrors += '- Forma de Pagamento<br/>';
	}
	if(isEmpty('#quantParc')){
		fieldErrors += '- Quantidade de Parcelas<br/>';
	}
	if(isEmpty('#dataVencim1aParcela')){
		fieldErrors += '- Data Vencimento 1a Parcela<br/>';
	}
	if(isEmpty('#grupoDeVendaId')){
		fieldErrors += '- Grupo de Venda da Proposta<br/>';
	}
	if(isEmpty('#nroPropostaSeg')){
		fieldErrors += '- Nro da Proposta na Seguradora<br/>';
	}
	if(isEmpty('#dataTransmissao')){
		fieldErrors += '- Data da Transmissão<br/>';
	}
	if(isEmpty('#dataGeracao')){
		fieldErrors += '- Data da Geração<br/>';
	}
	
	if (isNaN(apolice))
		msg = "efetivação do Proposta";
	else
		msg = apolice;
	if(fieldErrors != ''){
		errors += '<b>Para a '+msg+', os seguintes campos devem ser preenchidos: </b><br/>'+fieldErrors;
	}
	if(msgErrors != ''){
		errors += '<b>Existem condições pendentes que impossibilitam a '+msg+': </b><br/>'+msgErrors;
	}
	
	
	if(errors != ''){
		$('div[id^="divMessagesTab"]').html('').html(errors);
		fieldErrors = '';
		msgErrors = '';
		errors = '';
		return false;
	}
	fieldErrors = '';
	msgErrors = '';
	errors = '';
	return true;
}

function validacaoPedido(apolice){

	if(isEmpty('#dataProposta')){
		fieldErrors += '- Data da Proposta<br/>';
	}
	if(isEmpty('#seguradoraId')){
		fieldErrors += '- Seguradora<br/>';
	}
	if(isEmpty('#ramoId')){
		fieldErrors += '- Ramo<br/>';
	}
	
	if(isEmpty('#telefonePreferencial')){
		fieldErrors += '- Telefone Preferencial do Segurado<br/>';
	}
	if(isEmpty('#cepRes')){
		fieldErrors += '- CEP<br/>';
	}
	if(isEmpty('#lograRes')){
		fieldErrors += '- Logradouro<br/>';
	}
	if(isEmpty('#bairroRes')){
		fieldErrors += '- Bairro<br/>';
	}
	if(isEmpty('#cidadeRes')){
		fieldErrors += '- Cidade<br/>';
	}
	if(isEmpty('#ufRes')){
		fieldErrors += '- Estado<br/>';
	}

	if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size() == 0){
		msgErrors += '';
	}
	if(isEmpty('#premioLiquido')){
		fieldErrors += '- Prêmio Líquido<br/>';
	}
	if(isEmpty('#premioTotal')){
		fieldErrors += '- Prêmio Total<br/>';
	}
	if(isEmpty('#fator')){
		fieldErrors += '- Fator<br/>';
	}
	if(isEmpty('#inicioVigencia')){
		fieldErrors += '- Início Vigência<br/>';
	}
	if(isEmpty('#terminoVigencia')){
		fieldErrors += '- Têrmino Vigência<br/>';
	}
	if(isEmpty('#formaPagamento1aParcela')){
		fieldErrors += '- Forma de Pagamento<br/>';
	}
	if(isEmpty('#formaPagamento') && $('quantParc').val() > 1){
		fieldErrors += '- Forma de Pagamento<br/>';
	}
	if(isEmpty('#quantParc')){
		fieldErrors += '- Quantidade de Parcelas<br/>';
	}
	if(isEmpty('#dataVencim1aParcela')){
		fieldErrors += '- Data Vencimento 1a Parcela<br/>';
	}
	if(isEmpty('#grupoDeVendaId')){
		fieldErrors += '- Grupo de Venda da Proposta<br/>';
	}
	
	if (isNaN(apolice))
		msg = "Validação do Pedido";
	else
		msg = apolice;
	if(fieldErrors != ''){
		errors += '<b>Para a '+msg+', os seguintes campos devem ser preenchidos: </b><br/>'+fieldErrors;
	}
	if(msgErrors != ''){
		errors += '<b>Existem condições pendentes que impossibilitam a '+msg+': </b><br/>'+msgErrors;
	}
	
	
	if(errors != ''){
		$('div[id^="divMessagesTab"]').html('').html(errors);
		fieldErrors = '';
		msgErrors = '';
		errors = '';
		return false;
	}
	fieldErrors = '';
	msgErrors = '';
	errors = '';
	return true;
}

function validacaoGerarApolice(){
	if(isEmpty('#nroApolice')){
		fieldErrors += '- Numero da ApÃ³lice<br/>';
	}
	if(isEmpty('#dataEmissaoApolice')){
		fieldErrors += '- Data de EmissÃ£o da ApÃ³lice<br/>';
	}
	if(isEmpty('#dataRecebApolice')){
		fieldErrors += '- Data de Recebimento da ApÃ³lice<br/>';
	}
//	if(isEmpty('#propostaCodigoIdentificacao')){
//		fieldErrors += '- Nro do C.I.<br/>';
//	}
	return validacaoGerarProposta("Gerar ApÃ³lice");	
}

