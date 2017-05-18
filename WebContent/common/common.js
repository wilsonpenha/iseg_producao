﻿sortitems = 1;  // Automatically sort items within lists? (1 or 0)
netscape = false;
navegador = navigator.appName;
versao = parseInt(navigator.appVersion);
var formNavigateAlterado = false;
var contextApp = "/iseg";
var divArray = [];

function defineContext(contextStr){
	contextApp = contextStr.substring(0,contextStr.length-1);
}

function getContextApp(){
	return contextApp;
}

function confirmDeleteDialog(){
	return confirm('Confirma a exclusão do registro?'); 
}

function elemento_no_formulario(elemento) {
	var fim   = document.forms[0].elements.length;
	var volta = -1;
	for (var i=0; i < fim; i++) {
		if (document.forms[0].elements[i].name == elemento) {
			volta = i;
			break;
		}
	}
	return volta;
}

function elemento_no_formulario2(elemento,formulario) {
	var volta = -1;
	var fim= formulario.elements.length;
	for (var i=0; i < fim; i++) {
		if (formulario.elements[i].name == elemento) {
			volta = i;
			break;
		}
	}
	return volta;
}

//-----------------------------------------------------------------------------------------
// Retorna a quantidade de itens selecionados em uma array checkbox.
//-----------------------------------------------------------------------------------------
function VerificaQtosCamposChecados(checkbox){
	var campoChecado = 0;
	var qtde = checkbox.length;

	if (qtde > 0){
		qtde = checkbox.length;
	}else{
		if(checkbox.checked){
			campoChecado += 1;
			return campoChecado;
		}
	}

	for (var i = 0; i < qtde; i++) {
		if (checkbox[i].checked == true){
			campoChecado += 1;
		}
	}
	return campoChecado;
}

//-----------------------------------------------------------------------------------------
function telaAnterior(){
  history.go(-1);
}

// rotina para refazer o body corpo

var corpo = null;
var navegador = null;
var central = null;
var tabGuia = null;
var divBody = null;
var stlCorpo= null;
var stlNavegador= null;
var stlCentral= null;
var stlTabGuia= null;
var stlDivBody= null;
var divIndex = null;
var stlDivIndex= null;
var windowHeight = null;
var windowWidth = null;
var wrapped = false;

function toggleDebug(debugging) {
	if (debugging.value == '1')
		xbDEBUG.on = true;
	else
		xbDEBUG.on = false;
}

var oldBGColor = null;

function setColorOn(linha){
	var vLinha = xbGetElementById(linha);
	var stlLinha = new xbStyle(vLinha);
	oldBGColor = stlLinha.getBackgroundColor();
	stlLinha.setBackgroundColor('#7DB957');
}

function setColorOff(linha){
	var vLinha = xbGetElementById(linha);
	var stlLinha = new xbStyle(vLinha);
	stlLinha.setBackgroundColor(oldBGColor);
}

// Função utilizada para visualizar ou esconder uma div

function mostraDiv(div){
	var divFrame2 = xbGetElementById(div);
	var stlDivFrame2 = new xbStyle(divFrame2);
	if (stlDivFrame2.getVisibility()=='hidden' || stlDivFrame2.getVisibility()=='inherit'){
		stlDivFrame2.setVisibility('visible');
	}
}

function escodeDiv(div){
	var divFrame2 = xbGetElementById(div);
	var stlDivFrame2 = new xbStyle(divFrame2);
	if (stlDivFrame2.getVisibility()!='hidden' && stlDivFrame2.getVisibility()!='inherit'){
		stlDivFrame2.setVisibility('hidden');
	}
}

function retornaSelectList(campoDesc, campoChave, valorChave, formRetorno) {
	 alert(campoDesc);
	 alert(valorChave.substring(valorChave.indexOf('|')+1));
	 alert(camposChave.substring(0,camposChave.indexOf('|')));
	 alert(valorChave.substring(0,valorChave.indexOf('|')));
	 eval('opener.'+formRetorno.value+'.'+campoDesc+'.value = "'+ valorChave.substring(valorChave.indexOf("|")+1)+'"');
	 eval('opener.'+formRetorno.value+'.'+campoChave+'.value = "'+valorChave.substring(0,valorChave.indexOf("|"))+'"');
	 window.close();
}

function ConfirmaDisplayList(form, action) {
	if(action == 'editar'){
		if(VerificaQtosCamposChecados(form.id)==0){
			alert("Nenhum registro foi selecionado!");
			return false;
		}else if(VerificaQtosCamposChecados(form.id)>1){
			alert("Apenas um registro pode ser selecionado!");
			return false;
		}
	}else if(action == 'excluir'){
		if(VerificaQtosCamposChecados(form.id)==0){
			alert("Nenhum registro foi selecionado!");
			return false;
		}else{
			msg="Confirma a exclusão dos registros?";
			if (confirm(msg)){
				return true;
			} else {
				return false;
			}
		}
	}
	return true;
}

function searchElementByName(elementName){
	for(var i=0 ; i<document.forms.length ; i++){
		for(var j=0 ; j<document.forms[i].elements.length ; j++){
			if(document.forms[i].elements[j].name.match(elementName)){
				return document.forms[i].elements[j];
			}
		}
	}
	return null;
}

function insertIndex(string, index){
	var position = string.lastIndexOf("[]");
	if(position != -1){
		return string.substring(0,position+1)+index+string.substring(position+1);
	}
	return string;
}

function validateElement(inputText, table){
	//var regexEmptyBrackets = new RegExp("\\[\\]");
	//var regexNotEmptyBrackets = new RegExp("\\[\\d+\\]");
	var tableParent = inputText.parentNode;
	while(tableParent.tagName != "TABLE"){
		tableParent = tableParent.parentNode;
	}

	return tableParent == table ? true : false;
}

function addRow(table, tableItens, elements){

	// Define o índice do objeto que será adicionado.
	// Primeiro, verifica se foi definido um índice para a tabela de itens, caso tenha sido, pega o valor do elemento,
	// caso contrário, o índice será igual ao número de linhas da tabela de itens menos um (tableItens.rows.length-1),
	// pois desconsidera-se a primeira linha da tabela (header).
	var indexObject;
	if(document.getElementById(tableItens.id+'Index') != null){
		indexObject = Number(document.getElementById(tableItens.id+'Index').value)+1;
	}else{
		indexObject = tableItens.rows.length-1;
	}
	// Insere uma nova linha no final da tabela.
	var newRow = tableItens.insertRow(tableItens.rows.length);
	// Cria as células da linha.
	for(var i=0 ; i<elements.length ; i++){
		var newCell = newRow.insertCell(i);
		newCell.innerHTML = getValueToView(elements[i]);
	}
	// Cria a célula onde ficará a imagem para exclusão.
	var newCell = newRow.insertCell(elements.length);
	newCell.className = 'small_image';
	newCell.innerHTML = '<img alt="" style="cursor:pointer;" class="small_image" src="'+contextApp+'/common/web/images/delete.gif" onclick="removeRow('+tableItens.id+', this.parentNode.parentNode.rowIndex);"/>';
	// Cria os hiddens baseando nos campos da tabela e zera os campos.
	newCell.innerHTML += createHiddensAndCleanFields(table, indexObject);
	clearTableItens(table);
	// Atualiza o indice da Tabela de Itens
	if(document.getElementById(tableItens.id+'Index') != null){
		document.getElementById(tableItens.id+'Index').value = indexObject.toString();
	}
}

function removeRow(table, rowIndex){
	table.deleteRow(rowIndex);
}

function createHiddensAndCleanFields(table, indexObject){

	var innerHTML = '';
	var inputs = table.getElementsByTagName('input');

	for(var i=0 ; i<inputs.length ; i++){
		if(inputs[i].value != null && inputs[i].value != ''){

			if(inputs[i].type == 'text'){
				if(validateElement(inputs[i], table)){
					innerHTML += '<input type="hidden" name="'+insertIndex(inputs[i].name, indexObject)+'" value="'+inputs[i].value+'">';
				}
			}else if(inputs[i].type == 'hidden'){
				innerHTML += '<input type="hidden" name="'+insertIndex(inputs[i].name, indexObject)+'" value="'+inputs[i].value+'">';
			}else if (inputs[i].type == 'radio' || inputs[i].type == 'checkbox'){
				//TODO
			}
			inputs[i].value = '';
		}
	}

	var selects = table.getElementsByTagName('select');

	for(var i=0 ; i<selects.length ; i++){
		if(selects[i].value != null && selects[i].value != ''){
			if(validateElement(selects[i], table)){
				innerHTML += '<input type="hidden" name="'+insertIndex(selects[i].name, indexObject)+'" value="'+selects[i].value+'">';
			}
		}
		selects[i].selectedIndex = 0;
	}
	
	return innerHTML;
}

function clearTableItens(table){
	if(!!table){
		jQuery(table).find('input, select').each(function(){this.value="";});
	}
}

function getValueToView(element){
	if(element.tagName == 'INPUT'){
		return element.value;
	}else if (element.tagName == 'SELECT'){
		return element.selectedIndex < 0 ? "" : element.options[element.selectedIndex].text;
	}
	return '';
}

function openWindow(theURL,winName,features) { //v2.0
	var w=window.open(theURL,winName,features);
	w.focus();
}

function openWin(theURL,winName,width,height,features) { //v2.0
	if(height == "*"){
		height = (screen.availHeight - 80)
	}
	if(width == "*") {
		width = (screen.availWidth - 30)
	}
	var newFeatures = "height=" + height +", innerHeight=" + height;
	newFeatures += ",width=" + width + ",innerWidth=" + width;
	if (window.screen) {
		var ah = (screen.availHeight - 30);
		var aw = (screen.availWidth - 10);
		var xc = (( aw - width) / 2);
		var yc = (( ah - height) / 2);
		newFeatures += ",left=" + xc + ",screenX=" + xc;
		newFeatures += ",top=" + yc + ",screenY=" + yc;
		newFeatures += "," + features;
	}
	var newWin = window.open(theURL,winName,newFeatures);
	newWin.focus();
}

function submitForm(form, action, dispatchOnSubmitEvent, target){
	if (action.indexOf('/salvar')>=0 || action.indexOf('/efetivarProposta')>=0 || action.indexOf('/excluir')>=0 || 
		action.indexOf('/endossoRenovacao')>=0 || action.indexOf('/efetivarBaixa')>=0)
   		formNavigateAlterado = false;

	form.action=action;
	if (target!=null){
		form.target = target;
	}
	if(dispatchOnSubmitEvent && document.getElementById('submitButton') != null){
		document.getElementById('submitButton').click();
	}else{
		form.submit();
	}
}

function checkNumberOrControlKey(event){
	var charCode = window.innerHeight ? event.which : event.keyCode;
	return isNumber(charCode) || isControlKey(charCode) ? true : false;
}

function isAlphaChar(charCode){
	return ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 231) ? true : false; 
}

function isSymbol(charCode){
	return ((charCode >= 33 && charCode <= 47) || (charCode >= 58 && charCode <= 64) || (charCode >= 91 && charCode <= 96) || (charCode >= 123 && charCode <= 126) || (charCode == 168) || (charCode == 180)) ? true : false;
}

function isNumber(charCode){
	return (charCode >= 48 && charCode <= 57)? true : false;
}

function isNumberByKeyCode(keyCode){
	return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105))? true : false;
}

function isControlKey(charCode){
	return (charCode == 0) ? true : false;
}

function removeDotsAndCommas(str){
	return str.replace(/\./g,'').replace(/\,/g,'');
}

function removeCommas(str){
	return str.replace(/\./g,'').replace(/\,/g,'.');
}

function charFromKeyCode(keyCode){
	if(isNumberByKeyCode(keyCode)){
		if(keyCode > 57){
			keyCode -= 48; 
		}
		return String.fromCharCode(keyCode);
	}
	return null;
}


function addYearAndSetField(date, amount, fieldToSet){

	if(date.length == 10){

		var splitDate = date.split("/");
		var ano = parseInt(splitDate[2])+amount;
		fieldToSet.value = splitDate[0]+"/"+splitDate[1]+"/"+ano.toString();
	}

}

function addMonthAndSetField(date, amount, fieldToSet){

	if(date.length == 10){

		var splitDate = date.split("/");
		var mes = parseInt(splitDate[1])+amount;
		var ano = parseInt(splitDate[2]);
		if (mes > 12){
			mes = 1;
			ano = ano + 1;
		}
		if (mes < 10){
			mes = "0"+mes.toString();
		}
		fieldToSet.value = splitDate[0]+"/"+mes.toString()+"/"+ano.toString();
	}

}

function setInicioETerminoVigenciaVidaEmpresarial(date, fieldToSet1,fieldToSet2){

	if(date.value.length == 10){

		var splitDate = date.value.split("/");
		var mes = splitDate[1];
		var ano = parseInt(splitDate[2]);
		var dia1 = "01";
		var dia2 = 0;

		if (mes=="04" || mes=="06" || mes=="09" || mes=="11"){
		    dia2 = "30";
		}else if (mes=="02"){
		    if ((ano % 4)==0)
		    	dia2 = "29";
		    else
		    	dia2 = "28";
		}else
			dia2 = "31";

		fieldToSet1.value = dia1+"/"+splitDate[1]+"/"+splitDate[2];
		fieldToSet2.value = dia2+"/"+splitDate[1]+"/"+splitDate[2];
	}

}

function changeValueHidden(idHidden, checkbox){
	if(checkbox.checked){
		document.getElementById(idHidden).value = 'Sim';
	}else{
		document.getElementById(idHidden).value = 'Nao';
	}
}

function invertVisibleElement(visibleElement, invisibleElement){
	visibleElement.style.display = 'none';
	invisibleElement.style.display = '';
}

function addCssClass(element, className){
	var cssClass = "";
	if(element.className != null){
		cssClass = element.className;
	}/*else if(element.class != null){
		cssClass = element.class;
	}
	element.class = cssClass+" "+className;*/
	element.className = cssClass+" "+className;
}

function removeCssClass(element, className){
	/*element.class = element.class.replace(className, "");*/
	element.className = element.className.replace(className, "");
}

function setValue(idElement, value){
	jQuery("#"+idElement)[0].value = value;
}

// Rever essa função depois!
function focusFirst() {
	var form = document.forms[0];
	var elem = $('input:visible', form).get(0);
	var select = $('select:visible', form).get(0);

	if (select && elem) {
		if (select.parentNode.offsetTop < elem.parentNode.offsetTop) {
			elem = select;
		}
	}
	var textarea = $('textarea:visible', form).get(0);
	if (textarea && elem) {
		if (textarea.parentNode.offsetTop < elem.parentNode.offsetTop) {
			elem = textarea;
		}
	}
	if (elem) {
		elem.focus();
	}
}

function checkMaxLength(element, maxLength) {
	if (element.value.length > maxLength){
		element.value = element.value.substring(0, maxLength);
		return false;
	}
	return true;
}

function isNotEmpty(element){
	if(element.value != null && element.value != ""){
		return true;
	}
	return false;
}

function execOnEnterPress(event, func) {
	if (func != null) {
		var charCode = window.innerHeight ? event.which : window.event.keyCode;
		if (charCode == 13) {
			eval(func);
			return false;
		}
	}
	return true;
}

function addFunctionOnEnterPress(func, except){
	var inputs = $('input:visible:enabled');
	for(var i=0 ; i<inputs.length ; i++){
		if(!except.match(inputs[i].id)){
			addEvent(inputs[i],'keyup',func);
		}
	}
	var selects = $('select:visible:enabled');
	for(var i=0 ; i<selects.length ; i++){
		if(!except.match(selects[i].id)){
			addEvent(selects[i],'keyup',func);
		}
	}
}

function showCount(){
	if (isNaN(jQuery('#totalRegistros')[0])) 
		jQuery('#bookmark')[0].innerHTML = '0-0/0';
	else
		jQuery('#bookmark')[0].innerHTML = jQuery('#totalRegistros')[0].value;
}

/*function showCount(){
	$('#bookmark')[0].innerHTML = $('#totalRegistros').val();
}*/

function isValidCep(field){
	if(field.value != '' && field.value.length != 9){
		field.value = '';
		alert("CEP inválido!");
		field.focus();
		setTimeout(function(){field.focus();},250);
	}
}


function addErrorText(errorText, div){
	var error = document.createTextNode(errorText);
	var br = document.createElement("br");
	var span = document.createElement("span");
	span.setAttribute("class", "errorMessage");
	span.setAttribute("className", "errorMessage"); //ie hack cause ie does not support setAttribute
	span.appendChild(error);
	span.appendChild(br);
	div.appendChild(span);
}

function confirma(msg) {
	  return confirm(msg);
	}


function focusFirst(context) {
	
	if(context == null){
		context = document.forms[0];
	}
	var elem = $('input:visible', context).get(0);
	var select = $('select:visible', context).get(0);

	if (select && elem) {
		if (select.parentNode.offsetTop < elem.parentNode.offsetTop) {
			elem = select;
		}else if (select.parentNode.offsetLeft < elem.parentNode.offsetLeft)
			elem = select;

	}
	var textarea = $('textarea:visible', context).get(0);
	if (textarea && elem) {
		if (textarea.parentNode.offsetTop < elem.parentNode.offsetTop) {
			elem = textarea;
		}
	}
	if (elem) {
		elem.focus();
	}
}

function getLastEnabledElement(context) {
	
	if(context == null){
		context = document.forms[0];
	}
	var elem = $('input:last:enabled', context).get(0);
	var select = $('select:last:enabled', context).get(0);

	if (select && elem) {
		if (select.parentNode.offsetTop > elem.parentNode.offsetTop) {
			elem = select;
		}
	}
	var textarea = $('textarea:last:enabled', context).get(0);
	if (textarea && elem) {
		if (textarea.parentNode.offsetTop > elem.parentNode.offsetTop) {
			elem = textarea;
		}
	}
	return elem;
}

function converte_numero(vlr) {

	if(vlr == null || vlr == ""){
		return 0;
	}	
	var valor = vlr.replace( ".", "" );
	valor = valor.replace( ".", "" );
	valor = valor.replace( ".", "" );
	valor = valor.replace( ",", "." );
	valor = parseFloat(valor);
	return valor;
}

function isEmpty(id){
	return ($(id).val() != null && $(id).val() != "") ? false : true; 
}

function validaCPF(element) {

	var isValid = true;
	var cpf = element.value;
	if(cpf == null || cpf == ""){return true;}

	cpf = cpf.replace(/\./g,'').replace(/\-/g,'');

	if (cpf.length != 11){
		isValid = false;
	}
	for (i = 0; i < 10; i ++){
		if (cpf=="11111111111" || cpf=="22222222222" || cpf=="33333333333" ||
			cpf=="44444444444" || cpf=="55555555555" || cpf=="66666666666" ||
			cpf=="77777777777" || cpf=="88888888888" || cpf=="99999999999" || cpf=="00000000000")
			isValid = false;
	}
	soma = 0;
	for (i=0; i < 9; i ++){
		soma += parseInt(cpf.charAt(i)) * (10 - i);
	}
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11){
		resto = 0;
	}
	if (resto != parseInt(cpf.charAt(9))){
		isValid = false;
	}
	soma = 0;
	for (i = 0; i < 10; i ++){
		soma += parseInt(cpf.charAt(i)) * (11 - i);
	}
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11){
		resto = 0;
	}
	if (resto != parseInt(cpf.charAt(10))){
		isValid = false;
	}
	if(!isValid){
		//$('#clienteCpf').focus();
		alert("CPF inválido!");
		element.value = '';
		setTimeout(function(){element.focus();},250);
		return false;	
	}
	return true;
}

function applyFormatToNumber(element, numberValue, sizeDecimal){
	if(Math.abs(numberValue) < Math.pow(10, sizeDecimal)){
		element.value = numberValue.toFixed(sizeDecimal).replace('.',',')
	}else{
		var splitValue = numberValue.toFixed(sizeDecimal).toString().split('.');
		var regex  = new RegExp('(-?[0-9]+)([0-9]{3})');

		while(regex.test(splitValue[0])) {
			splitValue[0] = splitValue[0].replace(regex, '$1' + '.' + '$2');
		}
		element.value = splitValue[0]+','+splitValue[1];
	}
}

function validaCnpj(element) {

	var isValid = true;
	var cnpj = element.value;
	if(cnpj == null || cnpj == ""){return true;}

	cnpj = cnpj.replace(/\./g,'').replace(/\-/g,'').replace('/','');

	if (cnpj.length != 14){
		alert("CNPJ inválido!");
		element.value="";
		//element.focus();
		setTimeout(function(){element.focus();},250);
		return false;
	}
	
	var dv="";
	var dv1=0;
	var dv2=0;
	var t=0;
	var sm1=0;
	var sm2=0;
	var peso=6;

	for (i=0;i<=11; i++){
		if(i>=4) {
			i==4 ? peso=9 : peso--;
		}else{
          peso--;
        }
		sm1+=cnpj.substring(i,i+1)*peso;
	}
	peso=7;
	for(i=0;i<=12; i++){
		if(i>=5) {
			i==5 ? peso=9 : peso-- ;
		}else{
			peso--;
		}
		sm2+=cnpj.substring(i,i+1)*peso;
	}

	t = 11 - sm1%11;
	t < 10 ? dv1=t : dv1=0;
	t = 11 - sm2%11;
	t < 10 ? dv2=t : dv2=0;

	if((cnpj.substring(12,13)==dv1)&&(cnpj.substring(13,14)==dv2)) {
		return true;
	}else{
		alert("CNPJ inválido!");
		element.value="";
		//element.focus();
		setTimeout(function(){element.focus();},250);
		return false;
	}
}

function clearForm(formId){
	$(formId+' input').val('');
	combos = $(formId+' select');
	for (var i=0; i < combos.size(); i++) {
		combos[i].selectedIndex = 0;
	}

}

function splitResultGetFirst(value){
	return value==null ? null : value.toString().split('#')[0].replace(/^\s+|\s+$/g,"");
}

function submitFormAjax(idForm, url, idTarget, pIndicator){
	var indicator = pIndicator;

	if (pIndicator ==null || pIndicator==""){
		indicator = '#loadProgress';
		pIndicator = true;
	}

	if (pIndicator)
	   $(indicator).show();

	var form = $(idForm);
	var target = idTarget == null ? null : $(idTarget);

	$.extend( jQuery.ajaxSettings, {contentType: "application/x-www-form-urlencoded; charset=UTF-8"} );

	if(!!form){
		$(form).ajaxSubmit({
			type: "POST",
			url: url,
			indicator: indicator,
			messageTarget: "#divMessages",
			target: target,
			error: function(response){
				$("#divMessages").html(response.responseText);
			},
			complete: function(responseText){
				$(indicator).hide();
			}
		});
	}

}

function submitFormAjaxAllArgs(idForm, url, idTarget, indicator, beforeSubmit, error, success){

	var form = $(idForm);
	var target = idTarget == null ? null : $(idTarget);

	if(error == null){
		error = function(response){$("#divMessages").html(response.responseText);}
	}
	if(success == null){
		success = function(response){}
	}
	if(indicator == null || indicator==""){
		indicator = '#pageloader';
	}
	$(indicator).show();

	$.extend( jQuery.ajaxSettings, {contentType: "application/x-www-form-urlencoded; charset=UTF-8"} );

	if(!!form){
		$(form).ajaxSubmit({
					type: "POST",
					url: url,
					indicator: indicator,
					messageTarget: "#divMessages",
					target: target,
					beforeSubmit: beforeSubmit,
					error: error,
					success: success,
					complete: function(responseText){$(indicator).hide();}
				});
	}
}

function dateDiffYears(element1, element2){
	var dateSplit1 = $(element1).val().split('/');
	var dateSplit2 = $(element2).val().split('/');

	if(dateSplit1.length != 3 || dateSplit2.length != 3){
		return;
	}

	// Calcula a diferença entre os anos, subtrai 1, pois não sabemos se completou um ano inteiro. 
	var years = dateSplit2[2]-dateSplit1[2]-1;
	// Verifica se o mês é menor. Se for ainda não completou 1 ano inteiro.
	if(dateSplit2[1] < dateSplit1[1]){
		return years;
	// Verifica se o mês é maior. Se for já completou 1 ano inteiro, soma 1 no ano e retorna.
	}else if(dateSplit2[1] > dateSplit1[1]){
		return years+1;
	}else{
		// Caso os meses sejam iguais.
		// Verifica se o dia é menor. Se for ainda não completou 1 ano inteiro.
		if(dateSplit2[0] < dateSplit1[0]){
			return years;
		// Se o dia for maior ou igual já completou 1 ano inteiro, soma 1 no ano e retorna.
		}else{
			return years+1;
		}
	}
}

function clone(element){
	var div = document.createElement("DIV");
	return $(div).append(element.cloneNode(false));
}

function copyField(original, form) {
	var file = original.cloneNode(true);
	original.parentNode.replaceChild(file, original);
	form.appendChild(original);
	form.appendChild(document.createElement('br'));
}

function carregaSubRamosProposta() {

	$("#gpRamoId").val($("#paramRamoId").val());
	submitFormAjax('#formLookup', getContextApp()+'/objlookup/getRamosBySubRamo.action', '#divRamos');
	setTimeout(function(){
		carregaSeguradoras()
	},250);
}
	// Carrega Seguradoras nos dialogo de criação, baseado no Ramo
function carregaSeguradoras() {

	if ($("#paramSubRamoId option").size()>1){
		$("#gpRamoId").val($("#paramSubRamoId").val());
		submitFormAjax('#formLookup', getContextApp()+'/objlookup/getSeguradorasByRamo.action', '#divSeguradoras');
	}else{
		$("#gpRamoId").val($("#paramRamoId").val());
		submitFormAjax('#formLookup', getContextApp()+'/objlookup/getSeguradorasByRamo.action', '#divSeguradoras');
	}

	$("#faturaSimNao").hide();
	setTimeout(function(){
		if ($("#oferecerPagtoComFatura").val()=='true'){
			$("#faturaSimNao").show();
		}
		if ($("#blnRenovacao").val()=='false'){
			if ($("#paramRamoId").val()==RAMO_AUTOMOVEL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").show();
				$("#pessoaJuridicaSemPerfil").show();
				$("#pessoaJuridica").hide();
				$('#pf').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_IMOVEL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").show();
				$("#pessoaJuridica").hide();
				$('#pf').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_VIDA_EMPRESARIAL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pj').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_VIDA_INDIVIDUAL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").hide();
				$('#pf').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_RESIDENCIAL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").show();
				$("#pessoaJuridica").hide();
				$('#pf').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_EMPRESARIAL){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pj').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_CONDOMINIO){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pj').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_RISCO_DIVERSOS){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pj').attr('checked',true);
			}else if ($("#paramSubRamoId").val()==RAMO_TRANSPORTES){
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pj').attr('checked',true);
			}else{
				$("#pessoaFisica").show();
				$("#pessoaJuridicaComPerfil").hide();
				$("#pessoaJuridicaSemPerfil").hide();
				$("#pessoaJuridica").show();
				$('#pf').attr('checked',true);
			}
		}
	},500);
	
	function showDivs(){
		$("#lancamento1").show();
		$("#lancamento2").hide();
		$('#bonus').attr('disabled',true);
		$('#valorBonus').attr('disabled',true);
		$('#valorComissao').attr('disabled',false);
		$('#nomeSegurado').attr('disabled',false);
	}

}

function carregarSubRamos(){
	$("#gpRamoId").val($("#subRamoId").val());
	submitFormAjax('#formLookup', getContextApp()+'/objlookup/getSubRamosByRamo.action', '#divRamos');
}

function criarNova(){

	var error = "";

	// Valida os dados selecionados.
	if($('#paramSeguradoraId').val() == ""){
		error = "Selecione uma Seguradora!";
		$('#paramSeguradoraId').focus();
	}else if($('#paramRamoId').val() == ""){
		error = "Selecione um Ramo!";
		$('#paramRamoId').focus();
	}
	
	if(error != ""){
		alert(error);
		return;
	}

	// Define os parametros a serem setados e o action a ser chamado.
    var actionName = '';
    if($('#paramTipo').val() == TP_PROP_COMUM || $('#paramTipo').val() == TP_PROP_RENOVACAO_EXTERNA){
    	$("#blnEndosso").val('false');
    	$("#blnRenovacao").val('false');
    	actionName = 'novo';
    }else if($('#paramTipo').val() == TP_PROP_RENOVACAO_PROPRIA){
    	$("#blnEndosso").val('false');
    	$("#blnRenovacao").val('true');
    	actionName = 'displayList';
    }
    submitForm(document.paramFormProposta, getContextApp()+'/proposta/'+actionName+'.action', false);
}

/**********************************************************/
/* Editar uma proposta no historico de endosso            */
/**********************************************************/
function editHistorico(){
    submitForm($('#formHistorico').get(0), getContextApp()+'/proposta/editar.action', false);
}


/***************/
/*             */
/***************/
function calculaPremioTotal(){
	var premioLiquido = $("#premioLiquido").val();
	var custoApolice = $("#custoApolice").val();
	var iof = $("#iof").val();
	var desconto = $("#desconto").val();

	premioLiquido = converte_numero(premioLiquido);
	custoApolice = converte_numero(custoApolice);
	desconto = converte_numero(desconto);
	iof = converte_numero(iof);

	$("#premioTotal").get(0).value = ((premioLiquido + custoApolice + iof) + desconto).toFixed(2);
	valida_numero($("#premioTotal").get(0),15,2,'premioTotal');
	
	//calculaParcelas();
}

function calcularPremioLiquido(){
	var premioLiquido = converte_numero($("#premioLiquido").val());
	if (premioLiquido==0){
		var premioTotal = $("#premioTotal").val();
		var custoApolice = $("#custoApolice").val();
		var desconto = $("#desconto").val();
		var perc_iof = 1.0738;

		premioTotal = converte_numero(premioTotal);
		custoApolice = converte_numero(custoApolice);
		desconto = converte_numero(desconto);

		$("#premioLiquido").get(0).value = ((premioTotal/perc_iof) - custoApolice - desconto).toFixed(2);
		$("#iof").get(0).value = (premioTotal - (premioTotal/perc_iof)).toFixed(2);
		valida_numero($("#premioLiquido").get(0),15,2,'premioLiquido');
		valida_numero($("#iof").get(0),15,2,'iof');
		if (premioTotal>0){
			$('#premioTotal').addClass('readonly')
		}
	}
	//calculaParcelas();
}

function calculaIOF(forceCalc){

	var iof = converte_numero($("#iof").val());
	if(forceCalc){
		var premioLiquido = $("#premioLiquido").val();
		var custoApolice = $("#custoApolice").val();
		var percentualIOF = $("#percentualIOF").val();
		var desconto = $("#desconto").val();
		
		premioLiquido = converte_numero(premioLiquido);
		custoApolice = converte_numero(custoApolice);
		desconto = converte_numero(desconto);
		percentualIOF = converte_numero(percentualIOF);
		
		iof = ((premioLiquido+custoApolice+desconto)*(percentualIOF/100)).toFixed(2);
		
		$("#iof").val(iof);
		valida_numero($("#iof").get(0),15,2,'iof');
	}
}

function key(e) {return e?e.which:e.keyCode;}

//evitar que o usuario saia de um formulario sem salvar
$(document).ready(function(){
	if ($('#formEdit').length){
	    function confirmExit( event ) {  
	        if (!formNavigateAlterado) {  
	        	event.cancelBubble = true;  
	        } else {
	       		formNavigateAlterado = true;
	        	return unloadMessage();  
	        }
	    }
		window.onbeforeunload = confirmExit;  
	    $($('#formEdit')+":input[type=text], :input[type='textarea'], :input[type='password'], :input[type='radio'], :input[type='checkbox'], :input[type='file'], select").bind("change", function(){
	           formNavigateAlterado = true;
	    });
	    $($('#formEdit')+":input[type=text], :input[type='textarea'], :input[type='password'], :input[type='radio'], :input[type='checkbox'], :input[type='file']").bind("change", function(){
	           lastFocusField = this;
	           formNavigateAlterado = true;
	    });
		$($('#formEdit')+":input[type='textarea']").keyup(function(){ 
	           formNavigateAlterado = true;
		}); 
	    //$("#formEdit").FormNavigate(unloadMessage());
	}
});
    
function unloadMessage() {
    return 'Você alterou informações neste formulário que ainda não foram salvas. Se você navegar para outra página antes de salvá-las, suas informações serão perdidas!\n\n ';
}

// limpar todos os dados de apolice/endosso quando o nroApolice/nroEndosso for limpadado
function checarNroApoliceVazio(nroApolice){
	if (nroApolice.length==0 || nroApolice==""){
		if ($('#statusOperacional').val()==2){
			if (confirm("Esta alteração ira limpar todas as informações de Apólice e retornar o estado de Proposta! \n   CONFIRMA?")){
				$('#dataEmissaoApolice').val("");
				$('#dataBaixaApolice').val("");
				$('#dataLanctoApolice').val("");
				$('#dataRecebApolice').val("");
				$('#propostaCodigoIdentificacao').val("");
			}else
				document.formEdit.reset();
		}else if ($('#statusOperacional').val()==0 || $('#statusOperacional').val()==4){
			$('#dataEmissaoApolice').val("");
			$('#dataBaixaApolice').val("");
			$('#dataLanctoApolice').val("");
			$('#dataRecebApolice').val("");
			$('#propostaCodigoIdentificacao').val("");
		}
	}
}

function checarNroEndossoVazio(nroEndosso){
	if (nroEndosso.length==0 || nroEndosso==""){
		if ($('#statusOperacional').val()==7 || $('#statusOperacional').val()==10){
			if (confirm("Esta alteração ira limpar todas as informações de Endosso e retornar o estado de Proposta de Endosso! \n   CONFIRMA?")){
				$('#dataEmissaoEndosso').val("");
				$('#dataBaixaEndosso').val("");
				$('#dataLanctoEndosso').val("");
				$('#dataRecebEndosso').val("");
			}else
				document.formEdit.reset();
		}else if ($('#statusOperacional').val()==5 || $('#statusOperacional').val()==6 || 
				  $('#statusOperacional').val()==8 || $('#statusOperacional').val()==9){
			$('#dataEmissaoEndosso').val("");
			$('#dataBaixaEndosso').val("");
			$('#dataLanctoEndosso').val("");
			$('#dataRecebEndosso').val("");
		}
	}
}

/*******************/
/**     Anexo     **/
/*******************/
function removerPropostaAnexo(id){
	var parameters = '?propostaAnexo.id='+id+'&propostaAnexo.proposta.id='+$("#propostaId").val();
	submitFormAjax('#formAnexo', getContextApp()+'/proposta/excluirAnexo.action?propostaAnexo.id='+id, '#divListaAnexo');
}

function inserirPropostaAnexo(){

	if (isEmpty($("#arquivoAnexo"))){
		alert("Selecione um arquivo valido!")
		return;
	}
	
	$("#formAnexo").empty();

	//$("#formAnexo").append($("#arquivoAnexo").clone2());
	//$("#formAnexo").append($("#propostaId").clone2());
	copyField($("#arquivoAnexo")[0], $("#formAnexo")[0]);
	copyField($("#propostaId")[0], $("#formAnexo")[0]);

	submitFormAjax('#formAnexo', getContextApp()+'/proposta/inserirAnexo.action', '#divListaAnexo');
	$("#arquivoAnexo").val("");
}

function mostrarPropostaAnexo(id){
	openWin(contextApp+'/proposta/mostrarAnexo.action?propostaAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function preparaMostrarPropostaAnexo(id){
	openWin(contextApp+'/proposta/preparaMostrarAnexo.action?propostaAnexo.id='+id, 'clienteEdicao', '750', '500', 'resizable=yes');
}

function apagarDadosPropostaAnexo(){
	$("#arquivoAnexo").val("");
}

function carregarPropostaAnexos(){
	$("#faPropostaAnexoPropostaId").val($("#propostaId").val());
	$("#faPropostaId").val($("#propostaId").val());
	submitFormAjax('#formAnexo', getContextApp()+'/proposta/carregarAnexos.action', '#divListaAnexo');
}

function liberaCamposComissao(tipoComissao){
	$('#comissionadoPropostaVlrComissao').val('0,00');
	$('#comissionadoPropostaComissao').val('');
	if (tipoComissao != ''){
		if (tipoComissao != TP_COM_VALOR){
			$('#comissionadoPropostaComissao').removeClass('readonly');
			$('#comissionadoPropostaComissao').attr('readonly',false);
			$('#comissionadoPropostaVlrComissao').addClass('readonly');
			$('#comissionadoPropostaVlrComissao').attr('readonly',true);
		}else{
			$('#comissionadoPropostaVlrComissao').removeClass('readonly');
			$('#comissionadoPropostaVlrComissao').attr('readonly',false);
			$('#comissionadoPropostaComissao').addClass('readonly');
			$('#comissionadoPropostaComissao').attr('readonly',true);
		}
	}else{
		$('#comissionadoPropostaComissao').addClass('readonly');
		$('#comissionadoPropostaVlrComissao').addClass('readonly');
		$('#comissionadoPropostaComissao').attr('readonly',true);
		$('#comissionadoPropostaVlrComissao').attr('readonly',true);
	}
}

function liberaCamposAgenciamento(tipoComissao){
	$('#comissionadoAgenciamentoVlrComissao').val('0,00');
	$('#comissionadoAgenciamentoComissao').val('');
	if (tipoComissao != ''){
		if (tipoComissao != TP_COM_VALOR){
			$('#comissionadoAgenciamentoComissao').removeClass('readonly');
			$('#comissionadoAgenciamentoComissao').attr('readonly',false);
			$('#comissionadoAgenciamentoVlrComissao').addClass('readonly');
			$('#comissionadoAgenciamentoVlrComissao').attr('readonly',true);
		}else{
			$('#comissionadoAgenciamentoVlrComissao').removeClass('readonly');
			$('#comissionadoAgenciamentoVlrComissao').attr('readonly',false);
			$('#comissionadoAgenciamentoComissao').addClass('readonly');
			$('#comissionadoAgenciamentoComissao').attr('readonly',true);
		}
	}else{
		$('#comissionadoAgenciamentoComissao').addClass('readonly');
		$('#comissionadoAgenciamentoVlrComissao').addClass('readonly');
		$('#comissionadoAgenciamentoComissao').attr('readonly',true);
		$('#comissionadoAgenciamentoVlrComissao').attr('readonly',true);
	}
}

/* bloquear edição de campo das propostas */
function protegerCampos(div) {
   //Remove os overlay's
   //$('.div_overlay').remove();
 
   // localizando os elementos desabilitados
   var $disabled = $("#"+div+" input:visible, #"+div+" select:visible, textarea:visible, #labelCover, #"+div+" img.calculator-trigger");

   // para cada elemento desabilitado, criamos um "overlay"
   $disabled.each(function (){
     // elemento desabilitado
     var $self = $(this);
     // célula que contém o elemento desabilitado
     var $parent = $self.closest("td");
     // criando um "overlay"
     var $overlay = $("<div class='div_overlay' />");

     // aplicando estilo ao "overlay"
     
     $overlay.css({
       // posicionando o "overlay" exatamente na mesma posição do elemento desabilitado
         position: "absolute"
       , top: $self.position().top
       , left: $self.position().left-1
       , width: $self.outerWidth()+3
       , height: $self.outerHeight()+2
       , zIndex: 100000
       , background: "#c0c0c0"
	   , opacity: 0.0
         // IE necessita do atributo "backgroundColor" para responder aos eventos do mouse
     })
     // adicionado o "overlay" à página 
     $parent.append($overlay);
   });      
}

function validaComissionadoComissao(){

	var hasError = false;
	var divComissionados = $('#divMessagesComissionados').html('').get(0);

	if($('#comissionadoPropostaPessoaId').val() == ""){
		addErrorText('É necessário especificar uma pessoa.', divComissionados);
		hasError = true;
	}
	if($('#comissionadoPropostaPercentualComissao').val() == ""){
		addErrorText('É necessário especificar um percentual para o comissionado.', divComissionados);
		hasError = true;
	}
	if (!hasError){
		var percVlrComissao = converte_numero($("#comissionadoPropostaComissao").val());
		var premioLiquido = converte_numero($("#premioLiquido").val());
		if ($('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_COMISSAO ||
		    $('#comissionadoPropostaTipoComissao').val() == TP_COM_PERC_SOBRE_PREMIO_LIQ){
			if (percVlrComissao>100){
				addErrorText('O percentual de comissão não poder ser maior que 100%.', divComissionados);
				hasError = true;
			}
		}
		if($('#comissionadoPropostaTipoComissao').val() == TP_COM_VALOR){
			if (percVlrComissao>100){
				addErrorText('O valor da comissão não poder ser maior que o Prêmio liquido.', divComissionados);
				hasError = true;
			}
		}
	}
	return !hasError;
}

/**********************************/
/*   Copiar Endereço na proposta  */
/**********************************/

function copiarEnderecoResidencialParaEnderecoComercial(){
	$("#end1TipoEndereco").val("C");
	//$("#end1PessoaFisicaId").val($("#end0PessoaFisicaId").val());
	$("#cepCom").val($("#cepRes").val());
	$("#lograCom").val($("#lograRes").val());
	$("#compCom").val($("#compRes").val());
	$("#numeroCom").val($("#numeroRes").val());
	$("#foneCom").val($("#foneRes").val());
	$("#bairroCom").val($("#bairroRes").val());
	$("#cidadeCom").val($("#cidadeRes").val());
	$("#ufCom").val($("#ufRes").val());
	$("#faxCom").val($("#faxRes").val());
}

function abrirDivTrocarSeguradora(){
	$('#trocarSeguradora').modal({onOpen: openModalTrocarSeguradora, close: false});
}

function openModalTrocarSeguradora (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	
	$("#paramSegPropostaId").val($('#propostaId').val());		
	$("#seguradoraAtualNome").val($('#seguradoraNome').val());	
	$("#paramSegSeguradoraId").val('');

	setTimeout(function(){
		$("#segSeguradoraNome").focus();
		$('#btnf3').attr('disabled',true);
		$('#btnf4').attr('disabled',true);
		$('#btnf5').attr('disabled',true);
		$('#btnf6').attr('disabled',true);
		$('#btnf7').attr('disabled',true);
		$('#btnf8').attr('disabled',true);
		$('#btnf11').attr('disabled',true);
	}
	,2000);
}

function alterarSeguradora(){
	if ($("#paramSegSeguradoraId").val()==''){
		alert("Obrigatorio informar uma Seguradora valida!");
		$("#segSeguradoraNome").focus();
		return false;
	}
		
	if (!confirm("Confirma a TROCA da Seguradora? Esta alteração não afeta Perfil, Coberturas e Serviços!")){
		return false;
	}

	submitFormAjax('#formSeguradora', getContextApp()+'/proposta/alterarSeguradora.action', '#divSeguradora');
	$("#paramSegSeguradoraId").val('');
}

function confirmaInicioVigencia(data){
	
	var dataProposta = $('#dataProposta').val();
	
	var dataDaProposta = dataProposta.split('/');
	var inicioVigencia = data.value.split('/');

	if(dataDaProposta.length != 3 || inicioVigencia.length != 3){
		return false;
	}


	// datas no formato ano/mês/dia
	var diferenca = diferencaDias(new Date(dataDaProposta[2], dataDaProposta[1], dataDaProposta[0]), new Date(inicioVigencia[2], inicioVigencia[1], inicioVigencia[0]));
	
	if (diferenca >= 30)
		if (confirm("Você informou uma data de INICIO DE VIGENCIA 30 dias maior ou menor que a data da proposta, CONFIRMA ESTA DATA: "+data.value+" ?"))
			return true;
		else{
			data.value = '';
			data.focus();
			return false;
		}
}

function diferencaDias(data1, data2){
    var dif =
        Date.UTC(data1.getYear(),data1.getMonth(),data1.getDate(),0,0,0)
      - Date.UTC(data2.getYear(),data2.getMonth(),data2.getDate(),0,0,0);
    return Math.abs((dif / 1000 / 60 / 60 / 24));
}

