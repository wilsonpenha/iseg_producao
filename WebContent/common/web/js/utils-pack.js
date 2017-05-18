
var baseFrameServlet="http://localhost:8880/openbravo/security/Login_FS.html";var gColorSelected="#c0c0c0";var gWhiteColor="#F2EEEE";var arrGeneralChange=new Array();var dateFormat;var defaultDateFormat="%d-%m-%Y";var gBotonPorDefecto;var gEnviado=false;var arrTeclas=null;var gAUXILIAR=0;var gWaitingCallOut=false;function focoPrimerControl(Formulario,Campo)
{var encontrado=false;if(Formulario==null)Formulario=document.forms[0];var total=Formulario.length;for(var i=0;i<total;i++)
{if((Formulario.elements[i].type!="hidden")&&(Formulario.elements[i].type!="button")&&(Formulario.elements[i].type!="submit")&&(Formulario.elements[i].type!="image")&&(Formulario.elements[i].type!="reset"))
{if(Campo!=null){if(Campo==Formulario.elements[i].name&&!Formulario.elements[i].readonly&&!Formulario.elements[i].disabled){Formulario.elements[i].focus();encontrado=true;break;}}else if(!Formulario.elements[i].readonly&&!Formulario.elements[i].disabled){try{Formulario.elements[i].focus();encontrado=true;break;}catch(ignore){}}}}
if(encontrado&&Formulario.elements[i].type&&Formulario.elements[i].type.indexOf("select")==-1)
Formulario.elements[i].select();}
function limpiar(Formulario)
{if(Formulario==null)
Formulario=document.forms[0];var total=Formulario.length;for(var i=0;i<total;i++){if(Formulario.elements[i].type=="text"||Formulario.elements[i].type=="password")
Formulario.elements[i].value="";}}
function pulsarTecla(CodigoTecla)
{if(gBotonPorDefecto!=null)
{var tecla=(!CodigoTecla)?window.event.keyCode:CodigoTecla.which;if(tecla==13)
{eval(gBotonPorDefecto);return false;}}
return true;}
function porDefecto(accion)
{gBotonPorDefecto=accion;if(!document.all)
{document.captureEvents(Event.KEYDOWN);}
document.onkeydown=pulsarTecla;return true;}
function updateMenuIcon(id){if(!top.frameMenu)return false;else{var frame=top.document;var frameset=frame.getElementById("framesetMenu");if(!frameset)return false;try{if(frameset.cols.substring(0,1)=="0")changeClass(id,"_hide","_show",true);else changeClass(id,"_show","_hide",true);}catch(ignored){}
return true;}}
function mostrarMenu(id){if(!top.frameMenu)window.open(baseFrameServlet,"_blank");else{var frame=top.document;var frameset=frame.getElementById("framesetMenu");if(!frameset)return false;if(frameset.cols.substring(0,1)=="0")frameset.cols="25%,*";else frameset.cols="0%,*";try{changeClass(id,"_hide","_show");}catch(e){}
return true;}}
function buttonMenuVisibility(id,visibility){if(!top.frameMenu){window.open(baseFrameServlet,"_blank");}else{var frame=top.document;var frameset=frame.getElementById("framesetMenu");if(!frameset){return false;}
if(visibility=='show'){frameset.cols="25%,*";}else{frameset.cols="0%,*";}
try{var element=document.getElementById(id);if(visibility=='hide'){element.className=element.className.replace("_hide","_show");}else if(visibility=='show'){element.className=element.className.replace("_show","_hide");}}catch(e){}
return true;}}
function changeClass(id,class1,class2,forced){if(forced==null)forced=false;var element=document.getElementById(id);if(!element)return false;if(element.className.indexOf(class1)!=-1)element.className=element.className.replace(class1,class2);else if(!forced&&element.className.indexOf(class2)!=-1)element.className=element.className.replace(class2,class1);return true;}
function getReference(id){if(document.getElementById)return document.getElementById(id);else if(document.all)return document.all[id];else if(document.layers)return document.layers[id];else return null;}
function getStyle(id){var ref=getReference(id);if(ref==null||!ref)return null;return((document.layers)?ref:ref.style);}
function findElementPosition(Formulario,name){var total=Formulario.length;for(var i=0;i<total;i++){if(Formulario.elements[i].name==name)return i;}
return null;}
function findFirstElement(Formulario){if(Formulario==null)return null;var n=null;var total=Formulario.length;for(var i=0;i<total;i++){if(Formulario.elements[i].name.indexOf("inpRecordW")==0){n=i;break;}}
return n;}
function setClass(id,selectClass){var obj=getReference(id);if(obj==null)return null;obj.className=selectClass;}
function setFocus(campo){if(campo==null||!campo)return"";if(!campo.type&&campo.length>1)campo=campo[0];try{campo.focus();}catch(ignored){}
return"";}
function round(number,X){X=(!X?2:X);if(!number||isNaN(number))return 0;return Math.round(number*Math.pow(10,X))/Math.pow(10,X);}
function selected(cal,date){cal.sel.value=date;if(cal.dateClicked&&(cal.sel.id=="sel1"||cal.sel.id=="sel3"))
cal.callCloseHandler();}
function closeHandler(cal){if(typeof(cal.sel.onchange)!="undefined")cal.sel.onchange();cal.sel.focus();cal.hide();_dynarch_popupCalendar=null;}
function getDateFormat(str_format){var format="";if(str_format!=null&&str_format!=""&&(str_format.substring(0,1)=="M"||str_format.substring(0,1)=="m")){format="%m-%d-%Y";}else if(str_format!=null&&str_format!=""&&(str_format.substring(0,1)=="D"||str_format.substring(0,1)=="d")){format="%d-%m-%Y";}
if(str_format==null||str_format=="")str_format=defaultDateFormat;else if(str_format.indexOf(" %H:%M:%S")!=-1)format+=" %H:%M:%S";else if(str_format.indexOf(" %H:%M")!=-1)format+=" %H:%M";return format;}
function about(){var complementosNS4=""
var strHeight=500;var strWidth=600;var strTop=parseInt((screen.height-strHeight)/2);var strLeft=parseInt((screen.width-strWidth)/2);if(navigator.appName.indexOf("Netscape"))
complementosNS4="alwaysRaised=1, dependent=1, directories=0, hotkeys=0, menubar=0, ";var complementos=complementosNS4+"height="+strHeight+", width="+strWidth+", left="+strLeft+", top="+strTop+", screenX="+strLeft+", screenY="+strTop+", location=0, resizable=yes, scrollbars=yes, status=0, toolbar=0, titlebar=0";var winPopUp=window.open(baseDirection+"../ad_forms/about.html","ABOUT",complementos);if(winPopUp!=null){winPopUp.focus();document.onunload=function(){winPopUp.close();};document.onmousedown=function(){winPopUp.close();};}
return winPopUp;}
function resizeArea(isOnResize){if(isOnResize==null)isOnResize=false;var mnu=document.getElementById("client");var mleft=document.getElementById("tdLeftTabsBars");var mleftSeparator=document.getElementById("tdleftSeparator");var mright=document.getElementById("tdrightSeparator");var mtop=document.getElementById("tdtopNavButtons");var mtopToolbar=document.getElementById("tdToolBar");var mtopTabs=document.getElementById("tdtopTabs");var mbottombut=document.getElementById("tdbottomButtons");var mbottom=document.getElementById("tdbottomSeparator");var body=document.getElementsByTagName("BODY");var h=body[0].clientHeight;var w=body[0].clientWidth;var name=window.navigator.appName;mnu.style.width=w-((mleft?mleft.clientWidth:0)+(mleftSeparator?mleftSeparator.clientWidth:0)+(mright?mright.clientWidth:0))-((name.indexOf("Microsoft")==-1)?2:0);mnu.style.height=h-((mtop?mtop.clientHeight:0)+(mtopToolbar?mtopToolbar.clientHeight:0)+(mtopTabs?mtopTabs.clientHeight:0)+(mbottom?mbottom.clientHeight:0)+(mbottombut?mbottombut.clientHeight:0))-((name.indexOf("Microsoft")==-1)?1:0);var mbottomButtons=document.getElementById("tdbottomButtons");if(mbottomButtons)mbottomButtons.style.width=w-((mleft?mleft.clientWidth:0)+(mleftSeparator?mleftSeparator.clientWidth:0)+(mright?mright.clientWidth:0))-((name.indexOf("Microsoft")==-1)?2:0);mnu.style.display="";}
function isValidEmail(pVal){var reTipo=/^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/;if(!reTipo.test(pVal.value)){alert('E-mail incorreto');pVal.value='';}}