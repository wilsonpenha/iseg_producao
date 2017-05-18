function validaAcrescimoDesconto(){

	var acrescimoDesconto = $('#acrescimoDesconto')[0];
	var acrescimoDescontoPercentual = $('#acrescimoDescontoPercentual')[0];
	var acrescimoDescontoDescricao = $('#acrescimoDescontoDescricao')[0];
	var hasError = false;

	var divAcrescimoDesconto = $('#divMessagesAcrescimoDesconto').html('')[0];

	if(acrescimoDesconto.value == ""){
		addErrorText('Selecionar o Acessório/Desconto.', divAcrescimoDesconto);
		hasError = true;
	}
	if(acrescimoDescontoPercentual.value == "" || Number(removeCommas(acrescimoDescontoPercentual.value)) == 0){
		addErrorText('Especificar o percentual.', divAcrescimoDesconto);
		hasError = true;
	}
	if(acrescimoDescontoDescricao.value == ""){
		addErrorText('Especificar a descrição.', divAcrescimoDesconto);
		hasError = true;
	}
	return !hasError;
}

function addAcrescimoDesconto(){

	if (validaAcrescimoDesconto()){
		var elements = new Array(3);
		elements[0] = $('#acrescimoDesconto')[0];
		elements[1] = $('#acrescimoDescontoPercentual')[0];
		elements[2] = $('#acrescimoDescontoDescricao')[0];
		addRow($('#tableAcrescimoDesconto')[0], $('#tableAcrescimoDescontoItens')[0], elements);
	}
}

function validaAcessorio(){

	var acessorioElement = $('#acessorioId')[0];
	var divAcessorio = $('#divMessagesAcessorio').html('')[0];

	if(acessorioElement.value == ""){
		addErrorText('Selecionar o acessório a ser incluído.', divAcessorio);
		return false;
	}

	var acessorioName = acessorioElement.options[acessorioElement.selectedIndex].text; 
	var tableAcessorioItens = $('#tableAcessorioItens')[0];
	if(tableAcessorioItens.innerHTML.match(acessorioName)){
		addErrorText('Acessório já adicionado.', divAcessorio);
		return false;
	}
	return true;
}

function addAcessorio(){

	if(validaAcessorio()){
		var elements = new Array(1);
		elements[0] = $('#acessorioId')[0];
		addRow($('#tableAcessorio')[0], $('#tableAcessorioItens')[0], elements);
	}
}


function carregaComboModelo(marcaId) {
	document.getElementById("gpMarcaId").value=marcaId;
	document.getElementById("bindBtnModeloVeiculo").click();
}
