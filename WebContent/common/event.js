/*
**************************************
* Event Listener Function v1.4       *
* Autor: Carlos R. L. Rodrigues      *
**************************************
*/

/*
addEvent(object: Object, event: String, handler: Function(e: Event): Boolean, [scope: Object = object]): Boolean
--> Adiciona uma fun��o que ser� disparada quando ocorrer determinado evento no objeto.

	object: objeto que receber� o listener
	event: nome do evento sem o prefixo "on" (click, mouseover, ...)
	handler: fun��o que ser� chamada quando o evento ocorrer, ser� enviado como argumento
				para esta fun��o o objeto de evento, que al�m das propriedades normais, *sempre* ir� conter:
				* target: objeto que gerou o evento
				* key: c�digo do caractere em eventos de teclado
				* stopPropagation: m�todo para evitar a propaga��o do evento
				* preventDefault: m�todo para evitar que a a��o default ocorra o preventDefault pode ser emulado retornando "false" na fun��o
	scope: escopo (quem o "this" ir� referenciar dentro do handler) que ser� usado quando a fun��o for chamada, 
		   o default � o objeto no primeiro argumento
*/

addEvent = function(o, e, f, s){
	var r = o[r = "_" + (e = "on" + e)] = o[r] || (o[e] ? [[o[e], o]] : []), a, c, d;
	r[r.length] = [f, s || o], o[e] = function(e){
		try{
			(e = e || event).preventDefault || (e.preventDefault = function(){e.returnValue = false;});
			e.stopPropagation || (e.stopPropagation = function(){e.cancelBubble = true;});
			e.target || (e.target = e.srcElement || null);
			e.key = (e.which + 1 || e.keyCode + 1) - 1 || 0;
		}catch(f){}
		for(d = 1, f = r.length; f; r[--f] && (a = r[f][0], o = r[f][1], a.call ? c = a.call(o, e) : (o._ = a, c = o._(e), o._ = null), d &= c !== false));
		return e = null, !!d;
    }
};

/*
removeEvent(object: Object, event: String, handler: function(e: Event): Boolean, [scope: Object = object]): Boolean
--> Remove um listener previamente adicionado em um objeto e retorna true em caso de sucesso.

	object: objeto que recebeu o listener
	event: nome do evento sem o prefixo "on" (click, mouseover, ...)
	handler: mesma fun��o que foi atribuida no addEvent
	scope: escopo em que a fun��o foi adicionada, caso voc� tenha fornecido um escopo diferente no addEvent,
		   � necess�rio que voc� passe como par�metro o mesmo objeto, caso contr�rio a remo��o do evento Não ser� realizada
*/

removeEvent = function(o, e, f, s){
	for(var i = (e = o["_on" + e] || []).length; i;)
		if(e[--i] && e[i][0] == f && (s || o) == e[i][1])
			return delete e[i];
	return false;
};