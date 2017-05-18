
var keyActions=new Array();var eventKey=null;var ocorrencias=0;function hotKeys(event){event=(event)?event:((window.event)?event:null);eventKey=event;if(event){if(event.keyCode>111&&event.keyCode<123){var actionCode=event.keyCode;for(var i=0;i<keyActions.length;i++){if(keyActions[i].character==actionCode){var action;if(keyActions[i].actionType.toLowerCase()=="link"){action=new Function('location.href  ="'+keyActions[i].param+'"');}
else if(keyActions[i].actionType.toLowerCase()=="code"){action=new Function(keyActions[i].param);}
else{alert('Hotkey Function Error: Action should be "link" or "code"');break;}
action();break;}}}else if((event.keyCode>=65&&event.keyCode<=90)||(event.keyCode>=96&&event.keyCode<=113)||(event.keyCode>=48&&event.keyCode<=57)){alterado=true;}}
return true;}
function frmRequest_KeyDown(e)
{var numCharCode;var elTarget;var strType;if(!e)var e=window.event;if(e.keyCode)numCharCode=e.keyCode;else if(e.which)numCharCode=e.which;if(e.target){elTarget=e.target;}else if(e.srcElement)elTarget=e.srcElement;if(e.keyCode==46||e.keyCode==9||e.keyCode==8||(e.keyCode>=65&&e.keyCode<=90)||(e.keyCode>=96&&e.keyCode<=113)||(e.keyCode>=48&&e.keyCode<=57)){if(!editavel){if(navigator.appName!='Netscape'){e.keyCode=000;}
return false;}}
if(!hotKeys(e))
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
return false;case 13:if(e.explicitOriginalTarget){var evt=(evt)?evt:((e)?e:null);var node=(evt.target)?evt.target:((evt.explicitOriginalTarget)?evt.explicitOriginalTarget:null);if((evt.keyCode==13&&node.name.indexOf('lastfield')<0)&&((node.type=="text")||(node.type=="checkbox")||(node.type=="radio")||(node.type=="select-one"))){getNextElement(node).focus();if(node.type!="select-one")
getNextElement(node).select();return false;}}else if(e.srcElement){var evt=(evt)?evt:((e)?e:null);var node=(evt.target)?evt.target:((evt.srcElement)?evt.srcElement:null);if((evt.keyCode==13&&node.name.indexOf('lastfield')<0)&&((node.type=="text")||(node.type=="checkbox")||(node.type=="radio")||(node.type=="select-one"))){getNextElement(node).focus();return false;}}}
return true;}
function executarBotao(btnId){$('#'+btnId).click();}
function getNextElement(field)
{var form=field.form;for(var e=0;e<form.elements.length;e++){if(field==form.elements[e]){break;}}
e++;while(form.elements[e%form.elements.length].type=="hidden"||form.elements[e%form.elements.length].id==''||$('#'+form.elements[e%form.elements.length].id).css('display')=='none'||form.elements[e%form.elements.length].readOnly==true||form.elements[e%form.elements.length].disabled==true){e++;}
return form.elements[e%form.elements.length];}