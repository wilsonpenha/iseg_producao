﻿ArrNomeCampo     = ["#dataOrcamento", "#ramoId", "#seguradoraId", "#clientePFNome", "#pfGrupoDeVendaId", "#clientePJNome", "#pjGrupoDeVendaId"];
ArrLabelCampo    = ["Data da Orcamento", "Ramo de Seguro", "Seguradora","Nome do Cliente","Grupo de Venda","Nome do Cliente","Grupo de Venda"];
ArrTipoCampo     = [TIPOFORM_DATA, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT, TIPOFORM_TEXT, TIPOFORM_SELECT];
ArrOperacaoCampo = [OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE, OP_INSERT_UPDATE];

/************/
/* Orcamento */
/************/

var fieldErrors = '';
var msgErrors = '';
var errors = '';
var modalAbaAtual = "tabModal0";
var tabPaneModal = "tabPaneModal0";
var totalOrcamento = 0;
/****************/
/**  Clientes  **/
/****************/
  
function novaOrcamento(){

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
    if($('#paramTipo').val() == TP_PROP_COMUM || $('#paramTipo').val() == TP_PROP_RENOVACAO_EXTERNA){
    	$("#blnEndosso").val('false');
    	$("#blnRenovacao").val('false');
    	actionName = 'novo';
    }else if($('#paramTipo').val() == TP_PROP_RENOVACAO_PROPRIA){
    	$("#blnEndosso").val('false');
    	$("#blnRenovacao").val('true');
    	actionName = 'displayList';
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
    submitForm($('#formLookup').get(0), getContextApp()+'/orcamentoSegAuto/'+actionName+'.action', false);
}

function criarNovaCotacao(){
	if($('#tipoOrcamento').val() == TP_PROP_RENOVACAO_PROPRIA){
		$('#blnOrcamento').val('true');
	    submitForm(document.paramFormOrcamento, getContextApp()+'/proposta/displayList.action', false);
    }else if($('#tipoOrcamento').val() == TP_PROP_COMUM ||$('#tipoOrcamento').val() == TP_PROP_RENOVACAO_EXTERNA){
    	$('#blnOrcamento').val('false');
	    submitForm(document.paramFormOrcamento, getContextApp()+'/orcamentoSeguro/novo.action', false);
    }
//	if($('#tipoorcamento').val() == "true"){
//		$('#blnorcamento').val('true');
//	    submitform(document.paramformorcamento, getcontextapp()+'/proposta/'+actionname+'.action', false);
//	}else{
//		$('#blnorcamento').val('false');
//	    submitform(document.paramformorcamento, getcontextapp()+'/orcamentoseguro/'+actionname+'.action', false);
//	}
}

function listaOrcamentos(){
	submitForm($('#formEdit').get(0), getContextApp()+'/orcamentoSegAuto/displayList.action', false);
	mostrarMenu('buttonMenu');
	resizeArea(true);
}

function salvarOrcamento(){
//	if ($("#currentTabId").val()==3)
//		$("#blnReloaded").val("false");
//	if (propostaPerfilAlterada)
//		$("#perfilAlterado").val('true');
	if($('#tipoCliente').val()=='0'){
		if(isEmpty('#clientePFNome')){
			$("#clientePFNome").focus();
			alert("O nome do segurado deve ser informado!");
			return;
		}
		if(isEmpty('#clienteCpf')){
			$("#clienteCpf").focus();
			alert("O CPF do segurado deve ser informado!");
			return;
		}
	}else{
		if(isEmpty('#clientePJNome')){
			$("#clientePJNome").focus();
			alert("O nome do segurado deve ser informado!");
			return;
		}
		if(isEmpty('#clienteCnpj')){
			$("#clienteCpf").focus();
			alert("O CNPJ do segurado deve ser informado!");
			return;
		}
	}
	if ($("#orcamentoSeguroId").val()==''){
		submitFormAjax('#formEdit', getContextApp()+'/orcamentoSegAuto/salvarEditar.action', '#allForms', '#saveProgress');
	}else{
		submitFormAjaxAllArgs('#formEdit', getContextApp()+'/orcamentoSegAuto/salvarEditar.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress',null,null,
				function(response){
					object = $(response).find("select[id='statusOrcamentoId']");
					$("select[name='statusOrcamento[]']").each(function(){
						$(this).val(object[0].value);
						$('#statusOrcamento').val(object[0].value);
					});
					$('div[id^="divMessagesTab"]').html('').html('');
				}
		);
	}
	totalOrcamento ++;
	setAutomovelAlterado(false);
	$("#perfilAlterado").val('false');
	propostaPerfilAlterada = false;
	formNavigateAlterado = false;
	disableDadosClientes();
}

function enviarParaCalculo(){
	fieldErrors = '';
	if($('#tipoCliente').val()=='0'){
		if(isEmpty('#clientePFNome')){
			fieldErrors += "O <b>nome</b> do segurado deve ser informado! <a href='#' onclick='raisePanel(0); $(\"#clienteCpf\").focus();'><b>Aba Dados Cliente</b></a><br />";
		}
		if(isEmpty('#clienteCpf')){
			fieldErrors += "O <b>CPF</b> do segurado deve ser informado! <a href='#' onclick='raisePanel(0); $(\"#clienteCpf\").focus();'><b>Aba Dados Cliente</b></a><br />";
		}
		if(isEmpty('#dataNascimento')){
			fieldErrors += "A <b>Data de Nascimento</b> do segurado deve ser informada! <a href='#' onclick='raisePanel(0); $(\"#clienteCpf\").focus();'><b>Aba Dados Cliente</b></a><br />";
		}
		if(isEmpty('#sexo')){
			fieldErrors += "O <b>Sexo do segurado</b> deve ser informado! <a href='#' onclick='raisePanel(0); $(\"#clienteCpf\").focus();'><b>Aba Dados Cliente</b></a><br />";
		}
		if(isEmpty('#pfEstadoCivil')){
			fieldErrors += "O <b>Estado Civil</b> do segurado deve ser informado! <a href='#' onclick='raisePanel(0); $(\"#clienteCpf\").focus();'><b>Aba Dados Cliente</b></a><br />";
		}
		if(isEmpty('#cepResidencia')){
			fieldErrors += "O <b>Cep da Residencia</b> do segurado deve ser informado! <a href='#' onclick='raisePanel(1); $(\"#cepResidencia\").focus();'><b>Aba Perfil</b></a><br />";
		}
		if(isEmpty('#cepPernoite')){
			fieldErrors += "O <b>Cep de Pernoite</b> do segurado deve ser informado! <a href='#' onclick='raisePanel(1); $(\"#cepPernoite\").focus();'><b>Aba Perfil</b></a><br />";
		}
		cont = 0;
		$("input[name='ePrincipal[]']").each(function(){
			if($(this).val() == 'SIM'){
				cont++;
			}
		});
		if(cont == 0){
			fieldErrors += "Deve ter um <b>condutor Principal</b>! <a href='#' onclick='raisePanel(1); $(\"#condutorCpf\").focus();'><b>Aba Perfil</b></a><br />";
		}
		if(isEmpty('#marcaNome')){
			fieldErrors += "A <b>Marca</b> do veículo deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#marcaNome\").focus();'><b>Aba Veículo</b></a><br />";
		}
		if(isEmpty('#modeloVeiculoDescricao')){
			fieldErrors += "O <b>Modelo</b> do veículo deve ser informado! <a href='#' onclick='raisePanel(2); $(\"#modeloVeiculoDescricao\").focus();'><b>Aba Veículo</b></a><br />";
		}
		if(isEmpty('#anoFabricacao')){
			fieldErrors += "O <b>Ano de fabricação</b> do veículo deve ser informado! <a href='#' onclick='raisePanel(2); $(\"#anoFabricacao\").focus();'><b>Aba Veículo</b></a><br />";
		}
		if(isEmpty('#anoModelo')){
			fieldErrors += "O <b>Ano do Modelo</b> do veículo deve ser informado! <a href='#' onclick='raisePanel(2); $(\"#anoModelo\").focus();'><b>Aba Veículo</b></a><br />";
		}
		if($('#veiculoZero').val()=="NAO"){
			if(isEmpty('#placaVeiculo')){
				fieldErrors += "A <b>placa</b> do veículo deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#placaVeiculo\").focus();'><b>Aba Veículo</b></a><br />";
			}
			if(isEmpty('#chassiVeiculo')){
				fieldErrors += "O <b>Chassi</b> do veículo deve ser informado! <a href='#' onclick='raisePanel(2); $(\"#chassiVeiculo\").focus();'><b>Aba Veículo</b></a><br />";
			}
		}
		if($('#segPropArrend').val() == 'false'){
			if(isEmpty('#arrendatarioCPFCNPJ')){
				fieldErrors += "O <b>CPF/CNPJ</b> do Proprietário/Arrendatário deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#arrendatarioCPFCNPJ\").focus();'><b>Aba Veículo</b></a><br />";
			}
			if(isEmpty('#arrendatarioNome')){
				fieldErrors += "O <b>Nome</b> do Proprietário/Arrendatário deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#arrendatarioNome\").focus();'><b>Aba Veículo</b></a><br />";
			}
			if(isEmpty('#arrendatarioTelefones')){
				fieldErrors += "O <b>Telefone</b> do Proprietário/Arrendatário deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#arrendatarioTelefones\").focus();'><b>Aba Veículo</b></a><br />";
			}
			if(isEmpty('#arrendatarioDataNascimento')){
				fieldErrors += "A <b>Data de Nascimento</b> do Proprietário/Arrendatário deve ser informada! <a href='#' onclick='raisePanel(2); $(\"#condutorDataNascimento\").focus();'><b>Aba Veículo</b></a><br />";
			}
		}
	}else{
		if(isEmpty('#clientePJNome')){
			fieldErrors +="O nome do segurado deve ser informado!<br />";
		}
		if(isEmpty('#clienteCnpj')){
			fieldErrors +="O CNPJ do segurado deve ser informado!<br />";
		}
	}
	if(fieldErrors != ''){
		$('div[id^="divMessagesTab"]').html('').html(fieldErrors);
		fieldErrors = '';
		msgErrors = '';
		errors = '';
		return false;
	}else{
		$('div[id^="divMessagesTab"]').html('').html('');
	}
	$('#statusOrcamento').val('2');
//	submitFormAjax('#formEdit', getContextApp()+'/orcamentoSegAuto/salvarEditar.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress');
	
	submitFormAjaxAllArgs('#formEdit', getContextApp()+'/orcamentoSegAuto/salvarEditar.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress',null,null,
			function(response){
				$("#buttonCalculando").html('F10-Finalizar Cálculo');
				$("#btnf10")[0].setAttribute('onclick','finalizarCalculo();');
			}
	);
	
	disableDadosClientes();
}
function disabilitarCamposEnviadoParaCalculo(){
	if($('#statusOrcamento').val() == '2' || $('#statusOrcamento').val() == '3'){
		$('#cepResidencia').attr('readonly',true);
		$('#cepPernoite').attr('readonly',true);
		$('#marcaNome').attr('readonly',true);
		$('#modeloVeiculoDescricao').attr('readonly',true);
		$('#anoFabricacao').attr('readonly',true);
		$('#anoModelo').attr('readonly',true);
		$('#placaVeiculo').attr('readonly',true);
		$('#chassiVeiculo').attr('readonly',true);
		
		$('#cepResidencia').addClass('readonly');
		$('#cepPernoite').addClass('readonly');
		$('#marcaNome').addClass('readonly');
		$('#modeloVeiculoDescricao').addClass('readonly');
		$('#anoFabricacao').addClass('readonly');
		$('#anoModelo').addClass('readonly');
		$('#placaVeiculo').addClass('readonly');
		$('#chassiVeiculo').addClass('readonly');
		$("select[name='statusOrcamento[]']").each(function(){
			$(this).val($('#statusOrcamento').val());
		});
	}
}

function gerarApolice(){
	if ($('#statusOperacional').val()=='4')
		$('#statusOperacional').val('2');
	if ($('#statusOperacional').val()=='6')
		$('#statusOperacional').val('7');
	if ($('#statusOperacional').val()=='9')
		$('#statusOperacional').val('10');

	submitForm($('#formEdit').get(0), getContextApp()+'/wizard/efetivarOrcamento.action', false);
}

function excluirOrcamento(){
	var orcamentoSeguroId = $('#orcamentoSeguroId').val();
	if(orcamentoSeguroId != "" && $('#statusOperacional').val() == '0'){
		$("#gpOrcamentoId").val(orcamentoSeguroId);
		submitForm($('#formLookup').get(0), getContextApp()+'/wizard/excluir.action', false);
	}
}

/**************/
/* Condutores */
/**************/
function removeCondutor(id){
	$("#fcCondutorId").val(id);
	$("#fcCondutorOrcamento").val($("#orcamentoSeguroId").val());
	submitFormAjaxAllArgs('#formCondutor', getContextApp()+'/orcamentoSegAuto/excluirCondutor.action', null, null, null, null, function(response){$('#divListaCondutores').html(response);});
//	submitFormAjax('#formCondutor', getContextApp()+'/orcamentoSegAuto/excluirCondutor.action', '#divListaCondutores');
	$("#condutorNome").focus();
}

function editarCondutor(id){
	$("#fcCondutorId").val(id);
	$("#condutorNome").focus();
	submitFormAjax('#formCondutor', getContextApp()+'/orcamentoSegAuto/editarCondutor.action', '#divDadosCondutor');
}

function inserirCondutor(){
	if($("#condutorCpf").val() == ''){
		alert('O CPF do condutor deve ser informado');
		return;
	}
	if($("#condutorNome").val() == ''){
		alert('O Nome do condutor deve ser informado');
		return;
	}
	if(!validaCPF($("#condutorCpf")[0])){
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
	$("#fcCondutorOrcamento").val($("#orcamentoSeguroId").val());
	$("#fcIsCondutorPrincipal").val($("#isCondutorPrincipal").val());
	$("#fcCondutorProfissaoId").val($("#condutorProfissaoId").val());
	$("#fcEscolaridadeCondutor").val($("#escolaridadeCondutorId").val());
	$("#fcRelacaoCondutorSegurado").val($("#relacaoCondutorSegurado").val());
	$("#fcEmailCondutor").val($("#condutorEmail").val());
//	submitFormAjax('#formCondutor', getContextApp()+'/orcamentoSegAuto/inserirCondutor.action', '#divListaCondutores');
	
	submitFormAjaxAllArgs('#formCondutor', getContextApp()+'/orcamentoSegAuto/inserirCondutor.action', null, null, null,null, 
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
			});

	$('#divDadosCondutor input[type=text]').val('');
	$('#formCondutor input[type=hidden]').val('');
	$("#fcCondutorCPF").val('');
	$("#fcCondutorId").val('');
	$("#clienteCondutorId").val('');
	$("#condutorSexo").val('');
	$("#condutorEstadoCivil").val('');
	
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
	$("#fcCondutorCPF").val($("#clienteCpf").val());
	$("#fcCondutorOrcamento").val($("#orcamentoSeguroId").val());
	$("#fcCondutorNome").val($("#clientePFNome").val());
	$("#fcCondutorDataNascimento").val($("#dataNascimento").val());
	$("#fcCondutorSexo").val($("#sexo").val());
	$("#fcCondutorTelefones").val($("#telefonePreferencial").val());
	$("#fcCondutorEstadoCivil").val($("#pfEstadoCivil").val());
	$("#fcCondutorCNH").val($("#cnh").val());
	$("#fcCondutorData1aHabilitacao").val($("#data1aHabilitacao").val());
	$("#fcCondutorProfissao").val($("#profissaoNome").val());
	cont = 0;
	$("input[name='ePrincipal[]']").each(function(){
		if($(this).val() == 'SIM'){
			cont++;
		}
	});
	if(cont == 0){
		$("#fcIsCondutorPrincipal").val(true);
	}
//	submitFormAjax('#formCondutor', getContextApp()+'/orcamentoSegAuto/pesquisaDadosPessoa.action', '#divDadosCondutor');
	submitFormAjaxAllArgs('#formCondutor', getContextApp()+'/orcamentoSegAuto/pesquisaDadosPessoa.action', null, null, null, null, 
						  function(response){
							  $('#divDadosCondutor').html(response);
							  inserirCondutor();
						  });
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
	if($("#clienteCpf").val() == "" && $("#clientePFNome") == ""){
		$("#clienteId").val("");
	}
	$("#gpOrcamentoId").val($("#orcamentoSeguroId").val());
	$("#gpTipoCliente").val($("#tipoCliente").val());
	$("#gpPessoaFisicaId").val($("#clienteId").val());
	$("#gpClienteCpf").val($("#clienteCpf").val());
	$("#gpClienteCnpj").val($("#clienteCnpj").val());
//	submitFormAjax('#formLookup', getContextApp()+'/orcamentoSegAuto/wizardDadosClienteOrcamento.action', '#divDadosCliente');
	submitFormAjaxAllArgs('#formLookup', getContextApp()+'/orcamentoSegAuto/wizardDadosClienteOrcamento.action', null, null, null, null, 
			  function(response){
					$('#divDadosCliente').html(response);
					$("#gpPessoaFisicaId").val(null);
					$("#clienteId").val(null);
			  });
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

function checarCpfCondutor(cpf){
	setTimeout(function(){
		if (validaCPF($('#condutorCpf'))){
			carregaCondutor();
		}
	},300);
}
function carregaCondutor() {
	$("#fcCondutorOrcamento").val($("#orcamentoSeguroId").val());
	$("#fcClienteCondutorId").val($("#cienteCondutorId").val());
	$("#fcCondutorCPF").val($("#condutorCpf").val());
	$("#fcCondutorNome").val($("#condutorNome").val());
	submitFormAjax('#formCondutor', getContextApp()+'/orcamentoSegAuto/pesquisaDadosPessoa.action', '#divDadosCondutor');
	alterado = true;
}

function apagarDadosCliente(){
	
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
		salvarOrcamento(); 
	}else{
		$("#gpOrcamentoId").val($("#orcamentoSeguroId").val());
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

	if($('#comissionadoOrcamentoPessoaId').val() == ""){
		addErrorText('É necessário especificar uma Pessoa.', divComissionados);
		hasError = true;
	}
	if($('#comissionadoOrcamentoTipoComissao').val() == ""){
		addErrorText('É necessário especificar o Tipo de comissão.', divComissionados);
		hasError = true;
	}
	if((($('#comissionadoOrcamentoComissao').val() == "" || $('#comissionadoOrcamentoComissao').val() == "0,00") && $('#comissionadoOrcamentoTipoComissao').val() != TP_COM_VALOR)){
		addErrorText('É necessário especificar um Percentual para o comissionado.', divComissionados);
		hasError = true;
	}else if((($('#comissionadoOrcamentoVlrComissao').val() == "" || $('#comissionadoOrcamentoVlrComissao').val() == "0,00") && $('#comissionadoOrcamentoTipoComissao').val() == TP_COM_VALOR)){
		addErrorText('É necessário especificar um Valor para o comissionado.', divComissionados);
		hasError = true;
	}
	if (!hasError){
		var percComissao = converte_numero($("#comissionadoOrcamentoComissao").val());
		var vlrComissao = converte_numero($("#comissionadoOrcamentoVlrComissao").val());
		premioLiquido = converte_numero($("#premioLiquido").val());
		if ($('#comissionadoOrcamentoTipoComissao').val() == TP_COM_PERC_SOBRE_COMISSAO ||
		    $('#comissionadoOrcamentoTipoComissao').val() == TP_COM_PERC_SOBRE_PREMIO_LIQ){
			if (percComissao>100){
				addErrorText('O percentual de comissão não poder ser maior que 100%.', divComissionados);
				hasError = true;
			}
		}
		if($('#comissionadoOrcamentoTipoComissao').val() == TP_COM_VALOR){
			if (vlrComissao>100){
				addErrorText('O valor da comissão não poder ser maior que o Prêmio liquido.', divComissionados);
				hasError = true;
			}
		}
	}
	return !hasError;
}

function carregarComissionados(){

	var orcamentoSeguroId = $('#orcamentoSeguroId').val();
	if(orcamentoSeguroId != ""){
		$("#comOrcamentoId").val(orcamentoSeguroId);
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoOrcamento/carregarComissionados.action', '#divDadosComissao');
	}
}

function inserirComissionado(){
	if(validaComissionado()){
		$("#comPropId").val($('#comissionadoOrcamentoId').val());
		$("#comPropOrcamentoId").val($("#orcamentoSeguroId").val());
		$("#comPropPessoaId").val($("#comissionadoOrcamentoPessoaId").val());
		$("#comPropComissao").val($("#comissionadoOrcamentoComissao").val());
		$("#comPropVlrComissao").val($("#comissionadoOrcamentoVlrComissao").val());
		$("#comPropTipoComissao").val($("#comissionadoOrcamentoTipoComissao").val());
		submitFormAjax('#formComissionados', getContextApp()+'/comissionadoOrcamento/inserirComissionado.action', '#divListaComissionados');
		$('#comissionadoOrcamentoPessoaId').val('');
		$('#comissionadoOrcamentoPessoaNome').val('');
		$("#comissionadoOrcamentoComissao").val('');
		$("#comissionadoOrcamentoVlrComissao").val('');
		$("#comissionadoOrcamentoTipoComissao").val('');
	}
}

function removerComissionado(id){
	$("#comPropId").val(id);
	$("#comPropOrcamentoId").val($("#orcamentoSeguroId").val());
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoOrcamento/removerComissionado.action', '#divListaComissionados');
	salvarOrcamento();
}

function editarComissionado(id){
	$("#comPropId").val(id);
	submitFormAjax('#formComissionados', getContextApp()+'/comissionadoOrcamento/editarComissionado.action', '#divDadosComissionados');
}

function alterarGrupoDeVenda(){
	$("#gpOrcamentoId").val($("#orcamentoSeguroId").val());
	$("#gpGrupoDeVendaId").val($("#grupoDeVendaId").val());
	submitFormAjax('#formLookup', getContextApp()+'/wizard/alterarGrupoVenda.action', '#divComissaoPagar');
}

/****************/
/*   Endereço   */
/****************/

function copiarEnderecoResidencialParaEnderecoComercial(){
	$("#end1TipoEndereco").val("C");
	$("#end1PessoaFisicaId").val($("#end0PessoaFisicaId").val());
	$("#cepCom").val($("#cepRes").val());
	$("#lograCom").val($("#lograRes").val());
	$("#compCom").val($("#compRes").val());
	$("#numeroCom").val($("#numeroRes").val());
	$("#foneCom").val($("#foneRes").val());
	$("#bairroCom").val($("#bairroRes").val());
	$("#cidadeCom").val($("#cidadeRes").val());
	$("#ufCom").val($("#ufRes").val());
	$("#faxCom").val($("#faxRes").val());
}

/*****************/
/*   Cobertura   */
/*****************/
function setaAbaModalCalculo(id,idSeguradora){
	$("#paramOrcamentoSeguradoraId").val(id);
	$("#paramOrcamentoSeguradoraIdModal").val(id);
	$("#paramOrcamentoSeguroIdModal").val($('#orcamentoSeguroId').val());
	$("#paramSeguradoraIdModal").val(idSeguradora);
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradora', getContextApp()+'/orcamentoSegAuto/inserirTabsOrcamentoSegAuto.action', null, null, null, null, 
						   function(response){
						   		$('#tabFrameModal').html(response);
						   		object = $(response).find("input[id='tabsModalOrcamentoSeguradoraNome']");
						   		$('#titleCalculo').html('Novo Cálculo - '+object[0].value);
						   		$("#loadProgressModal").css({'display':'none'});
						   }
						  );
}
function abrirDivNovoCalculo(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#novoCalculo').width() / 2);
	$('#novoCalculo').modal({onOpen: openModalNovoCalculo, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (567 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left,'width':'770px'});
}

function openModalNovoCalculo(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	setTimeout(function(){
//		$("#paramCobDescricaoCobertura").focus();
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

function closeModalCalculo(){
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradora', getContextApp()+'/orcamentoSegAuto/fecharOrcamentoSeguradora.action', null, null, null, null, 
			function(response){
				$('#tableCalculos').html(response);
				$("#paramCobDescricaoCobertura").focus();
				$('#btnf3').attr('disabled',false);
				$('#btnf4').attr('disabled',false);
				$('#btnf5').attr('disabled',false);
				$('#btnf6').attr('disabled',false);
				$('#btnf7').attr('disabled',false);
				$('#btnf8').attr('disabled',false);
				$('#btnf11').attr('disabled',false);
				$('#closeDiv').click();
				$("#loadProgressModal").css({'display':'none'});
				modalAbaAtual = "tabModal0";
				tabPaneModal = "tabPaneModal0";
			});
}
function salvarCalculoOrcamentoSegAuto(){
	$("#saveProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradoraModal', getContextApp()+'/orcamentoSegAuto/salvarCalculoOrcamentoSegAuto.action', null, null, null, null, 
						  function(response){
								$('#tabFrameModal').html(response);
								$("#saveProgressModal").css({'display':'none'});
								$("#cascoLmiSeguradora").val($("#percentuaLmiCasco").val());
								if(modalAbaAtual == null || modalAbaAtual == ''){
									modalAbaAtual = "tabModal0";
									tabPaneModal = "tabPaneModal0";
								}
								calculoAlterado = false;
						  });
}

function calcularOnline(){
	$("#calculoProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradoraModal', getContextApp()+'/orcamentoSegAuto/calculoSeguroBradesco.action', null, null, null, null, 
						  function(response){
								$('#tabFrameModal').html(response);
								$("#calculoProgressModal").css({'display':'none'});
								abrirModalMensagensCalculoOnline();
								if(modalAbaAtual == null || modalAbaAtual == ''){
									modalAbaAtual = "tabModal0";
									tabPaneModal = "tabPaneModal0";
								}
								calculoAlterado = false;
						  });
}

function abrirModalMensagensCalculoOnline(){
	$('#divMensagensCalculoOnline').dialog('destroy');
	$('#divMensagensCalculoOnline').dialog({
		height: 190,
		width: 600,
		modal: true,
		zIndex: 4000,
		show: "blind",
		hide: "explode"
	});
	$('#divMensagensCalculoOnline').css({'background-color':'#E8E8E8'});
}

function gerarParcelas(idTable,premioTotal,totalParcelasId,qtdParcelaDebId,qtdParcelaCarneId, qtdParcelaCredId, qtdParcelaCheqId,idFranquias,pos){
	$("#paramPremioTotal").val($(premioTotal).val());
	$("#paramQtdeParcelas").val($(totalParcelasId).val());
	$("#paramQtdeParDeb").val($(qtdParcelaDebId).val());
	$("#paramQtdeParCarne").val($(qtdParcelaCarneId).val());
	$("#paramQtdeParCred").val($(qtdParcelaCredId).val());
	$("#paramQtdeParCheq").val($(qtdParcelaCheqId).val());
	$("#paramOrcamentoFranquias").val(idFranquias);
	$("#paramOrcamentoFranquiasPosicao").val(pos);
	submitFormAjaxAllArgs('#formParcelas', getContextApp()+'/orcamentoSegAuto/gerarParcelasOrcamentoFranquias.action', null, null, null, null, function(response){$(idTable).html(response);});
}

function novoItem(){
	if($('#statusOperacional').val()!='0' && $('#statusOperacional').val()!='5'){
		if(isEmpty('#marcaId')){
			fieldErrors += '- Fabricante do Veiculo<br/>';
		}
		if(isEmpty('#modeloVeiculoId')){
			fieldErrors += '- Modelo do Veiculo<br/>';
		}
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
	$("#itensSegurados").click();
	$("#itemCorrente").val(item);
    submitFormAjax('#formEdit', getContextApp()+'/wizard/removerItem.action', '#tabPane2');
}

function removerItem(){
	if ($("#itemCorrente").val()==$("#itens").val()){
		$("#itemCorrente").val(0);
		submitFormAjax('#formEdit', getContextApp()+'/wizard/editarAutomovel.action', '#tabPane2');
	}else{
	    submitFormAjax('#formEdit', getContextApp()+'/wizard/removerItem.action', '#tabPane2');
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
			if(isEmpty('#modeloVeiculoId')){
				fieldErrors += '- Modelo do Veiculo<br/>';
			}
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
			if(isEmpty('#modeloVeiculoId')){
				fieldErrors += '- Modelo do Veiculo<br/>';
			}
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
			if(isEmpty('#modeloVeiculoId')){
				fieldErrors += '- Modelo do Veiculo<br/>';
			}
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
			if(isEmpty('#modeloVeiculoId')){
				fieldErrors += '- Modelo do Veiculo<br/>';
			}
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
	if($('#comissionadoOrcamentoTipoComissao').val() == TP_COM_PERC_SOBRE_COMISSAO){
		var valorComissaoPrincipal = converte_numero($("#totalComissao").val());
		var fator = converte_numero(comissao);

		if(fator != 0 && valorComissaoPrincipal != 0){
			$("#comissionadoOrcamentoVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));
			valida_numero($("#comissionadoOrcamentoVlrComissao").get(0),15,2,'comissionadoOrcamentoVlrComissao');
		}
	}else if($('#comissionadoOrcamentoTipoComissao').val() == TP_COM_PERC_SOBRE_PREMIO_LIQ){
		var valorComissaoPrincipal = converte_numero($("#premioLiquido").val());
		var fator = converte_numero(comissao);

		if(fator != 0 && valorComissaoPrincipal != 0){
			$("#comissionadoOrcamentoVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));
			valida_numero($("#comissionadoOrcamentoVlrComissao").get(0),15,2,'comissionadoOrcamentoVlrComissao');
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
	$("#gpOrcamentoId").val($("#id").val());
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
	if(!isEmpty('#clienteId')){
		$('#tableDadosCliente input[type=text]').attr('readonly',true);
		$('#tableDadosCliente input[type=text]').addClass('readonly');
		$('#tableDadosCliente select').addClass('readonly');
		
		$('#tableDadosCliente select').bind("onfocus", function(){
	        if($(this).hasClass('readonly'))
	        {
	          $(this).blur();
	          return;
	        }
	    });
		
		$('#clienteCpf').attr('readonly',false);
		$('#clienteId').attr('readonly',false);
		$('#clienteCpf').removeClass('readonly');
	}
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

function selectFinanciado(value){
	if(value=='11928'){
		desabilitarCamposTela('instituicaoFinanceira');
	}else{
		habilitarCamposTela('instituicaoFinanceira');
	}
}

function setTipoPessoa(value){
	if(value==1){
		$('#cpf_cnpj').html('CPF');
		$('#arrendatarioCPFCNPJ').removeClass('clCNPJ');
		$('#arrendatarioCPFCNPJ').addClass('clCPF');
		$('#arrendatarioCPFCNPJ').attr("onKeyUp","Mascara('CPF',this,event);");
		$('#arrendatarioCPFCNPJ').attr("maxlength","14");
		habilitarCamposTela('trPessoaFisica');
	}else{
		$('#cpf_cnpj').html('CNPJ');
		$('#arrendatarioCPFCNPJ').removeClass('clCPF');
		$('#arrendatarioCPFCNPJ').addClass('clCNPJ');
		$('#arrendatarioCPFCNPJ').attr("onKeyUp","Mascara('CNPJ',this,event);");
		$('#arrendatarioCPFCNPJ').attr("maxlength","18");
		desabilitarCamposTela('trPessoaFisica');
	}
}

function desabilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',true);
	$('#'+idDiv+' input[type=text]').addClass('readonly');
	
	$('#'+idDiv+' textarea').attr('disabled',true);
	$('#'+idDiv+' textarea').addClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',true);
	$('#'+idDiv+' select').addClass('readonly');
}

function habilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',false);
	$('#'+idDiv+' input[type=text]').removeClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',false);
	$('#'+idDiv+' select').removeClass('readonly');
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
	if(event.keyCode == 9){
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

function validacaoGerarOrcamento(apolice){

	if($('#itens').val()>2){
		if(isEmpty('#marcaId')){
			fieldErrors += '- Fabricante do Veiculo<br/>';
		}
		if(isEmpty('#modeloVeiculoId')){
			fieldErrors += '- Modelo do Veiculo<br/>';
		}
	}
	
	if(isEmpty('#dataOrcamento')){
		fieldErrors += '- Data da Orcamento<br/>';
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
		msgErrors += '- Não existe uma Pessoa cadastrado para essa Orcamento<br/>';
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
	if(isEmpty('#modeloVeiculoId')){
		fieldErrors += '- Modelo Veículo<br/>';
	}
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
	if(isEmpty('#categoriaVeiculoId')){
		fieldErrors += '- Categoria Veículo<br/>';
	}
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
		fieldErrors += '- Grupo de Venda da Orcamento<br/>';
	}
	if(isEmpty('#nroOrcamentoSeg')){
		fieldErrors += '- Nro da Orcamento na Seguradora<br/>';
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
		msg = "efetivação do Orcamento";
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
*/	return validacaoGerarOrcamento("Gerar Apólice");	
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
	var orcamentoSeguroId = $('#orcamentoSeguroId').val();
	var ramoId = $('#ramoId').val();
	if(orcamentoSeguroId != ""){
		//url ='<s:url value="/jasperreport/myJasperTest.action" includeParams="none"/>?orcamentoSeguro.id='+orcamentoSeguroId;
		url ='<s:url value="/reports.do" includeParams="none"/>?orcamentoSeguroId='+orcamentoSeguroId+'&ramoId='+ramoId+'&dt='+(new Date());
		openWin(url, 'report', '750', '500', 'resizable=yes');
	}else{
		alert('Favor, salvar a orçamento.');
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
	  paramNovaOrcamento();}
	,2000);
}

function paramNovaOrcamento(){
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

function fechaParamNovaOrcamento(){
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

/** Metodo que adiciona Orcamento Cobertura Iseg na lista**/

function addOrcamentoCoberturaIseg(){
	submitFormAjax('#formOrcCobIseg', getContextApp()+'/orcamentoSegAuto/addOrcamentoCoberturaIseg.action', '#coberturasIseg');
}
/** Metodo que adiciona Orcamento Seguro Iseg na lista**/
function addOrcamentoServicoIseg(){
	submitFormAjax('#formOrcServIseg', getContextApp()+'/orcamentoSegAuto/addOrcamentoServicosIseg.action', '#servicosIseg');
}

/*****************/
/*   Cobertura   */
/*****************/
function abrirModalCoberturaSeguradora(){
	$('#gpSeguradoraId').val($('#paramSeguradoraModal').val());
	$('#gpOrcamentoSeguroId').val($('#paramOrcamentoSeguradoraIdModal').val());
	$('#gpRamoId').val($('#paramRamoIdModal').val());
	submitFormAjaxAllArgs('#formLookup', getContextApp()+'/orcamentoSegAuto/abrirModalCoberturaSeguradora.action', null, null, null, null, function(response){$('#formularioCoberturaSeguradora').html(response);});
	$('#divCoberturaSeguradora').dialog('destroy');
	$('#divCoberturaSeguradora').dialog({
		height: 190,
		width: 600,
		modal: true,
		zIndex: 4000,
		show: "blind",
		hide: "explode"
	});
	$('#divCoberturaSeguradora').css({'background-color':'#E8E8E8'});
}
function inserirCoberturaSeguradora(){
	if($('#orcamentoCobertura_coberturas_id').val()==''){
		alert("Selecionar a cobertura, caso não exista, terá que cadastrar cobertura para a seguradora selecionada!");
		return;
	}
	$('#paramOrcamentoSeguradoraCob').val($('#paramOrcamentoSeguradoraIdModal').val());
	submitFormAjaxAllArgs('#formCoberturaSeguradora', getContextApp()+'/orcamentoSegAuto/inserirCoberturaSeguradora.action', null, null, null, null, function(response){$('#tableCoberturaContratada').append(response);$('#divCoberturaSeguradora').dialog('close');});
}

function abrirDivNovaCobertura(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovaCobertura').width() / 2);
	$('#divNovaCobertura').modal({onOpen: openModalNovaCobertura, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (125 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
}
function editarCoberturaServico(){
	submitFormAjax('#formEdit', getContextApp()+'/orcamentoSegAuto/salvarEditar.action', null, null);
}
function openModalNovaCobertura (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	
	$('#paramOrcamentoSeguroId').val($('#orcamentoSeguroId').val());		
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
	$('#paramOrcamentoSeguroId').val($('#orcamentoSeguroId').val());
	submitFormAjaxAllArgs('#formCobertura', getContextApp()+'/orcamentoSegAuto/inserirOrcamentoCoberturaIseg.action', null, null, null, null, 
			function(response){
				if(response == "ERROR"){
					alert("Essa cobertura já foi adicionada!");
				}else
					$('#tableCoberturas').append(response);
			}
	);
}
/****************/
/*   Servicos   */
/****************/
function abrirModalServicoSeguradora(){
	$('#gpSeguradoraId').val($('#paramSeguradoraModal').val());
	$('#gpOrcamentoSeguroId').val($('#paramOrcamentoSeguradoraIdModal').val());
	$('#gpRamoId').val($('#paramRamoIdModal').val());
	submitFormAjaxAllArgs('#formLookup', getContextApp()+'/orcamentoSegAuto/abrirModalServicoSeguradora.action', null, null, null, null, function(response){$('#formularioServicoSeguradora').html(response);});
	$('#divServicoSeguradora').dialog('destroy');
	$('#divServicoSeguradora').dialog({
		height: 190,
		width: 600,
		modal: true,
		zIndex: 4000,
		show: "blind",
		hide: "explode"
	});
	$('#divServicoSeguradora').css({'background-color':'#E8E8E8'});
}
function inserirServicoSeguradora(){
	if($('#orcamentoServico_servicos_id').val()==''){
		alert("Selecionar o serviço, caso não exista, terá que cadastrar serviço para a seguradora selecionada!");
		return;
	}
	$('#paramOrcamentoSeguradoraServModal').val($('#paramOrcamentoSeguradoraIdModal').val());
	submitFormAjaxAllArgs('#formServicoSeguradora', getContextApp()+'/orcamentoSegAuto/inserirServicoSeguradora.action', null, null, null, null, function(response){$('#tableServicoContratado').append(response);$('#divServicoSeguradora').dialog('close');});
}
function abrirDivNovoServico(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovoServico').width() / 2);
	$('#divNovoServico').modal({onOpen: openModalNovoServico, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (140 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
}

function openModalNovoServico (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	$('#paramOrcamentoSeguroIdServicosIseg').val($('#orcamentoSeguroId').val());
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
	$('#paramOrcamentoSeguroIdServicosIseg').val($('#orcamentoSeguroId').val());
	submitFormAjaxAllArgs('#formServico', getContextApp()+'/orcamentoSegAuto/inserirOrcamentoServicosIseg.action', null, null, null, null, 
			function(response){
				if(response == "ERROR"){
					alert("Esse serviço já foi adicionado!");
				}else
					$('#tableServicos').append(response);
			}
	);
}

/**Calculos**/
function inserirOrcamentoSeguradora(){
	$("#loadProgress").css({'display':'',zIndex:'5000'});
	if($("#tipoFranquiasModalSeguradoras").val() == ''){
		alert('Informe o tipo de franquia');
		return;
	}
	submitFormAjaxAllArgs('#formSeguradora', getContextApp()+'/orcamentoSegAuto/inserirOrcamentoSeguradora.action', null, null, null, null, 
			function(response){
				$('#tableCalculos').append(response);
				$('#seguradoraCloseDiv').click();
				$("#loadProgress").css({'display':'none'});
				$('#btnf3').attr('disabled',false);
				$('#btnf4').attr('disabled',false);
				$('#btnf5').attr('disabled',false);
				$('#btnf6').attr('disabled',false);
				$('#btnf7').attr('disabled',false);
				$('#btnf8').attr('disabled',false);
				$('#btnf11').attr('disabled',false);
			}
	);
}
function removeFranquiaOrcamentoSeguradora(idSeguradora, idFranquia){
	$('#paramOrcamentoSeguradoraId').val(idSeguradora);
	$('#paramFranquiaOrcamentoSeguradoraId').val(idFranquia);
	$('#paramOrcamentoSeguroIdModal').val($('#orcamentoSeguroId').val());
	$("#loadProgress").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradora', getContextApp()+'/orcamentoSegAuto/removeFranquiaOrcamentoSeguradora.action', null, null, null, null, function(response){$('#tableCalculos').html(response);$("#loadProgress").css({'display':'none'});});
}
function inserirFranquiaOrcamentoSeguradora(id){
	if($("#tpFranquiaModal").val() == ''){
		alert("Favor Selecione uma Franquia");
		return;
	}
	submitFormAjaxAllArgs('#formFranquiaSeguradora', getContextApp()+'/orcamentoSegAuto/inserirFranquiaOrcamentoSeguradora.action', null, null, null, null, function(response){
		$('#calculo_'+id).append(response);
		closeModal();
	});
}

function abrirDivNovaSeguradora(){
	if($('#seguradoraId').val() == ''){
		alert("Seguradora inexistente ou não foi selecionada no auto-complete!");
		return;
	}
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovaSeguradora').width() / 2);
	$('#divNovaSeguradora').modal({onOpen: openModalNovoCalculo, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (567 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
	$('#paramSeguradoraOrcamentoSeguroId').val($('#orcamentoSeguroId').val());
	$('#paramSeguradoraNome').val($('#seguradoraNome').val());
	$('#paramOrcamentoSegSeguradoraId').val($('#seguradoraId').val());
	$('#paramOrcamentoSeguradoraRotulo').val($('#orcamentoSeguradoraRotulo').val());
	$('#paramOrcamentoSeguradoraFator').val($('#orcamentoSeguradoraFator').val());
}

function openModalNovaSeguradora(dialog) {
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

function abrirDivNovaFranquiaSeguradora(id,rotulo, posicao){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovaFranquiaSeguradora').width() / 2);
	$('#divNovaFranquiaSeguradora').modal({onOpen: openModalNovaFranquiaSeguradora, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (567 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
	$('#paramFranquiaSeguradoraOrcamentoSeguroId').val($('#orcamentoSeguroId').val());
	$('#paramFranquiaSeguradoraNome').val($('#seguradoraNome'+posicao).val());
	$('#paramOrcamentoSegSeguradoraFranquiaId').val(id.toString());
	$('#paramFranquiaSeguradoraRotulo').val(rotulo);
	$('#paramItemCorrente').val(posicao);
}

function openModalNovaFranquiaSeguradora(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}

/*******************/
/**     Anexo     **/
/*******************/
function inserirOrcamentoAnexo(){
//	if (isEmpty($("#arquivoAnexo"))){
//		alert("Selecione um arquivo valido!");
//		return;
//	}
	$("#formAnexo").empty();

	copyField($("#arquivoAnexo")[0], $("#formAnexo")[0]);
	copyField($("#paramOrcamentoSeguradoraIdModal")[0], $("#formAnexo")[0]);
	copyField($("#paramPropostaAnexoOrcamentoSeguradoraId")[0], $("#formAnexo")[0]);
	
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formAnexo', getContextApp()+'/orcamentoSegAuto/inserirAnexo.action', null, null, null, null, function(response){$('#divListaAnexo').html(response);$("#loadProgressModal").css({'display':'none'});$(".jcarousel-skin-tango").css({'width':'650px'});});
}
function removerOrcamentoAnexo(id){
	var parameters = '?propostaAnexo.id='+id+'&propostaAnexo.orcamentoSeguradora.id='+$("#propostaId").val();
	$('#faPropostaAnexoOrcamentoSeguradoraId').val($('#paramOrcamentoSeguradoraIdModal').val());
	$('#paramPropostaAnexoOrcamentoSeguradoraId').val($('#paramOrcamentoSeguradoraIdModal').val());
	submitFormAjax('#formAnexo', getContextApp()+'/orcamentoSegAuto/excluirAnexo.action?propostaAnexo.id='+id, '#divListaAnexo');
}

function mostrarOrcamentoAnexo(id){
	openWin(contextApp+'/orcamentoSegAuto/mostrarAnexo.action?propostaAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function preparaMostrarOrcamentoAnexo(id){
	openWin(contextApp+'/orcamentoSegAuto/preparaMostrarAnexo.action?propostaAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function apagarDadosPropostaAnexo(){
	$("#arquivoAnexo").val("");
}

function carregarPropostaAnexosOrcamento(idOrcamentoSeguradora){
	$('#faPropostaAnexoOrcamentoSeguradoraId').val(idOrcamentoSeguradora);
	$('#paramPropostaAnexoOrcamentoSeguradoraId').val(idOrcamentoSeguradora);
	submitFormAjaxAllArgs('#formAnexo', getContextApp()+'/orcamentoSegAuto/carregarAnexos.action', null, null, null, null, function(response){$('#divListaAnexo').html(response);$('#faPropostaAnexoOrcamentoSeguradoraId').val('');});
}

function ativarOutraProfissao(obj){
	if(obj.checked){
		$("#outraProfissaoNome").attr('disabled',false);
		$("#outraProfissaoNome").removeClass('readonly');
		
		$("#profissaoNome").attr('disabled',true);
		$("#profissaoNome").addClass('readonly');
		$("#profissaoId").attr('disabled',true);
		
		$("#profissaoNome").val('');
		$("#profissaoId").val('');
	}else{
		$("#outraProfissaoNome").attr('disabled',true);
		$("#outraProfissaoNome").addClass('readonly');
		
		$("#profissaoNome").attr('disabled',false);
		$("#profissaoNome").removeClass('readonly');
		$("#profissaoId").attr('disabled',false);
		
		$("#outraProfissaoNome").val('');
		$("#outraProfissaoNome").val('');
	}
}
function checarProfissao(){
	if($("#profissaoId").val() == '' && $("#profissaoNome").val() != ''){
		$("#profissaoNome").val('');
		$("#profissaoNome").focus();
		alert("Profissão inexistente!");
	}
}

function clearProfissao(event){
	if(event.keyCode != 9){
		$("#profissaoId").val("");
	}else{
		setTimeout(function(){
			checarProfissao();
		},300);
	}
}

//--->Função para a formatação dos campos...<---
function Mascara(tipo, campo, teclaPress) {
    if (window.event)
    {
            var tecla = teclaPress.keyCode;
    } else {
            tecla = teclaPress.which;
    }
    var s = new String(campo.value);
    // Remove todos os caracteres à seguir: ( ) / - . e espaço, para tratar a string denovo.
    s = s.replace(/(\.|\(|\)|\/|\-| )+/g,'');
    tam = s.length + 1;
    if ( tecla != 9 && tecla != 8 ) {
        switch (tipo)
        {
            case 'CPF' :
                if (tam > 3 && tam < 7)
                    campo.value = s.substr(0,3) + '.' + s.substr(3, tam);
                if (tam >= 7 && tam < 10)
                    campo.value = s.substr(0,3) + '.' + s.substr(3,3) + '.' + s.substr(6,tam-6);
                if (tam >= 10 && tam < 12)
                    campo.value = s.substr(0,3) + '.' + s.substr(3,3) + '.' + s.substr(6,3) + '-' + s.substr(9,tam-9);
            break;
            case 'CNPJ' :
 
	            if (tam > 2 && tam < 6)
	            	campo.value = s.substr(0,2) + '.' + s.substr(2, tam);
	            if (tam >= 6 && tam < 9)
                    campo.value = s.substr(0,2) + '.' + s.substr(2,3) + '.' + s.substr(5,tam-5);
	            if (tam >= 9 && tam < 13)
                    campo.value = s.substr(0,2) + '.' + s.substr(2,3) + '.' + s.substr(5,3) + '/' + s.substr(8,tam-8);
	            if (tam >= 13 && tam < 15)
                    campo.value = s.substr(0,2) + '.' + s.substr(2,3) + '.' + s.substr(5,3) + '/' + s.substr(8,4)+ '-' + s.substr(12,tam-12);
            break;
        }
    }
}

function digitos(event){
    if (window.event) {
        // IE
        key = event.keyCode;
    } else if ( event.which ) {
        // netscape
        key = event.which;
    }
    if ( key != 8 || key != 13 || key < 48 || key > 57 )
        return ( ( ( key > 47 ) && ( key < 58 ) ) || ( key == 8 ) || ( key == 13 ) );
    return true;
}

function popupResumoOrcamento(){
	orcamentoSeguroId = $('#orcamentoSeguroId').val();
	tipoCliente = $('#tipoCliente').val();
	if(orcamentoSeguroId != ''){
		openWin(contextApp+'/orcamentoSegAuto/popupResumoOrcamento.action?orcamentoSeguro.id='+orcamentoSeguroId+'&tipoCliente'+tipoCliente, 'divPopupOrcamento', '850', '500', 'resizable=yes,scrollbars=1');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
}

function gerarProposta(){
	if($('#statusOrcamento').val() != '3'){
		alert("Situação do orçamento não permite gerar proposta");
		return;
	}
	if($('input[name=parcelasOrcamento.id]:checked').length <= 0){
		alert("Selecione a Quantidade de Parcelas!");
	}else{
		submitForm($('#formGeraProposta').get(0), getContextApp()+'/orcamentoSeguro/gerarPropostaOrcamento.action', false);
	}
}
function abrirModalGeraProposta(idFranquia){
	$('#paramFranquiaOrcamentoSeguradoraId').val(idFranquia);
	$('#paramOrcamentoFranquiasProposta').val(idFranquia);
	$('#paramTipoCliente').val($('#tipoCliente').val());
	submitFormAjax('#formOrcamentoSeguradora', getContextApp()+'/orcamentoSegAuto/abrirModalGerarProposta.action', '#dadosGerarProposta');
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#modalGerarProposta').width() / 2);
	$('#modalGerarProposta').modal({onOpen: openModalNovoCalculo, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (567 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
}

function openModalGerarProposta(dialog) {
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
function closeModalGerarProposta(){
	$('#btnf3').attr('disabled',false);
	$('#btnf4').attr('disabled',false);
	$('#btnf5').attr('disabled',false);
	$('#btnf6').attr('disabled',false);
	$('#btnf7').attr('disabled',false);
	$('#btnf8').attr('disabled',false);
	$('#btnf11').attr('disabled',false);
	$('#closeDiv').click();
}
function gerarOrcamento(){
	$("#telefoneCliente").val($("#telefoneCelular").val());
	$("#emailCliente").val($("#email").val());
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#modalGerarOrcamento').width() / 2);
	$('#modalGerarOrcamento').modal({onOpen: openModalGerarOrcamento, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (650 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left,'width':500, 'max-height':800});
	$('.nicEdit-main').css({'max-height':130,'overflow':'auto'});
}

function openModalGerarOrcamento(dialog) {
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
function gerarOrcamentoPdf(){
	orcamentoSeguroId = $('#orcamentoSeguroId').val();
	orcamentoSeguradoras = '';
	if($('input[name=orcamentoSegId]:checked').length > 5){
		alert("Excedeu o limite máximo de itens, favor selecionar até 5 companhias.");
		return;
	}
	$('input[name=orcamentoSegId]:checked').each(function(){
		orcamentoSeguradoras += '&orcamentoSegId='+$(this).val();
	});
	if(orcamentoSeguroId != ''){
		possuiCobServ = $('#possuiCobServ').val();
		openWin(contextApp+'/orcamentoSegAuto/gerarOrcamento.action?orcamentoSeguro.id='+orcamentoSeguroId+orcamentoSeguradoras+'&possuiCobServ='+possuiCobServ, 'divPopupOrcamento', '850', '500', 'resizable=yes,scrollbars=1');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
}
function enviarOrcamento(){
	orcamentoSeguroId = $('#orcamentoSeguroId').val();
	orcamentoSeguradoras = '';
	if($('input[name=orcamentoSegId]:checked').length > 5){
		alert("Excedeu o limite máximo de itens, favor selecionar até 5 companhias.");
		return;
	}
	$('input[name=orcamentoSegId]:checked').each(function(){
		orcamentoSeguradoras += '&orcamentoSegId='+$(this).val();
	});
	$('#editor').val($('.nicEdit-main').html());
	$("#loadProgress").css({'display':'',zIndex: 4000});
	submitFormAjaxAllArgs($('#formGeraOrcamento'), getContextApp()+'/orcamentoSegAuto/enviarOrcamentoEmail.action?orcamentoSeguro.id='+orcamentoSeguroId+orcamentoSeguradoras+'&possuiCobServ='+$('#possuiCobServ').val(), null, null, null, null, 
			  function(response){
				if(response == "SALVO"){
					$("#msgEmail").html("<label style='color: green; font-weight: bold; font-size: 14px;'>Enviado com Sucesso!</label>");
					$("#msgEmail").animate({ width: 200, height: 20 }, "fast");
					setTimeout(function(){
						$("#msgEmail").animate({ width: 0, height: 0 }, "fast");
						$("#msgEmail").html("");
					}
					,3000);
					$("#loadProgress").css({'display':'none'});
					enviarSms();
				}else{
					$("#msgEmail").html("<label style='color: red; font-weight: bold; font-size: 14px;'>Erro ao Enviar!</label>");
					$("#msgEmail").animate({ width: 200, height: 20 }, "fast");
					setTimeout(function(){
						$("#msgEmail").animate({ width: 0, height: 0 }, "fast");
						$("#msgEmail").html("");
					}
					,3000);
					$("#loadProgress").css({'display':'none'});
				}
			  });
//	submitFormAjax($('#formGeraOrcamento'), getContextApp()+'/orcamentoSegAuto/enviarOrcamentoEmail.action?orcamentoSeguro.id='+orcamentoSeguroId+orcamentoSeguradoras, null);
}

function enviarSms(){
	celulares = "";
	if($('#isEnvioSms').val() == 'true'){
		celulares = removerMascara($('#telefoneCliente').val());
	}
	if($('#isEnvioProdutor').val() == 'true'){
		if(celulares != ""){
			celulares += ", ";
		}
		celulares += removerMascara($('#telefoneProdutor').val());
	}
	$('#celularCliente').val(celulares);
	submitAjaxFormArguments('#formEnviarSms', 'http://www.iagentesms.com.br/webservices/smslote.php', null, null, null, null, function(response){});
}

function submitAjaxFormArguments(idForm, url, idTarget, indicator, beforeSubmit, error, success){

	var form = $(idForm);
	var target = idTarget == null ? null : $(idTarget);

	if(error == null){
		error = function(response){$("#divMessages").html(response.responseText);}
	}
	if(success == null){
		success = function(response){}
	}
	if(indicator == null || indicator==""){
		indicator = '#pageloader';
	}
	$(indicator).show();

	$.extend( jQuery.ajaxSettings, {contentType: "text/html; charset=UTF-8"} );

	if(!!form){
		$(form).ajaxSubmit({
					type: "GET",
					url: url,
					indicator: indicator,
					messageTarget: "#divMessages",
					target: target,
					beforeSubmit: beforeSubmit,
					error: error,
					success: success,
					complete: function(responseText){$(indicator).hide();}
				});
	}
}

function removerMascara(text){
	text = text.replace("(","").replace(")","").replace("-","").replace(" ","").trim();
	return text;
} 

function excluirSeguradora(idSeguradora){
	$("#paramOrcamentoSeguradoraId").val(idSeguradora);
	$("#paramOrcamentoSeguroIdModal").val($('#orcamentoSeguroId').val());
	$("#loadProgress").css({'display':''});
	submitFormAjaxAllArgs('#formOrcamentoSeguradora', getContextApp()+'/orcamentoSegAuto/removeOrcamentoSeguradora.action', null, null, null, null, 
						  function(response){
							$('#tableCalculos').html(response);
							$("#loadProgress").css({'display':'none'});
						  });
}
function setarFatores(){
	$(".fator").each(function(){
		if($(this).val() == '0,00'){
			$(this).val($("#orcamentoSeguradoraFator").val());
		}
	});
}
function apoliceCancelada(object){
	if(object.value == 'true'){
		$("#motivo").attr("readonly",true);
		$("#motivo").addClass("readonly");
	}else{
		$("#motivo").attr("readonly",false);
		$("#motivo").removeClass("readonly");
	}
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
	$('#modalContainer').css({'top':top,'margin-left':left});
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

function closeModal(){
	$('#btnf3').attr('disabled',false);
	$('#btnf4').attr('disabled',false);
	$('#btnf5').attr('disabled',false);
	$('#btnf6').attr('disabled',false);
	$('#btnf7').attr('disabled',false);
	$('#btnf8').attr('disabled',false);
	$('#btnf11').attr('disabled',false);
	$('#closeDiv').click();
}
function checarModeloVeiculo(){
	if($('#modeloVeiculoDescricao').val() == ''){
		$('#modeloVeiculoId').val('');
	}
//	if($('#modeloVeiculoId').val() == ''){
//		if($('.ac_results')[1] == null || $('.ac_results')[1].style.display == 'none'){
//			alert("Selecione um Modelo Válido");
//			$('#modeloVeiculoDescricao').val("");
//			$('#modeloVeiculoDescricao').focus();
//		}
//	}
}
function checarMarcaVeiculo(){
	if($('#marcaNome').val() == ''){
		$('#marcaId').val("");
	}
//	if($('#marcaId').val() == ''){
//		if($('.ac_results')[0] == null || $('.ac_results')[0].style.display == 'none'){
//			alert("Selecione uma Marca Válida");
//			$('#marcaNome').val("");
//			$('#marcaNome').focus();
//		}
//	}
}
function finalizarCalculo(){
	submitFormAjaxAllArgs('#formEdit', getContextApp()+'/orcamentoSegAuto/finalizarCalculo.action', '#tabPane'+$('#currentTabId').val(), '#saveProgress',null,null,
			function(response){
				object = $(response).find("select[id='statusOrcamentoId']");
				$("select[name='statusOrcamento[]']").each(function(){
					$(this).val(object[0].value);
					$('#statusOrcamento').val(object[0].value);
				});
				$('div[id^="divMessagesTab"]').html('').html('');
			}
	);
//	salvarOrcamento();
}
function listaCorretorPorGrupoDeVenda(id){
	idOrcamento = $('#orcamentoSeguroId').val();
	submitFormAjax('#formEdit', getContextApp()+'/orcamentoSegAuto/listaCorretorPorGrupoDeVenda.action', '#comboCorretorPorGrupoDeVenda');
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
//mostrarMenu('buttonMenu');