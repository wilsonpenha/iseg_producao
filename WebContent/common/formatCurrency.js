var BACK_SPACE_KEY_CODE = 8;
var DEL_KEY_CODE = 46;

function formatNumber(element, event, sizeDecimal, maxlength){

	var keyCode = event.keyCode;
	var charCode = window.innerHeight ? event.which : event.keyCode;
	var isToFormat = false;
	var stringZero = Math.pow(10, sizeDecimal).toString().replace('1','');
	var stringValue = '';
	var maxlength = maxlength || 15;

	if(document.selection){
		setSelectedTextIE(element);
	}

	if(keyCode == BACK_SPACE_KEY_CODE){
		selectionStart = (element.selectionStart != element.selectionEnd) ? element.selectionStart : element.selectionStart-1;
		stringValue = removeDotsAndCommas(element.value.substring(0,selectionStart)+element.value.substring(element.selectionEnd));
		if((stringValue == stringZero)){stringValue = '';}
		isToFormat = ((stringValue == '') ? false : true);
	}else if(keyCode == DEL_KEY_CODE){
		selectionEnd = (element.selectionStart != element.selectionEnd) ? element.selectionEnd : element.selectionEnd+1;
		stringValue = removeDotsAndCommas(element.value.substring(0,element.selectionStart)+element.value.substring(selectionEnd));
		isToFormat = ((stringValue == '') ? false : true);
	}else if(isNumber(charCode)){
		selectionStart = (element.selectionStart != element.selectionEnd) ? element.selectionStart : element.selectionStart-1;
		stringValue = removeDotsAndCommas(element.value.substring(0,element.selectionStart)+String.fromCharCode(charCode)+element.value.substring(element.selectionEnd));
		isToFormat = true;
	}else if(isAlphaChar(charCode) || isSymbol(charCode)){
		return false;
	}

	if(isToFormat){
		if(maxlength >= stringValue.length){
			var numberValue = stringValue/Math.pow(10, sizeDecimal).toFixed(sizeDecimal);
			applyFormatToNumber(element, numberValue, sizeDecimal);
		}
		return false;
	}else if((keyCode == BACK_SPACE_KEY_CODE) && stringValue == ''){
		element.value = '';
	}
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

function setSelectedTextIE(textElement){

	var iCaretPos = 0;

	textElement.focus();
	var oSel = document.selection.createRange();
	oSel.moveStart('character', -textElement.value.length);
	iCaretPos = oSel.text.length;

	textElement.selectionStart = iCaretPos;
	textElement.selectionEnd = iCaretPos;
}

function getSelectionStart(field){
	if (document.selection) {
		// IE black magic
		return Math.abs(
			document.selection.createRange().moveStart("character", -1000000)
		);
	} else if (typeof(field.selectionStart) != "undefined"){
		// mozilla and opera
		var selStart = field.selectionStart;
	
		// Safari bug when field is focused for first time
		if(selStart == 2147483647){
			selStart = 0;
		}

		return selStart;
	}
	
	return 0;
};

function getSelectionEnd(field){
	if (document.selection) {
		// IE black magic
		return field.value.length - Math.abs(
			document.selection.createRange().moveEnd("character", 1000000)
		);
	} else if (typeof(field.selectionEnd) != "undefined") {
		// mozilla and opera
		return field.selectionEnd;
	} 

	return 0;
};


function simulateKeyPressEvent(element, event){

	var elementClone = document.getElementById('teste');
	elementClone.value = element.value;
	elementClone.selectionStart = element.selectionStart; 
	elementClone.selectionEnd = element.selectionEnd;
	
	//setSelectionIE(element);
	if( window.KeyEvent ) {
		var eventObject = document.createEvent('KeyEvents');
		eventObject.initKeyEvent( 'keypress', true, true, window, event.ctrlKey, event.altKey, event.shiftKey, event.metaKey, event.keyCode, event.charCode );
		elementClone.dispatchEvent(eventObject);
	} else {
		describeEvent(event);
		var eventObject = document.createEventObject(event);
		eventObject.returnValue = true;
		describeEvent(eventObject);
		alert(elementClone.fireEvent('onkeypress', eventObject));
	}
	alert(elementClone.value);

	return elementClone.value;
}