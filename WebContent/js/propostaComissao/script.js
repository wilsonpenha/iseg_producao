function editarComissao(id, parcela, vencto, valorComissao, situacao, valorPagamento){
	$("#comissaoId").val(id);
	$("#comissaoNroDaParcela").val(parcela);
	$("#comissaoDataVencimento").val(vencto);
	$("#comissaoValorComissao").val(valorComissao);
	$("#comissaoSituacao").val(situacao);
	$("#comissaoDataPagamento").datepicker('setDate',new Date());
	$("#comissaoDataPagamento").focus();
}

function baixarComissao(){
	if ($("#comissaoNroDaParcela").val()==''){
		alert("Selecione a parcela a ser baixada!");
		return;
	}
	if ($("#comissaoDataPagamento").val()=='' || $("#comissaoValorPagamento").val()==''){
		alert("A data de pagamento e o valor devem ser informados!");
		$("#comissaoDataPagamento").focus();
		return;
	}
	
	$("#comPropostaId").val($('#propostaId').val());
	$("#comComissaoId").val($("#comissaoId").val());
	$("#comComissaoNroDaParcela").val($("#comissaoNroDaParcela").val());
	$("#comComissaoDataVencimento").val($("#comissaoDataVencimento").val());
	$("#comComissaoDataPagamento").val($("#comissaoDataPagamento").val());
	$("#comComissaoValorPagamento").val($("#comissaoValorPagamento").val());
	$("#comComissaoValorComissao").val($("#comissaoValorComissao").val());

	if ($("#comComissaoNroDaParcela").val()!=''){
		if (confirm("Confirma a Baixa da Comissao?")){
			submitFormAjax('#formComissoes', getContextApp()+'/preBaixaComissao/baixarComissao.action', '#divListaComissoes');
			setTimeout("submitFormAjax('#formComissoes', getContextApp()+'/preBaixaComissao/atualizarRepasse.action', '#divListaComissionados',false)",500)
			$("#comissaoId").val('');
			$("#comissaoNroDaParcela").val('');
			$("#comissaoDataVencimento").val('');
			$("#comissaoValorComissao").val('');
			$("#comissaoDataPagamento").val('');
			$("#comissaoValorPagamento").val('');
			$("#comissaoSituacao").val('');
		}
	}
}

function listaComissoes(){
	submitForm($('#formEdit').get(0), getContextApp()+'/preBaixaComissao/displayList.action', false);
}

function estornarComissao(){
	$("#comPropostaId").val($('#propostaId').val());

	if (confirm("Confirma o Estorno das Comissões?")){
		//submitFormAjax('#formComissoes', getContextApp()+'/preBaixaComissao/estornaComissao.action', '#divListaComissoes');
	}
}

function validaComissionado(){

	var pessoaId = $('#propostaComissaoPessoaId')[0];
	var hasError = false;

	var divComissionados = $('#divMessagesComissionados').html('')[0];

	if(pessoaId.value == ""){
		addErrorText('É necessário especificar uma pessoa.', divComissionados);
		hasError = true;
	}
	return !hasError;
}

function carregarComissionados(){
	document.getElementById("gpPropostaId").value=document.getElementById("propostaId").value;

	document.getElementById("bindBtnCarregarComissionados").click();
}

function adicionarComissionado(){
	if(validaComissionado()){
		document.getElementById("gpPropostaId").value=document.getElementById("propostaId").value;
		document.getElementById("gpComissionadoId").value=document.getElementById("propostaComissaoPessoaId").value;

		document.getElementById("bindBtnAdicionarComissionado").click();
	}
}

function removerComissionado(id){
	document.getElementById("gpPropostaId").value=document.getElementById("propostaId").value;
	document.getElementById("gpComissionadoId").value=document.getElementById("propostaComissaoPessoaId").value;

	document.getElementById("bindBtnRemoverComissionado").click();
}

function calcularPercentualComissao(){

	var sizeDecimal = 2;
	var inputs = $('#tableProdutorItens input'); 
	var totalPercentual = 0.0;
	for(var i=0 ; i<inputs.length ; i++){
		if(inputs[i].name.match('percentualComissao')){
			totalPercentual += Number(inputs[i].value.replace(/\./g,'').replace(/\,/g,'.'));
		}
	}

	var numberValue = Math.round(totalPercentual*Math.pow(10,sizeDecimal))/Math.pow(10,sizeDecimal);
	applyFormatToNumber(document.getElementById('totalPercentualComissao'), numberValue, sizeDecimal);
}

function validatePercentual(){

	var tableItens = $('#tableProdutorItens')[0];
	var divMessages = $('#divMessages').html('')[0];
	var percentualComissao;
	var hasError = false;

	for(var i=0 ; i<tableItens.rows.length-1 ; i++){
		percentualComissao = $('#propostaComissaoPercentual'+i)[0];
		if(percentualComissao.value == "" || Number(removeCommas(percentualComissao.value)) == 0){
			var produtorNome = $('#propostaComissaoPessoaNome'+i)[0];
			addErrorText('É necessário especificar um percentual de comissão para o produtor '+produtorNome.value, divMessages);
			hasError = true;
		}
	}

	if($('#totalPercentualComissao')[0].value != '100,00'){
		addErrorText('O total do percentual deve ser igual a 100%.', divMessages);
		hasError = true;
	}
	return !hasError;
}


// Funcoes para gerenciamento de comissoes

function listaLista(){
	$("#bindLista")[0].click();
}

function listaNext(){
	$("#bindNext")[0].click();
}

function listaPrevious(){
	$("#bindPrevious")[0].click();
}

function listaLast(){
	$("#bindLast")[0].click();
}

function listaFirst(){
	$("#bindFirst")[0].click();
}

