/*==============================================================================

This routine enables standard keys to be used as hotkeys to either invoke a
link, or to fire some JavaScript code.  The hotkey should be pressed down at the
aame time as either the control key, the alt key, or the Mac metakey.

   Calling Sequence: <body onkeydown="hotKeys(event);">

Don't worry about the parameter - just call as above.

A hot key may either have a link associated with it, or some JavaScript code
(typically a function).

Note that because of the different keyboard layouts in use, and because of the
way that JavaScript handles keyboard events, it is best to limit your range of
hotkeys to the following characters:

   0 to 9
   A to Z
   a to z
   - . ,

Author:     John Gardner
Date:       September 2004

Note that some of the techniques here have been picked up from Chapter 9 of
"JavaScript and DHTML Cookbook", by Danny Goodman, published by O'Reilly.

The routine should degrade gracefully in older browsers.

The action keys are specified in a table. To add a new key, add a new array
element - e.g. KeyActions [2]. The code below has been set up for the example
page:

    htt://www.braemoor.co.uk/software/hotkeys.shtml

Modify it as required for your web page.

The three parts of the array element are as follows:

   character:      the hot key
   actionType:     either "link" or "code"
   param:          either the URL for a hyperlink or the JavaScript code.

When using hot keys in forms for buttons, radiobuttons, or checkboxes, ensure
that you provide each with id and name attributes, with the same value. e.g.

     document.myform.submit.click();
     document.myform.reset.click();
     document.myform.radio[2].checked=true;

==============================================================================*/

// This array should be set up as required for YOUR web page.

var keyActions = new Array ();
var eventKey = null;

// End of user defined array

var ocorrencias = 0;

function hotKeys (event) {

  // Get details of the event dependent upon browser
  event = (event) ? event : ((window.event) ? event : null);
  eventKey = event;
  // We have found the event.
  if (event) {

    // Hotkeys require that either the control key or the alt key is being held down
    if (event.keyCode > 111 && event.keyCode < 123) {

      var actionCode = event.keyCode; //save the current press PF?

      // Now scan through the user-defined array to see if character has been defined.
      for (var i = 0; i < keyActions.length; i++) {

        // See if the next array element contains the Hotkey character
        if (keyActions[i].character == actionCode) {

          // Yes - pick up the action from the table
          var action;

          // If the action is a hyperlink, create JavaScript instruction in an anonymous function
          if (keyActions[i].actionType.toLowerCase() == "link") {
            action = new Function ('location.href  ="' + keyActions[i].param + '"');
          }

          // If the action is JavaScript, embed it in an anonymous function
          else if (keyActions[i].actionType.toLowerCase()  == "code") {
            action = new Function (keyActions[i].param);
          }

          // Error - unrecognised action.
          else {
            alert ('Hotkey Function Error: Action should be "link" or "code"');
            break;
          }

          // At last perform the required action from within an anonymous function.
          action ();

          // Hotkey actioned - exit from the for loop.
          break;
        }
      }
    }else if( (event.keyCode >= 65 && event.keyCode <= 90) || (event.keyCode >= 96 && event.keyCode <= 113) || (event.keyCode >= 48 && event.keyCode <= 57)){
		alterado = true;
	}
  }
  return true;
}

// ----------------------------------------------------------------------------
// frmRequest_KeyDown
//
// Description: event handler for request form key down event
//    translates returns on option buttons to a tab
//    this works only for IE, the keypress event is used for other browsers
//
// Arguments :
//    e - the event object
//
// Dependencies : none
//
// History :
// 2006.07.13 - WSR : adapted to this project
//
function frmRequest_KeyDown( e )
	{

	var numCharCode;
	var elTarget;
	var strType;

	// get event if not passed
	if (!e) var e = window.event;

	// get character code of key pressed
	if (e.keyCode) numCharCode = e.keyCode;
	else if (e.which) numCharCode = e.which;

	if (e.target){
		elTarget = e.target;
	}else if (e.srcElement) elTarget = e.srcElement;

	if(e.keyCode == 46 || e.keyCode == 9 || e.keyCode == 8 || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 113) || (e.keyCode >= 48 && e.keyCode <= 57)){
    	if (!editavel){
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
    		return false;
    	}
	}
	
	if (!hotKeys(e))
		return true;

	switch (e.keyCode){
		case 113 : // 'F2'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 114 : // 'F3'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 115 : // 'F4'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 116 : // 'F5'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 117 : // 'F6'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 118 : // 'F7'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 119 : // 'F8'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 120 : // 'F9'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 121 : // 'F10'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
		case 122 : // 'F11'
			if (navigator.appName!='Netscape'){
				e.keyCode=000;
			}
			return false;
/*		case 8 : // 'BACKSPACE'
	    	if (e.explicitOriginalTarget){
	    		if (e.explicitOriginalTarget.nodeName != 'INPUT' && 
	    			e.explicitOriginalTarget.nodeName != 'TEXTAREA'){
	    			return false;
	    		}
	    	}else if (e.srcElement){
	    		if (e.srcElement.tagName != 'INPUT' &&
	    			e.srcElement.tagName != 'TEXTAREA'){
    				e.keyCode=000;
	    			return false;
	    		}
	    	}*/
		case 13 : // 'ENTER'
	    	if (e.explicitOriginalTarget){
    			var evt = (evt) ? evt : ((e) ? e : null); 
				var node = (evt.target) ? evt.target : ((evt.explicitOriginalTarget) ? evt.explicitOriginalTarget : null); 
				if ((evt.keyCode == 13 && node.name.indexOf('lastfield')<0) && ((node.type=="text") || (node.type=="checkbox") || (node.type=="radio")  || (node.type=="select-one"))){ 
				    getNextElement(node).focus();  
				    if (node.type!="select-one")
				    	getNextElement(node).select();  
				    return false;   
				} 	    			
	    	}else if (e.srcElement){
    			var evt = (evt) ? evt : ((e) ? e : null); 
				var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
				if ((evt.keyCode == 13  && node.name.indexOf('lastfield')<0) && ((node.type=="text") || (node.type=="checkbox") || (node.type=="radio")  || (node.type=="select-one"))){ 
				    getNextElement(node).focus();  
				    return false;   
				} 	    			
	    	}
	}
	return true;
}
//
// frmRequest_KeyDown
// ----------------------------------------------------------------------------


function executarBotao(btnId){
	$('#'+btnId).click();
}

function getNextElement(field) 
{
    var form = field.form;
    for ( var e = 0; e < form.elements.length; e++) {
        if (field == form.elements[e]) {
            break;
        }
    }
    e++;
    while (form.elements[e % form.elements.length].type == "hidden" || 
    	   form.elements[e % form.elements.length].id == '' || 
    	   $('#'+form.elements[e % form.elements.length].id).css('display')=='none' ||
    	   form.elements[e % form.elements.length].readOnly==true ||
    	   form.elements[e % form.elements.length].disabled==true){
        e++;
    }
    return form.elements[e % form.elements.length];
}