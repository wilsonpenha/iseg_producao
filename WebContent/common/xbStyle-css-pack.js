
function cssStyleGetClip()
{var clip=this.getEffectiveValue('clip');if(clip=='rect()')
clip='';if(clip==''||clip=='auto')
{clip='rect(0px, '+this.getWidth()+'px, '+this.getHeight()+'px, 0px)';}
else
{clip=clip.replace(/px /g,'px, ');}
return clip;}
function cssStyleSetClip(sClipString)
{this.styleObj.clip=sClipString;}
function cssStyleGetClipTop()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.top;}
function cssStyleSetClipTop(top)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.top=top;this.styleObj.clip=rect.toString();}
function cssStyleGetClipRight()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.right;}
function cssStyleSetClipRight(right)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.right=right;this.styleObj.clip=rect.toString();}
function cssStyleGetClipBottom()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.bottom;}
function cssStyleSetClipBottom(bottom)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.bottom=bottom;this.styleObj.clip=rect.toString();}
function cssStyleGetClipLeft()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.left;}
function cssStyleSetClipLeft(left)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.left=left;this.styleObj.clip=rect.toString();}
function cssStyleGetClipWidth()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.getWidth();}
function cssStyleSetClipWidth(width)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.setWidth(width);this.styleObj.clip=rect.toString();}
function cssStyleGetClipHeight()
{var clip=this.getClip();var rect=new xbClipRect(clip);return rect.getHeight();}
function cssStyleSetClipHeight(height)
{var clip=this.getClip();var rect=new xbClipRect(clip);rect.setHeight(height);this.styleObj.clip=rect.toString();}
function cssStyleGetLeft()
{var left=this.getEffectiveValue('left');if(typeof(left)=='number')
return left;if(left!=''&&left.indexOf('px')==-1)
{xbDEBUG.dump('xbStyle.getLeft: Element ID='+this.object.id+' does not use pixels as units. left='+left+' Click Ok to continue, Cancel to Abort');return 0;}
if(top=='auto'&&this.object&&typeof(this.object.offsetTop)=='number')
{left=this.object.offsetTop+'px';}
if(left=='')
left='0px';return xbToInt(left);}
function cssStyleSetLeft(left)
{if(typeof(this.styleObj.left)=='number')
this.styleObj.left=left;else
this.styleObj.left=left+'px';}
function cssStyleGetTop()
{var top=this.getEffectiveValue('top');if(typeof(top)=='number')
return top;if(top!=''&&top.indexOf('px')==-1)
{xbDEBUG.dump('xbStyle.getTop: Element ID='+this.object.id+' does not use pixels as units. top='+top+' Click Ok to continue, Cancel to Abort');return 0;}
if(top=='auto'&&this.object&&typeof(this.object.offsetTop)=='number')
{top=this.object.offsetTop+'px';}
if(top=='')
top='0px';return xbToInt(top);}
function cssStyleSetTop(top)
{if(typeof(this.styleObj.top)=='number')
this.styleObj.top=top;else
this.styleObj.top=top+'px';}
function cssStyleGetPageX()
{var x=0;var elm=this.object;var elmstyle;var position;if(typeof(elm.offsetLeft)=='number')
{while(elm)
{x+=elm.offsetLeft;elm=elm.offsetParent;}}
else
{while(elm)
{if(elm.style)
{elmstyle=new xbStyle(elm);position=elmstyle.getEffectiveValue('position');if(position!=''&&position!='static')
x+=elmstyle.getLeft();}
elm=elm.parentNode;}}
return x;}
function cssStyleSetPageX(x)
{var xParent=0;var elm=this.object.parentNode;var elmstyle;var position;if(elm&&typeof(elm.offsetLeft)=='number')
{while(elm)
{xParent+=elm.offsetLeft;elm=elm.offsetParent;}}
else
{while(elm)
{if(elm.style)
{elmstyle=new xbStyle(elm);position=elmstyle.getEffectiveValue('position');if(position!=''&&position!='static')
xParent+=elmstyle.getLeft();}
elm=elm.parentNode;}}
x-=xParent;this.setLeft(x);}
function cssStyleGetPageY()
{var y=0;var elm=this.object;var elmstyle;var position;if(typeof(elm.offsetTop)=='number')
{while(elm)
{y+=elm.offsetTop;elm=elm.offsetParent;}}
else
{while(elm)
{if(elm.style)
{elmstyle=new xbStyle(elm);position=elmstyle.getEffectiveValue('position');if(position!=''&&position!='static')
y+=elmstyle.getTop();}
elm=elm.parentNode;}}
return y;}
function cssStyleSetPageY(y)
{var yParent=0;var elm=this.object.parentNode;var elmstyle;var position;if(elm&&typeof(elm.offsetTop)=='number')
{while(elm)
{yParent+=elm.offsetTop;elm=elm.offsetParent;}}
else
{while(elm)
{if(elm.style)
{elmstyle=new xbStyle(elm);position=elmstyle.getEffectiveValue('position');if(position!=''&&position!='static')
yParent+=elmstyle.getTop();}
elm=elm.parentNode;}}
y-=yParent;this.setTop(y);}
function cssStyleGetHeight()
{var display=this.getEffectiveValue('display');var height=this.getEffectiveValue('height');if(typeof(height)=='number')
{return height;}
if(height==''||height=='auto'||height.indexOf('%')!=-1)
{if(typeof(this.object.offsetHeight)=='number')
{height=this.object.offsetHeight+'px';}
else if(typeof(this.object.scrollHeight)=='number')
{height=this.object.scrollHeight+'px';}}
if(height.indexOf('px')==-1)
{xbDEBUG.dump('xbStyle.getHeight: Element ID='+this.object.id+' does not use pixels as units. height='+height+' Click Ok to continue, Cancel to Abort');return 0;}
height=xbToInt(height);return height;}
function cssStyleSetHeight(height)
{if(typeof(this.styleObj.height)=='number')
this.styleObj.height=height;else{if(height<=0){this.styleObj.height=oldHeight;}else{oldHeight=height;this.styleObj.height=height.toString()+'px';}}}
function cssStyleGetWidth()
{var display=this.getEffectiveValue('display');var width=this.getEffectiveValue('width');if(typeof(width)=='number')
{if(navigator.userAgent.indexOf('Opera')!=-1)
return this.object.clientWidth;else
return width;}
if(width==''||width=='auto'||width.indexOf('%')!=-1)
{if(typeof(this.object.offsetWidth)=='number')
{width=this.object.offsetWidth+'px';}
else if(typeof(this.object.scrollHeight)=='number')
{width=this.object.scrollWidth+'px';}}
if(width.indexOf('px')==-1)
{xbDEBUG.dump('xbStyle.getWidth: Element ID='+this.object.id+' does not use pixels as units. width='+width+' Click Ok to continue, Cancel to Abort');return 0;}
width=xbToInt(width);return width;}
function cssStyleSetWidth(width)
{if(typeof(this.styleObj.width)=='number')
this.styleObj.width=width;else
this.styleObj.width=width+'px';}
function cssStyleGetVisibility()
{return this.getEffectiveValue('visibility');}
function cssStyleSetVisibility(visibility)
{this.styleObj.visibility=visibility;}
function cssStyleGetzIndex()
{return xbToInt(this.getEffectiveValue('zIndex'));}
function cssStyleSetzIndex(zIndex)
{this.styleObj.zIndex=zIndex;}
function cssStyleGetBackgroundColor()
{return this.getEffectiveValue('backgroundColor');}
function cssStyleSetBackgroundColor(color)
{this.styleObj.backgroundColor=color;}
function cssStyleGetColor()
{return this.getEffectiveValue('color');}
function cssStyleSetColor(color)
{this.styleObj.color=color;}
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
function xbSetInnerHTML(str)
{if(typeof(this.object.innerHTML)!='undefined')
this.object.innerHTML=str;}
function cssStyleGetBorderTopWidth()
{return xbToInt(this.getEffectiveValue('borderTopWidth'));}
function cssStyleGetBorderRightWidth()
{return xbToInt(this.getEffectiveValue('borderRightWidth'));}
function cssStyleGetBorderBottomWidth()
{return xbToInt(this.getEffectiveValue('borderBottomWidth'));}
function cssStyleGetBorderLeftWidth()
{return xbToInt(this.getEffectiveValue('borderLeftWidth'));}
function cssStyleGetMarginTop()
{return xbToInt(this.getEffectiveValue('marginTop'));}
function cssStyleGetMarginRight()
{return xbToInt(this.getEffectiveValue('marginRight'));}
function cssStyleGetMarginBottom()
{return xbToInt(this.getEffectiveValue('marginBottom'));}
function cssStyleGetMarginLeft()
{return xbToInt(this.getEffectiveValue('marginLeft'));}
function cssStyleGetPaddingTop()
{return xbToInt(this.getEffectiveValue('paddingTop'));}
function cssStyleGetPaddingRight()
{return xbToInt(this.getEffectiveValue('paddingRight'));}
function cssStyleGetPaddingBottom()
{return xbToInt(this.getEffectiveValue('paddingBottom'));}
function cssStyleGetPaddingLeft()
{return xbToInt(this.getEffectiveValue('paddingLeft'));}
function cssStyleGetClientWidth()
{return this.getWidth()+this.getPaddingLeft()+this.getPaddingRight();}
function cssStyleGetClientHeight()
{return this.getHeight()+this.getPaddingTop()+this.getPaddingBottom();}
function sleep(){return;}
xbStyle.prototype.getClip=cssStyleGetClip;xbStyle.prototype.setClip=cssStyleSetClip;xbStyle.prototype.getClipTop=cssStyleGetClipTop;xbStyle.prototype.setClipTop=cssStyleSetClipTop;xbStyle.prototype.getClipRight=cssStyleGetClipRight;xbStyle.prototype.setClipRight=cssStyleSetClipRight;xbStyle.prototype.getClipBottom=cssStyleGetClipBottom;xbStyle.prototype.setClipBottom=cssStyleSetClipBottom;xbStyle.prototype.getClipLeft=cssStyleGetClipLeft;xbStyle.prototype.setClipLeft=cssStyleSetClipLeft;xbStyle.prototype.getClipWidth=cssStyleGetClipWidth;xbStyle.prototype.setClipWidth=cssStyleSetClipWidth;xbStyle.prototype.getClipHeight=cssStyleGetClipHeight;xbStyle.prototype.setClipHeight=cssStyleSetClipHeight;xbStyle.prototype.getLeft=cssStyleGetLeft;xbStyle.prototype.setLeft=cssStyleSetLeft;xbStyle.prototype.getTop=cssStyleGetTop;xbStyle.prototype.setTop=cssStyleSetTop;xbStyle.prototype.getPageX=cssStyleGetPageX;xbStyle.prototype.setPageX=cssStyleSetPageX;xbStyle.prototype.getPageY=cssStyleGetPageY;xbStyle.prototype.setPageY=cssStyleSetPageY;xbStyle.prototype.getVisibility=cssStyleGetVisibility;xbStyle.prototype.setVisibility=cssStyleSetVisibility;xbStyle.prototype.getzIndex=cssStyleGetzIndex;xbStyle.prototype.setzIndex=cssStyleSetzIndex;xbStyle.prototype.getHeight=cssStyleGetHeight;xbStyle.prototype.setHeight=cssStyleSetHeight;xbStyle.prototype.getWidth=cssStyleGetWidth;xbStyle.prototype.setWidth=cssStyleSetWidth;xbStyle.prototype.getBackgroundColor=cssStyleGetBackgroundColor;xbStyle.prototype.setBackgroundColor=cssStyleSetBackgroundColor;xbStyle.prototype.getColor=cssStyleGetColor;xbStyle.prototype.setColor=cssStyleSetColor;xbStyle.prototype.setInnerHTML=xbSetInnerHTML;xbStyle.prototype.getBorderTopWidth=cssStyleGetBorderTopWidth;xbStyle.prototype.getBorderRightWidth=cssStyleGetBorderRightWidth;xbStyle.prototype.getBorderBottomWidth=cssStyleGetBorderBottomWidth;xbStyle.prototype.getBorderLeftWidth=cssStyleGetBorderLeftWidth;xbStyle.prototype.getMarginLeft=cssStyleGetMarginLeft;xbStyle.prototype.getMarginTop=cssStyleGetMarginTop;xbStyle.prototype.getMarginRight=cssStyleGetMarginRight;xbStyle.prototype.getMarginBottom=cssStyleGetMarginBottom;xbStyle.prototype.getMarginLeft=cssStyleGetMarginLeft;xbStyle.prototype.getPaddingTop=cssStyleGetPaddingTop;xbStyle.prototype.getPaddingRight=cssStyleGetPaddingRight;xbStyle.prototype.getPaddingBottom=cssStyleGetPaddingBottom;xbStyle.prototype.getPaddingLeft=cssStyleGetPaddingLeft;xbStyle.prototype.getClientWidth=cssStyleGetClientWidth;xbStyle.prototype.getClientHeight=cssStyleGetClientHeight;var oldHeight=0;