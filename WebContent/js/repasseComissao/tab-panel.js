
// Global vars to hold the object in the panel.
tabPanelArray = new Array(6);
tabMenuArray = new Array(6);
currentMenuIndex = 0;

var numeroDeTabs = 6;
var tabCount = 0;
var firstLoop = false;
var doNavigate;
var continueLoop = false;

/**
 * This MUST be called on page load to fill up the shared global values.
 * Having the panes object accessible by index makes things easier.
 * This is also a good place to display the first page.
 */
function bodyOnLoad()
   {
   tabPanelArray[0] = getItemObj('tabPane0');

   //tabMenuArray[0] = getItemObj('tabMenu0');

   tabCount = currentMenuIndex;
   
	raiseObject (tabPanelArray[0], 4);
	tabPanelArray[0].style.visibility='visible';
	//tabMenuArray[0].className = 'active';
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
	tabCount = parseInt(panelIndex);

	for (index=0; index<6; index++ ){
		// the panel with the index == wantedIndex gets raised.
		if (index == tabCount ){
			raiseObject (tabPanelArray[index], 4);
			tabPanelArray[currentMenuIndex].style.visibility='hidden';
			tabPanelArray[index].style.visibility='visible';
			tabMenuArray[index].className = 'active';
		}else{
			raiseObject (tabPanelArray[index], 2);
			tabMenuArray[index].className = 'inactive';
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

    if (type=="proximo"||type=="anterior"){continueLoop=false}
    if ((type=="proximo" && ((tabCount + 1) < numeroDeTabs)) || (type=="anterior" && ((tabCount - 1) > -1))) {
		if (type=="proximo")
			tabCount++;
		else
			tabCount--;

		if (alterado==true){
			document.getElementById("currentTabId").value=tabCount;
			salvarProposta();		
			alterado = false;
			return false;
		}	
			
		for (index=0; index<6; index++ ){
			// the panel with the index == wantedIndex gets raised.
			if (index == tabCount ){
				raiseObject (tabPanelArray[index], 4);
				tabPanelArray[index].style.visibility='visible';
				if (type=="proximo")
					tabPanelArray[index-1].style.visibility='hidden';
				else
					tabPanelArray[index+1].style.visibility='hidden';
				tabMenuArray[index].className = 'active';
			}else{
				raiseObject (tabPanelArray[index], 2);
				tabMenuArray[index].className = 'inactive';
			}
		}

	   document.getElementById("currentTabId").value=tabCount;
	   currentMenuIndex=tabCount;
	}
    
    if($('#blnPossuiPerfil').val() == 'false' && currentMenuIndex == 1){
    	navigate(type);
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
   
   newTop = obj.offsetTop; 
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
