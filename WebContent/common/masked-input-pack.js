
﻿
MaskInput=function(f,m){if(f==null)
return;function mask(e){if(ignoreKeys(e)){return true;}
apagaSelecao(f,e);var patterns={"1":/[A-Z]/i,"2":/[0-9]/,"4":/[À-ÿ]/i,"8":/./},rules={"a":3,"A":7,"9":2,"C":5,"c":1,"*":8};function accept(c,rule){for(var i=1,r=rules[rule]||0;i<=r;i<<=1)
if(r&i&&patterns[i].test(c))
break;return i<=r||c==rule;}
var k,mC,r,c=String.fromCharCode(k=e.key),l=f.value.length;(!k||k==8?1:(r=/^(.)\^(.*)$/.exec(m))&&(r[0]=r[2].indexOf(c)+1)+1?r[1]=="O"?r[0]:r[1]=="E"?!r[0]:accept(c,r[1])||r[0]:(l=(f.value+=m.substr(l,(r=/[A|9|C|\*]/i.exec(m.substr(l)))?r.index:l)).length)<m.length&&accept(c,m.charAt(l)))||e.preventDefault();}
for(var i in!/^(.)\^(.*)$/.test(m)&&(f.maxLength=m.length),{keypress:0,keyup:1})
addEvent(f,i,mask);};function apagaSelecao(campo,e){if(getSelectionEnd(campo)-getSelectionStart(campo)==campo.value.length){if((e.key>=65&&e.key<=90)||(e.key>=97&&e.key<=113)||(e.key>=48&&e.key<=57)){campo.value="";}}}
function ignoreKeys(e){if(e.key==9||e.key==16||(e.key>=37&&e.key<=40)){return true;}}
function getSelectionStart(field){if(field.disabled){return 0;}
if(document.selection){return Math.abs(document.selection.createRange().moveStart("character",-1000000));}else if(typeof(field.selectionStart)!="undefined"){var selStart=field.selectionStart;if(selStart==2147483647){selStart=0;}
return selStart;}
return 0;};function getSelectionEnd(field){if(field.disabled){return 0;}
if(document.selection){return field.value.length-Math.abs(document.selection.createRange().moveEnd("character",1000000));}else if(typeof(field.selectionEnd)!="undefined"){return field.selectionEnd;}
return 0;};function isEnter(campo,e){if(e.key==13){campo.form.submit();}}