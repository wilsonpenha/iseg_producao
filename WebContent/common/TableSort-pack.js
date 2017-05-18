
if(typeof HTMLElement!="undefined"&&!HTMLElement.prototype.insertAdjacentElement){HTMLElement.prototype.insertAdjacentElement=function(where,parsedNode){switch(where){case'beforeBegin':this.parentNode.insertBefore(parsedNode,this)
break;case'afterBegin':this.insertBefore(parsedNode,this.firstChild);break;case'beforeEnd':this.appendChild(parsedNode);break;case'afterEnd':if(this.nextSibling)
this.parentNode.insertBefore(parsedNode,this.nextSibling);else this.parentNode.appendChild(parsedNode);break;}}
HTMLElement.prototype.insertAdjacentHTML=function(where,htmlStr){var r=this.ownerDocument.createRange();r.setStartBefore(this);var parsedHTML=r.createContextualFragment(htmlStr);this.insertAdjacentElement(where,parsedHTML)}
HTMLElement.prototype.insertAdjacentText=function(where,txtStr){var parsedText=document.createTextNode(txtStr)
this.insertAdjacentElement(where,parsedText)}}
currentCol=0;previousCol=-1;var counter=0;var dateCol=6;function CompareAlpha(a,b){if(a[currentCol]<b[currentCol]){return-1;}
if(a[currentCol]>b[currentCol]){return 1;}
window.status='sn:'+counter++;return 0;}
function CompareAlphaAscending(a,b){if(a[currentCol]<b[currentCol]){return-1;}
if(a[currentCol]>b[currentCol]){return 1;}
if(a[currentCol]==b[currentCol]){datA=new Date(a[dateCol]);datB=new Date(b[dateCol]);if(datA<datB){return 1;}
else{if(datA>datB){return-1;}
else{return 0;}}}
window.status='sn:'+counter++;return 0;}
function CompareAlphaDescending(a,b){if(a[currentCol]<b[currentCol]){return 1;}
if(a[currentCol]>b[currentCol]){return-1;}
if(a[currentCol]==b[currentCol]){datA=new Date(a[dateCol]);datB=new Date(b[dateCol]);if(datA<datB){return 1;}
else{if(datA>datB){return-1;}
else{return 0;}}}
window.status='sn:'+counter++;return 0;}
function CompareAlphaIgnore(a,b){strA=a[currentCol].toLowerCase();strB=b[currentCol].toLowerCase();if(strA<strB){return-1;}
else{if(strA>strB){return 1;}
else{return 0;}}}
function CompareAlphaIgnoreArray(a,b){strA=a.toLowerCase();strB=b.toLowerCase();if(strA<strB){return-1;}
else{if(strA>strB){return 1;}
else{return 0;}}}
function CompareAlphaIgnoreDescending(a,b){strA=a[currentCol].toLowerCase();strB=b[currentCol].toLowerCase();if(strA>strB){return-1;}
else{if(strA<strB){return 1;}
else{return 0;}}}
function CompareAlphaIgnoreAscending(a,b){strA=a[currentCol].toLowerCase();strB=b[currentCol].toLowerCase();if(strA<strB){return-1;}
else{if(strA>strB){return 1;}
else{return 0;}}}
function CompareDate(a,b){datA=new Date(a[currentCol]);datB=new Date(b[currentCol]);if(datA<datB){return-1;}
else{if(datA>datB){return 1;}
else{return 0;}}}
function CompareDateAscending(a,b){if(isDate(a[currentCol])){datA=new Date(a[currentCol]);}else{datA=new Date("01/01/2200");}
if(isDate(b[currentCol])){datB=new Date(b[currentCol]);}else{datB=new Date("01/01/2200");}
if(datA<datB){return-1;}
else{if(datA>datB){return 1;}
else{return 0;}}}
function CompareDateDescending(a,b){if(isDate(a[currentCol])){datA=new Date(a[currentCol]);}else{datA=new Date("01/01/1000");}
if(isDate(b[currentCol])){datB=new Date(b[currentCol]);}else{datB=new Date("01/01/1000");}
if(datA<datB){return 1;}
else{if(datA>datB){return-1;}
else{return 0;}}}
function isDate(dateStr){var datePat=/^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4}|\d{2})$/;var matchArray=dateStr.match(datePat);if(matchArray==null){return false;}
month=matchArray[1];day=matchArray[3];year=matchArray[5];if(month<1||month>12){return false;}
if(day<1||day>31){return false;}
if((month==4||month==6||month==9||month==11)&&day==31){return false;}
if(month==2){var isleap=(year%4==0&&(year%100!=0||year%400==0));if(day>29||(day==29&&!isleap)){return false;}}
return true;}
function CompareDateEuro(a,b){strA=a[currentCol].split(".");strB=b[currentCol].split(".")
datA=new Date(strA[2],strA[1],strA[0]);datB=new Date(strB[2],strB[1],strB[0]);if(datA<datB){return-1;}
else{if(datA>datB){return 1;}
else{return 0;}}}
function CompareNumeric(a,b){numA=a[currentCol]
numB=b[currentCol]
if(isNaN(numA)){return 0;}
else{if(isNaN(numB)){return 0;}
else{return numA-numB;}}}
function CompareDateEuroAscending(a,b){strA=a[currentCol].split("/");strB=b[currentCol].split("/")
datA=new Date(strA[2],strA[1]-1,strA[0]);if(isNaN(datA)){datA=new Date(2100,1,1);}
datB=new Date(strB[2],strB[1]-1,strB[0]);if(isNaN(datB)){datB=new Date(2100,1,1);}
if(datA<datB){return-1;}
else{if(datA>datB){return 1;}
else{return 0;}}}
function CompareDateEuroDescending(a,b){strA=a[currentCol].split("/");strB=b[currentCol].split("/")
datA=new Date(strA[2],strA[1],strA[0]);if(isNaN(datA)){datA=new Date(1900,1,1);}
datB=new Date(strB[2],strB[1],strB[0]);if(isNaN(datB)){datB=new Date(1900,1,1);}
if(datA<datB){return 1;}
else{if(datA>datB){return-1;}
else{return 0;}}}
function CompareDateCustomAscending(a,b){strA=a[currentCol].split("-");strB=b[currentCol].split("-")
datA=new Date(strA[2],GetMonthNumber(strA[1])-1,strA[0]);if(isNaN(datA)){datA=new Date(2100,1,1);}
datB=new Date(strB[2],GetMonthNumber(strB[1])-1,strB[0]);if(isNaN(datB)){datB=new Date(2100,1,1);}
if(datA<datB){return-1;}
else{if(datA>datB){return 1;}
else{return 0;}}}
function CompareDateCustomDescending(a,b){strA=a[currentCol].split("-");strB=b[currentCol].split("-")
datA=new Date(strA[2],GetMonthNumber(strA[1]),strA[0]);if(isNaN(datA)){datA=new Date(1900,1,1);}
datB=new Date(strB[2],GetMonthNumber(strB[1]),strB[0]);if(isNaN(datB)){datB=new Date(1900,1,1);}
if(datA<datB){return 1;}
else{if(datA>datB){return-1;}
else{return 0;}}}
function CompareNumericAscending(a,b){numA=parseInt(a[currentCol]);numB=parseInt(b[currentCol]);if(isNaN(numA)){numA=-1;}
if(isNaN(numB)){numB=-1;}
if(numA<numB){return-1;}
else{if(numA>numB){return 1;}
else{return 0;}}}
function CompareNumericDescending(a,b){numA=parseInt(a[currentCol]);numB=parseInt(b[currentCol]);if(isNaN(numA)){numA=-1;}
if(isNaN(numB)){numB=-1;}
if(numA>numB){return-1;}
else{if(numA<numB){return 1;}
else{return 0;}}}
function TableSort(myTable,myCol,myType,sRow,cf){if(!document.getElementById("WaitMessageId")){waitWindow()}
var startRow=1;if(sRow=='undefined'){startRow=1;}else{if(sRow==0){startRow=0;}
if(sRow==1){startRow=1;}}
counter=0;var mySource=document.getElementById(myTable);var myRows=mySource.rows.length;var myCols=mySource.rows[0].cells.length;currentCol=myCol;myArray=new Array(myRows);for(i=startRow;i<myRows;i++){myArray[i]=new Array(myCols);for(j=0;j<myCols;j++){myArray[i][j]=mySource.rows[i].cells[j].innerHTML;}}
switch(myType){case"a":myArray.sort(CompareAlpha);break;case"aa":myArray.sort(CompareAlphaIgnoreAscending);break;case"ad":myArray.sort(CompareAlphaIgnoreDescending);break;case"ai":myArray.sort(CompareAlphaIgnore);break;case"d":myArray.sort(CompareDate);break;case"da":myArray.sort(CompareDateAscending);break;case"dd":myArray.sort(CompareDateDescending);break;case"de":myArray.sort(CompareDateEuro);break;case"dea":myArray.sort(CompareDateEuroAscending);break;case"ded":myArray.sort(CompareDateEuroDescending);break;case"ca":myArray.sort(CompareDateCustomAscending);break;case"cd":myArray.sort(CompareDateCustomDescending);break;case"n":myArray.sort(CompareNumeric);break;case"na":myArray.sort(CompareNumericAscending);break;case"nd":myArray.sort(CompareNumericDescending);break;default:myArray.sort();}
for(i=startRow;i<myRows;i++){for(j=0;j<myCols;j++){if(startRow==1){mySource.rows[i].cells[j].innerHTML=myArray[i-1][j];}else{mySource.rows[i].cells[j].innerHTML=myArray[i][j];}}}
previousCol=myCol;if(cf=='view'){if(!document.getElementById("WaitMessageId")){waitWindow()}
document.getElementById("WaitMessageId").style.display="none";}
return 0;}
function TableSortWait(TableName,StartRow,SortType,IncludeFirstRow){if(!document.getElementById("WaitMessageId")){waitWindow()}
document.getElementById("WaitMessageId").style.display="block";setTimeout("TableSort(\""+TableName+"\",\""+StartRow+"\",\""+SortType+"\",\""+IncludeFirstRow+"\",'view')",'500');}
function waitWindow(){str=' <DIV class="Wait" id="WaitMessageId" style="cursor:wait; display:none;"> '
str+='<DIV class="waitTable" style="position:absolute;top:200px;left:400px">'
str+='<TABLE BGCOLOR="#000000" BORDER="1" BORDERCOLOR="#000000" CELLPADDING="0" CELLSPACING="0" HEIGHT="50" WIDTH="150">'
str+='<TR>'
str+='<TD WIDTH="100%" HEIGHT="100%" BGCOLOR="#CCCCCC" ALIGN="CENTER" VALIGN="MIDDLE">'
str+='<FONT FACE="Verdana" SIZE="1" COLOR="#000066"><B>&nbsp;&nbsp;&nbsp;&nbsp;Ordenando...</B></FONT><hr> &nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="common/images/PleaseWait.gif" BORDER="1" HEIGHT="10" WIDTH="100"><BR>'
str+='<br>'
str+='</TD>'
str+='</TR>'
str+='</TABLE>'
str+='</DIV>'
str+='</DIV>'
document.body.insertAdjacentHTML("beforeEnd",str)}
function GetMonthNumber(vl){switch(vl.toLowerCase()){case"jan":return 1;break;case"feb":return 2;break;case"mar":return 3;break;case"apr":return 4;break;case"may":return 5;break;case"jun":return 6;break;case"jul":return 7;break;case"aug":return 8;break;case"sep":return 9;break;case"oct":return 10;break;case"nov":return 11;break;case"dec":return 12;break;default:return 0;}}