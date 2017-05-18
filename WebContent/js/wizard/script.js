﻿﻿ArrNomeCampo     = ["#dataProposta", "#ramoId", "#seguradoraId", "#clientePFNome", "#pfGrupoDeVendaId", "#clientePJNome", "#pjGrupoDeVendaId"];
ArrLabelCampo    = ["Data da Proposta", "Ramo de Seguro", "Seguradora","Nome do Cliente","Grupo de Venda","Nome do Cliente","Grupo de Venda"];
ArrTipoCampo     = [TIPOFORM_DATA, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT];
ArrOperacaoCampo = [OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE];

/************/
/* Proposta */
/************/

var fieldErrors = '';
var msgErrors = '';
var errors = '';

/**************/
/*  Clientes  */
/**************/
  
function novaProposta(){

	var error = "";

	// Valida os dados selecionados.
	if($('#paramTipo').val() == 'NOVA'){
		if($('#paramSeguradoraId').val() == ""){
			error = "Selecione uma Seguradora!";
			$('#paramSeguradoraId').focus();
		}else if($('#paramRamoId').val() == ""){
			error = "Selecione um Ramo!";
			$('#paramRamoId').focus();
		}
		
		if(error != ""){
			alert(error);
			return;
		}
	}

	// Define os parametros a serem setados e o action a ser chamado.
    var actionName = '';
    if($('#paramTipo').val() == 'NOVA'){
    	$("#gpSeguradoraId").val($('#paramSeguradoraId').val());
    	$("#gpRamoId").val($('#paramRamoId').val());
    	$("#gpTipoCliente").val($('input[name=ntipoCliente]:checked').val());
    	actionName = 'novo';
    }else if($('#paramTipo').val() == 'RENOVACAO'){
    	$("#gpBlnRenovacao").val('true');
    	actionName = 'displayList';
    }
    submitForm($('#formLookup').get(0), getContextApp()+'/proposta/'+actionName+'.action', false);
}

function listaPropostas(){
	submitForm($('#formEdit').get(0), getContextApp()+'/proposta/displayList.action', false);
	mostrarMenu('buttonMenu');
	resizeArea(true);
}

function salvarProposta(){
	if ($("#currentTabId").val()==3)
		$("#blnReloaded").val("false");
	if (propostaPerfilAlterada)
		$("#perfilAlterado").val('true');
		
	if ($("#propostaId").val()=='' || $("#clienteId").val()==''){
		if($('#tipoCliente').val()=='0'){
			if(isEmpty('#clientePFNome')){
				$("#clientePFNome").focus();
				alert("O nome do segurado deve ser informado!");
				return;
			}
		}else{
			if(isEmpty('#clientePJNome')){
				$("#clientePJNome").focus();
				alert("O nome do segurado deve ser informado!");
				return;
			}
		}

		submitFormAjax('#formEdit', getContextApp()+'/wizard/salvarEditar.action', '#allForms', '#saveProgress');
	}else{
		if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5' && $('#statusOperacional').val()!='8'){
			
			if(isEmpty('#numeroItem') || $('#numeroItem').val()<1){
				fieldErrors += '- Numero do Item<br/>';
			}
			if(isEmpty('#marcaId')){
				fieldErrors += '- Fabricante do Veiculo<br/>';
			}
//			if(isEmpty('#modeloVeiculoId')){
//				fieldErrors += '- Modelo do Veiculo<br/>';
//			}
			if(fieldErrors != ''){
				errors += '<b>Dados Obrigatórios não foram informarmados: </b><br/>'+fieldErrors;
				$('div[id^="divMessagesTab"]').html('').html(errors);
				fieldErrors = '';
				return false;
			}
		}
		
		submitFormAjax('#formEdit', getContextApp()+'/wizard/salvarEditar.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress');
	}
	if($("#isFrota").val() == "true"){
		$("#btnf10").attr("onClick","abrirModalRelatorioFrota()");
	}
	setAutomovelAlterado(false);
	$("#perfilAlterado").val('false');
	propostaPerfilAlterada = false;
	formNavigateAlterado = false;
	relembrarDecisao = false;
}

function setarPedidoValidado(){
	if ($('#statusOperacional').val()=='0')
		$('#statusOperacional').val('1');
	if ($('#statusOperacional').val()=='5')
		$('#statusOperacional').val('51');
	if ($('#statusOperacional').val()=='8')
		$('#statusOperacional').val('81');
	
	submitForm($('#formEdit').get(0), getContextApp()+'/wizard/efetivarProposta.action', false);
}

function gerarProposta(){
	if ($('#statusOperacional').val()=='0' || $('#statusOperacional').val()=='1')
		$('#statusOperacional').val('4');
	if ($('#statusOperacional').val()=='5' || $('#statusOperacional').val()=='51')
		$('#statusOperacional').val('6');
	if ($('#statusOperacional').val()=='8' || $('#statusOperacional').val()=='81')
		$('#statusOperacional').val('9');
	
	submitForm($('#formEdit').get(0), getContextApp()+'/wizard/efetivarProposta.action', false);
}

function gerarApolice(){
	if ($('#statusOperacional').val()=='4')
		$('#statusOperacional').val('2');
	if ($('#statusOperacional').val()=='6')
		$('#statusOperacional').val('7');
	if ($('#statusOperacional').val()=='9')
		$('#statusOperacional').val('10');

	submitForm($('#formEdit').get(0), getContextApp()+'/wizard/efetivarProposta.action', false);
}

function excluirProposta(){
	var propostaId = $('#propostaId').val();
	if(propostaId != "" && $('#statusOperacional').val() == '0'){
		$("#gpPropostaId").val(propostaId);
		submitForm($('#formLookup').get(0), getContextApp()+'/wizard/excluir.action', false);
	}
}

/**************/
/* Condutores */
/**************/
function removeCondutor(id){
	$("#fcCondutorId").val(id);
	$("#fcCondutorProposta").val($("#propostaId").value);
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/excluirCondutor.action', '#divListaCondutores');
	$("#condutorNome").focus();
}

function editarCondutor(id){
	$("#fcCondutorId").val(id);
	$("#condutorNome").focus();
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/editarCondutor.action', '#divDadosCondutor');
}

function inserirCondutor(){
	$("#fcCondutorId").val($("#condutorId").val());
	$("#fcCondutorNome").val($("#condutorNome").val());
	$("#fcCondutorTipoCondutor").val($("#condutorTipoCondutor").val());
	if($("#condutorTipoCondutor").val() == 'SIM'){
		$("#fcIsCondutorPrincipal").val(true);
	}else{
		$("#fcIsCondutorPrincipal").val(false);
	}
	$("#fcCondutorDataNascimento").val($("#condutorDataNascimento").val());
	$("#fcCondutorSexo").val($("#condutorSexo").val());
	$("#fcCondutorTelefones").val($("#condutorTelefones").val());
	$("#fcCondutorEstadoCivil").val($("#condutorEstadoCivil").val());
	$("#fcCondutorCNH").val($("#condutorCNH").val());
	$("#fcCondutorData1aHabilitacao").val($("#condutorData1aHabilitacao").val());
	$("#fcCondutorProfissao").val($("#condutorProfissao").val());
	$("#fcCondutorCPF").val($("#condutorCPF").val());
	$("#fcCondutorProposta").val($("#propostaId").val());
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/inserirCondutor.action', '#divListaCondutores');
	$("#condutorId").val('');
	$("#condutorNome").val('');
	$("#condutorTipoCondutor").val('');
	$("#condutorDataNascimento").val('');
	$("#condutorSexo").val('');
	$("#condutorTelefones").val('');
	$("#condutorEstadoCivil").val('');
	$("#condutorCNH").val('');
	$("#condutorData1aHabilitacao").val('');
	$("#condutorProfissao").val('');
	$("#condutorCPF").val('');
	$("#condutorNome").focus();
}

function validaCondutorPrincipal(){

	if($("#condutorTipoCondutor").val().toUpperCase() == 'SIM'){
		if($('#tableCondutorItens tr td[cellIndex=2]:contains("SIM")').size() > 0){
			return confirm("Já existe um Condutor Principal cadastrado.\nDeseja cadastrar este novo condutor como Condutor Principal?");
		}
	}

	//return confirm("Confirma inclusão?");
	return true;
}

function importarDadosCliente(){
/*	$("#condutorId").val('');
	$("#condutorNome").val($("#clientePFNome").val());
	$("#condutorEstadoCivil").val($('#pfEstadoCivil').val());
	$("#condutorDataNascimento").val($("#dataNascimento").val());
	$("#condutorSexo").val($("#sexo").val());
	$("#condutorTelefones").val($("#telefonePreferencial").val());
	$("#condutorTipoCondutor").val('SIM');
	$("#condutorProfissao").val($("#pfProfissao").val());
	$("#condutorCNH").val($("#cnh").val());
	$("#condutorData1aHabilitacao").val($("#data1aHabilitacao").val());
	$("#condutorDataVencHabilitacao").val($("#dataVencHabilitacao").val());
	$("#condutorCPF").val($("#clienteCpf").val());
*/	$("#fcCondutorId").val('');
	$("#fcCondutorNome").val($("#clientePFNome").val());
	$("#fcCondutorTipoCondutor").val('SIM');
	$("#fcCondutorDataNascimento").val($("#dataNascimento").val());
	$("#fcCondutorSexo").val($("#sexo").val());
	$("#fcCondutorTelefones").val($("#telefonePreferencial").val());
	$("#fcCondutorEstadoCivil").val($("#pfEstadoCivil").val());
	$("#fcCondutorCNH").val($("#cnh").val());
	$("#fcCondutorData1aHabilitacao").val($("#data1aHabilitacao").val());
	$("#fcCondutorDataVencHabilitacao").val($("#dataVencHabilitacao").val());
	$("#fcCondutorProfissao").val($("#pfProfissao").val());
	$("#fcCondutorCPF").val($("#clienteCpf").val());
	$("#fcCondutorProposta").val($("#propostaId").val());
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/inserirCondutor.action', '#divListaCondutores');
}

function apagarDadosCondutor(){
	if(confirm("Tem certeza que deseja apagar os Dados do Condutor?")){
		$("#condutorId").val('');
		$("#condutorNome").val('');
		$("#condutorEstadoCivil").val('');
		$("#condutorDataNascimento").val('');
		$("#condutorSexo").val('');
		$("#condutorTelefones").val('');
		$("#condutorTipoCondutor").val('');
		$("#condutorProfissao").val('');
		$("#condutorCNH").val('');
		$("#condutorData1aHabilitacao").val('');
		$("#condutorCPF").val('');
	}
}

function handleFocusNomeCondutor(event, value, contextId){
	if((value == null || value == '') && event.keyCode == 9 ){
		$(':input:enabled:visible:first', contextId).focus();
		//focusFirst($(contextId));
		return false;
	}
	return true;
}
/**************/
/* Seguradora */
/**************/
function carregaComboVistoriadora(seguradoraId) {
	$("#gpSeguradoraId").val(seguradoraId);
	submitFormAjax('#formLookup', getContextApp()+'/wizard/vistoriadoraPorSeguradora.action', '#divVistoriadora');
}

function carregaComboCondPagto(seguradoraId) {
	$("#gpSeguradoraId").val(seguradoraId);
	submitFormAjax('#formLookup', getContextApp()+'/wizard/condPagtoPorSeguradora.action', '#divCondPagto');
}

/**************/
/*  Clientes  */
/**************/
function carregaCliente() {

	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpTipoCliente").val($("#tipoCliente").val());
	$("#gpClienteId").val($("#clienteId").val());
	$("#gpClienteCpf").val($("#clienteCpf").val());
	$("#gpClienteCnpj").val($("#clienteCnpj").val());
	submitFormAjax('#formLookup', getContextApp()+'/wizard/wizardDadosCliente.action', '#divDadosCliente');
	alterado = true;
	formNavigateAlterado = true;
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

function apagarDadosCliente(){
	$('#formLookup #currentTabId').val('0');
	$("#gpTipoCliente").val($("#tipoCliente").val());
	setAlterado(true);
	formNavigateAlterado = true;
	submitFormAjax('#formLookup', getContextApp()+'/wizard/novoDadosClienteForm.action', '#divDadosCliente');
}

function editarCliente(){
	var clienteId = $('#clienteId').val();  
	if(clienteId != ''){
		openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId, 'clienteEdicao', '750', '500', 'resizable=yes');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
}

/**************/
/*  Parcelas  */
/**************/
function carregaParcelas(){
	if ($("#formaPagamento").val()=='' && $('#quantParc').val() > 1){
		$("#formaPagamento").focus();
		alert("Forma de pagamento das demais parcelas, deve ser informada!");
		return;
	}
		
	if(alterado){
		$("#blnGerarParcelas").val("true");
		salvarProposta(); 
	}else{
		$("#gpPropostaId").val($("#propostaId").val());
		$("#gpQuantParc").val($('#quantParc').val());
		$("#gpFormaPagamento").val($('#formaPagamento').val());
		$("#gpFormaPagamento1aParcela").val($('#formaPagamento1aParcela').val());
		$("#gpValorDemaisParcelas").val($('#valorDemaisParcelas').val());
		$("#gpDataVencim1aParcela").val($("#dataVencim1aParcela").val());
		$("#gpValor1aParcela").val($("#valor1aParcela").val());
		$("#gpPremioTotal").val($("#premioTotal").val());
		$("#gpNroBanco").val($("#nroBanco").val());
		$("#gpCodigoAgencia").val($("#codigoAgencia").val());
		$("#gpContaCorrente").val($("#contaCorrente").val());
		$("#gpContaDigito").val($("#contaDigito").val());
		submitFormAjax('#formLookup', getContextApp()+'/wizard/gerarParcelas.action', '#divParcelas');
	}
}


/***************/
/*  Comissões  */
/***************/

// Percentual sobre percentual da Comissão
var TP_COM_PERC_SOBRE_COMISSAO = 0;
// Percentual sobre Prêmio Líquido
var TP_COM_PERC_SOBRE_PREMIO_LIQ = 1;
// Valor fixo
var TP_COM_VALOR = 2;

function validaComissionado(){

	var hasError = false;
	var divComissionados = $('#divMessagesComissionados').html('').get(0);

	if($('#comissionadoPropostaPessoaId').val() == ""){
		addErrorText('É necessário especificar uma Pessoa.', divComissionados);
		hasError = true;
	}
	if($('#comissionadoPropostaTipoComissao').val() == ""){
		addErrorText('É necessário especificar o Tipo de comissão.', divComissionados);
		hasError = true;
	}
	if((($('#comissionadoPropostaComissao').val() == "" || $('#comissionadoPropostaComissao').val() == "0,00") && $('#comissionadoPropostaTipoComissao').val() != TP_COM_VALOR)){
		addErrorText('É necessário especificar um Percentual para o comissionado.', divComissionados);
		hasError = true;
	}else if((($('#comissionadoPropostaVlrComissao').val() == "" || $('#comissionadoPropostaVlrComissao').val() == "0,00") && $('#comissionadoPropostaTipoComissao').val() == TP_COM_VALOR)){
		addErrorText('É necessário especificar um Valor para o comissionado.', divComissionados);
		hasError = true;
	}
	if (!hasError){
		var percComissao = converte_numero($("#comissionadoPropostaComissao").val());
		var vlrComissao = converte_numero($("#comissionadoPropostaVlrComissao").val());
		var premioLiquido = converte_numero($("#premioLiquido").val());
		if ($('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_COMISSAO ||
		    $('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_PREMIO_LIQ){
			if (percComissao>100){
				addErrorText('O percentual de comissão não poder ser maior que 100%.', divComissionados);
				hasError = true;
			}
		}
		if($('#comissionadoPropostaTipoComissao').val() == TP_COM_VALOR){
			if (vlrComissao>100){
				addErrorText('O valor da comissão não poder ser maior que o Prêmio liquido.', divComissionados);
				hasError = true;
			}
		}
	}
	return !hasError;
}

function carregarComissionados(){

	var propostaId = $('#propostaId').val();
	if(propostaId != ""){
		$("#comPropostaId").val(propostaId);
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/carregarComissionados.action', '#divDadosComissao');
	}
}

function inserirComissionado(){
	if(validaComissionado()){
		$("#comPropId").val($('#comissionadoPropostaId').val());
		$("#comPropPropostaId").val($("#propostaId").val());
		$("#comPropPessoaId").val($("#comissionadoPropostaPessoaId").val());
		$("#comPropComissao").val($("#comissionadoPropostaComissao").val());
		$("#comPropVlrComissao").val($("#comissionadoPropostaVlrComissao").val());
		$("#comPropTipoComissao").val($("#comissionadoPropostaTipoComissao").val());
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/inserirComissionado.action', '#divListaComissionados');
		$('#comissionadoPropostaPessoaId').val('');
		$('#comissionadoPropostaPessoaNome').val('');
		$("#comissionadoPropostaComissao").val('');
		$("#comissionadoPropostaVlrComissao").val('');
		$("#comissionadoPropostaTipoComissao").val('');
	}
}

function removerComissionado(id){
	$("#comPropId").val(id);
	$("#comPropPropostaId").val($("#propostaId").val());
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/removerComissionado.action', '#divListaComissionados');
	salvarProposta();
}

function editarComissionado(id){
	$("#comPropId").val(id);
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoProposta/editarComissionado.action', '#divDadosComissionados');
}

function alterarGrupoDeVenda(){
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formLookup', getContextApp()+'/wizard/alterarGrupoVenda.action', '#divComissaoPagar');
}

/*****************/
/*   Cobertura   */
/*****************/

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
	}
	,2000);
}

function inserirCobertura(){
	//submitFormAjax('#formCobertura', getContextApp()+'/wizard/inserirCobertura.action', '#divListaCoberturas');
	//$("#paramCobAutomovelId").val($("#automovelId").val());
	$('#paramCobItemCorrente').val($("#itemCorrente").val());
	submitFormAjaxAllArgs('#formCobertura', getContextApp()+'/wizard/inserirCobertura.action', null, null, null, null, function(response){$('#tableCoberturas tbody').append(response);});
	$("#paramCobDescricaoCobertura").val('');
	$("#paramCobInformaFranquia").val('');
	setAutomovelAlterado(true);
}

function novoItem(){
	if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
		if(isEmpty('#marcaId')){
			fieldErrors += '- Fabricante do Veiculo<br/>';
		}
//		if(isEmpty('#modeloVeiculoId')){
//			fieldErrors += '- Modelo do Veiculo<br/>';
//		}
		if(fieldErrors != ''){
			errors += '<b>É Obrigatório informar O Fabricante e Modelo de Veiculo: </b><br/>'+fieldErrors;
			$('div[id^="divMessagesTab"]').html('').html(errors);
			fieldErrors = '';
			return false;
		}
	}
	
	submitFormAjax('#formEdit', getContextApp()+'/wizard/novoItem.action', '#tabPane2');
}

function editarImovel(item){
	$("#itensSegurados").click();
	$("#itemCorrente").val(item);
	submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
}

function removerItem(item){
	if (item){
		$("#itensSegurados").click();
		$("#itemCorrente").val(item);
	    submitFormAjax('#formEdit', getContextApp()+'/wizard/removerItem.action', '#tabPane2');
	}else{
	    if ($("#itemCorrente").val()==$("#itens").val()){
			$("#itemCorrente").val(0);
			submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
		}else{
		    submitFormAjax('#formEdit', getContextApp()+'/wizard/removerItem.action', '#tabPane2');
		}
	}
}

function proximoItem(){

	var _itens = converte_numero($("#itens").val());
	var _item  = converte_numero($("#itemCorrente").val());

	_item  = _item + 1;
	if (_item<_itens){
		if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
			if(isEmpty('#marcaId')){
				fieldErrors += '- Fabricante do Veiculo<br/>';
			}
//			if(isEmpty('#modeloVeiculoId')){
//				fieldErrors += '- Modelo do Veiculo<br/>';
//			}
			if(fieldErrors != ''){
				errors += '<b>É Obrigatório informar O Fabricante e Modelo de Veiculo: </b><br/>'+fieldErrors;
				$('div[id^="divMessagesTab"]').html('').html(errors);
				fieldErrors = '';
				return false;
			}
		}
		
		$("#itemCorrente").val(_item);
		submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
	}else
		return false;
}

function ultimoItem(){
	var _item  = converte_numero($("#itens").val());

	if (_item>1){
		if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
			if(isEmpty('#marcaId')){
				fieldErrors += '- Fabricante do Veiculo<br/>';
			}
//			if(isEmpty('#modeloVeiculoId')){
//				fieldErrors += '- Modelo do Veiculo<br/>';
//			}
			if(fieldErrors != ''){
				errors += '<b>É Obrigatório informar O Fabricante e Modelo de Veiculo: </b><br/>'+fieldErrors;
				$('div[id^="divMessagesTab"]').html('').html(errors);
				fieldErrors = '';
				return false;
			}
		}
		
		$("#itemCorrente").val(_item-1);
		submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
	}else
		return false;
}

function itemAnterior(){
	var _item = converte_numero($("#itemCorrente").val());
	_item = _item - 1;
	if (_item>=0){
		if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
			if(isEmpty('#marcaId')){
				fieldErrors += '- Fabricante do Veiculo<br/>';
			}
//			if(isEmpty('#modeloVeiculoId')){
//				fieldErrors += '- Modelo do Veiculo<br/>';
//			}
			if(fieldErrors != ''){
				errors += '<b>É Obrigatório informar O Fabricante e Modelo de Veiculo: </b><br/>'+fieldErrors;
				$('div[id^="divMessagesTab"]').html('').html(errors);
				fieldErrors = '';
				return false;
			}
		}
		
		$("#itemCorrente").val(_item);
		submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
	}else
		return false;
}

function primeiroItem(){
	var _item = converte_numero($("#itemCorrente").val());

	if (_item>0){
		if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
			if(isEmpty('#marcaId')){
				fieldErrors += '- Fabricante do Veiculo<br/>';
			}
//			if(isEmpty('#modeloVeiculoId')){
//				fieldErrors += '- Modelo do Veiculo<br/>';
//			}
			if(fieldErrors != ''){
				errors += '<b>É Obrigatório informar O Fabricante e Modelo de Veiculo: </b><br/>'+fieldErrors;
				$('div[id^="divMessagesTab"]').html('').html(errors);
				fieldErrors = '';
				return false;
			}
		}
		
		$("#itemCorrente").val(0);
		submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
	}else
		return false;
}

/****************/
/*   Servicos   */
/****************/

function abrirDivNovoServico(){
	$('#divNovoServico').modal({onOpen: openModalNovoServico, close: false});
}

function openModalNovoServico (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	$("#paramServPropostaId").val($('#propostaId').val());		
	setTimeout(function(){
		$("#paramServDescricaoServico").focus();
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	}
	,2000);
}


function inserirServico(){
	//submitFormAjax('#formServico', getContextApp()+'/wizard/inserirServico.action', '#divListaServicos');
	//$("#paramServAutomovelId").val($("#automovelId").val());
	$('#paramServItemCorrente').val($("#itemCorrente").val());
	submitFormAjaxAllArgs('#formServico', getContextApp()+'/wizard/inserirServico.action', null, null, null, null, function(response){$('#tableServicos tbody').append(response);});
	$("#paramServDescricaoServico").val('');
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
		
		var valorParcela = premioTotal/qtdeParcelas;
		
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

	if(valor1aParcela != 0){
		qtdeParcelas = qtdeParcelas - 1;
	}
	if(qtdeParcelas == 0){
		qtdeParcelas = 1;
		$("#quantParc").val(1);
	}

	$("#valorDemaisParcelas").val(((premioTotal-valor1aParcela)/qtdeParcelas).toFixed(2));
	valida_numero($("#valorDemaisParcelas").get(0),15,2,'valorDemaisParcelas');
}

function calculaTotalComissao(){

	var premioLiquido = converte_numero($("#premioLiquido").val());
	var fator = converte_numero($("#fator").val());

	if(fator != 0 && premioLiquido != 0){
		$("#totalComissao").val((premioLiquido*fator/100).toFixed(2));
		valida_numero($("#totalComissao").get(0),15,2,'totalComissao');
	}
}

//Percentual sobre percentual da Comissão
//TP_COM_PERC_SOBRE_COMISSAO = 0;
// Percentual sobre Prêmio Líquido
//TP_COM_PERC_SOBRE_PREMIO_LIQ = 1;
// Valor fixo
//TP_COM_VALOR = 2;

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

function carregaItensSegurados(){
	$("#gpPropostaId").val($("#id").val());
	$("#bindBtnItensSegurados").click();
}

function abrirDivNovoModelo(){
	$("#paramMarcaNome").autocomplete(getContextApp()+'/objlookup/getMarcaList.action', {idFieldsToUpdate:["#paramMarcaId"],alwaysSelect:true, width:400,maxItemsToShow:10,minChars:1});
	$('#divNovoModelo').modal({onOpen: openModalNovoModelo, close: false});
}

function openModalNovoModelo(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	
	setTimeout(function(){
		$("#paramMarcaNome").focus();
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	}
	,2000);
}

function inserirModelo(){
	submitFormAjax('#formModelo', getContextApp()+'/wizard/inserirVeiculoModelo.action');
	$('#paramMarcaId').val('');
	$('#paramMarcaNome').val('');
	$('#paramModeloVeiculoDescricao').val('');
}

function cancelarInserirModelo(){
	$('#paramMarcaId').val('');
	$('#paramMarcaNome').val('');
	$('#paramModeloVeiculoDescricao').val('');
}

function buildReport(url){
	frmLOV = window.open(url , "winReport", "left=0,top=0,scrollbars=yes,resizable=yes,width=800,height=600");
	frmLOV.focus();
	if (frmLOV.opener == null) {
		frmLOV.opener = self;
	}
}

function openWindowCliente(){
	var url = '';
	if($('#clienteNome').val() != ''){
		if($('#pfRG').get(0) != null){
			url = contextApp+'/pessoaFisica/editar.action?pessoaFisica.id='+$('#clienteId').val();
		}else if($('#pjRazaoSocial').get(0) != null){
			url = contextApp+'/pessoaJuridica/editar.action?pessoaJuridica.id='+$('#clienteId').val();
		}
	}else{
		url = contextApp+'/pessoa/displayList.action';
	}
	if(url != ''){
		openWin(url, 'clienteEdicao', '750', '500', 'resizable=yes');
	}
}

function openWindowGrupoDeVenda(){

	if($('#grupoVendaId').val() != ''){
		url = contextApp+'/grupoDeVenda/editar.action?grupoDeVenda.id='+$('#grupoVendaId').val();
		if(url != ''){
			openWin(url, 'grupoDeVendaEdicao', '750', '500', 'resizable=yes');
		}
	}else{
		alert('Selecione um Grupo de Venda.');
	}
}

function validaData1aHabilitacao(element1, element2){
	
	if(dateDiffYears(element1, element2) < 18){
		alert("A diferença entre a Data de Nascimento e a Data da 1a Hablitação deve ser maior que 18.");
		$(element2).val('');
		$(element2).focus();
		setTimeout(function(){$(element2).focus();},250);
		return false;
	}
}

function disableDadosClientes(){
	if ((!isEmpty('#propostaId') && !isEmpty('#clienteId')) || !isEmpty('#clienteId')){
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

function enableDisableDadosServico(rowNumber){
	var scElements = $('#tableServicos tr select').filter('[id^="servicoContratado"]');
	if(rowNumber == null || rowNumber == ''){
		for(var i=0 ; i<scElements.length ; i++){
			if(scElements[i].value == 'NAO'){
				$('#servicoTextoDescricao'+i).attr('disabled',true);
				$('#servicoTextoDescricao'+i).addClass('readonly');
				$('#servicoFranquia'+i).attr('disabled',true);
				$('#servicoFranquia'+i).addClass('readonly');
				$('#servicoTextoFranquia'+i).attr('disabled',true);
				$('#servicoTextoFranquia'+i).addClass('readonly');
				$('#servicoPremio'+i).attr('disabled',true);
				$('#servicoPremio'+i).addClass('readonly');
			}else{
				$('#servicoTextoDescricao'+i).attr('disabled',false);
				$('#servicoTextoDescricao'+i).removeClass('readonly');
				$('#servicoFranquia'+i).attr('disabled',false);
				$('#servicoFranquia'+i).removeClass('readonly');
				$('#servicoTextoFranquia'+i).attr('disabled',false);
				$('#servicoTextoFranquia'+i).removeClass('readonly');
				$('#servicoPremio'+i).attr('disabled',false);
				$('#servicoPremio'+i).removeClass('readonly');
			}
		}
	}else{
		if(scElements[rowNumber].value == 'NAO'){
			$('#servicoTextoDescricao'+rowNumber).attr('disabled',true);
			$('#servicoTextoDescricao'+rowNumber).addClass('readonly');
			$('#servicoFranquia'+rowNumber).attr('disabled',true);
			$('#servicoFranquia'+rowNumber).addClass('readonly');
			$('#servicoTextoFranquia'+rowNumber).attr('disabled',true);
			$('#servicoTextoFranquia'+rowNumber).addClass('readonly');
			$('#servicoPremio'+rowNumber).attr('disabled',true);
			$('#servicoPremio'+rowNumber).addClass('readonly');
		}else{
			$('#servicoTextoDescricao'+rowNumber).attr('disabled',false);
			$('#servicoTextoDescricao'+rowNumber).removeClass('readonly');
			$('#servicoFranquia'+rowNumber).attr('disabled',false);
			$('#servicoFranquia'+rowNumber).removeClass('readonly');
			$('#servicoTextoFranquia'+rowNumber).attr('disabled',false);
			$('#servicoTextoFranquia'+rowNumber).removeClass('readonly');
			$('#servicoPremio'+rowNumber).attr('disabled',false);
			$('#servicoPremio'+rowNumber).removeClass('readonly');
		}
	}
}
function showHideCascoOptions(value){

	if(value.toLowerCase() == 'nao'){
		$('tr#rowCasco td:not(td:first) input').css('display','none');
		$('tr#rowCasco td:not(td:first) select').css('display','none');
		$('tr#rowCasco td:not(td:first) label').css('display','none');
	}else if(value.toLowerCase() == 'sim'){
		$('tr#rowCasco td:not(td:first) input').css('display','');
		$('tr#rowCasco td:not(td:first) select').css('display','');
		$('tr#rowCasco td:not(td:first) label').css('display','');
		tooglePercValorCoberturaCasco($('#tipoIndenizacao').val());
	}
}

function tooglePercValorCoberturaCasco(value){

	if(value == null)
		return;
	
	if(value.toLowerCase() == 'vr'){
		$('#percentualReferenciado').css('display','');
		$('#valorCasco').css('display','none');
		$('#valorCasco').val('');
		$('#percentualValor').html('Percentual');
	}else if(value.toLowerCase() == 'vd'){
		$('#valorCasco').css('display','');
		$('#percentualReferenciado').css('display','none');
		$('#percentualReferenciado').val('');
		$('#percentualValor').html('Valor');
	}
}

function setAlterado(b){
	$("#blnReloaded").val('false');
	alterado = b;
}

function setAutomovelAlterado(b){
	alterado = b;
	automovelAlterado = b;
	$('#automovelAlterado').val(b);
}

function nextTab(event){

	// Tecla TAB pressionada.
	if(event.keyCode == 9 || event.keyCode == 13){
		$('#btnf6').click();
		return false;
	}
	return true;
}

function showHideDadosFormaPagamento(){
	
	var formaPagamento = $('#formaPagamento').val();
	var formaPagamento1aParcela = $('#formaPagamento1aParcela').val();
	
	$('#tableDadosDebitoConta').hide();

	if (formaPagamento == '4' || formaPagamento1aParcela == '4'){ // Débito em Conta
	    $('#tableDadosDebitoConta').show();
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

function showHideTab(){
	if($('#blnPossuiPerfil').val() == 'true'){
		$('#tabMenu1').show();
	}else{
		$('#tabMenu1').hide();
	}
}

function enableDisableModeloVeiculo(){
	if(isEmpty('#marcaId')){
		$('#modeloVeiculoId').val('');
		$('#modeloVeiculoDescricao').val('');
		$('#modeloVeiculoDescricao').addClass('readonly');
		$('#modeloVeiculoDescricao').attr('readonly','true');
	}else{
		$('#modeloVeiculoDescricao').removeClass('readonly');
		$('#modeloVeiculoDescricao').attr('readonly','');
	}
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

function validacaoPedido(apolice){

	
	if($('#blnPossuiPerfil').val()=='true'){
		cont = 0;
		$("input[name='ePrincipal[]']").each(function(){
			if($(this).val() == 'SIM'){
				cont++;
			}
		});
		if(cont == 0){
			fieldErrors += "Deve ter um <b>condutor Principal</b>! <a href='#' onclick='raisePanel(1); $(\"#condutorCpf\").focus();'><b>Aba Perfil</b></a><br />";
		}
	}
	
	if($('#itens').val()>2){
		if(isEmpty('#marcaId')){
			fieldErrors += '- Fabricante do Veiculo<br/>';
		}
//		if(isEmpty('#modeloVeiculoId')){
//			fieldErrors += '- Modelo do Veiculo<br/>';
//		}
	}
	
	if(isEmpty('#dataProposta')){
		fieldErrors += '- Data da Proposta<br/>';
	}
	if(isEmpty('#seguradoraId')){
		fieldErrors += '- Seguradora<br/>';
	}
	if(isEmpty('#ramoId')){
		fieldErrors += '- Ramo<br/>';
	}

	if(!isEmpty('#pessoaFisicaId')){

		if(isEmpty('#clientePFNome')){
			fieldErrors += '- Nome do Segurado<br/>';
		}
		if(isEmpty('#dataNascimento')){
			fieldErrors += '- Data de Nascimento do Segurado<br/>';
		}
		if(isEmpty('#sexo')){
			fieldErrors += '- Sexo do Segurado<br/>';
		}
		if(isEmpty('#rg')){
			fieldErrors += '- RG do Segurado<br/>';
		}
		if(isEmpty('#orgaoEmissor')){
			fieldErrors += '- Órgão Emissor do RG do Segurado<br/>';
		}
		if(isEmpty('#dataEmissao')){
			fieldErrors += '- Data de Emissão do RG do Segurado<br/>';
		}
	} else if(!isEmpty('#pessoaJuridicaId')){

		if(isEmpty('#clientePJNome')){
			fieldErrors += '- Nome do Segurado<br/>';
		}
	}else{
		//Problema! Não existe uma pessoa cadastrada para a proposta.
		msgErrors += '- Não existe uma Pessoa cadastrado para essa Proposta<br/>';
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

	if(isEmpty('#marcaId')){
		fieldErrors += '- Marca<br/>';
	}
//	if(isEmpty('#modeloVeiculoId')){
//		fieldErrors += '- Modelo Veículo<br/>';
//	}
	if(isEmpty('#anoFabricacao')){
		fieldErrors += '- Ano Fabricação<br/>';
	}
	if(isEmpty('#anoModelo')){
		fieldErrors += '- Ano Modelo<br/>';
	}
	if(isEmpty('#nroPlaca')){
		fieldErrors += '- Número Placa<br/>';
	}
	if(isEmpty('#regiaoTarifacao')){
		fieldErrors += '- Regiao Tarifacao<br/>';
	}
/*	if(isEmpty('#categoriaVeiculoId')){
		fieldErrors += '- Categoria Veículo<br/>';
	}*/
	if(isEmpty('#tipoCombustivel')){
		fieldErrors += '- Tipo de Combustível<br/>';
	}
	if(isEmpty('#nroChassis')){
		fieldErrors += '- Número Chassi<br/>';
	}
	if(isEmpty('#corPredominante')){
		fieldErrors += '- Cor Predominante<br/>';
	}

	if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size() == 0){
		msgErrors += '- Não existe nenhuma cobertura especificada para essa proposta<br/>';
	}
	
	if(isEmpty('#premioLiquido')){
		fieldErrors += '- Prêmio Líquido<br/>';
	}
	if(isEmpty('#custoApolice')){
		fieldErrors += '- Custo da Apólice<br/>';
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
		fieldErrors += '- Término Vigência<br/>';
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
	if(isEmpty('#valor1aParcela')){
		fieldErrors += '- Valor 1a Parcela<br/>';
	}

	if(isEmpty('#grupoDeVendaId')){
		fieldErrors += '- Grupo de Venda da Proposta<br/>';
	}

	if(isEmpty('#tipoRecebimentoComissao')){
		fieldErrors += '- Tipo de Recebimento de Comissão<br/>';
	}else{
		if($('#tipoRecebimentoComissao').val() == '1' && isEmpty('#descontaCustoApoliceIof')){
			fieldErrors += '- Desconta Custo Apólice e IOF<br/>';
		}else if($('#tipoRecebimentoComissao').val() == '2' && isEmpty('#quantParcComissao')){
			fieldErrors += '- Quantidade de Parcelas de Comissão<br/>';
		}
	}
	
	if($('#tableComissionadoItens tr').length < 2){
		msgErrors += '- Não existe nenhum comissionado cadastrado para essa proposta<br/>';
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

function validacaoGerarProposta(apolice){

	if($('#itens').val()>2){
		if(isEmpty('#marcaId')){
			fieldErrors += '- Fabricante do Veiculo<br/>';
		}
//		if(isEmpty('#modeloVeiculoId')){
//			fieldErrors += '- Modelo do Veiculo<br/>';
//		}
	}
	
	if(isEmpty('#dataProposta')){
		fieldErrors += '- Data da Proposta<br/>';
	}
	if(isEmpty('#seguradoraId')){
		fieldErrors += '- Seguradora<br/>';
	}
	if(isEmpty('#ramoId')){
		fieldErrors += '- Ramo<br/>';
	}

	if(!isEmpty('#pessoaFisicaId')){

		if(isEmpty('#clientePFNome')){
			fieldErrors += '- Nome do Segurado<br/>';
		}
		if(isEmpty('#dataNascimento')){
			fieldErrors += '- Data de Nascimento do Segurado<br/>';
		}
		if(isEmpty('#sexo')){
			fieldErrors += '- Sexo do Segurado<br/>';
		}
		/*if(isEmpty('#pfGrupoDeVendaId')){
			fieldErrors += '- Grupo de Venda do Segurado<br/>';
		}
		if(isEmpty('#cnh')){
			fieldErrors += '- Número CNH do Segurado<br/>';
		}
		if(isEmpty('#data1aHabilitacao')){
			fieldErrors += '- Data 1a Habilitação do Segurado<br/>';
		}*/
		if(isEmpty('#rg')){
			fieldErrors += '- RG do Segurado<br/>';
		}
		if(isEmpty('#orgaoEmissor')){
			fieldErrors += '- Órgão Emissor do RG do Segurado<br/>';
		}
		if(isEmpty('#dataEmissao')){
			fieldErrors += '- Data de Emissão do RG do Segurado<br/>';
		}
	} else if(!isEmpty('#pessoaJuridicaId')){

		if(isEmpty('#clientePJNome')){
			fieldErrors += '- Nome do Segurado<br/>';
		}
//		if(isEmpty('#razaoSocial')){
//			fieldErrors += '- Razão Social do Segurado<br/>';
//		}
		/*if(isEmpty('#pjGrupoDeVendaId')){
			fieldErrors += '- Grupo de Venda do Segurado<br/>';
		}*/
//		if(isEmpty('#atividadeComercial')){
//			fieldErrors += '- Atividade Comercial do Segurado<br/>';	
//		}
	}else{
		//Problema! Não existe uma pessoa cadastrada para a proposta.
		msgErrors += '- Não existe uma Pessoa cadastrado para essa Proposta<br/>';
	}

//	if(isEmpty('#telefonePreferencial')){
//		fieldErrors += '- Telefone Preferencial do Segurado<br/>';
//	}
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

//	if($('#tableCondutorItens tr').length < 2){
//		msgErrors += '- Não existe nenhum condutor cadastrado para essa proposta<br/>';
//	}
	
	
//	if($('#tablePerfil select').add('#tablePerfil input').filter('[id^="resposta"]').filter('[value=""]').size() != 0){
//		msgErrors += '- O perfil não foi totalmente preenchido<br/>';
//	}
	
	if(isEmpty('#marcaId')){
		fieldErrors += '- Marca<br/>';
	}
//	if(isEmpty('#modeloVeiculoId')){
//		fieldErrors += '- Modelo Veículo<br/>';
//	}
	if(isEmpty('#anoFabricacao')){
		fieldErrors += '- Ano Fabricação<br/>';
	}
	if(isEmpty('#anoModelo')){
		fieldErrors += '- Ano Modelo<br/>';
	}
	if(isEmpty('#nroPlaca')){
	    zeroKM = $('#veiculoZero>option:selected').text();
	    if (zeroKM=='NAO')
	    	fieldErrors += '- Número Placa<br/>';
	}
	if(isEmpty('#regiaoTarifacao')){
		fieldErrors += '- Regiao Tarifacao<br/>';
	}
	/*if(isEmpty('#categoriaVeiculoId')){
		fieldErrors += '- Categoria Veículo<br/>';
	}*/
	if(isEmpty('#tipoCombustivel')){
		fieldErrors += '- Tipo de Combustível<br/>';
	}
	if(isEmpty('#nroChassis')){
		fieldErrors += '- Número Chassi<br/>';
	}
	if(isEmpty('#corPredominante')){
		fieldErrors += '- Cor Predominante<br/>';
	}

	if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size() == 0){
		msgErrors += '- Não existe nenhuma cobertura especificada para essa proposta<br/>';
	}
	
	if(isEmpty('#premioLiquido')){
		fieldErrors += '- Prêmio Líquido<br/>';
	}
	if(isEmpty('#custoApolice')){
		fieldErrors += '- Custo da Apólice<br/>';
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
		fieldErrors += '- Término Vigência<br/>';
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
	if(isEmpty('#valor1aParcela')){
		fieldErrors += '- Valor 1a Parcela<br/>';
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
	/*if(isEmpty('#autorGeracaoNome')){
		fieldErrors += '- Autor da geração<br/>';
	}*/

	if(isEmpty('#tipoRecebimentoComissao')){
		fieldErrors += '- Tipo de Recebimento de Comissão<br/>';
	}else{
		if($('#tipoRecebimentoComissao').val() == '1' && isEmpty('#descontaCustoApoliceIof')){
			fieldErrors += '- Desconta Custo Apólice e IOF<br/>';
		}else if($('#tipoRecebimentoComissao').val() == '2' && isEmpty('#quantParcComissao')){
			fieldErrors += '- Quantidade de Parcelas de Comissão<br/>';
		}
	}
	
	if($('#tableComissionadoItens tr').length < 2){
		msgErrors += '- Não existe nenhum comissionado cadastrado para essa proposta<br/>';
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

function validacaoGerarApolice(){
	if(isEmpty('#nroApolice')){
		fieldErrors += '- Numero da Apólice<br/>';
	}
	if(isEmpty('#dataEmissaoApolice')){
		fieldErrors += '- Data de Emissão da Apólice<br/>';
	}
	if(isEmpty('#dataRecebApolice')){
		fieldErrors += '- Data de Recebimento da Apólice<br/>';
	}
/*	if(isEmpty('#propostaCodigoIdentificacao')){
		fieldErrors += '- Nro do C.I.<br/>';
	}
*/	return validacaoGerarProposta("Gerar Apólice");	
}

function loadMask(){
}

function clearModeloVeiculoValues(){
	$('#marcaId').val('');
	$('#marcaNome').val('');
	$('#modeloVeiculoId').val('');
	$('#modeloVeiculoDescricao').val('');
}

function openWinReport(){
	var propostaId = $('#propostaId').val();
	var ramoId = $('#ramoId').val();
	if(propostaId != ""){
		//url ='<s:url value="/jasperreport/myJasperTest.action" includeParams="none"/>?proposta.id='+propostaId;
		url ='<s:url value="/reports.do" includeParams="none"/>?propostaId='+propostaId+'&ramoId='+ramoId+'&dt='+(new Date());
		openWin(url, 'report', '750', '500', 'resizable=yes');
	}else{
		alert('Favor, salvar a proposta.');
	}
}

// Estes parametros são para desativar as teclas PF's do browser.

function modalOpen (dialog) {
	/*dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});*/
	
	setTimeout(function(){
	  paramNovaProposta();}
	,2000);
}

function paramNovaProposta(){
	document.getElementById("paramSeguradoraId").focus();
	document.getElementById('btnf3').disabled=true;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=true;
	document.getElementById('btnf8').disabled=true;
	document.getElementById('btnf11').disabled=true;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf2');"};

}

function fechaParamNovaProposta(){
	document.getElementById('btnf3').disabled=false;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf14');"};

}

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
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 17)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 34)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 40)); 
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

function openModalNovoCalculo(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}

function abrirModalComplemento(id){
	$("#paramAutomovelId").val(id);
	$("#loadProgress").css({'display':''});
	submitFormAjaxAllArgs('#formAutomovel',getContextApp()+'/wizard/consultarAutomovel.action',null,null,null,null,
		function(response){
			$("#loadProgress").css({'display':'none'});
			$('#formAutomovel').html($(response).find("#formAutomovel").html());
			var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#modalDadosVeiculoCompl').width() / 2);
			$('#modalDadosVeiculoCompl').modal({onOpen: openModalComplemento, close: false});
			var top = (document.getElementById("modalOverlay").offsetHeight / 2) - ($('#modalDadosVeiculoCompl').height() / 2);
			$('#modalContainer').css({'top':top,'left':left, 'width':'672px', 'height' : '560px'});
		}
	);
}

function openModalComplemento(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}
function closeModalComplemento(){
	$('#closeDiv').click();
}
function selectDadosArrendatario(value){
	if(value=='true'){
		desabilitarCamposTela('proprietarioArrendatarioTable');
		$('#relacaoSegProp').attr('disabled',true);
		$('#relacaoSegProp').addClass('readonly');
	}else{
		habilitarCamposTela('proprietarioArrendatarioTable');
		$('#relacaoSegProp').attr('disabled',false);
		$('#relacaoSegProp').removeClass('readonly');
	}
}
function desabilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',true);
	$('#'+idDiv+' input[type=text]').addClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',true);
	$('#'+idDiv+' select').addClass('readonly');
}

function habilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',false);
	$('#'+idDiv+' input[type=text]').removeClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',false);
	$('#'+idDiv+' select').removeClass('readonly');
}
function salvarComplemento(){
	$("#saveProgress").css({'display':'','z-index':'4000'});
	submitFormAjaxAllArgs('#formAutomovel',getContextApp()+'/wizard/salvarDetalhesAutomovel.action',null,null,null,null,
		function(response){
			$("#saveProgress").css({'display':'none'});closeModalComplemento();
			$("bloqueadorId").val($(response).find("#selectBloqueadorId").val());
			$("rastreadorId").val($(response).find("#selectRastreadorId").val());
		}
	);
}
function habilitaDesabilitaCamposBanco(obj){
	if(obj.checked == true){
		habilitarCamposTela(obj.parentNode.parentNode.id);
	}else{
		desabilitarCamposTela(obj.parentNode.parentNode.id);
	}
}

function abrirDivCondutor(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divCondutor').width() / 2);
	$('#divCondutor').modal({onOpen: openModalCondutor, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (250/ 2);
	$('#modalContainer').css({'top':top,'left':left, 'width':'675px'});
}

function openModalCondutor(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	setTimeout(function(){
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	}
	,2000);
}

function closeModalCondutor(){
	$('#btnf3').attr('disabled',false);
	$('#btnf4').attr('disabled',false);
	$('#btnf5').attr('disabled',false);
	$('#btnf6').attr('disabled',false);
	$('#btnf7').attr('disabled',false);
	$('#btnf8').attr('disabled',false);
	$('#btnf11').attr('disabled',false);
	$('#closeDiv').click();
}
function checarCpfCondutor(cpf){
	setTimeout(function(){
		if (validaCPF($('#condutorCpf'))){
			carregaCondutor();
		}
	},300);
}
function carregaCondutor() {
	$("#fcCondutorProposta").val($("#propostaCondutorId").val());
	$("#fcCondutorId").val($("#clienteCondutorId").val());
	$("#fcCondutorCPF").val($("#condutorCpf").val());
	$("#fcCondutorNome").val($("#condutorNome").val());
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/pesquisaDadosPessoa.action', '#divDadosCondutor');
	alterado = true;
}
function editarCondutorPerfil(id){
	$("#fcCondutorId").val(id);
	$("#condutorNome").focus();
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/editarCondutorPerfil.action', '#divDadosCondutor');
}
function inserirCondutorPerfil(){
	if($("#condutorCpf").val() == '' && $("#isCondutorPrincipal").val() == 'true'){
		alert('O CPF do condutor deve ser informado');
		return;
	}
	if($("#condutorNome").val() == ''){
		alert('O Nome do condutor deve ser informado');
		return;
	}
	cont = 0;
	$("input[name='ePrincipal[]']").each(function(){
		if($(this).val() == 'SIM'){
			cont++;
		}
	});
	if(cont == 0 && $("#isCondutorPrincipal").val() == "false"){
		alert("Deve ter um condutor Principal!");
		return;
	}
	$("#fcCondutorId").val($("#condutorId").val());
	$("#fcCondutorNome").val($("#condutorNome").val());
	$("#fcCondutorTipoCondutor").val($("#condutorTipoCondutor").val());
	$("#fcCondutorDataNascimento").val($("#condutorDataNascimento").val());
	$("#fcCondutorSexo").val($("#condutorSexo").val());
	$("#fcCondutorTelefones").val($("#condutorTelefones").val());
	$("#fcCondutorEstadoCivil").val($("#condutorEstadoCivil").val());
	$("#fcCondutorCNH").val($("#condutorCNH").val());
	$("#fcCondutorData1aHabilitacao").val($("#condutorData1aHabilitacao").val());
	$("#fcCondutorProfissao").val($("#condutorProfissao").val());
	$("#fcCondutorCPF").val($("#condutorCpf").val());
	$("#fcCondutorProposta").val($("#propostaId").val());
	$("#fcIsCondutorPrincipal").val($("#isCondutorPrincipal").val());
	$("#fcCondutorProfissaoId").val($("#condutorProfissaoId").val());
	$("#fcEscolaridadeCondutor").val($("#escolaridadeCondutorId").val());
	$("#fcRelacaoCondutorSegurado").val($("#relacaoCondutorSegurado").val());
	$("#fcEmailCondutor").val($("#condutorEmail").val());
//	submitFormAjax('#formCondutor', getContextApp()+'/wizard/inserirCondutorPerfil.action', '#divListaCondutores');
	submitFormAjaxAllArgs('#formCondutor', getContextApp()+'/wizard/inserirCondutorPerfil.action', null, null, null, null, 
			function(response){
				$('#divListaCondutores').html(response);
				$("#msgCondutor").animate({ width: 250, height: 20 }, "fast",function(){
					$("#labelMsgCondutor").css({'display':''});
					setTimeout(function(){
						$("#msgCondutor").animate({ width: 0, height: 0 }, "fast");
						$("#labelMsgCondutor").css({'display':'none'});
					}
					,3000);
			     });
			}
	);
	
	$('#divDadosCondutor input[type=text]').val('');
	$('#formCondutor input[type=hidden]').val('');
	$("#fcCondutorCPF").val('');
	$("#fcCondutorId").val('');
	$("#clienteCondutorId").val('');
	$("#condutorSexo").val('');
	$("#condutorEstadoCivil").val('');
	
}
function removeCondutorPerfil(id){
	$("#fcCondutorId").val(id);
	$("#fcCondutorProposta").val($("#propostaId").val());
	submitFormAjaxAllArgs('#formCondutor', getContextApp()+'/wizard/excluirCondutorPerfil.action', null, null, null, null, function(response){$('#divListaCondutores').html(response);});
}

function importarDadosClientePerfil(){
	$("#fcCondutorNome").val($("#clientePFNome").val());
	$("#fcCondutorTipoCondutor").val('SIM');
	$("#fcCondutorDataNascimento").val($("#dataNascimento").val());
	$("#fcCondutorSexo").val($("#sexo").val());
	$("#fcCondutorTelefones").val($("#telefonePreferencial").val());
	$("#fcCondutorCPF").val($("#clienteCpf").val());
	$("#fcCondutorProposta").val($("#propostaId").val());
	$("#fcCondutorEstadoCivil").val($("#pfEstadoCivil").val());
	$("#fcCondutorCNH").val($("#cnh").val());
	$("#fcCondutorData1aHabilitacao").val($("#data1aHabilitacao").val());
	$("#fcIsCondutorPrincipal").val(true);
	$("#fcEmailCondutor").val($("#email").val());
	
	submitFormAjax('#formCondutor', getContextApp()+'/wizard/inserirCondutorPerfil.action', '#divListaCondutores');
}
function selectRastreador(value){
	if(value=="75"){
		$("#outroRastreador").attr("disabled",false);
		$("#outroRastreador").removeClass("readonly");
	}else{
		$("#outroRastreador").attr("disabled",true);
		$("#outroRastreador").addClass("readonly");
	}
}
function selectBloqueador(value){
	if(value=="15"){
		$("#outroBloqueador").attr("disabled",false);	
		$("#outroBloqueador").removeClass("readonly");
	}else{
		$("#outroBloqueador").attr("disabled",true);
		$("#outroBloqueador").addClass("readonly");
	}
}
function bloquearHabilitarDadosCaminhao(opcao){
	if(opcao.value == 3){
		habilitarCamposTela("opcao_caminhao");
	}else{
		desabilitarCamposTela("opcao_caminhao");
	}
}
var relembrarDecisao = false;
function verificarMarcaId(){
	if($("#modeloVeiculoId").val() == "" && verificarResults()){
		if(!relembrarDecisao){
			decisao = confirm("Modelo informado não está cadastrado na tabela FIPE. Deseja continuar?");
		}
		if(!decisao){
			$("#modeloVeiculoDescricao").val("");
			$("#modeloVeiculoDescricao").focus();
			relembrarDecisao = false;
		}else{
			relembrarDecisao = true;
		}
		$("#codigoFipe").val("");
	}else{
		relembrarDecisao = false;
	}
}
function verificarModeloId(){
	$("#modeloVeiculoId").val("");
}
function verificarResults(){
	boolean = true
	$(".ac_results").each(function(){
		if($(this).css('display') != 'none'){
			boolean = false;
		}
	});
	return boolean;
}

function abrirModalRelatorioFrota(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - (240 / 2);
	$('#divRelatorioFrota').modal({onOpen: openModalRelatorioFrota, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (250/ 2);
	$('#modalContainer').css({'top':top,'left':left, 'width':'240px'});
}

function openModalRelatorioFrota(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	setTimeout(function(){
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	}
	,2000);
}
function closeModalRelatorioFrota(){
	$('#btnf3').attr('disabled',false);
	$('#btnf4').attr('disabled',false);
	$('#btnf5').attr('disabled',false);
	$('#btnf6').attr('disabled',false);
	$('#btnf7').attr('disabled',false);
	$('#btnf8').attr('disabled',false);
	$('#btnf11').attr('disabled',false);
	$('#modeloCloseDiv').click();
}
function imprimirRelFrota(){
	$('#modalRelatorioPropostaId').val($('#propostaId').val());
	if(propostaId != ""){
		//url ='<s:url value="/jasperreport/myJasperTest.action" includeParams="none"/>?proposta.id='+propostaId;
		
		openWin('', 'report', '800', '600', 'resizable=yes');
		submitForm($('#formRelatorioFrota').get(0), getContextApp()+'/report/runjasper.action', false, "report");
	}else{
		alert('Favor, salvar a proposta.');
	}
}
//mostrarMenu('buttonMenu');