function createCounter(horas, minutos, segundos, elemento,funcao) {
	var _horas = horas;
	var _minutos = minutos;
	var _segundos = segundos;
	return {
		"counter" : function() {
			if (_segundos == 0) {
				if (_minutos == 0) {
					if (_horas > 0) {
						_horas -= 1;
						_minutos = 59;
						_segundos = 59;
					}
				} else {
					_minutos -= 1;
					_segundos = 59;
				}
			}
			else
				_segundos -= 1;
			$("#" + elemento)
			.find("#horas").text(_horas).end()
			.find("#minutos").text(_minutos).end()
			.find("#segundos").text(_segundos);
			if(_minutos == 0 && _segundos == 0){
				_horas = horas;
				_minutos = minutos;
				_segundos = segundos;
				funcao();
			}
		},
		"reset" : function() {
			_horas = horas;
			_minutos = minutos;
			_segundos = segundos;
		},
	};
}
var atualizarGrids = function(){
	submitFormAjaxAllArgs('#formEdit', getContextApp()+'/processarIntegracao/atualizarSituacaoLotesImportacao.action', null, null, null, null, 
			function(response){
				$('#loteImportacaoList').html(response);
			}
	);
};

function pesquisarLotes(){
	submitFormAjaxAllArgs('#formEdit', getContextApp()+'/processarIntegracao/atualizarSituacaoLotesImportacao.action', null, null, null, null, 
			function(response){
				$('#loteImportacaoList').html(response);
			}
	);
}

function imporarEdiImportacaoAnexo(){
	$('#tipoArquivoId').html('');
	if($("#arquivoAnexo").val() != ""){
		$('#tipoArquivoId').append('<input name="tipoArquivo" value="0">');
	}
	if($("#arquivoAnexo2").val() != ""){
		$('#tipoArquivoId').append('<input name="tipoArquivo" value="1">');
	}
	submitFormAjaxAllArgs('#formEdit', getContextApp()+'/processarIntegracao/imporarEdiImportacaoAnexo.action', null, null, null, null, 
			function(response){
				$('#loteImportacaoList').html(response);
			}
	);
}

function abrirModal(id){
	$("#modalLancamentoId").val(id);
	var left = (document.getElementById("formEdit").offsetWidth / 2) - ($('#divModalLinkProposta').width() / 2);
	$('#divModalLinkProposta').modal({onOpen: openModalLinkProposta, close: false});
	var top = (document.getElementById("modalOverlay").offsetHeight / 2) - (400/ 2);
	$('#modalContainer').css({'top':top,'margin-left':left});
	$("#loadProgressModal").css({'display':''});
	submitFormAjaxAllArgs('#formLinkProposta', getContextApp()+'/borderoComissao/consultarBorderoLancamento.action', null, null, null, null, 
	    function(response){
			$('#divLinkProposta').html($(response).find("#divLinkProposta").html());
			$("#loadProgressModal").css({'display':'none'});
		}
	);
}
function openModalLinkProposta(dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
}