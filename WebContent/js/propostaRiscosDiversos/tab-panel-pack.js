
tabPanelArray=new Array(5);tabMenuArray=new Array(5);currentMenuIndex=0;var numeroDeTabs=5;var tabCount=0;var firstLoop=false;var doNavigate;var continueLoop=false;function bodyOnLoad(){tabPanelArray[0]=getItemObj('tabPane0');tabPanelArray[1]=getItemObj('tabPane1');tabPanelArray[2]=getItemObj('tabPane2');tabPanelArray[3]=getItemObj('tabPane3');tabPanelArray[4]=getItemObj('tabPane4');if(numeroDeTabs==6)
tabPanelArray[5]=getItemObj('tabPane5');tabMenuArray[0]=getItemObj('tabMenu0');tabMenuArray[1]=getItemObj('tabMenu1');tabMenuArray[2]=getItemObj('tabMenu2');tabMenuArray[3]=getItemObj('tabMenu3');tabMenuArray[4]=getItemObj('tabMenu4');if(numeroDeTabs==6)
tabMenuArray[5]=getItemObj('tabMenu5');tabCount=currentMenuIndex;if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';tabPanelArray[currentMenuIndex].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(editavel){if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("cepRis").focus();}else if(tabCount==2){document.getElementById("premioLiquido").focus();}else if(tabCount==3){document.getElementById("nroApolice").focus();}else if(tabCount==4){document.getElementById("grupoDeVendaId").focus();}}}
function getItemObj(itemId){obj=document.getElementById(itemId);if(obj==null)alert('Script Error: id='+itemId+' does not exist');return obj;}
function raisePanel(panelIndex){if($("#propostaId").val()==''){if($('#tipoCliente').val()=='0'){if(isEmpty('#clientePFNome')){$("#clientePFNome").focus();alert("O nome do segurado deve ser informado!");return false;}}else{if(isEmpty('#clientePJNome')){$("#clientePJNome").focus();alert("O nome do segurado deve ser informado!");return false;}}}
if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;tabCount=parseInt(panelIndex);if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
if(alterado==true){document.getElementById("currentTabId").value=tabCount;salvarProposta();alterado=false;return false;}
for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';tabPanelArray[currentMenuIndex].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(editavel){if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("cepRis").focus();}else if(tabCount==2){document.getElementById("premioLiquido").focus();}else if(tabCount==3){document.getElementById("nroApolice").focus();}else if(tabCount==4){document.getElementById("grupoDeVendaId").focus();}}
currentMenuIndex=tabCount;document.getElementById("currentTabId").value=tabCount;return true;}
function navigate(type){if($("#propostaId").val()==''){if($('#tipoCliente').val()=='0'){if(isEmpty('#clientePFNome')){$("#clientePFNome").focus();alert("O nome do segurado deve ser informado!");return false;}}else{if(isEmpty('#clientePJNome')){$("#clientePJNome").focus();alert("O nome do segurado deve ser informado!");return false;}}}
if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;if(type=="proximo"||type=="anterior"){continueLoop=false}
if((type=="proximo"&&((tabCount+1)<numeroDeTabs))||(type=="anterior"&&((tabCount-1)>-1))){if(type=="proximo")
tabCount++;else
tabCount--;if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
if(alterado==true){document.getElementById("currentTabId").value=tabCount;salvarProposta();alterado=false;return false;}
for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';if(type=="proximo"){tabPanelArray[index-1].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index-1].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';}else{tabPanelArray[index+1].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index+1].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';}
tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(editavel){if(tabCount==0){document.getElementById("dataProposta").focus();}else if(tabCount==1){document.getElementById("cepRis").focus();}else if(tabCount==2){document.getElementById("premioLiquido").focus();}else if(tabCount==3){document.getElementById("nroApolice").focus();}else if(tabCount==4){setTimeout(function(){document.getElementById("grupoDeVendaId").focus();},1000);}}
document.getElementById("currentTabId").value=tabCount;currentMenuIndex=tabCount;}
return true;}
function raiseObject(target,level){safeMargin=8;obj=getItemObj('tabFiller');newWidth=obj.offsetWidth-safeMargin;if(newWidth<safeMargin)newWidth=safeMargin;target.style.width=newWidth+'px';newHeight=obj.offsetHeight-safeMargin;if(newHeight<safeMargin)newHeight=safeMargin;target.style.height=newHeight+'px';newTop=obj.offsetTop-34;target.style.top=newTop+'px';newLeft=obj.offsetLeft-4;target.style.left=newLeft+'px';target.style.zIndex=level;}
function mouseOut(menuIndex){if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenu';}
function mouseOver(menuIndex){if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenuOver';}