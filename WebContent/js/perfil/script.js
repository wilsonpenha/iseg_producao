/************************************************************/
//Description: Project iseg
//Company....: Atlas
//Version....: 0.1
//Last change: 4/26/2008
/************************************************************/
ArrNomeCampo     = [];
ArrLabelCampo    = [];
ArrTipoCampo     = [];
ArrOperacaoCampo = [];

function removePergunta(id){
	$("#ppPerfilId").val($("#perfilId").val());
	$("#ppPerguntasPerfilId").val(id);
	submitFormAjax('#formPerguntas', getContextApp()+'/perfil/excluirPergunta.action', '#divListaPerguntas');
	$("#pergunta").focus();
}

function editarPergunta(id){
	$("#ppPerguntasPerfilId").val(id);
	$("#pergunta").focus();
	submitFormAjax('#formPerguntas', getContextApp()+'/perfil/editarPergunta.action', '#divDadosPergunta');
}

function inserirPergunta(){
	if (isEmpty("#pergunta") || isEmpty("#ordem")){
		alert("É necessario informar a pergunta e a ordem!");
		return;
	}
	$("#ppPerfilId").val($("#perfilId").val());
	$("#ppPerguntasPerfilId").val($("#perguntasPerfilId").val());
	$("#ppPergunta").val($("#pergunta").val());
	$("#ppOrdem").val($("#ordem").val());
	$("#ppTipoResposta").val($("#tipoResposta").val());
	$("#ppAtiva").val($("#ativa").val());
	submitFormAjax('#formPerguntas', getContextApp()+'/perfil/inserirPergunta.action', '#divListaPerguntas');
	$("#perguntasPerfilId").val('');
	$("#pergunta").val('');
	$("#ordem").val('');
	$("#tipoResposta").val('');
	$("#ativa").val('');
}



/************************************************************/
// Atlas, 2008
/************************************************************/
