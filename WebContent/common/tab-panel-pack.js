
tabPanelArray=new Array(6);tabMenuArray=new Array(6);currentMenuIndex=0;var numeroDeTabs=6;var tabCount=0;var firstLoop=false;var doNavigate;var continueLoop=false;function bodyOnLoad()
{tabPanelArray[0]=getItemObj('tabPane0');tabPanelArray[1]=getItemObj('tabPane1');tabPanelArray[2]=getItemObj('tabPane2');tabPanelArray[3]=getItemObj('tabPane3');tabPanelArray[4]=getItemObj('tabPane4');tabPanelArray[5]=getItemObj('tabPane5');tabMenuArray[0]=getItemObj('tabMenu0');tabMenuArray[1]=getItemObj('tabMenu1');tabMenuArray[2]=getItemObj('tabMenu2');tabMenuArray[3]=getItemObj('tabMenu3');tabMenuArray[4]=getItemObj('tabMenu4');tabMenuArray[5]=getItemObj('tabMenu5');tabCount=currentMenuIndex;for(index=0;index<6;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);tabPanelArray[currentMenuIndex].style.visibility='hidden';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("condutorNome").focus();}else if(tabCount==2){document.getElementById("marcaNome").focus();}else if(tabCount==3){document.getElementById("premioLiquido").focus();}else if(tabCount==4){document.getElementById("grupoDeVendaId").focus();}else if(tabCount==5){document.getElementById("nroApolice").focus();}}
function getItemObj(itemId)
{obj=document.getElementById(itemId);if(obj==null)alert('Script Error: id='+itemId+' does not exist');return obj;}
function raisePanel(panelIndex){if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;tabCount=parseInt(panelIndex);if(alterado==true){document.getElementById("currentTabId").value=tabCount;salvarProposta();alterado=false;return false;}
for(index=0;index<6;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);tabPanelArray[currentMenuIndex].style.visibility='hidden';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("condutorNome").focus();}else if(tabCount==2){document.getElementById("marcaNome").focus();}else if(tabCount==3){document.getElementById("premioLiquido").focus();}else if(tabCount==4){document.getElementById("grupoDeVendaId").focus();}else if(tabCount==5){document.getElementById("nroApolice").focus();}
currentMenuIndex=tabCount;document.getElementById("currentTabId").value=tabCount;return true;}
function navigate(type){if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;if(type=="proximo"||type=="anterior"){continueLoop=false}
if((type=="proximo"&&((tabCount+1)<numeroDeTabs))||(type=="anterior"&&((tabCount-1)>-1))){if(type=="proximo")
tabCount++;else
tabCount--;if(alterado==true){document.getElementById("currentTabId").value=tabCount;salvarProposta();alterado=false;return false;}
for(index=0;index<6;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);tabPanelArray[index].style.visibility='visible';if(type=="proximo")
tabPanelArray[index-1].style.visibility='hidden';else
tabPanelArray[index+1].style.visibility='hidden';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("condutorNome").focus();}else if(tabCount==2){document.getElementById("marcaNome").focus();}else if(tabCount==3){document.getElementById("premioLiquido").focus();}else if(tabCount==4){document.getElementById("grupoDeVendaId").focus();}else if(tabCount==5){document.getElementById("nroApolice").focus();}
document.getElementById("currentTabId").value=tabCount;currentMenuIndex=tabCount;}
if($('#blnPossuiPerfil').val()=='false'&&currentMenuIndex==1){navigate(type);}
return true;}
function raiseObject(target,level)
{safeMargin=8;obj=getItemObj('tabFiller');newWidth=obj.offsetWidth-safeMargin;if(newWidth<safeMargin)newWidth=safeMargin;target.style.width=newWidth+'px';newHeight=obj.offsetHeight-safeMargin;if(newHeight<safeMargin)newHeight=safeMargin;target.style.height=newHeight+'px';newTop=obj.offsetTop-34;target.style.top=newTop+'px';newLeft=obj.offsetLeft-4;target.style.left=newLeft+'px';target.style.zIndex=level;}
function mouseOut(menuIndex)
{if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenu';}
function mouseOver(menuIndex)
{if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenuOver';}