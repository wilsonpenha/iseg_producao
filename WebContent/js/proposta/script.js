
function geraParcelas(condPagto){
	$("#gpPropostaId")[0].value = $("#id")[0].value;
	$("#gpCondicaoPagamentoId")[0].value = condPagto;
	$("#gpDataVencim1aParcela")[0].value = $("#dataVencim1aParcela")[0].value;
	$("#gpValor1aParcela")[0].value = $("#valor1aParcela")[0].value;
	$("#gpPremioLiquido")[0].value = $("#premioLiquido")[0].value;
	$("#bindBtnParcelas")[0].click();
}

function carregaParcelas(){
	$("#gpPropostaId")[0].value=$("#id")[0].value;
	$("#gpCondicaoPagamentoId")[0].value = $("#condicaoPagamentoId")[0].value;
	$("#gpDataVencim1aParcela")[0].value = $("#dataVencim1aParcela")[0].value;
	$("#gpValor1aParcela")[0].value = $("#valor1aParcela")[0].value;
	$("#gpPremioLiquido")[0].value = $("#premioLiquido")[0].value;
	$("#bindBtnParcelas")[0].click();
}

function carregaEndereco(){
	$("#gpPessoaId")[0].value=$("#clienteId")[0].value;
	$("#bindBtnDadosClientes")[0].click();
}

function carregaItensSegurados(){
	$("#gpPropostaId")[0].value=$("#id")[0].value;
	$("#bindBtnItensSegurados")[0].click();
}

function apagaDivDadosCliente(){
	$('#divDadosCliente').html('');
}

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

function buildReport(url){
	frmLOV = window.open(url , "winReport", "left=0,top=0,scrollbars=yes,resizable=yes,width=800,height=600");
	frmLOV.focus();
	if (frmLOV.opener == null) {
		frmLOV.opener = self;
	}
}

function calcularPremioLiquido(){
	var sizeDecimal = 2;
	var premioLiquido = Number($('#premioTotal')[0].value.replace(/\./g,'').replace(/\,/g,'.'))-
						Number($('#custoApolice')[0].value.replace(/\./g,'').replace(/\,/g,'.'))-
						Number($('#desconto')[0].value.replace(/\./g,'').replace(/\,/g,'.'))-
						Number($('#iof')[0].value.replace(/\./g,'').replace(/\,/g,'.'))+
						Number($('#adicional')[0].value.replace(/\./g,'').replace(/\,/g,'.'));

	var numberValue = Math.round(premioLiquido*Math.pow(10,sizeDecimal))/Math.pow(10,sizeDecimal);
	applyFormatToNumber($('#premioLiquido'), numberValue, sizeDecimal);
}

function openWindowCliente(){
	var url = '';
	if($('#clienteNome')[0].value != '' && $('#clienteId')[0].value != ''){
		if($('#pfRG')[0] != null){
			url = contextApp+'/pessoaFisica/editar.action?pessoaFisica.id='+$('#clienteId')[0].value;
		}else if($('#pjRazaoSocial')[0] != null){
			url = contextApp+'/pessoaJuridica/editar.action?pessoaJuridica.id='+$('#clienteId')[0].value;
		}
	}
	if(url == ''){
		url = contextApp+'/pessoa/displayList.action';
	}
	openWin(url, 'clienteEdicao', '750', '500', 'resizable=yes');
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

function validaProcessarProposta(){
	clearErrorMessages();
	var blnPropostaOK = true;
	if($('#blnComissoesGeradas')[0].value == 'false'){
		addError(null, 'A proposta não pode ser processada enquanto o Rateio das Comissões não for realizado.');
		blnPropostaOK = false;
	}
	if($('#blnPossuiItemSegurado')[0].value == 'false'){
		addError(null, 'A proposta não pode ser processada, pois não foi incluso nenhum Item Segurado.');
		blnPropostaOK = false;
	}
	return blnPropostaOK;
}

function desabilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',true);
	$('#'+idDiv+' input[type=text]').addClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',true);
	$('#'+idDiv+' select').addClass('readonly');
}

function habilitarCamposTela(idDiv){
	$('#'+idDiv+' input[type=text]').attr('disabled',false);
	$('#'+idDiv+' input[type=text]').removeClass('readonly');
	
	$('#'+idDiv+' select').attr('disabled',false);
	$('#'+idDiv+' select').removeClass('readonly');
}

function habilitaDesabilitaCamposBanco(obj){
	if(obj.checked == true){
		habilitarCamposTela(obj.parentNode.parentNode.id);
	}else{
		desabilitarCamposTela(obj.parentNode.parentNode.id);
	}
}