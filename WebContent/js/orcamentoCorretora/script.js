var area1, area2;
function abrirDivNovaCobertura(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovaCobertura').width() / 2);
	$('#divNovaCobertura').modal({onOpen: openModalNovaCobertura, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (125 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left,'width':480});
	$("#paramCoberturaCorretoraId").val($("#corretoraId").val());
	$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
}
function openModalNovaCobertura (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}
function abrirDivNovoServico(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovoServico').width() / 2);
	$('#divNovoServico').modal({onOpen: openModalNovoServico, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (125 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left, 'width':317});
	$("#paramServicoCorretoraId").val($("#corretoraId").val());
}
function openModalNovoServico(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}
function abrirDivNovaSeguradora(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovaSeguradora').width() / 2);
	$('#divNovaSeguradora').modal({onOpen: openModalNovaSeguradora, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (125 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left, 'width':400});
	$("#paramSeguradoraCorretoraId").val($("#corretoraId").val());
}
function openModalNovaSeguradora(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}
function abrirDivNovoTemplateEmail(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovoTemplateEmail').width() / 2);
	$('#divNovoTemplateEmail').modal({onOpen: openModalNovoTemplateEmail, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (380 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left, 'width':550});
	$("#paramTemplateMensagemCorretoraId").val($("#corretoraId").val());
}
function openModalNovoTemplateEmail(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	toggleArea1();
}
function abrirDivNovoTemplateSms(){
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divNovoTemplateSms').width() / 2);
	$('#divNovoTemplateSms').modal({onOpen: openModalNovoTemplateSms, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (330 / 2);
	$('#modalContainer').css({'top':top,'margin-left':left, 'width':400});
	$("#paramTemplateMensagemSmsCorretoraId").val($("#corretoraId").val());
}
function openModalNovoTemplateSms(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	toggleArea1();
}

function closeModal(){
	$('#closeDiv').click();
}

function closeModalModelo(){
	area1.removeInstance('editor');
	area1 = null;
	$('#closeDiv').click();
}

function inserirCoberturas(){
	submitFormAjaxAllArgs('#formCobertura', getContextApp()+'/orcamentoCorretora/inserirCoberturaIseg.action', null, null, null, null, 
			  function(response){
				  $('#listaDeCoberturas').html(response);
			  });
}
function inserirServicos(){
	submitFormAjaxAllArgs('#formServico', getContextApp()+'/orcamentoCorretora/inserirServicoIseg.action', null, null, null, null, 
			  function(response){
				  $('#listaDeServicos').html(response);
			  });
}
function inserirSeguradoras(){
	submitFormAjaxAllArgs('#formSeguradora', getContextApp()+'/orcamentoCorretora/inserirSeguradorasPreferenciais.action', null, null, null, null, 
			  function(response){
				  $('#listaDeSeguradoras').html(response);
			  });
}
function inserirTemplateEmail(){
	$("#editor").val(nicEditors.findEditor('editor').getContent());
	submitFormAjaxAllArgs('#formTemplateEmail', getContextApp()+'/orcamentoCorretora/inserirTemplateEmail.action', null, null, null, null, 
			  function(response){
				  $('#listaTemplateEmail').html(response);
			  });
}
function inserirTemplateSms(){
	submitFormAjaxAllArgs('#formTemplateSms', getContextApp()+'/orcamentoCorretora/inserirTemplateSms.action', null, null, null, null, 
			function(response){
		$('#listaTemplateSms').html(response);
	});
}
function excluirCoberturas(id){
	$("#paramCoberturaCorretoraId").val($("#corretoraId").val());
	$("#corretoraCoberturasIsegId").val(id);
	submitFormAjaxAllArgs('#formCobertura', getContextApp()+'/orcamentoCorretora/excluirCoberturaIseg.action', null, null, null, null, 
			  function(response){
				  $('#listaDeCoberturas').html(response);
			  });
}

function excluirServicos(id){
	$("#paramServicoCorretoraId").val($("#corretoraId").val());
	$("#corretoraServicosIsegId").val(id);
	submitFormAjaxAllArgs('#formServico', getContextApp()+'/orcamentoCorretora/excluirServicoIseg.action', null, null, null, null, 
			  function(response){
				  $('#listaDeServicos').html(response);
			  });
}
function excluirSeguradoras(id){
	$("#paramSeguradoraCorretoraId").val($("#corretoraId").val());
	$("#seguradorasPreferenciaisId").val(id);
	submitFormAjaxAllArgs('#formSeguradora', getContextApp()+'/orcamentoCorretora/excluirSeguradorasPreferenciais.action', null, null, null, null, 
			  function(response){
				  $('#listaDeSeguradoras').html(response);
			  });
}
function excluirTemplateEmail(id){
	$("#templateEmailId").val(id);
	$("#paramTemplateMensagemCorretoraId").val($("#corretoraId").val());
	submitFormAjaxAllArgs('#formTemplateEmail', getContextApp()+'/orcamentoCorretora/excluirTemplateEmail.action', null, null, null, null, 
			  function(response){
				  $('#listaTemplateEmail').html(response);
			  });
}
function excluirTemplateSms(id){
	$("#templateSmsId").val(id);
	$("#paramTemplateMensagemSmsCorretoraId").val($("#corretoraId").val());
	submitFormAjaxAllArgs('#formTemplateSms', getContextApp()+'/orcamentoCorretora/excluirTemplateSms.action', null, null, null, null, 
			function(response){
				$('#listaTemplateSms').html(response);
			});
}

function editarCoberturas(id){
	$("#paramCoberturaCorretoraId").val($("#corretoraId").val());
	$("#corretoraCoberturasIsegId").val(id);
	submitFormAjaxAllArgs('#formCobertura', getContextApp()+'/orcamentoCorretora/editarCoberturaIseg.action', null, null, null, null, 
			  function(response){
					$("#formCobertura").html($(response).find("#formCobertura").html());
					abrirDivNovaCobertura();
	});
}

function editarSeguradoras(id){
	$("#paramSeguradoraCorretoraId").val($("#corretoraId").val());
	$("#seguradorasPreferenciaisId").val(id);
	submitFormAjaxAllArgs('#formSeguradora', getContextApp()+'/orcamentoCorretora/editarSeguradora.action', null, null, null, null, 
			function(response){
				$("#formSeguradora").html($(response).find("#formSeguradora").html());
				abrirDivNovaSeguradora();
	});
}

function editarTemplateEmail(id){
	$("#paramTemplateMensagemCorretoraId").val($("#corretoraId").val());
	$("#templateEmailId").val(id);
	submitFormAjaxAllArgs('#formTemplateEmail', getContextApp()+'/orcamentoCorretora/editarTemplateEmail.action', null, null, null, null, 
			function(response){
		$("#formTemplateEmail").html($(response).find("#formTemplateEmail").html());
		abrirDivNovoTemplateEmail();
	});
}

function editarTemplateSms(id){
	$("#Seguradora").val($("#corretoraId").val());
	$("#templateSmsId").val(id);
	submitFormAjaxAllArgs('#formTemplateSms', getContextApp()+'/orcamentoCorretora/editarTemplateSms.action', null, null, null, null, 
			function(response){
		$("#formTemplateSms").html($(response).find("#formTemplateSms").html());
		abrirDivNovoTemplateSms();
	});
}

function toggleArea1() {
	if(!area1) {
		area1 = new nicEditor({fullPanel : true}).panelInstance('editor',{hasPanel : true});
	} else {
		area1.removeInstance('editor');
		area1 = null;
	}
}

function resetForm($form) {
    $form.find('input:text, input:password, input:file, select, textarea').val('');
    $form.find('input:radio, input:checkbox')
         .removeAttr('checked').removeAttr('selected');
    $form.find('#select-to').html("");
}