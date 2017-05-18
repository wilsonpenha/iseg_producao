
var keyActions=new Array();var eventKey=null;function hotKeys(event){event=(event)?event:((window.event)?event:null);eventKey=event;if(event){if(event.keyCode>111&&event.keyCode<123){var actionCode=event.keyCode;for(var i=0;i<keyActions.length;i++){if(keyActions[i].character==actionCode){var action;if(keyActions[i].actionType.toLowerCase()=="link"){action=new Function('location.href  ="'+keyActions[i].param+'"');}
else if(keyActions[i].actionType.toLowerCase()=="code"){action=new Function(keyActions[i].param);}
else{alert('Hotkey Function Error: Action should be "link" or "code"');break;}
action();break;}}}else if((event.keyCode>=65&&event.keyCode<=90)||(event.keyCode>=97&&event.keyCode<=113)||(event.keyCode>=48&&event.keyCode<=57)){alterado=true;}}
return true;}
function frmRequest_KeyDown(e)
{var numCharCode;var elTarget;var strType;if(!e)var e=window.event;if(e.keyCode)numCharCode=e.keyCode;else if(e.which)numCharCode=e.which;if(e.target){elTarget=e.target;}else if(e.srcElement)elTarget=e.srcElement;if(!hotKeys(e))
return true;switch(e.keyCode){case 113:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 114:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 115:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 116:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 117:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 118:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 119:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 120:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 121:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;case 122:if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;}
return true;}
function executarBotao(btnId){if(document.getElementById(btnId))
document.getElementById(btnId).click();}