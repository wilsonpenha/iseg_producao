sortitems = 1;  // Automatically sort items within lists? (1 or 0)
netscape = false;
navegador = navigator.appName;
versao = parseInt(navigator.appVersion);

function defineContext(contextStr){
	contextApp = contextStr.substring(0,contextStr.length-1);
}

function getContextApp(){
	return contextApp;
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

	// Calcula a diferen�a entre os anos, subtrai 1, pois Não sabemos se completou um ano inteiro. 
	var years = dateSplit2[2]-dateSplit1[2]-1;
	// Verifica se o m�s � menor. Se for ainda Não completou 1 ano inteiro.
	if(dateSplit2[1] < dateSplit1[1]){
		return years;
	// Verifica se o m�s � maior. Se for já completou 1 ano inteiro, soma 1 no ano e retorna.
	}else if(dateSplit2[1] > dateSplit1[1]){
		return years+1;
	}else{
		// Caso os meses sejam iguais.
		// Verifica se o dia � menor. Se for ainda Não completou 1 ano inteiro.
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

//Rever essa fun��o depois!
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

function TableSort(myTable, myCol, myType, sRow, cf) {

	//document.body.style.cursor = "wait";
	if (!document.getElementById("WaitMessageId")){
	waitWindow()
	}
   var startRow=1;
   //document.all.ResultDiv.style.cursor="wait";
	//alert("Function=TableSort"+" myTable=" + myTable + " myCol=" + myCol +" myType=" + myType + " sRow=" +sRow);
	if(sRow=='undefined'){
			startRow=1;
		  //alert("undefined:"+startRow);
	}else{
				if(sRow==0){
				 startRow=0;
				 //alert("value of row=0:" + startRow);
				}
				if(sRow==1){
					startRow=1;
				 //alert("value of row=1:" + startRow);
				}
	}
	//alert("sRow="+sRow + " startRow="+startRow)
	
  counter=0;
	var mySource = document.getElementById(myTable);
	var myRows = mySource.rows.length;
	
	var myCols = mySource.rows[0].cells.length;
	currentCol = myCol;
	myArray = new Array(myRows);		
	for (i=startRow; i < myRows; i++) {
		myArray[i] = new Array(myCols);
		for (j=0; j < myCols; j++) {
					myArray[i][j] = mySource.rows[i].cells[j].innerHTML;
					//window.status = "Records Read=" + i +" of " + myRows;
					//alert("i=" + i + " j:" + j + " value:" + myArray[i][j]);
		}
	}  	
	switch (myType){
			case "a":
				myArray.sort(CompareAlpha);
				break;
			case "aa":
				//window.status = "Sorting Started..!" ;
				myArray.sort(CompareAlphaIgnoreAscending);
			    //window.status = "Sorting Completed..!" ;
				break;
			case "ad":
				myArray.sort(CompareAlphaIgnoreDescending);
				break;				
			case "ai":
				myArray.sort(CompareAlphaIgnore);
				break;
			case "d":
				myArray.sort(CompareDate);
				break;
			case "da":
				myArray.sort(CompareDateAscending);
				break;
			case "dd":
				myArray.sort(CompareDateDescending);
				break;
			case "de":
				myArray.sort(CompareDateEuro);
				break;
			case "dea":
				myArray.sort(CompareDateEuroAscending);
				break;
			case "ded":
				myArray.sort(CompareDateEuroDescending);
				break;
			case "ca":
				myArray.sort(CompareDateCustomAscending);
				break;
			case "cd":
				myArray.sort(CompareDateCustomDescending);
				break;
			case "n":
				myArray.sort(CompareNumeric);
				break;
			case "na":
				myArray.sort(CompareNumericAscending);
				break;
			case "nd":
				myArray.sort(CompareNumericDescending);
				break;
			default:
				myArray.sort();
		}
	for (i=startRow; i < myRows; i++) {
		for (j=0; j < myCols; j++){
		  if (startRow==1){
				 mySource.rows[i].cells[j].innerHTML = myArray[i-1][j];
			}else{
				 mySource.rows[i].cells[j].innerHTML = myArray[i][j];
			}	 
			//window.status = "Records Write =" + i +" of " + myRows ;
		}
	}
	previousCol = myCol; // remember the current sort column for the next pass
	if (cf=='view'){
	
		if (!document.getElementById("WaitMessageId")){
	waitWindow()
	}
		document.getElementById("WaitMessageId").style.display = "none" ;
	}
	return 0;
}

function TableSortWait(TableName, StartRow, SortType, IncludeFirstRow){

	if (!document.getElementById("WaitMessageId")){
	waitWindow()
	}

	document.getElementById("WaitMessageId").style.display = "block" ;

setTimeout("TableSort(\"" + TableName + "\",\"" + StartRow + "\",\"" + SortType + "\",\"" + IncludeFirstRow + "\",'view')", '500');

}


