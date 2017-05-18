
(function($){var height=$.fn.height,width=$.fn.width;$.fn.extend({height:function(){if(this[0]==window)
return self.innerHeight||$.boxModel&&document.documentElement.clientHeight||document.body.clientHeight;if(this[0]==document)
return Math.max(document.body.scrollHeight,document.body.offsetHeight);return height.apply(this,arguments);},width:function(){if(this[0]==window)
return self.innerWidth||$.boxModel&&document.documentElement.clientWidth||document.body.clientWidth;if(this[0]==document)
return Math.max(document.body.scrollWidth,document.body.offsetWidth);return width.apply(this,arguments);},innerHeight:function(){return this[0]==window||this[0]==document?this.height():this.is(':visible')?this[0].offsetHeight-num(this,'borderTopWidth')-num(this,'borderBottomWidth'):this.height()+num(this,'paddingTop')+num(this,'paddingBottom');},innerWidth:function(){return this[0]==window||this[0]==document?this.width():this.is(':visible')?this[0].offsetWidth-num(this,'borderLeftWidth')-num(this,'borderRightWidth'):this.width()+num(this,'paddingLeft')+num(this,'paddingRight');},outerHeight:function(){return this[0]==window||this[0]==document?this.height():this.is(':visible')?this[0].offsetHeight:this.height()+num(this,'borderTopWidth')+num(this,'borderBottomWidth')+num(this,'paddingTop')+num(this,'paddingBottom');},outerWidth:function(){return this[0]==window||this[0]==document?this.width():this.is(':visible')?this[0].offsetWidth:this.width()+num(this,'borderLeftWidth')+num(this,'borderRightWidth')+num(this,'paddingLeft')+num(this,'paddingRight');},scrollLeft:function(val){if(val!=undefined)
return this.each(function(){if(this==window||this==document)
window.scrollTo(val,$(window).scrollTop());else
this.scrollLeft=val;});if(this[0]==window||this[0]==document)
return self.pageXOffset||$.boxModel&&document.documentElement.scrollLeft||document.body.scrollLeft;return this[0].scrollLeft;},scrollTop:function(val){if(val!=undefined)
return this.each(function(){if(this==window||this==document)
window.scrollTo($(window).scrollLeft(),val);else
this.scrollTop=val;});if(this[0]==window||this[0]==document)
return self.pageYOffset||$.boxModel&&document.documentElement.scrollTop||document.body.scrollTop;return this[0].scrollTop;},position:function(options,returnObject){var elem=this[0],parent=elem.parentNode,op=elem.offsetParent,options=$.extend({margin:false,border:false,padding:false,scroll:false},options||{}),x=elem.offsetLeft,y=elem.offsetTop,sl=elem.scrollLeft,st=elem.scrollTop;if($.browser.mozilla||$.browser.msie){x+=num(elem,'borderLeftWidth');y+=num(elem,'borderTopWidth');}
if($.browser.mozilla){do{if($.browser.mozilla&&parent!=elem&&$.css(parent,'overflow')!='visible'){x+=num(parent,'borderLeftWidth');y+=num(parent,'borderTopWidth');}
if(parent==op)break;}while((parent=parent.parentNode)&&(parent.tagName.toLowerCase()!='body'||parent.tagName.toLowerCase()!='html'));}
var returnValue=handleOffsetReturn(elem,options,x,y,sl,st);if(returnObject){$.extend(returnObject,returnValue);return this;}
else{return returnValue;}},offset:function(options,returnObject){var x=0,y=0,sl=0,st=0,elem=this[0],parent=this[0],op,parPos,elemPos=$.css(elem,'position'),mo=$.browser.mozilla,ie=$.browser.msie,sf=$.browser.safari,oa=$.browser.opera,absparent=false,relparent=false,options=$.extend({margin:true,border:false,padding:false,scroll:true,lite:false},options||{});if(options.lite)return this.offsetLite(options,returnObject);if(elem.tagName.toLowerCase()=='body'){x=elem.offsetLeft;y=elem.offsetTop;if(mo){x+=num(elem,'marginLeft')+(num(elem,'borderLeftWidth')*2);y+=num(elem,'marginTop')+(num(elem,'borderTopWidth')*2);}else
if(oa){x+=num(elem,'marginLeft');y+=num(elem,'marginTop');}else
if(ie&&jQuery.boxModel){x+=num(elem,'borderLeftWidth');y+=num(elem,'borderTopWidth');}}else{do{parPos=$.css(parent,'position');x+=parent.offsetLeft;y+=parent.offsetTop;if(mo||ie){x+=num(parent,'borderLeftWidth');y+=num(parent,'borderTopWidth');if(mo&&parPos=='absolute')absparent=true;if(ie&&parPos=='relative')relparent=true;}
op=parent.offsetParent;if(options.scroll||mo){do{if(options.scroll){sl+=parent.scrollLeft;st+=parent.scrollTop;}
if(mo&&parent!=elem&&$.css(parent,'overflow')!='visible'){x+=num(parent,'borderLeftWidth');y+=num(parent,'borderTopWidth');}
parent=parent.parentNode;}while(parent!=op);}
parent=op;if(parent.tagName.toLowerCase()=='body'||parent.tagName.toLowerCase()=='html'){if((sf||(ie&&$.boxModel))&&elemPos!='absolute'&&elemPos!='fixed'){x+=num(parent,'marginLeft');y+=num(parent,'marginTop');}
if((mo&&!absparent&&elemPos!='fixed')||(ie&&elemPos=='static'&&!relparent)){x+=num(parent,'borderLeftWidth');y+=num(parent,'borderTopWidth');}
break;}}while(parent);}
var returnValue=handleOffsetReturn(elem,options,x,y,sl,st);if(returnObject){$.extend(returnObject,returnValue);return this;}
else{return returnValue;}},offsetLite:function(options,returnObject){var x=0,y=0,sl=0,st=0,parent=this[0],op,options=$.extend({margin:true,border:false,padding:false,scroll:true},options||{});do{x+=parent.offsetLeft;y+=parent.offsetTop;op=parent.offsetParent;if(options.scroll){do{sl+=parent.scrollLeft;st+=parent.scrollTop;parent=parent.parentNode;}while(parent!=op);}
parent=op;}while(parent&&parent.tagName.toLowerCase()!='body'&&parent.tagName.toLowerCase()!='html');var returnValue=handleOffsetReturn(this[0],options,x,y,sl,st);if(returnObject){$.extend(returnObject,returnValue);return this;}
else{return returnValue;}}});var num=function(el,prop){return parseInt($.css(el.jquery?el[0]:el,prop))||0;};var handleOffsetReturn=function(elem,options,x,y,sl,st){if(!options.margin){x-=num(elem,'marginLeft');y-=num(elem,'marginTop');}
if(options.border&&($.browser.safari||$.browser.opera)){x+=num(elem,'borderLeftWidth');y+=num(elem,'borderTopWidth');}else if(!options.border&&!($.browser.safari||$.browser.opera)){x-=num(elem,'borderLeftWidth');y-=num(elem,'borderTopWidth');}
if(options.padding){x+=num(elem,'paddingLeft');y+=num(elem,'paddingTop');}
if(options.scroll){sl-=elem.scrollLeft;st-=elem.scrollTop;}
return options.scroll?{top:y-st,left:x-sl,scrollTop:st,scrollLeft:sl}:{top:y,left:x};};})(jQuery);