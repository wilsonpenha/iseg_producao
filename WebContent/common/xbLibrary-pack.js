
if(!document.getElementById||navigator.userAgent.indexOf('Opera')!=-1)
{window.onerror=defaultOnError;function defaultOnError(msg,url,line)
{if(typeof(msg)!='string')
{msg='unknown error';}
if(typeof(url)!='string')
{url=document.location;}
alert('An error has occurred at '+url+', line '+line+': '+msg);}}
function xbLibrary(path)
{this.path=path;}
xbLibrary.prototype.loadScript=function(scriptName)
{document.write('<script language="javascript" src="'+scriptName+'"><\/script>');};xblibrary=new xbLibrary('./');