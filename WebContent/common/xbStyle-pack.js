
function xbStyleNotSupported(){}
function xbStyleNotSupportStringValue(propname){xbDEBUG.dump(propname+' is not supported in this browser');return'';};function xbClipRect(a1,a2,a3,a4)
{this.top=0;this.right=0;this.bottom=0;this.left=0;if(typeof(a1)=='string')
{var val;var ca;var i;if(a1.indexOf('rect(')==0)
{ca=a1.substring(5,a1.length-1).match(/-?[0-9a-zA-Z]+/g);for(i=0;i<4;++i)
{val=xbToInt(ca[i]);if(val!=0&&ca[i].indexOf('px')==-1)
{xbDEBUG.dump('xbClipRect: A clipping region '+a1+' was detected that did not use pixels as units.  Click Ok to continue, Cancel to Abort');return;}
ca[i]=val;}
this.top=ca[0];this.right=ca[1];this.bottom=ca[2];this.left=ca[3];}}
else if(typeof(a1)=='number'&&typeof(a2)=='number'&&typeof(a3)=='number'&&typeof(a4)=='number')
{this.top=a1;this.right=a2;this.bottom=a3;this.left=a4;}}
xbClipRect.prototype.top=0;xbClipRect.prototype.right=0;xbClipRect.prototype.bottom=0;xbClipRect.prototype.left=0;function xbClipRectGetWidth()
{return this.right-this.left;}
xbClipRect.prototype.getWidth=xbClipRectGetWidth;function xbClipRectSetWidth(width)
{this.right=this.left+width;}
xbClipRect.prototype.setWidth=xbClipRectSetWidth;function xbClipRectGetHeight()
{return this.bottom-this.top;}
xbClipRect.prototype.getHeight=xbClipRectGetHeight;function xbClipRectSetHeight(height)
{this.bottom=this.top+height;}
xbClipRect.prototype.setHeight=xbClipRectSetHeight;function xbClipRectToString()
{return'rect('+this.top+'px '+this.right+'px '+this.bottom+'px '+this.left+'px )';}
xbClipRect.prototype.toString=xbClipRectToString;function xbStyle(obj,win,position)
{if(typeof(obj)=='object'&&typeof(obj.style)!='undefined')
this.styleObj=obj.style;else if(document.layers)
{if(typeof(position)=='undefined')
position='';this.styleObj=obj;this.styleObj.position=position;}
this.object=obj;this.window=win?win:window;}
xbStyle.prototype.styleObj=null;xbStyle.prototype.object=null;function xbStyleGetEffectiveValue(propname)
{var value=null;if(this.window.document.defaultView&&this.window.document.defaultView.getComputedStyle)
{var capIndex;var cappropname=propname;while((capIndex=cappropname.search(/[A-Z]/))!=-1)
{if(capIndex!=-1)
{cappropname=cappropname.substring(0,capIndex)+'-'+cappropname.substring(capIndex,capIndex+1).toLowerCase()+cappropname.substr(capIndex+1);}}
value=this.window.document.defaultView.getComputedStyle(this.object,'').getPropertyValue(cappropname);if(!value&&this.styleObj[propname])
{value=this.styleObj[propname];}}
else if(typeof(this.styleObj[propname])=='undefined')
{value=xbStyleNotSupportStringValue(propname);}
else if(typeof(this.object.currentStyle)!='undefined')
{value=this.object.currentStyle[propname];if(!value)
{value=this.styleObj[propname];}
if(propname=='clip'&&!value)
{value='rect('+this.object.currentStyle.clipTop+', '+this.object.currentStyle.clipRight+', '+this.object.currentStyle.clipBottom+', '+this.object.currentStyle.clipLeft+')';}}
else
{value=this.styleObj[propname];}
return value;}
function xbStyleMoveAbove(cont)
{this.setzIndex(cont.getzIndex()+1);}
function xbStyleMoveBelow(cont)
{var zindex=cont.getzIndex()-1;this.setzIndex(zindex);}
function xbStyleMoveBy(deltaX,deltaY)
{this.moveTo(this.getLeft()+deltaX,this.getTop()+deltaY);}
function xbStyleMoveTo(x,y)
{this.setLeft(x);this.setTop(y);}
function xbStyleMoveToAbsolute(x,y)
{this.setPageX(x);this.setPageY(y);}
function xbStyleResizeBy(deltaX,deltaY)
{this.setWidth(this.getWidth()+deltaX);this.setHeight(this.getHeight()+deltaY);}
function xbStyleResizeTo(x,y)
{this.setWidth(x);this.setHeight(y);}
xbStyle.prototype.getEffectiveValue=xbStyleGetEffectiveValue;xbStyle.prototype.moveAbove=xbStyleMoveAbove;xbStyle.prototype.moveBelow=xbStyleMoveBelow;xbStyle.prototype.moveBy=xbStyleMoveBy;xbStyle.prototype.moveTo=xbStyleMoveTo;xbStyle.prototype.moveToAbsolute=xbStyleMoveToAbsolute;xbStyle.prototype.resizeBy=xbStyleResizeBy;xbStyle.prototype.resizeTo=xbStyleResizeTo;if(document.all||document.getElementsByName)
{xblibrary.loadScript(getContextApp()+'/common/xbStyle-css.js');}
else if(document.layers)
{xblibrary.loadScript('xbStyle-nn4.js');}
else
{xblibrary.loadScript('xbStyle-not-supported.js');}