
tabPanelArray=new Array(8);tabMenuArray=new Array(8);currentMenuIndex=0;var numeroDeTabs=6;var tabCount=0;var firstLoop=false;var doNavigate;var continueLoop=false;function bodyOnLoad(){tabPanelArray[0]=getItemObj('tabPane0');tabPanelArray[1]=getItemObj('tabPane1');tabPanelArray[2]=getItemObj('tabPane2');tabPanelArray[3]=getItemObj('tabPane3');tabPanelArray[4]=getItemObj('tabPane4');tabPanelArray[5]=getItemObj('tabPane5');if(numeroDeTabs==7)
tabPanelArray[6]=getItemObj('tabPane6');tabMenuArray[0]=getItemObj('tabMenu0');tabMenuArray[1]=getItemObj('tabMenu1');tabMenuArray[2]=getItemObj('tabMenu2');tabMenuArray[3]=getItemObj('tabMenu3');tabMenuArray[4]=getItemObj('tabMenu4');tabMenuArray[5]=getItemObj('tabMenu5');if(numeroDeTabs==7)
tabMenuArray[6]=getItemObj('tabMenu6');tabCount=currentMenuIndex;for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';tabPanelArray[currentMenuIndex].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
if(tabCount==0){$("#dataProposta").focus();}else if(tabCount==1){$("#descricaoRisco").focus();}else if(tabCount==2){$("#inicioVigencia").focus();}else if(tabCount==3){$("#nroApolice").focus();}else if(tabCount==4){$("#grupoDeVendaId").focus();}}
function getItemObj(itemId){obj=document.getElementById(itemId);if(obj==null)alert('Script Error: id='+itemId+' does not exist');return obj;}
function raisePanel(panelIndex){if($("#propostaId").val()==''){if($('#tipoCliente').val()=='0'){if(isEmpty('#clientePFNome')){$("#clientePFNome").focus();alert("O nome do segurado deve ser informado!");return false;}}else{if(isEmpty('#clientePJNome')){$("#clientePJNome").focus();alert("O nome do segurado deve ser informado!");return false;}}}
if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;tabCount=parseInt(panelIndex);if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
if(alterado==true||(tabCount==4&&$("#blnReloaded").val()=='false')){$("#currentTabId").val(tabCount);salvarProposta();alterado=false;if(tabCount==4)
$("#blnReloaded").val("true");return false;}
for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[currentMenuIndex].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';tabPanelArray[currentMenuIndex].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(tabCount==0){$("#dataProposta").focus();}else if(tabCount==1){$("#descricaoRisco").focus();}else if(tabCount==2){$("#inicioVigencia").focus();}else if(tabCount==3){$("#nroApolice").focus();}else if(tabCount==4){$("#grupoDeVendaId").focus();}
currentMenuIndex=tabCount;$("#currentTabId").val(tabCount);return true;}
function navigate(type){if($("#propostaId").val()==''){if($('#tipoCliente').val()=='0'){if(isEmpty('#clientePFNome')){$("#clientePFNome").focus();alert("O nome do segurado deve ser informado!");return false;}}else{if(isEmpty('#clientePJNome')){$("#clientePJNome").focus();alert("O nome do segurado deve ser informado!");return false;}}}
if(!ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_SEM_CONFIRMA))
return false;if(type=="proximo"||type=="anterior"){continueLoop=false}
if((type=="proximo"&&((tabCount+1)<numeroDeTabs))||(type=="anterior"&&((tabCount-1)>-1))){if(type=="proximo")
tabCount++;else
tabCount--;if(!editavel){$('.div_overlay').remove();protegerCampos(tabPanelArray[tabCount].id);}
if(alterado==true||(tabCount==4&&$("#blnReloaded").val()=='false')){$("#currentTabId").val(tabCount);salvarProposta();alterado=false;if(tabCount==4)
$("#blnReloaded").val("true");return false;}
for(index=0;index<numeroDeTabs;index++){if(index==tabCount){raiseObject(tabPanelArray[index],4);panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='visible';tabPanelArray[index].style.visibility='visible';if(type=="proximo"){tabPanelArray[index-1].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index-1].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';}else{tabPanelArray[index+1].style.visibility='hidden';panelReadOnly=document.getElementById('divReadonly_'+tabPanelArray[index+1].id+'_event');if(panelReadOnly!=null)
panelReadOnly.style.visibility='hidden';}
tabMenuArray[index].className='active';}else{raiseObject(tabPanelArray[index],2);tabMenuArray[index].className='inactive';}}
if(tabCount==0){$("#dataProposta").focus();}else if(tabCount==1){$("#descricaoRisco").focus();}else if(tabCount==2){$("#inicioVigencia").focus();}else if(tabCount==3){$("#nroApolice").focus();}else if(tabCount==4){$("#grupoDeVendaId").focus();}
$("#currentTabId").val(tabCount);currentMenuIndex=tabCount;}
return true;}
function raiseObject(target,level){safeMargin=8;obj=getItemObj('tabFiller');newWidth=obj.offsetWidth-safeMargin;if(newWidth<safeMargin)newWidth=safeMargin;target.style.width=newWidth+'px';newHeight=obj.offsetHeight-safeMargin;if(newHeight<safeMargin)newHeight=safeMargin;target.style.height=newHeight+'px';newTop=obj.offsetTop-34;target.style.top=newTop+'px';newLeft=obj.offsetLeft-4;target.style.left=newLeft+'px';target.style.zIndex=level;}
function mouseOut(menuIndex){if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenu';}
function mouseOver(menuIndex){if(menuIndex==currentMenuIndex)return true;tabMenuArray[menuIndex].className='tabMenuOver';}