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

function showCount(){
	if (!isNaN(jQuery('#totalRegistros')[0]))
		jQuery('#bookmark')[0].innerHTML = '0-0/0';
	else
		jQuery('#bookmark')[0].innerHTML = jQuery('#totalRegistros')[0].value;
}

function openWindowPessoa(){
	var url = '';
	if($('#pfRG')[0] != null ){
		url = contextApp+'/pessoaFisica/editar.action?pessoaFisica.id='+$('#clienteId')[0].value;
	}else if($('#pjRazaoSocial')[0] != null){
		url = contextApp+'/pessoaJuridica/editar.action?pessoaJuridica.id='+$('#clienteId')[0].value;
	}else{
		url = contextApp+'/pessoaJuridica/displayList.action';
	}
	if(url != ''){
		openWin(url, 'clienteEdicao', '750', '550', 'resizable=yes');
	}
}