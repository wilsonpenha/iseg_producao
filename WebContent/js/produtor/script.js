/**************/
/*  Clientes  */
/**************/
function carregaPessoaFisica() {

	$("#lkpPessoaFisicaId").val($("#pessoaFisicaId").val());
	submitFormAjax('#formLookup', getContextApp()+'/produtor/getDadosPessoaFisica.action', '#divDadosProdutor');
	setTimeout(function(){
		$("#dataNascimentoId").focus();
	}
	,200);
}

function carregaPessoaJuridica() {

	$("#lkpPessoaJuridicaId").val($("#pessoaJuridicaId").val());
	submitFormAjax('#formLookup', getContextApp()+'/produtor/getDadosPessoaJuridica.action', '#divDadosProdutor');
	setTimeout(function(){
		$("#razaoSocial").focus();
	}
	,200);
}

