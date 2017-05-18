//+ Jonas Raoni Soares Silva
//@ http://jsfromhell.com/forms/masked-input [v1.0]

//========================================================
// REQUIRES http://www.jsfromhell.com/geral/event-listener
//========================================================

/*
MaskInput(field: HTMLInputElement, mask: String): void
	Adiciona máscara a um campo.
	- field: campo que vai receber a máscara
	- mask: máscara que será aplicada

Regras Padrões

	- a = A-Z e 0-9
	- A = A-Z, acentos e 0-9
	- 9 = 0-9
	- C = A-Z e acentos
	- c = A-Z
	- * = qualquer coisa

Regras Especiais

	* E = (Except) exceção
	* O = (Only) somente

Criação de Máscaras

	Máscara simples: 
	nesse tipo de máscara o usuário pode digitar no máximo a mesma quantidade de caracteres que
	a máscara contém.
	
Exemplo:

Telefone = (99)9999-9999
Data = 99/99/9999

	Máscara especial "regra^exceções":
	esse tipo de máscara é composto por 2 partes, separadas por "^", o lado esquerdo especifica a
	regra e o direito as exceções para a regra selecionada.

Exemplo:

9^abc = a regra é aceitar somente números "9" e a exceção são os caracteres a, b e c
c^123 = aceita somente caracteres de a-z e a exceção são os números 1, 2 e 3

	Uso das regras especiais:
	ela é semelhante a máscara especial, porém o lado esquerdo tem um significado diferente,
	podendo ser "E" (qualquer coisa, exceto...) ou "O" (somente...)

Exemplo:

E^abc: aceita qualquer coisa, menos a, b e c
O^123: só permite os caracteres 1, 2 e 3
*/

MaskInput = function(f, m){
		if(f == null)
			return;

		function mask(e){
		
			if(ignoreKeys(e)){return true;}
			apagaSelecao(f,e);
			var patterns = {"1": /[A-Z]/i, "2": /[0-9]/, "4": /[À-ÿ]/i, "8": /./ },
				rules = { "a": 3, "A": 7, "9": 2, "C":5, "c": 1, "*": 8};
			function accept(c, rule){
				for(var i = 1, r = rules[rule] || 0; i <= r; i<<=1)
					if(r & i && patterns[i].test(c))
						break;
					return i <= r || c == rule;
			}
			var k, mC, r, c = String.fromCharCode(k = e.key), l = f.value.length;
			(!k || k == 8 ? 1 : (r = /^(.)\^(.*)$/.exec(m)) && (r[0] = r[2].indexOf(c) + 1) + 1 ?
				r[1] == "O" ? r[0] : r[1] == "E" ? !r[0] : accept(c, r[1]) || r[0]
				: (l = (f.value += m.substr(l, (r = /[A|9|C|\*]/i.exec(m.substr(l))) ?
				r.index : l)).length) < m.length && accept(c, m.charAt(l))) || e.preventDefault();
		}
		for(var i in !/^(.)\^(.*)$/.test(m) && (f.maxLength = m.length), {keypress: 0, keyup: 1})
			addEvent(f, i, mask);
};

function apagaSelecao(campo, e){

	if(getSelectionEnd(campo)-getSelectionStart(campo) == campo.value.length){
		if( (e.key >= 65 && e.key <= 90) || (e.key >= 97 && e.key <= 113) || (e.key >= 48 && e.key <= 57)){
			campo.value = "";
		}
	}
}

function ignoreKeys(e){
	if(e.key == 9 || e.key == 16 || (e.key >= 37 && e.key <= 40)){
		return true;
	}
}

function getSelectionStart(field){
	if(field.disabled){
		return 0;
	}

	if (document.selection) {
		// IE black magic
		return Math.abs(
			document.selection.createRange().moveStart("character", -1000000)
		);
	} else if (typeof(field.selectionStart) != "undefined"){
		// mozilla and opera
		var selStart = field.selectionStart;
	
		// Safari bug when field is focused for first time
		if(selStart == 2147483647){
			selStart = 0;
		}

		return selStart;
	}
	
	return 0;
};

function getSelectionEnd(field){
	if(field.disabled){
		return 0;
	}

	if (document.selection) {
		// IE black magic
		return field.value.length - Math.abs(
			document.selection.createRange().moveEnd("character", 1000000)
		);
	} else if (typeof(field.selectionEnd) != "undefined") {
		// mozilla and opera
		return field.selectionEnd;
	} 

	return 0;
};

function isEnter(campo, e){
	if(e.key == 13){
		campo.form.submit();
	}
}