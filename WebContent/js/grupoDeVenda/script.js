/************************************************************/
//Description: Project iseg
//Company....: Atlas
//Version....: 0.1
//Last change: 4/26/2008
/************************************************************/

function addProdutor(){

	var elements = new Array(3);
	elements[0] = document.getElementById('produtorNome');
	elements[1] = document.getElementById('tipoComissao');
	elements[2] = document.getElementById('comissao');

	if (elements[1].value==''){
		alert('Informe o tipo de repasse!');
		elements[1].focus();
	}else
		addRow(document.getElementById('tableProdutor'), document.getElementById('tableProdutorItens'), elements);
}

function produtorAlreadyAdd(){
	var element = document.getElementById("produtorNome");
	var name = element.value; 
	var tableItens = document.getElementById("tableProdutorItens");

	if(tableItens.innerHTML.match(name)){
		alert("Produtor já adicionado!");
		return true;
	}
	return false;
}

/************************************************************/
// Atlas, 2008
/************************************************************/