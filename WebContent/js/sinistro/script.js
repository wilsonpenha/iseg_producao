ArrNomeCampo     = [];
ArrLabelCampo    = [];
ArrTipoCampo     = [];
ArrOperacaoCampo = [];

/**************/
/** Sinistro **/
/**************/

function novoSinistro(){
	submitForm($('#formEdit').get(0), getContextApp()+'/sinistro/displayList.action', false);
}

function listarSinistro(){
	submitForm($('#formEdit').get(0), getContextApp()+'/sinistro/displayList.action', false);
}

function handleReadonly(){
	$('#tableDadosCliente input').attr('readonly','true');
	$('#tableDadosCliente input').addClass('readonly');
	$('#tableDadosCliente select').attr('disabled','true');
	$('#tableDadosCliente select').addClass('readonly');
}

function salvarSinistro(){
	submitFormAjax('#formEdit', getContextApp()+'/sinistro/salvarEditar.action', '#allForms', '#saveProgress');
}

/************************/
/** Terceiro Envolvido **/
/************************/
function removeTerceiroEnvolvido(id){
	$("#teTerceiroId").val(id);
	$("#teTerceiroSinistroId").val($("#sinistroId").val());
	submitFormAjax('#formTerceiroEnvolvido', getContextApp()+'/sinistro/excluirTerceiroEnvolvido.action', '#divListaTerceiroEnvolvido');
	$("#teTerceiroNome").focus();
}

function inserirTerceiroEnvolvido(){
	
	$("#teTerceiroId").val($("#terceiroId").val());
	$("#teTerceiroSinistroId").val($("#sinistroId").val());
	$("#teTerceiroNome").val($("#terceiroNome").val());
	$("#teTerceiroCpfCnpj").val($("#terceiroCpfCnpj").val());
	$("#teTerceiroDataNascimento").val($("#terceiroDataNascimento").val());
	$("#teTerceiroTipoEndereco").val($("#terceiroTipoEndereco").val());
	$("#teCepTer").val($("#cepTer").val());
	$("#teLograTer").val($("#lograTer").val());
	$("#teCompTer").val($("#compTer").val());
	$("#teNumeroTer").val($("#numeroTer").val());
	$("#teFoneTer").val($("#foneTer").val());
	$("#teBairroTer").val($("#bairroTer").val());
	$("#teCidadeTer").val($("#cidadeTer").val());
	$("#teUfTer").val($("#ufTer").val());
	$("#teCelTer").val($("#celTer").val());
	$("#teTerceiroCondutorNome").val($("#terceiroCondutorNome").val());
	$("#teTerceiroCondutorCpf").val($("#terceiroCondutorCpf").val());
	$("#teTerceiroCondutorCNH").val($("#terceiroCondutorCNH").val());
	$("#teTerceiroVeiculoEnvolvido").val($("#terceiroVeiculoEnvolvido").val());
	$("#teTerceiroCor").val($("#terceiroCor").val());
	$("#teTerceiroAnoFabricacao").val($("#terceiroAnoFabricacao").val());
	$("#teTerceiroAnoModelo").val($("#terceiroAnoModelo").val());
	$("#teTerceiroNroPlaca").val($("#terceiroNroPlaca").val());
	submitFormAjax('#formTerceiroEnvolvido', getContextApp()+'/sinistro/inserirTerceiroEnvolvido.action', '#divListaTerceiroEnvolvido');
	$("#terceiroId").val("");
	$("#terceiroNome").val("");
	$("#terceiroCpfCnpj").val("");
	$("#terceiroDataNascimento").val("");
	$("#terceiroTipoEndereco").val("");
	$("#cepTer").val("");
	$("#lograTer").val("");
	$("#compTer").val("");
	$("#numeroTer").val("");
	$("#foneTer").val("");
	$("#bairroTer").val("");
	$("#cidadeTer").val("");
	$("#ufTer").val("");
	$("#celTer").val("");
	$("#terceiroCondutorNome").val("");
	$("#terceiroCondutorCpf").val("");
	$("#terceiroCondutorCNH").val("");
	$("#terceiroVeiculoEnvolvido").val("");
	$("#terceiroCor").val("");
	$("#terceiroAnoFabricacao").val("");
	$("#terceiroAnoModelo").val("");
	$("#terceiroNroPlaca").val("");
	$("#terceiroNome").focus();
}

function editarTerceiroEnvolvido(id){
	$("#teTerceiroId").val(id);
	submitFormAjax('#formTerceiroEnvolvido', getContextApp()+'/sinistro/editarTerceiroEnvolvido.action', '#divDadosTerceiroEnvolvido');
}

function apagarDadosTerceiroEnvolvido(){
	if(confirm("Tem certeza que deseja apagar os Dados do Terceiro Envolvido?")){
		$("#terceiroId").val("");
		$("#terceiroNome").val("");
		$("#terceiroCpfCnpj").val("");
		$("#terceiroDataNascimento").val("");
		$("#terceiroTipoEndereco").val("");
		$("#cepTer").val("");
		$("#lograTer").val("");
		$("#compTer").val("");
		$("#numeroTer").val("");
		$("#foneTer").val("");
		$("#bairroTer").val("");
		$("#cidadeTer").val("");
		$("#ufTer").val("");
		$("#celTer").val("");
		$("#terceiroCondutorNome").val("");
		$("#terceiroCondutorCpf").val("");
		$("#terceiroCondutorCNH").val("");
		$("#terceiroVeiculoEnvolvido").val("");
		$("#terceiroCor").val("");
		$("#terceiroAnoFabricacao").val("");
		$("#terceiroAnoModelo").val("");
		$("#terceiroNroPlaca").val("");
		$("#terceiroNome").focus();
	}
}

/**********************/
/**  Acompanhamento  **/
/**********************/
function removeAcompanhamento(id){
	$("#acoAcompanhamentoId").val(id);
	$("#acoAcompanhamentoSinistroId").val($("#sinistroId").val());
	submitFormAjax('#formAcompanhamento', getContextApp()+'/sinistro/excluirAcompanhamento.action', '#divListaAcompanhamento');
	$("#acoDtLancamento").focus();
}

function inserirAcompanhamento(){
	
	$("#acoAcompanhamentoId").val($("#acompanhamentoId").val());
	$("#acoAcompanhamentoSinistroId").val($("#sinistroId").val());
	$("#acoAcompanhamentoDataLancamento").val($("#acoDtLancamento").val());
	$("#acoAcompanhamentoDetalhamento").val($("#acoDetalhamento").val());
	submitFormAjax('#formAcompanhamento', getContextApp()+'/sinistro/inserirAcompanhamento.action', '#divListaAcompanhamento');
	$("#acompanhamentoId").val("");
	$("#acoDtLancamento").val("");
	$("#acoDetalhamento").val("");
	$("#acoDtLancamento").focus();
}

function editarAcompanhamento(id){
	$("#acoAcompanhamentoId").val(id);
	submitFormAjax('#formAcompanhamento', getContextApp()+'/sinistro/editarAcompanhamento.action', '#divDadosAcompanhamento');
}

function apagarDadosAcompanhamento(){
	if(confirm("Tem certeza que deseja apagar os Dados do Acompanhamento?")){
		$("#acompanhamentoId").val("");
		$("#acoDtLancamento").val("");
		$("#acoDetalhamento").val("");
		$("#acoDtLancamento").focus();
	}
}

/*******************/
/**  Indenização  **/
/*******************/
function removeIndenizacao(id){
	$("#fiIndenizacaoId").val(id);
	$("#fiIndenizacaoSinistroId").val($("#sinistroId").val());
	submitFormAjax('#formIndenizacao', getContextApp()+'/sinistro/excluirIndenizacao.action', '#divListaIndenizacao');
	$("#indenizacaoDataPagamento").focus();
}

function inserirIndenizacao(){
	
	$("#fiIndenizacaoId").val($("#indenizacaoId").val());
	$("#fiIndenizacaoSinistroId").val($("#sinistroId").val());
	$("#fiIndenizacaoDataPagamento").val($("#indenizacaoDataPagamento").val());
	$("#fiIndenizacaoValor").val($("#indenizacaoValor").val());
	$("#fiIndenizacaoTipo").val($("#indenizacaoTipo").val());
	submitFormAjax('#formIndenizacao', getContextApp()+'/sinistro/inserirIndenizacao.action', '#divListaIndenizacao');
	$("#indenizacaoId").val("");
	$("#indenizacaoDataPagamento").val("");
	$("#indenizacaoValor").val("");
	$("#indenizacaoTipo").val("");
	$("#indenizacaoDataPagamento").focus();
}

function editarIndenizacao(id){
	$("#fiIndenizacaoId").val(id);
	submitFormAjax('#formIndenizacao', getContextApp()+'/sinistro/editarIndenizacao.action', '#divDadosIndenizacao');
}

function apagarDadosIndenizacao(){
	if(confirm("Tem certeza que deseja apagar os Dados do Indenizacao?")){
		$("#indenizacaoId").val("");
		$("#indenizacaoDataPagamento").val("");
		$("#indenizacaoValor").val("");
		$("#indenizacaoTipo").val("");
		$("#indenizacaoDataPagamento").focus();
	}
}

/*******************/
/**     Anexo     **/
/*******************/
function removerAnexo(id){
	//var parameters = '?sinistroAnexo.id='+id+'&sinistroAnexo.sinistro.id='+$("#sinistroId").val();
	submitFormAjax('#formAnexo', getContextApp()+'/sinistro/excluirAnexo.action?sinistroAnexo.id='+id, '#divListaAnexo');
}

function inserirAnexo(){

	if (isEmpty($("#arquivoAnexo"))){
		alert("Selecione um arquivo valido!")
		return;
	}
	
	$("#formAnexo").empty();

	//$("#formAnexo").append($("#arquivoAnexo").clone2());
	//$("#formAnexo").append($("#sinistroId").clone2());
	copyField($("#arquivoAnexo")[0], $("#formAnexo")[0]);
	copyField($("#sinistroId")[0], $("#formAnexo")[0]);

	submitFormAjax('#formAnexo', getContextApp()+'/sinistro/inserirAnexo.action', '#divListaAnexo');
	$("#arquivoAnexo").val("");
}

function mostrarAnexo(id){
	openWin(contextApp+'/sinistro/mostrarAnexo.action?sinistroAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function preparaMostrarAnexo(id){
	openWin(contextApp+'/sinistro/preparaMostrarAnexo.action?sinistroAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function apagarDadosAnexo(){
	$("#arquivoAnexo").val("");
}

function carregarAnexos(){
	$("#faSinistroAnexoSinistroId").val($("#sinistroId").val());
	$("#faSinistroId").val($("#sinistroId").val());
	submitFormAjax('#formAnexo', getContextApp()+'/sinistro/carregarAnexos.action', '#divListaAnexo');
}
/****************/
/** Seguradora **/
/****************/
function carregaComboVistoriadora(seguradoraId) {
	$("#gpSeguradoraId").val(seguradoraId);
	submitFormAjax('#formLookup', getContextApp()+'/sinistro/vistoriadoraPorSeguradora.action', '#divVistoriadora');
}

function carregaComboCondPagto(seguradoraId) {
	$("#gpSeguradoraId").val(seguradoraId);
	submitFormAjax('#formLookup', getContextApp()+'/sinistro/condPagtoPorSeguradora.action', '#divCondPagto');
}

/****************/
/**  Clientes  **/
/****************/
function carregaCliente() {

	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpTipoCliente").val($("#tipoCliente").val());
	submitFormAjax('#formLookup', getContextApp()+'/sinistro/getDadosCliente.action', '#divDadosCliente');
}

function apagarDadosCliente(){
	$('#formLookup #currentTabId').val('0');
	$("#gpTipoCliente").val($("#tipoCliente").val());
	submitFormAjax('#formLookup', getContextApp()+'/sinistro/novoDadosClienteForm.action', '#divDadosCliente');
}

function editarCliente(){
	var clienteId = $('#clienteId').val(); 
	if(clienteId != ''){
		openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId, 'clienteEdicao', '750', '500', 'resizable=yes');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
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

function validaData1aHabilitacao(element1, element2){
	if(dateDiffYears(element1, element2) < 18){
		alert("A diferença entre a Data de Nascimento e a Data da 1a Hablitação deve ser maior que 18.");
		$(element2).val('');
		$(element2).select();
		$(element2).focus();
		return false;
	}
}

function setAlterado(b){
	alterado = b;
}

function nextTab(event){

	// Tecla TAB pressionada.
	if(event.keyCode == 9 || event.keyCode == 13){
		navigate('proximo');
		return false;
	}
	return true;
}