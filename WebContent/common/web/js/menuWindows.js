function setClick(event){
	var source = event.target ? event.target : event.srcElement;
	if(source.id.match("nav") != null){
		var conteudo = document.getElementById(source.id+"Sub");
		if(conteudo != null){
			if(conteudo.style.display == "block"){
				conteudo.style.display = "none";
			}else{
				conteudo.style.display = "block";
			}
		}
	}
}

function addEvent(obj, evType, fn){
	if (obj.addEventListener){ // Usuário FFudido
		obj.addEventListener(evType, fn, true);
	} else if (obj.attachEvent){ // Usuário do IEteligente
		obj.attachEvent("on"+evType, fn);
	}
}

function setHover(source) {
	//var source = event.target ? event.target : event.srcElement;
	if(source.className.match("Active") == null){
		if(source.className.match("Hover") != null){
			source.className = source.className.replace("Hover","");
		}else{
			source.className = source.className+"Hover";
		}
	}
}

function setMouseDown(event) {
	var source = event.target ? event.target : event.srcElement;
	source.className = source.className.replace("Hover","Active");
}

function setMouseUp(event) {
	var source = event.target ? event.target : event.srcElement;
	source.className = source.className.replace("Active","Hover");
}

function loadMenuEvents(){
	var uls = document.getElementsByTagName("ul");
	for(var i=0 ; i<uls.length ; i++){
		var lis = uls[i].getElementsByTagName("li");
		for(var j=0 ; j<lis.length; j++){
			if(lis[j].id.match("nav")){
				addEvent(lis[j], "mousedown", setMouseDown);
				addEvent(lis[j], "mouseup", setMouseUp);
			}
			lis[j].onmouseover = function(){setHover(this);}
			lis[j].onmouseout = function(){setHover(this);}
		}	
	}
}

function inicializeMenu(){
	loadMenuEvents();
	//adjustHeightMenu();
}

function adjustHeightMenu(){

	var menu = document.getElementById("nav")
	var lis = menu.getElementsByTagName("li");
	for(var i=0 ; i<lis.length ; i++){
		var ulsInsideLis = lis[i].getElementsByTagName("ul");
		for(var j=0 ; j<ulsInsideLis.length; j++){
			lis[i].style.height = 24*ulsInsideLis[j].getElementsByTagName("li").length;
		}	
	}
}

//-->
