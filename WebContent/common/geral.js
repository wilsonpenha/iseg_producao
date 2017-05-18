sortitems = 1;  // Automatically sort items within lists? (1 or 0)
netscape = false;
navegador = navigator.appName;
versao = parseInt(navigator.appVersion);
	if ( (navegador == "Netscape") && (versao >= 3) ) {
	  netscape = true;
	}
	else
	{
	  document.write('<link rel="stylesheet" type="text/css" href="/js/ftie5style.css">');
	}

   function imprime_numero(numero_val,p_inteiro,p_decimal,campo_nome,numero_obj)
   {
      cont_i = 0;
      cont_p = 0;
      cont_n = p_inteiro;
      numero_fmt = new String();
      cont_d = numero_val.length;
      negativo = numero_val.indexOf("-");
      if (negativo>=0) numero_val = numero_val.replace("-","");
      while (cont_d >=0) {
         if (numero_val.substring(cont_d-1,cont_d) != " " && numero_val.substring(cont_d-1,cont_d) != "" &&
             numero_val.substring(cont_d-1,cont_d) != "," && numero_val.substring(cont_d-1,cont_d) != "."){
            if (numero_val.substring(cont_d-1,cont_d) != "1" && numero_val.substring(cont_d-1,cont_d) != "2" &&
                numero_val.substring(cont_d-1,cont_d) != "3" && numero_val.substring(cont_d-1,cont_d) != "4" &&
                numero_val.substring(cont_d-1,cont_d) != "5" && numero_val.substring(cont_d-1,cont_d) != "6" &&
                numero_val.substring(cont_d-1,cont_d) != "7" && numero_val.substring(cont_d-1,cont_d) != "8" &&
                numero_val.substring(cont_d-1,cont_d) != "9" && numero_val.substring(cont_d-1,cont_d) != "0")
            {
            camposvalidadosOk = false;
               alert("Valor Inválido!"); //+ numero_val.substring(cont_d-1,cont_d));
               numero_obj.focus();
               return false;
            }
            if (cont_i == cont_p && cont_p > 0) {
               numero_fmt = "." + numero_fmt;
               cont_p = cont_i + 4;
               ++cont_i;
            }
            if (cont_i == p_decimal && p_decimal > 0){
               numero_fmt = "," + numero_fmt;
               cont_p = cont_i + 4;
               ++cont_i;
               }
            else{
               numero_fmt = numero_val.substring(cont_d-1,cont_d) + numero_fmt;
               --cont_n;
               --cont_d;
               ++cont_i;
            }
            if (p_decimal == 0 && cont_i == 3) {
               cont_p = 3;
            }
         }
         else
         {--cont_d;}
         if (cont_n < 0) {
           camposvalidadosOk = false;
           alert("Tamanho Inválido!");
           numero_fmt = new String();
           numero_obj.focus();
           return false;
         }
      }
      if (negativo>=0)
        numero_obj.value="-"+numero_fmt;
      else
        numero_obj.value=numero_fmt;
      return true;
    }
   function erro_numero(numero_val,p_inteiro,p_decimal,campo_nome,numero_obj)
   {
      numero_fmt = new String();
      cont_d = numero_val.length;
      while (cont_d >=1) {
         if (numero_val.substring(cont_d-1,cont_d) != "1" && numero_val.substring(cont_d-1,cont_d) != "2" &&
             numero_val.substring(cont_d-1,cont_d) != "3" && numero_val.substring(cont_d-1,cont_d) != "4" &&
             numero_val.substring(cont_d-1,cont_d) != "5" && numero_val.substring(cont_d-1,cont_d) != "6" &&
             numero_val.substring(cont_d-1,cont_d) != "7" && numero_val.substring(cont_d-1,cont_d) != "8" &&
             numero_val.substring(cont_d-1,cont_d) != "9" && numero_val.substring(cont_d-1,cont_d) != "0")
         {
         camposvalidadosOk = false;
//            alert("Matrícula Inválida ! ");
            alert("Número Inválido! ");// + numero_val.substring(cont_d-1,cont_d));
            numero_fmt = new String();
            numero_obj.focus();
            break;
         }
         else
         {--cont_d;}
         numero_fmt = numero_val;
      }
      var fim   = document.forms[0].elements.length;
      for (var i=0; i < fim; i++) {
         if (document.forms[0].elements[i].name == campo_nome) {
            document.forms[0].elements[i].value = numero_fmt;
            break;
         }
      }
   }

   function testa_numero(numero_valor,p_inteiro,p_decimal,p_inicio_intervalo,p_fim_intervalo)
   {
      cont = 0;
      virgula = 0;
      inteiro = new String();
      decimal = new String();
      for(i=1;i<=numero_valor.length;++i)
      {
         if (numero_valor.substring(i-1,i) != "1" && numero_valor.substring(i-1,i) != "2" &&
             numero_valor.substring(i-1,i) != "3" && numero_valor.substring(i-1,i) != "4" &&
             numero_valor.substring(i-1,i) != "5" && numero_valor.substring(i-1,i) != "6" &&
             numero_valor.substring(i-1,i) != "7" && numero_valor.substring(i-1,i) != "8" &&
             numero_valor.substring(i-1,i) != "9" && numero_valor.substring(i-1,i) != "0" &&
             numero_valor.substring(i-1,i) != "," && numero_valor.substring(i-1,i) != "-")
         {
            break;
            return false;
         }
         else
         {
            if (numero_valor.substring(i-1,i) == ",")
            {
               if (virgula == 0 && (cont > 0 && cont <= p_inteiro ))
               {
                  inteiro = numero_valor.substring(i-(cont+1),i-1);
               }
               ++virgula;
               cont = 0;
            }
            else
            {
               ++cont;
            }
            if (i == (numero_valor.length))
            {
               if (virgula > 0 && (cont > 0 && cont <= p_decimal ))
               {
                  decimal = numero_valor.substring(i-cont,i);
               }
               else
               {
                  if (virgula == 0 && (cont > 0 && cont <= p_inteiro ))
                  {
                     inteiro = numero_valor.substring(i-cont,i);
                  }
               }
            }
         }
      }
      if ((inteiro.length == 0) || (decimal.length == 0 && virgula == 1) || (virgula > 1))
      {
         camposvalidadosOk = false;
         alert("número inválido");
         return false;
      }
      else
      {
         if (decimal == "")
         {
            v_num = inteiro;
         }
         else
         {
            v_num = inteiro+"."+decimal;
         }
         if ((p_inicio_intervalo != null && p_fim_intervalo != null) && (v_num < p_inicio_intervalo || v_num > p_fim_intervalo))
         {
         camposvalidadosOk = false;
            alert("número fora do intervalo de " + p_inicio_intervalo + " a " + p_fim_intervalo);
            return false;
         }
      }
      return true;
    }


    function FormataValor(campo,tammax,teclapres) {
  var tecla = teclapres.keyCode;
  vr = document.form[campo].value;
  vr = vr.replace( "/", "" );
  vr = vr.replace( "/", "" );
  vr = vr.replace( ",", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  tam = vr.length;

  if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

  if (tecla == 8 ){ tam = tam - 1 ; }

  if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
    if ( tam <= 2 ){
      document.form[campo].value = vr ; }
    if ( (tam > 2) && (tam <= 5) ){
      document.form[campo].value = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; }
    if ( (tam >= 6) && (tam <= 8) ){
      document.form[campo].value = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
    if ( (tam >= 9) && (tam <= 11) ){
      document.form[campo].value = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
    if ( (tam >= 12) && (tam <= 14) ){
      document.form[campo].value = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
    if ( (tam >= 15) && (tam <= 17) ){
      document.form[campo].value = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;}
  }

    }

	function valida_numero(numero_obj,p_inteiro,p_decimal,campo_nome){
	  if(numero_obj.value == null || numero_obj.value == ''){
	    numero_obj.value = '0';
	  }
	  if (numero_obj.value.length > 0){
		if(p_decimal > 0){
		  // Substitue o valor do ponto por virgula, quando a semantica indicar
          if((numero_obj.value.indexOf(".")!=-1) && (p_decimal >= (numero_obj.value.length - numero_obj.value.indexOf(".")-1))){
			numero_obj.value=numero_obj.value.replace(".",",");
		  }
		  if((numero_obj.value.indexOf(",") == -1) && (numero_obj.value.length <= (p_inteiro - p_decimal)))    {
			numero_obj.value = numero_obj.value + ",00";
		  }
		  //coloca 0 antes da ',' ou do ponto caso eles seja o primeiro caracter
		  if(numero_obj.value.indexOf(",")==0){
			numero_obj.value= "0" + numero_obj.value;
		  }
		  //preenche de 0s a direita do ultimo numero representativo apos a virgula, ate completar as casas decimais.
		  var quantNumDec=(numero_obj.value.length - numero_obj.value.indexOf(",")-1);
		  if( quantNumDec < p_decimal){
			for(var k=0;k<(p_decimal-quantNumDec); k++){
			  numero_obj.value=numero_obj.value+"0";
			}
		  }
		}
		return imprime_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
	  }
	}

//   function valida_numero(numero_obj,p_inteiro,p_decimal,campo_nome)
//   {
//      if (numero_obj.value.length > 0)
//      {
//
//         if (testa_numero(numero_obj.value,p_inteiro,p_decimal,p_inicio_intervalo,p_fim_intervalo) == false)
//         {
//            numero_obj.value = "";
//            numero_obj.focus();
//         }
//         imprime_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
//      }
//   }

   function valida_numerico(numero_obj,p_inteiro,p_decimal,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
      }
   }

   function valida_nome(numero_obj,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_nome(numero_obj.value,campo_nome);
      }
   }

   function valida_doc(numero_obj,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
      }
   }



function valida_data(campo) {
  var c;
  a = campo.value;
  if (a.length == 8) {
    a = a.substring(0,2) + "/" + a.substring(2,4) + "/" + a.substring(4,8);
  }
  valida(campo);
  campo.value = a;
}

function valida(campo) {
  var err=0
  a = campo.value;
  if (a.length != 10) err=1
  d = a.substring(0, 2)// day
  c = a.substring(2, 3)// '/'
  b = a.substring(3, 5)// month
  e = a.substring(5, 6)// '/'
  f = a.substring(6, 10)// year
  if (b<1 || b>12) err = 1
  if (c != '/') err = 1
  if (d<1 || d>31) err = 1
  if (e != '/') err = 1
  if (f<0 || f>2100) err = 1

  if (b==4 || b==6 || b==9 || b==11){
    if (d==31) err=1
  }
  if (b==2){
    var g=parseInt(f/4)
    if (isNaN(g)) {
      err=1
    }
    if (d>29) err=1
    if (d==29 && ((f/4)!=parseInt(f/4))) err=1
  }
  if (err==1) {
  campo.focus();
  alert('Entre com uma data valida no formato DD/MM/YYYY');
  return false;
  }
  else{
    return true;
  }
}

function VerificaCampos(Campo){
  if (Campo.value.length==0){
    Campo.focus();
    alert('Campo deve ser preenchido!!');
    event.returnValue=false;
  }
}

function tamanhoMaximo(objeto, max , nomecampo){
  var campo = eval(objeto);

  if(campo.value.length>max){
    alert("O Campo " + nomecampo + " deve possuir no máximo " + max + " caracteres." );
    campo.focus();
  }
}

function valida_mascara(mascara, evento, objeto, size){
  if (window.innerHeight)
    keypress=evento.which;
  else
    keypress=evento.keyCode;

  var conjuntos = 0;
  var conjunto1 = 0;
  var conjunto2 = 0;
  var conjunto3 = 0;
  var conjunto4 = 0;
  var conjunto5 = 0;

  var j = 0;

  campo = eval(objeto);
  valor = campo.value;
  arrTexto = mascara.split('.');
  caracteres = '01234567890';
  conjuntos  = arrTexto.length;
  separacoes = arrTexto.length-1;
  separacao1 = '.';
  separacao2 = '.';
  separacao3 = '.';
  separacao4 = '.';

  for (var i=0; i < arrTexto.length; i++) {
    j=i+1;
    eval('conjunto'+j+'=arrTexto[i].length');
  }

  if ((caracteres.search(String.fromCharCode(keypress))!=-1)  && campo.value.length < (conjunto1 + conjunto2 + conjunto3 + conjunto4 + conjunto5 + separacoes))
  {
    if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
    if (campo.value.length == conjunto1 + conjunto2 + 1) campo.value = campo.value + separacao2;
    if (campo.value.length == conjunto1 + conjunto2 + conjunto3 + 2) campo.value = campo.value + separacao3;
    if (campo.value.length == conjunto1 + conjunto2 + conjunto3 + conjunto4 + 3) campo.value = campo.value + separacao4;
  } else {
    if (keypress==13||keypress==8||keypress==0)
      return true;
    else
      return false;
  }
}

function Mascara(formato, evento, objeto, size){
  if (window.innerHeight)
    keypress=evento.charCode;
  else
    keypress=evento.keyCode;

  if (keypress==0)
	  return true;
  
  campo = objeto;

  if (formato=='textarea'){
    if (campo.value.length < size){
      return true;
    }
    else return false;
  }

  if (formato=='numero2')
  {
    caracteres = '01234567890';
    separacoes = 1;
    separacao1 = '.';
    conjuntos = 2;
    conjunto1 = 7;
    conjunto2 = 1;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + 2))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='numero3')
  {
    numero_val = campo.value;
    caracteres = '01234567890';

    if ((caracteres.search(String.fromCharCode(keypress))!=-1  && campo.value.length < 18))
    {
      cont_i = 0;
      cont_p = 0;
      cont_n = 15;
      numero_fmt = new String();
      cont_d = numero_val.length;
      p_decimal = 1;
      while (cont_d >=0) {
         if (numero_val.substring(cont_d-1,cont_d) != " " && numero_val.substring(cont_d-1,cont_d) != "" &&
             numero_val.substring(cont_d-1,cont_d) != "," && numero_val.substring(cont_d-1,cont_d) != "."){
            if (cont_i == cont_p && cont_p > 0) {
               numero_fmt = "." + numero_fmt;
               cont_p = cont_i + 4;
               ++cont_i;
            }
            if (cont_i == p_decimal && p_decimal > 0){
               numero_fmt = "," + numero_fmt;
               cont_p = cont_i + 4;
               ++cont_i;
               }
            else{
               numero_fmt = numero_val.substring(cont_d-1,cont_d) + numero_fmt;
               --cont_n;
               --cont_d;
               ++cont_i;
            }
            if (p_decimal == 0 && cont_i == 3) {
               cont_p = 3;
            }
         }
         else
         {--cont_d;}
      }
      campo.value = numero_fmt;

    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='numero1')
  {
    caracteres = '01234567890.,';
    separacoes = 0;
    conjuntos = 1;
    conjunto1 = 20;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length <= (conjunto1))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='numero5')
  {
    caracteres = '-01234567890.,';
    separacoes = 0;
    conjuntos = 1;
    conjunto1 = 20;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length <= (conjunto1))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }
 
  if (formato=='numero')
  {
    caracteres = '-01234567890';
    separacoes = 1;
    separacao1 = '.';
    conjuntos = 2;
    conjunto1 = 4;
    conjunto2 = 1;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + 2))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='numero4')
  {
    caracteres = '-01234567890';
    if (caracteres.search(String.fromCharCode(keypress))!=-1)
    {
        return true;
    }
    else return false;
  }

  if (formato=='data')
  {
    caracteres = '01234567890';
    separacoes = 2;
    separacao1 = '/';
    separacao2 = '/';
    conjuntos = 3;
    conjunto1 = 2;
    conjunto2 = 2;
    conjunto3 = 4;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + conjunto3 + 2))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
      if (campo.value.length == conjunto1 + conjunto2 + 1) campo.value = campo.value + separacao2;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='hora')
  {
    caracteres = '01234567890';
    separacoes = 1;
    separacao1 = ':';
    conjuntos = 2;
    conjunto1 = 2;
    conjunto2 = 2;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + 1))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='mesano')
  {
    caracteres = '01234567890';
    separacoes = 1;
    separacao1 = '/';
    conjuntos = 2;
    conjunto1 = 2;
    conjunto2 = 4;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + 2))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='cnpj')
  {
    caracteres = '01234567890';
    separacoes = 4;
    separacao1 = '.';
    separacao2 = '.';
    separacao3 = '/';
    separacao4 = '-';
    conjuntos = 5;
    conjunto1 = 2;
    conjunto2 = 3;
    conjunto3 = 3;
    conjunto4 = 4;
    conjunto5 = 2;

    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + conjunto3 + conjunto4 + conjunto5 + 4))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
      if (campo.value.length == conjunto1 + conjunto2 + 1) campo.value = campo.value + separacao2;
      if (campo.value.length == conjunto1 + conjunto2 + conjunto3 + 2) campo.value = campo.value + separacao3;
      if (campo.value.length == conjunto1 + conjunto2 + conjunto3 + conjunto4 + 3) campo.value = campo.value + separacao4;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='cpf')
  {
    caracteres = '01234567890';
    separacoes = 3;
    separacao1 = '.';
    separacao2 = '.';
    separacao3 = '-';
    conjuntos = 4;
    conjunto1 = 3;
    conjunto2 = 3;
    conjunto3 = 3;
    conjunto4 = 2;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + conjunto3 + conjunto4 + 3))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
      if (campo.value.length == conjunto1 + conjunto2 + 1) campo.value = campo.value + separacao2;
      if (campo.value.length == conjunto1 + conjunto2 + conjunto3 + 2) campo.value = campo.value + separacao3;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='cep')
  {
    caracteres = '01234567890';
    separacoes = 2;
    separacao1 = '.';
    separacao2 = '-';
    conjuntos = 3;
    conjunto1 = 2;
    conjunto2 = 3;
    conjunto3 = 3;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1 + conjunto2 + conjunto3 + 2))
    {
      if (campo.value.length == conjunto1) campo.value = campo.value + separacao1;
      if (campo.value.length == conjunto1 + conjunto2 + 1) campo.value = campo.value + separacao2;
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='telefone')
  {
    caracteres = '01234567890-';
    separacoes = 0;
    conjuntos = 1;
    conjunto1 = 10;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1+ 1))
    {
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }

  if (formato=='ddd_ddi')
  {
    caracteres = '01234567890';
    separacoes = 0;
    conjuntos = 1;
    conjunto1 = 4;
    if ((caracteres.search(String.fromCharCode(keypress))!=-1) && campo.value.length < (conjunto1))
    {
    } else {
      if (keypress==13||keypress==8||keypress==0)
        return true;
      else
        return false;
    }
  }
}

//-----------------------------------------------------------------------------------------
// Retorna a quantidade de itens selecionados em uma array checkbox.
//-----------------------------------------------------------------------------------------
function VerificaQtosCamposChecados(checkbox){
  var campoChecado = 0;
  var qtde = checkbox.length;

  if (qtde > 0)
  {qtde = checkbox.length;}
  else
  {
   if(checkbox.checked)
    {
     campoChecado += 1;
     return campoChecado;
    }
  }

  for (var i = 0; i < qtde; i++) {
    if (checkbox[i].checked == true){
      campoChecado += 1;
    }
  }
  return campoChecado;
}

//-----------------------------------------------------------------------------------------
// Verifica se um item de um radiobutton foi selecionado.
//-----------------------------------------------------------------------------------------
function verificaCampoSelecionado(radiobutton){
  var campoSelecionado = 0;
  for (var i = 0; i < radiobutton.length; i++) {
    if (radiobutton[i].checked == true) {
      campoSelecionado = 1;
    }
  }
  return campoSelecionado;
}

//-----------------------------------------------------------------------------------------
function telaAnterior(){
  history.go(-1);
}

//-----------------------------------------------------------------------------------------
//Função que retorna "true" se o valor selecionado na combo
//for diferente de vazio, e retorna "false" em caso contrário
//-----------------------------------------------------------------------------------------
function ComboSelecionado(Combo)
{
 if (Combo.length != 0)
  {
   var valorSelecionado = Combo.options[Combo.selectedIndex].value;
    if(valorSelecionado != "")
     {
      return true;
     }
  }
 return false;
}

var mensagemDeErro;

function mensagemErro(Erro) {

  if(Erro.length != 0) {
  mensagemDeErro = Erro;
  var tempo;
  tempo=setTimeout("timer()", 500);
  }
}

function timer() {
  alert(mensagemDeErro);
}

function trim(str) {
      i=0;
      while (((str.substring(i,i+1))== " ")&&(i < str.length)) i++;
      aux=str.substring(i,str.length); i=aux.length;
      while (((aux.substring(i-1,i)) == " ")&&(i>1)) i--;
      aux=aux.substring(0,i);
      return aux;
    }

function FiltraCampo(valor){
  var s = "";
  var cp = "";
  vr = valor;
  tam = vr.length;
  for (i = 0; i < tam ; i++) {
    if (vr.substring(i,i + 1) != "/" && vr.substring(i,i + 1) != "-" && vr.substring(i,i + 1) != "."  && vr.substring(i,i + 1) != "," ){
      s = s + vr.substring(i,i + 1);}
  }

  return s;
}

function e_Text(objeto,msg){
	if (!objeto)
		return true;
  var campo = objeto;
//  alert("Msg "+msg);
  aux=trim(campo.value);
  if (aux =="")
    { alert("Campo "+ msg + " deve ser preenchido !");
      return false;
    }
  return true;
  }

function e_Num(objeto,msg){
	if (!objeto)
		return true;
      var campo = objeto;
      en=true;
      st="0123456789,.";
      aux=trim(campo.value);

      if (aux =="")
      { alert("Campo "+ msg + " deve ser preenchido !");
       return false;
      }

      ct=0;
      while (ct+1 <= aux.length) {
        if (st.indexOf(aux.substring(ct,ct+1))== -1) {
          en=false; break;
        }
        ct++;
      }

    if (en)
     { return true;
     }else
      {alert("Campo "+ msg + " inválido !");
       return false;
      }
  }

// Campo para validar campo numerico CASO esteja preenchido!
function e_NumValida(objeto,msg){
	if (!objeto)
		return true;

      var campo = objeto;
      aux=trim(campo.value);

      if (aux =="")
      { return true;}
      else
       {
         return e_Num(objeto,msg);
       }
}

// Campo para validar campo INTEIRO!

function e_Int(objeto,msg){
	if (!objeto)
		return true;

      var campo = objeto;
      en=true;
      st="0123456789";
      aux=trim(campo.value);

      if (aux =="")
      { alert("Campo "+ msg + " deve ser preenchido !");
       return false;
      }

      ct=0;
      while (ct+1 <= aux.length) {
        if (st.indexOf(aux.substring(ct,ct+1))== -1) {
          en=false; break;
        }
        ct++;
      }

    if (en)
     { return true;
     }else
      {alert("Campo "+ msg + " inválido !");
       return false;
      }

  }

// Campo para validar campo INTEIRO CASO esteja preenchido!

function e_IntValida(objeto,msg){
	if (!objeto)
		return true;

   var campo = objeto;
   aux=trim(campo.value);

   if (aux =="")
      {return true;}
   else
   {
    return e_Int(objeto,msg);
   }

  }


function e_Cpf(objeto,msg){
	if (!objeto)
		return true;

   var obj = objeto;
   var campo =  FiltraCampo(trim(obj.value));
   ax         = obj.value;
   obj.value = campo;
   anterior = '';
   todosIguais = false;

  //bloco que verifica se todos os numeros sao iguais
  anterior = obj.value.substring(0,1);
  for(var i=2;i<11;i++){
    if(anterior == obj.value.substring(i-1,i)){
      todosIguais = true;
      anterior = obj.value.substring(i-1,i);
    }else{
      todosIguais = false;
      break;
    }
  }

  if(todosIguais){
    alert("Campo "+ msg + " inválido !");
    obj.focus();
    return false;
  }


  if ((campo.length==11)&&(e_Num(objeto,msg))) {
    k=10; soma1 = 0; num1 = "";
    for (var i=0;i<9;i++){ 
      elem1 = campo.substring(i,i+1); soma1 += k * elem1; num1 += elem1; k--;
    }

   obj.value = ax;

    dv1 = 11-(soma1 % 11);

    if (dv1 >= 10){ dv1 = "0";  }

    dv_in = campo.substring(9,10);

    if (dv_in != dv1) {
     alert("Campo "+ msg + " inválido !");
     obj.focus();
     return false;
    }

    num2 = num1 + (dv1); var k = 11; soma2 = 0;
    for (var j=0;j<10;j++)  {
     elem2 = num2.substring(j,j+1); soma2 += k * elem2; num2 += elem2; k--;
    }
    dv2 = 11-(soma2 % 11);
    if (dv2 >= 10){ dv2 = "0"; }
    dv_in = campo.substring(10,11);
    if (dv_in != dv2) {
     alert("Campo "+ msg + " inválido !");
     obj.focus();
     return false;
    }

    for (var j=0;j<10;j++)  {

     if (campo.substring(j,j+1) != campo.substring(j+1,j+2)) {
       return true;
      }
    }

  } else {
    alert("Campo "+ msg + " inválido !");
    obj.focus();
    return false;
  }
}


function e_Data(objeto,msg) {
	if (!objeto)
		return true;
      var ret   = false;
      var campo = objeto;
      var vlraux = trim(campo.value);

      if (vlraux == "")
       {
        alert("Campo  " + msg + " deve ser preenchido !"); campo.value=""; campo.focus(); return false;
       }

      if ((vlraux.length != 10) ||
         (vlraux.substring(2,3) != "/") ||(vlraux.substring(5,6)!= "/")){
         alert("Campo  " + msg + " inválida !"); campo.value=""; campo.focus(); return false;
      }

      dia = parseInt(vlraux.substring(0,2),10); mes = parseInt(vlraux.substring(3,5),10);
      ano = parseInt(vlraux.substring(6,10),10);

      if (isNaN(dia) || isNaN(mes) || isNaN(ano) || (mes < 1) || (mes > 12) || (dia < 1)) {
       alert("Campo  " + msg + " inválido !"); campo.value=""; campo.focus(); ;return false;
      }
      tabmes = "312831303130313130313031";
      if ((dia == 29) && (mes == 02)){
        if ((ano == 0) || ((ano % 4) != 0)){
          alert("Campo  " + msg + " inválido !"); campo.value=""; campo.focus(); return false;
        } else {
       return true;
        }
      }
      k = (mes * 2 - 2)
      if (dia > tabmes.substring(k,k + 2)) {
        alert("Campo  " + msg + " inválido !"); campo.value=""; campo.focus(); return false;
      } else {
       return true;
      }
    }

function e_DataValida(objeto,msg) {
	if (!objeto)
		return true;

      var ret   = false;
      var campo = objeto;
      var vlraux = trim(campo.value);
      if (vlraux == "")
       {
        return true;
       }

      if ((vlraux.length != 10) ||
         (vlraux.substring(2,3) != "/") ||(vlraux.substring(5,6)!= "/")){
         alert("Campo  " + msg + " inválida !"); return false;
      }

      dia = parseInt(vlraux.substring(0,2),10); mes = parseInt(vlraux.substring(3,5),10);
      ano = parseInt(vlraux.substring(6,10),10);

      if (isNaN(dia) || isNaN(mes) || isNaN(ano) || (mes < 1) || (mes > 12) || (dia < 1)) {
       alert("Campo  " + msg + " inválido !"); return false;
      }
      tabmes = "312831303130313130313031";
      if ((dia == 29) && (mes == 02)){
        if ((ano == 0) || ((ano % 4) != 0)){
          alert("Campo  " + msg + " inválido !"); return false;
        } else {
       return true;
        }
      }
      k = (mes * 2 - 2)
      if (dia > tabmes.substring(k,k + 2)) {
        alert("Campo  " + msg + " inválido !"); return false;
      } else {
       return true;
      }


    }
function e_Cep(objeto,msg) {
	if (!objeto)
		return true;

      var campo = objeto;
      var ax    = campo.value;
      var vlr   = trim(FiltraCampo(campo.value));

      if (vlr=="" || vlr.length!=8 )
       {alert("Campo  " + msg + " inválido !"); return false;}

      campo.value=vlr;

      if (e_Num(objeto,msg))
       {campo.value=ax; return true}
       else
        {campo.value=ax; alert("Campo  " + msg + " inválido !"); return false; }
    }

function e_Cnpj(objeto,msg) {
	if (!objeto)
		return true;
      var campo = objeto;
      var arg   = FiltraCampo(campo.value);

      c=trim(arg); t=c.length; ax=""; dv=""; dv1=0; dv2=0;

      if (t<14  || parseInt(c)==0) {
       alert("Campo  " + msg + " inválido !"); campo.value=""; campo.focus(); return false;
      }

      while(t<14) {
        ax+="0"; t++;
      }
      c=ax+c;
      sm1=0; sm2=0;
      peso=6;
      for (i=0;i<=11; i++){
        if (i>=4) {
          i==4 ? peso=9 : peso-- ;
        } else {
          peso--;
        }
        sm1+=c.substring(i,i+1)*peso;
      }
      peso=7;
      for (i=0;i<=12; i++){
        if (i>=5) {
          i==5 ? peso=9 : peso-- ;
        } else {
          peso--;
        }
        sm2+=c.substring(i,i+1)*peso;
      }

      t = 11 - sm1%11;
      t < 10 ? dv1=t : dv1=0;
      t = 11 - sm2%11;
      t < 10 ? dv2=t : dv2=0;

      if ((c.substring(12,13)==dv1)&&(c.substring(13,14)==dv2)) {
        return true;
      } else {
       alert("Campo  " + msg + " inválido !"); campo.value=""; campo.focus(); return false;
      }
    }

function esta_Select(objeto,msg){
	if (!objeto)
		return true;
	var retorno = false;
	Combo = objeto;

	if (Combo.options) {
		if (Combo.options.selectedIndex != -1){
			var valorSelecionado = Combo.options[Combo.selectedIndex].value;
			if(valorSelecionado != ""){
				retorno = true;
			}
		}
	}
	if (retorno == false && Combo.disabled==false){
		alert("Campo  " + msg + " deve ser Selecionado !");
		retorno = false;
    }
	return retorno;
}


//-----------------------------------------------------------------------------------------
// Valida se existe algum  item selecionados em uma array checkbox.
//-----------------------------------------------------------------------------------------
function esta_Checado(objeto,msg)
 {
	if (!objeto)
		return true;
  var campoChecado = 0;
  var checkbox = objeto;

  var qtde = checkbox.length;

  if (qtde > 0)
  {qtde = checkbox.length;}
  else
  {
   if(checkbox.checked)
    {
     campoChecado += 1;
     return campoChecado;
    }
  }

  for (var i = 0; i < qtde; i++) {
    if (checkbox[i].checked == true){
      campoChecado += 1;
    }
  }
 if (campoChecado >0)
   {return true;}
   else
   {alert("Campo " + msg + " deve ser Selecionado !");
    return false;}

}
function e_Email(objeto,msg)  {
	if (!objeto)
		return true;
       arg = objeto.value;

       var s = trim(arg);
     /*
       var filter=/^[A-Za-z][A-Za-z0-9_.]*@[A-Za-z0-9_]+\.[A-Za-z0-9_.]+[A-za-z]$/;
       if (s.length == 0 ) return true;
       if (filter.test(s))
            return true;
       else
         return false;
     }
      */
      if (s=="") {
          alert("Campo  " + msg + " inválido !"); return false;
      } else {
         p1= s.indexOf("@"); p2=s.indexOf(".");

         if ((p1<0)||(p2<0)) {
            alert("Campo  " + msg + " inválido !"); return false;
         } else {
           return true;
         }
      }
    }



function selecionaCombo (objeto,valor)
 {
   Combo = eval(objeto);

  if (Combo.length != 0)
  {
   for (var i = 0; i < Combo.length;i++)
    {
     if (Combo.options[i].value = valor)
     {
      Combo.options[i].selected=true;
     }
    }
  }
 }

// Verifica se a data do objeto1 e maior que a do objeto2 caso seja retorna false

function DataInicio_Maior_que_DataFim (objeto1,objeto2,msg)
 {

  var ax1 = eval(objeto1);
  var ax2 = eval(objeto2);

 if (trim(ax1.value)=="" || trim(ax2.value) =="")
  {
   ax1.value=trim(ax1.value);
   ax2.value=trim(ax2.value);
   return true; }

  var var1 = FiltraCampo(trim(ax1.value));
  var var2 = FiltraCampo(trim(ax2.value)) ;



  var Data1 = var1.substring(4,8)+var1.substring(2,4)+var1.substring(0,2);
  var Data2 = var2.substring(4,8)+var2.substring(2,4)+var2.substring(0,2);

  if (Data1>Data2)
   {
    alert(msg);
    return false;
   }
  else
   {
    return true;
   }

 }


//------------------------------------------------------------------------------
// Muda da Action do Formulario
// Data: 14/02/2001
//------------------------------------------------------------------------------

function MudaActionForm(form,acao)
 {
   form.action=acao;
  }

function ConfirmaSalvar() {
  return confirm("Confirma Inserção ?");
}

function ConfirmaExcluir() {
  return confirm("Confirma Exclusão ?");
}


function ConfirmaAlterar() {
  return confirm("Confirma Alteração ?");
}

function Testando(valor,descricao) {
  alert(valor+" "+descricao);
}

function onkeypressNumero(keypress) {
 if (keypress >= 48 && keypress <= 57)
  {
  event.returnValue = true;
  }
 else event.returnValue=false;

}

/**
 * Recebe o valor da tecla selecionada para validar somente
 * numero e virgula.
 *
 * @return True caso seja um numero ou virgula e false caso contrario
 */
function onkeypressNumeroVirgula(keypress) {
 if ((keypress >= 48 && keypress <= 57) || keypress == 44)
  {
  event.returnValue = true;
  }
 else event.returnValue=false;
}

/**
 * Recebe o valor da tecla selecionada para validar somente
 * numero e ponto.
 *
 * @return True caso seja um numero ou ponto e false caso contrario
 */
function onkeypressNumeroPonto(keypress) {
 if ((keypress >= 48 && keypress <= 57) || keypress == 46)
  {
  event.returnValue = true;
  }
 else event.returnValue=false;
}

function onkeypressNumeroVirgulaPonto(keypress) {
 if ((keypress >= 48 && keypress <= 57) || keypress == 44 || keypress == 46)
  {
  event.returnValue = true;
  }
 else event.returnValue=false;
}

function move(fbox,tbox) {
  for(var i=0; i<fbox.options.length; i++) {
    if(fbox.options[i].selected && fbox.options[i].value != "") {
      var no = new Option();
      no.value = fbox.options[i].value;
      no.text = fbox.options[i].text;
      tbox.options[tbox.options.length] = no;
      fbox.options[i].value = "";
      fbox.options[i].text = "";
      }
  }
  BumpUp(fbox);
  if (sortitems) SortD(tbox);
}

/*---------------------------------------------------------
*     Remove relativas a remoção de um
*     item de um selected
*--------------------------------------------------------*/
function remove(form) {
  if (form.disabled == true) {
    alert("Para tornar disponível a remoção, selecione, no menu de ações, a opção \"Editar Dados\"!");
  } else {
    for (var i=0; i<form.options.length; i++) {
      if (form.options[i].selected) {
        form.options[i].value = "";
        form.options[i].text  = "";
      }
    }
    BumpUp(form);
    //carregaVetor(form);
  }
}

// ao remover um item, coloca o proximo no seu lugar.
function BumpUp(box)  {
  for(var i=0; i<box.options.length; i++) {
    if(box.options[i].value == "")  {
      for(var j=i; j<box.options.length-1; j++)  {
        box.options[j].value = box.options[j+1].value;
        box.options[j].text = box.options[j+1].text;
      }
      var ln = i;
      break;
    }
  }
  if(ln < box.options.length)  {
    box.options.length -= 1;
    BumpUp(box);
  }
}


/*--------------------------------------------------
*                       Fim
*-------------------------------------------------*/
// apenas modifica as posicoes das opcoes. Coloca as opcoes de texto menor primeiro.
function SortD(box)  {
  var temp_opts = new Array();
  var temp = new Object();
  for(var i=0; i<box.options.length; i++)  {
    temp_opts[i] = box.options[i];
  }
  for(var x=0; x<temp_opts.length-1; x++)  {
    for(var y=(x+1); y<temp_opts.length; y++)  {
      if(temp_opts[x].text > temp_opts[y].text)  {
        temp = temp_opts[x].text;
        temp_opts[x].text = temp_opts[y].text;
        temp_opts[y].text = temp;
        temp = temp_opts[x].value;
        temp_opts[x].value = temp_opts[y].value;
        temp_opts[y].value = temp;
      }
      }
  }
  for(var i=0; i<box.options.length; i++)  {
    box.options[i].value = temp_opts[i].value;
    box.options[i].text = temp_opts[i].text;
    }
}

function converte_numero(vlr) {
  var valor = vlr.replace( ".", "" );
  valor = valor.replace( ",", "." );
  valor = parseFloat(valor);
  return valor;
}

function valorData(data){
  dia = data.substring(0,2);
  mes = data.substring(3,5);
  ano = data.substring(6,10);
  return ano+mes+dia;
}

function strToFloat(vlr) {
  var valor = vlr.replace( ".", "" );
  valor = valor.replace( ".", "" );
  valor = valor.replace( ".", "" );
  valor = valor.replace( ".", "" );
  valor = valor.replace( ",", "." );
  valor = parseFloat(valor);
  return valor;
}
