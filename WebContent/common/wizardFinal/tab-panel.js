
// Global vars to hold the object in the panel.
tabPanelArray = new Array(6);
tabMenuArray = new Array(6);
divItens = null;
currentMenuIndex = 0;

var numeroDeTabs = 6;
var tabCount = 0;
var firstLoop = false;
var doNavigate;
var continueLoop = false;

var panelReadOnly;

/**
 * This MUST be called on page load to fill up the shared global values.
 * Having the panes object accessible by index makes things easier.
 * This is also a good place to display the first page.
 */
function bodyOnLoad(){
   tabPanelArray[0] = getItemObj('tabPane0');
   tabPanelArray[1] = getItemObj('tabPane1');
   tabPanelArray[2] = getItemObj('tabPane2');
   tabPanelArray[3] = getItemObj('tabPane3');
   tabPanelArray[4] = getItemObj('tabPane4');
   tabPanelArray[5] = getItemObj('tabPane5');
   if (numeroDeTabs==7)
	   tabPanelArray[6] = getItemObj('tabPane6');
   
   divItens = getItemObj('divItens');

   tabMenuArray[0] = getItemObj('tabMenu0');
   tabMenuArray[1] = getItemObj('tabMenu1');
   tabMenuArray[2] = getItemObj('tabMenu2');
   tabMenuArray[3] = getItemObj('tabMenu3');
   tabMenuArray[4] = getItemObj('tabMenu4');
   tabMenuArray[5] = getItemObj('tabMenu5');
   if (numeroDeTabs==7)
	   tabMenuArray[6] = getItemObj('tabMenu6');

   tabCount = currentMenuIndex;
   
	if (!editavel){
		$('.div_overlay').remove();
		protegerCampos(tabPanelArray[tabCount].id);
	}

   for (index=0; index<numeroDeTabs; index++ ){
		// the panel with the index == wantedIndex gets raised.
		if (index == tabCount ){
			raiseObject (tabPanelArray[index], 4);
			panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');
			if (panelReadOnly != null)
				panelReadOnly.style.visibility='hidden';
			tabPanelArray[currentMenuIndex].style.visibility='hidden';
			panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');
			if (panelReadOnly != null)
				panelReadOnly.style.visibility='visible';
			tabPanelArray[index].style.visibility='visible';
			tabMenuArray[index].className = 'active';
			if (index == 2)
				divItens.style.visibility='visible';
			else
				divItens.style.visibility='hidden';
		}else{
			raiseObject (tabPanelArray[index], 2);
			tabMenuArray[index].className = 'inactive';
		}
	}

	if (editavel){
	   if (tabCount==0){
		   document.getElementById("comboVistoriadora").focus();
	   }else if (tabCount==1){
		   if(document.getElementById("condutorCPF") != null)
			   document.getElementById("condutorCPF").focus();
	   }else if (tabCount==2){
		   document.getElementById("numeroItem").focus();
	   }else if (tabCount==3){
		   document.getElementById("premioLiquido").focus();
	   }else if (tabCount==4){
		   document.getElementById("nroPropostaSeg").focus();
	   }else if (tabCount==5){
		   document.getElementById("grupoDeVendaId").focus();
	   }
	//   raisePanel ( currentMenuIndex );
	   }
}

/**
 * Utility function just to show an error if I try to get non existen objects
 */
function getItemObj ( itemId )
   {
   obj = document.getElementById(itemId);

   if ( obj == null ) alert('Script Error: id='+itemId+' does not exist');

   return obj;
   }


/**
 * raising a panel means setting all the other panels to a lower level
 * and setting the raided panel to a higher level
 * note that also the size must be set correctly !
 * to activate a menu i switch the class between active and not active.
 */
function raisePanel ( panelIndex )   {
		
	if ($("#propostaId").val()=='' || $("#clienteId").val()==''){
		if($('#tipoCliente').val()=='0'){
			if(isEmpty('#clientePFNome')){
				$("#clientePFNome").focus();
				alert("O nome do segurado deve ser informado!");
				return false;
			}
		}else{
			if(isEmpty('#clientePJNome')){
				$("#clientePJNome").focus();
				alert("O nome do segurado deve ser informado!");
				return false;
			}
		}
	}

	if (!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
		return false;

	tabCount = parseInt(panelIndex);

	if (!editavel){
		$('.div_overlay').remove();
		protegerCampos(tabPanelArray[tabCount].id);
	}

	if (alterado==true || (tabCount==5 && $("#blnReloaded").val()=='false')){
		$("#currentTabId").val(tabCount);
		salvarProposta();		
		alterado = false;
		if (tabCount==5)
			$("#blnReloaded").val("true");
		return false;
	}
	
	for (index=0; index<numeroDeTabs; index++ ){
		// the panel with the index == wantedIndex gets raised.
		if (index == tabCount ){
			raiseObject (tabPanelArray[index], 4);

			panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');
			if (panelReadOnly != null)
				panelReadOnly.style.visibility='hidden';
			tabPanelArray[currentMenuIndex].style.visibility='hidden';
			panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');
			if (panelReadOnly != null)
				panelReadOnly.style.visibility='visible';
			tabPanelArray[index].style.visibility='visible';
			tabMenuArray[index].className = 'active';
			if (index == 2)
				divItens.style.visibility='visible';
			else
				divItens.style.visibility='hidden';
		}else{
			raiseObject (tabPanelArray[index], 2);
			tabMenuArray[index].className = 'inactive';
		}
	}


	if (editavel){
	   if (tabCount==0){
		   document.getElementById("comboVistoriadora").focus();
	   }else if (tabCount==1){
		   if(document.getElementById("condutorCPF") != null)
			   document.getElementById("condutorCPF").focus();
	   }else if (tabCount==2){
		   document.getElementById("numeroItem").focus();
	   }else if (tabCount==3){
		   document.getElementById("premioLiquido").focus();
	   }else if (tabCount==4){
		   document.getElementById("nroPropostaSeg").focus();
	   }else if (tabCount==5){
		   document.getElementById("grupoDeVendaId").focus();
	   }
	}

   currentMenuIndex=tabCount;
   document.getElementById("currentTabId").value=tabCount;


   return true;
}

/**
 * raising a panel means setting all the other panels to a lower level
 * and setting the raided panel to a higher level
 * note that also the size must be set correctly !
 * to activate a menu i switch the class between active and not active.
 */
function navigate (type){

	if ($("#propostaId").val()=='' || $("#clienteId").val()==''){
		if($('#tipoCliente').val()=='0'){
			if(isEmpty('#clientePFNome')){
				$("#clientePFNome").focus();
				alert("O nome do segurado deve ser informado!");
				return false;
			}
		}else{
			if(isEmpty('#clientePJNome')){
				$("#clientePJNome").focus();
				alert("O nome do segurado deve ser informado!");
				return false;
			}
		}
	}

	if (!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
		return false;


    if(($('#blnPossuiPerfil').val() == 'false' && currentMenuIndex == 0 && type=="proximo") ||
       ($('#blnPossuiPerfil').val() == 'false' && currentMenuIndex == 2 && type=="anterior")){
		if (type=="proximo")
			tabCount++;
		else
			tabCount--;
    }

    if (type=="proximo"||type=="anterior"){continueLoop=false}
    if ((type=="proximo" && ((tabCount + 1) < numeroDeTabs)) || (type=="anterior" && ((tabCount - 1) > -1))) {
		if (type=="proximo")
			tabCount++;
		else
			tabCount--;

		if (!editavel){
			$('.div_overlay').remove();
			protegerCampos(tabPanelArray[tabCount].id);
		}

		if (alterado==true || (tabCount==5 && $("#blnReloaded").val()=='false')){
			$("#currentTabId").val(tabCount);
			salvarProposta();		
			alterado = false;
			if (tabCount==5)
				$("#blnReloaded").val("true");
			return false;
		}
		
		for (index=0; index<numeroDeTabs; index++ ){
			// the panel with the index == wantedIndex gets raised.
			if (index == tabCount ){
				raiseObject (tabPanelArray[index], 4);
				panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');
				if (panelReadOnly != null)
					panelReadOnly.style.visibility='visible';
				tabPanelArray[index].style.visibility='visible';
				if (type=="proximo"){
					tabPanelArray[index-1].style.visibility='hidden';
					panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[index-1].id+'_event');
					if (panelReadOnly != null)
						panelReadOnly.style.visibility='hidden';
				}else{
					tabPanelArray[index+1].style.visibility='hidden';
					panelReadOnly = document.getElementById('divReadonly_'+tabPanelArray[index+1].id+'_event');
					if (panelReadOnly != null)
						panelReadOnly.style.visibility='hidden';
				}
				tabMenuArray[index].className = 'active';
				if (index == 2)
					divItens.style.visibility='visible';
				else
					divItens.style.visibility='hidden';
			}else{
				raiseObject (tabPanelArray[index], 2);
				tabMenuArray[index].className = 'inactive';
			}
		}

		if (editavel){
		   if (tabCount==0){
			   document.getElementById("comboVistoriadora").focus();
		   }else if (tabCount==1){
			   if(document.getElementById("condutorCPF") != null)
				   document.getElementById("condutorCPF").focus();
		   }else if (tabCount==2){
			   document.getElementById("numeroItem").focus();
		   }else if (tabCount==3){
			   document.getElementById("premioLiquido").focus();
		   }else if (tabCount==4){
			   document.getElementById("nroPropostaSeg").focus();
		   }else if (tabCount==5){
			   document.getElementById("grupoDeVendaId").focus();
		   }
		}
	   document.getElementById("currentTabId").value=tabCount;
	   currentMenuIndex=tabCount;
	}
    
   	return true;
}

/**
 * When I raise a panel I may as well check for the correct size and fix it.
 * it is a bit of doubling work, but it does not happens often !
 */
function raiseObject ( target, level )
   {
   /* the number of pixels we shave to the outside filler to fit everything in
    * this value depends on the border set for the filler div and possible padding
    * it is best to experiment a bit with it.
    */
   safeMargin = 8;

   // the size of the panels depends on the size of the tabFiller
   obj = getItemObj('tabFiller');

   newWidth = obj.offsetWidth - safeMargin;
   if ( newWidth < safeMargin ) newWidth = safeMargin;
   target.style.width = newWidth+'px';

   newHeight =obj.offsetHeight - safeMargin;
   if ( newHeight < safeMargin ) newHeight = safeMargin;
   target.style.height = newHeight+'px';
   
   newTop = obj.offsetTop - 34; 
   target.style.top = newTop+'px';

   newLeft = obj.offsetLeft - 4; 
   target.style.left = newLeft+'px';

   //target.style.top = '0px';
   // setting the z-index last should optimize possible resize.
   target.style.zIndex=level;
   }

/**
 * When we mouse out of the span we restore the class to the default value
 * But this only if we are not over the current selected menu
 */
function mouseOut ( menuIndex )
   {
   if ( menuIndex == currentMenuIndex ) return true;

   tabMenuArray[menuIndex].className = 'tabMenu';
   }

/**
 * When we mouse over of the span we set the class of the span to the over one
 * But this only if we are not over the current selected menu
 */
function mouseOver ( menuIndex )
   {
   if ( menuIndex == currentMenuIndex ) return true;

   tabMenuArray[menuIndex].className = 'tabMenuOver';
   }
