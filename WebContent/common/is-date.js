//+ Jonas Raoni Soares Silva
//@ http://jsfromhell.com/geral/is-date [v1.0]

isDate = function(y, m, d){
		if(typeof y == "string" && m instanceof RegExp && d){
			if(!m.test(y)) return 1;
			y = RegExp["$" + d.y], m = RegExp["$" + d.m], d = RegExp["$" + d.d];
		}
		d = Math.abs(d) || 0, m = Math.abs(m) || 0, y = Math.abs(y) || 0;
		return arguments.length != 3 ? 1 : d < 1 || d > 31 ? 2 : m < 1 || m > 12 ? 3 : /4|6|9|11/.test(m) && d == 31 ? 4
		: m == 2 && (d > ((y = !(y % 4) && (y % 1e2) || !(y % 4e2)) ? 29 : 28)) ? 5 + !!y : 0;
};


isDateDefault = function(y, d){
	if(y!=''){
		m = /^([0-9]{1,2})[\/]([0-9]{1,2})[\/]([0-9]{4})$/;
		if(typeof y == "string" && m instanceof RegExp && d){
			if(!m.test(y)) return 1;
			y = RegExp["$" + d.y], m = RegExp["$" + d.m], d = RegExp["$" + d.d];
		}
		d = Math.abs(d) || 0, m = Math.abs(m) || 0, y = Math.abs(y) || 0;
		return arguments.length != 2 ? 1 : d < 1 || d > 31 ? 2 : m < 1 || m > 12 ? 3 : /4|6|9|11/.test(m) && d == 31 ? 4		
		: m == 2 && (d > ((y = !(y % 4) && (y % 1e2) || !(y % 4e2)) ? 29 : 28)) ? 5 + !!y : 0;
	}
	return 0;
};

getDateMsg = function(x){
	return x == 0 ? ""
	: x == 1 ? "Formato de data inválido"
	: x == 2 ? "Dia inválido"
	: x == 3 ? "Mês inválido"
	: x == 4 ? "Nos meses de abril, junho, setembro e novembro não existe o dia 31"
	: x == 5 ? "Fevereiro só tem 28 dias"
	: x == 6 ? "Em anos bissextos, fevereiro tem 29 dias" : "=]";
};

isValidDate = function(data){
	msg = getDateMsg(isDateDefault(data.value, {d: 1, m: 2, y: 3}));
	if(msg != ''){ 
		alert(msg);
		data.value = '';
		data.focus();
		return false;
	}
	return true;
}

//Melhorar essa função
isValidMesAno = function(field){
	if(field.value != ''){
		var msg = '';
		if(field.value.length != 7){
			msg = 'Formato inválido (mm/yyyy).'; 
		}else{
			var mes = field.value.split('/')[0];
			if(mes < '01' || mes > '12'){
				msg = 'Mês inválido.';
			}
		}
		if(msg != ''){ 
			alert(msg);
			field.value = '';
			field.focus();
		}
	}
}

isValidDiaMes = function(field){
	if(field.value != ''){
		var msg = '';
		if(field.value.length != 5){
			msg = 'Formato inválido (dd/mm).';
		}else{
			var arrayDiaMes = field.value.split('/');
			if(arrayDiaMes){
				if(arrayDiaMes[0] < '01' || arrayDiaMes[0] > '31'){
					msg = 'Dia Inválido';
				}
				if(arrayDiaMes[1] < '01' || arrayDiaMes[1] > '12'){
					msg = 'Mês Inválido';
				}
			}
		}
		if(msg != ''){ 
			alert(msg);
			data.value = '';
			data.focus();
		}
	}
}