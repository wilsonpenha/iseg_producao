<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	try {
%>

<div id="repasseComissao" style="display: none; z-index: 1000;">
<form id="formRepasseComissao" name="formRepasseComissao">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<table style="width: 723px;" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050">
			<span id="divRepasseTitulo" style="color: #FFFFFF; font-size: 8pt; font-weight: bold; height: 26px !important; padding: 0 4px; text-align: center; white-space: nowrap;">
				Repasse de Comissões/Agenciamento 
			</span>
			</td>
		</tr>
	</table>

	<s:textfield theme="simple" cssStyle="display:none;" id="paramRepassePropostaId" name="proposta.id" />
	<s:textfield theme="simple" cssStyle="display:none;" id="paramParcelaSelecionada" name="parcelaSelecionada" />
	<s:textfield theme="simple" cssStyle="display:none;" id="paramParcelaProposta" name="parcelasProposta.id" />
	<s:textfield theme="simple" cssStyle="display:none;" id="paramListaIndex" name="listIndex" />
	<div style="border: solid 1px #505050; padding-left: 5px;padding-right: 17px;">
	
		<div id="divRepasse">
		</div>
		<div>
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="left">
				<a href="#" class="button" onclick="recarregarParcelas();fechaFormRepasse();$('#closeDiv').click();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				<tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Fechar</td>
					<td class="wButton_right" />
				</tr>
				</table>
				</a>
			</td>
			<td align="left">
				<a href="#" class="button" onclick="salvarRepasse();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				<tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Salvar</td>
					<td class="wButton_right" />
				</tr>
				</table>
				</a>
			</td>
		</tr>
		</table>
		</div>
	</div>
</form>
</div>

<script>

function salvarRepasse(){
	if (confirm("Confirma novos dados de repasse?")){
		submitFormAjax('#formRepasseComissao', getContextApp()+'/propostaEmpresarial/salvarRepasse.action', '#divRepasseComissao', '#saveProgress');
	}
}

function alterarGrupoDeVendaSemSalvar(){
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpGrupoDeVendaId").val($("#comissoesGrupoDeVendaId").val());
	$("#gpParcelaSelecionadaId").val($("#paramParcelaProposta").val());
	$("#gpDemaisParcelas").val($("#demaisParcelas").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaEmpresarial/alterarGrupoDeVendaSemSalvar.action', '#divRepasseComissao', '#saveProgress');
}

function alterarGrupoDeVendaAgenciamentoSelecionadaSemSalvar(){
	$("#gpPropostaId").val($("#propostaId").val());
	$("#gpGrupoDeVendaId").val($("#agenciamentoGrupoDeVendaId").val());
	$("#gpAgenciamentoId").val($("#agenciamentoId").val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaEmpresarial/alterarGrupoVendaAgenciamentoSemSalvar.action', '#divAgenciamentoPagar', '#saveProgress');
}

function comissionadoAlreadyAdd(nome){
	var name = nome; 
	var tableItens = document.getElementById("tableComissionadosRepasse");

	if ($("#comissionadoPropostaTipoComissao").val()==''){
		alert('Informe o tipo de repasse!');
		$("#comissionadoPropostaTipoComissao").focus();
		return true;
	}
	
	if ($("#comissionadoPropostaPessoaNome").val()=='' || $("#comissionadoPropostaPessoaId").val() == ''){
		alert('Informe o Produtor!');
		$("#comissionadoPropostaPessoaNome").focus();
		return true;
	}
	
	if(tableItens.innerHTML.match(name.toUpperCase())){
		alert("O produtor "+nome+", já foi adicionado como comissionado deste repasse!");
		$("#comissionadoPropostaPessoaNome").val("");
		$("#comissionadoPropostaPessoaId").val("")
		return true;
	}

	return false;
}

function comissionadoAgenciamentoAlreadyAdd(nome){
	var name = nome; 
	var tableItens = document.getElementById("tableComissionadoAgenciamento");

	if ($("#comissionadoAgenciamentoTipoComissao").val()==''){
		alert('Informe o tipo de repasse!');
		$("#comissionadoAgenciamentoTipoComissao").focus();
		return true;
	}
	
	if ($("#comissionadoAgenciamentoPessoaNome").val()=='' || $("#comissionadoAgenciamentoPessoaId").val() == ''){
		alert('Informe o Produtor!');
		$("#comissionadoAgenciamentoPessoaNome").focus();
		return true;
	}
	
	if(tableItens.innerHTML.match(name.toUpperCase())){
		alert("O produtor "+nome+", já foi adicionado como comissionado deste agenciamento!");
		$("#comissionadoAgenciamentoPessoaNome").val("");
		$("#comissionadoAgenciamentoPessoaId").val("")
		return true;
	}

	return false;
}

function inserirComissionadoSemSalvar(){
	if(validaComissionadoComissao()){
		$("#comPropId").val($('#comissionadoPropostaId').val());
		$("#comPropPropostaId").val($("#propostaId").val());
		$("#comPropPessoaId").val($("#comissionadoPropostaPessoaId").val());
		$("#comPropComissionadoParcelaId").val($("#paramParcelaProposta").val());
		$("#comPropComissao").val($("#comissionadoPropostaComissao").val());
		$("#comPropTipoComissao").val($("#comissionadoPropostaTipoComissao").val());
		$("#comPropVlrComissao").val($("#comissionadoPropostaVlrComissao").val());
		$("#comPropComissionadoPropostaCount").val($("#comissionadoPropostaCount").val());
		submitFormAjaxAllArgs('#formComissionados', getContextApp()+'/propostaEmpresarial/inserirComissionadoSemSalvar.action', null, null, null, null, function(response){$('#tableComissionadosRepasse tbody').append(response);});

		$('#comissionadoPropostaPessoaId').val('');
		$('#comissionadoPropostaPessoaNome').val('');
		$("#comissionadoPropostaComissao").val('');
		$("#comissionadoPropostaTipoComissao").val('');
	}
}

function inserirComissionadoAgenciamentoSemSalvar(){
	if(validaComissionadoAgenciamento()){
		$("#comPropAgenciadorId").val($('#comissionadoAgenciamentoId').val());
		$("#comPropAgenciadorAgenciamentoId").val($('#agenciamentoId').val());
		$("#comPropAgenciadorPropostaId").val($("#propostaId").val());
		$("#comPropAgenciadorPessoaId").val($("#comissionadoAgenciamentoPessoaId").val());
		$("#comPropAgenciadorComissao").val($("#comissionadoAgenciamentoComissao").val());
		$("#comPropAgenciadorTipoComissao").val($("#comissionadoAgenciamentoTipoComissao").val());
		$("#comPropAgenciadorVlrComissao").val($("#comissionadoAgenciamentoVlrComissao").val());
		$("#comPropComissionadoAgenciamentoCount").val($("#comissionadoAgenciamentoCount").val());
		submitFormAjaxAllArgs('#formComissionadosAgenciamento', getContextApp()+'/propostaEmpresarial/inserirComissionadoAgenciamentoSemSalvar.action', null, null, null, null, function(response){$('#tableComissionadoAgenciamento tbody').append(response);});
		$('#comissionadoAgenciamentoPessoaId').val('');
		$('#comissionadoAgenciamentoPessoaNome').val('');
		$("#comissionadoAgenciamentoPropostaComissao").val('');
		$("#comissionadoAgenciamentoPropostaTipoComissao").val('');
	}
}

function abrirDivRepasse(parcelaSelecionada, parcelasPropostaId,listIndex){
	$('#paramListaIndex').val(listIndex);

	$('#paramParcelaSelecionada').val(parcelaSelecionada);
	$('#paramParcelaProposta').val(parcelasPropostaId);
	$("#paramRepassePropostaId").val($('#propostaId').val());
	$('#divRepasseTitulo')[0].innerHTML = 'Repasse de Comissões/Agenciamento - Referência: '+parcelaSelecionada.substring(3);		
	submitFormAjax('#formRepasseComissao', getContextApp()+'/propostaEmpresarial/repassePorParcela.action', '#divRepasse', '#loadProgress');
	$('#repasseComissao').modal({onOpen: openModalRepasse, close: false});
}

function recarregarParcelas(){
	$("#gpPropostaId").val($('#propostaId').val());
	submitFormAjax('#formLookup', getContextApp()+'/propostaEmpresarial/carregarParcelas.action', '#divParcelas', '#loadProgress');
	$('#repasseComissao').modal({onOpen: openModalRepasse, close: false});
}

function openModalRepasse (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	
	setTimeout(function(){
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	},2000);
}

function abrirFormRepasse(){
	document.getElementById('btnf3').disabled=true;
	document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	document.getElementById('btnf7').disabled=true;
	document.getElementById('btnf8').disabled=true;
	document.getElementById('btnf11').disabled=true;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf15');"};

}

function fechaFormRepasse(){
	document.getElementById('btnf3').disabled=false;
	document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf14');"};

}

</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>