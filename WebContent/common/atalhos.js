function editarCliente(){
	var clienteId = $('#clienteId').val(); 
	if(clienteId != ''){
		openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId, 'clienteEdicao', '750', '500', 'resizable=yes');
	}else{
		alert('Este cliente não possui registro no sistema!');
	}
}
function editarProdutor(id){
	if(id != ''){
		openWin(contextApp+'/produtor/editar.action?produtor.id='+id, 'produtorEdicao', '750', '500', 'resizable=yes');
	}else{
		openWin(contextApp+'/produtor/displayList.action', 'produtorLista', '750', '500', 'resizable=yes');
	}
}
