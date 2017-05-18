sortitems = 1;  // Automatically sort items within lists? (1 or 0)
netscape = false;
navegador = navigator.appName;
versao = parseInt(navigator.appVersion);

function check_required_field(campo, nome) {
  if (campo.value.length==0){
    alert(nome+' cannot be left blank');
    campo.focus();
    return false;
  }
  else {
   return true;
  }
}

  function sair()
  {
    document.location = "/sari/inicio.jsp?paginaId=0";
    return true;
  }

  function check_espaco_inicio(campo, nome) {
    var dado = campo.value;
    if (dado.length > 0) {
      info = dado.substring(0, 1)
      if (info == " ") {
        alert(nome+' cannot start with a space');
        campo.focus();
        return false;
      }
    }
    return true;
  }

   function verifica_deletar() {
      if (!confirm("Are you sure you want to delete this ?")) {
         return false
      }
      document.forms[0].ZAction.value = "VerifiedDelete";
      return true;
   }
   function seta_foco_no_primeiro() {
  if(document.forms.length != 0){
      var fim = document.forms[0].elements.length;
          for (var i=0; i < fim; i++) {
        if ((document.forms[0].elements[i].type != "hidden") && (document.forms[0].elements[i].type != "button") && (document.forms[0].elements[i].type != "submit") && (document.forms[0].elements[i].type != "reset")) {
        if (!document.forms[0].elements[i].disabled){
                  document.forms[0].elements[i].focus();
                  break;
        }
            }
    }
   }
   }

   function limpa_form(nr){
     if (document.forms[nr].elements.length > 0) {
        for (i = 0; i < document.forms[nr].elements.length; i++) {
      e = document.forms[nr].elements[i];
      if ((e.type == "text") || (e.type == "textarea") || (e.type == "password") || (e.type == "checkbox") || (e.type == "radio")) {
           e.value = "";
      }
        }
     }
   return;
   }

   function submeter() {
      document.forms[0].submit();
   }
   function muda_url(nova_url) {
      window.open(nova_url, "_self");
   }
   function elemento_no_formulario(elemento) {
      var fim   = document.forms[0].elements.length;
      var volta = -1;
      for (var i=0; i < fim; i++) {
         if (document.forms[0].elements[i].name == elemento) {
            volta = i;
            break;
         }
      }
      return volta;
   }
   function elementos_do_formulario1(elemento,formulario) {
      var volta = -1;
      var cont = 0;
      var fim   = document.forms[formulario].elements.length;
      for (var i=0; i < fim; i++) {
         if (document.forms[formulario].elements[i].name == elemento) {
            cont = cont+1;
         }
      }
 //     alert(cont);
  //    window.alert(document.forms[0].objIds[0].value);
      return cont;
   }
   function elemento_no_formulario1(elemento,formulario) {
      var volta = -1;
      var fim   = document.forms[formulario].elements.length;
      for (var i=0; i < fim; i++) {
         if (document.forms[formulario].elements[i].name == elemento) {
            volta = i;
            break;
         }
      }
//      window.alert(volta);
      return volta;
   }
   function formulario_do_elemento(elemento) {
      var _fim   = document.forms.length;
      var volta = -1;
      for (var k=0; k < _fim; k++) {
         var fim   = document.forms[k].elements.length;
         for (var i=0; i < fim; i++) {
            if (document.forms[k].elements[i].name == elemento) {
               volta = k;
               break;
            }
         }
      }
      return volta;
   }
   function chama_lov(item, url, tabela, chave, descricao, parametros, retorno, visivel, p_not, lista, titulo) {
      var volta_desc = elemento_no_formulario(item);
      if (volta_desc == -1) {
         alert("Field " + item + " not exist in the form.");
         return;
      }
      var volta_chav = 0
      var vis = "";
      var ret = "";
      var lst = "";
      var tit = "";
      var tab = "&P_TABLE_NAME="+tabela;
      var chv = "&P_KEY_FIELD="+chave;
      var des = "&P_NAME_FIELD="+descricao;
      if (retorno != "") {
         ret = "&P_KEY_RETURN="+retorno;
         volta_chav = elemento_no_formulario("P_"+retorno);
         if (volta_chav == -1) {
            alert("Field " + item + " not exist in the form.");
            return;}
      }
      else {
         volta_chav = elemento_no_formulario("P_"+chave);
         if (volta_chav == -1) {
            alert("Field " + item + " not exist in the form.");
            return;}
      }
      if (visivel != "") {
         vis = "&P_KEY_VIEW="+visivel;
      }
      if (lista != "") {
         lst = "&P_LIST_VIEW="+lista;
      }
      if (titulo != "") {
         tit = "&P_TITULO="+titulo;
      }
      var car = "?P_WHERE_CLAUSE=";
      var pos_item = elemento_no_formulario(item);
      var val_item = document.forms[0].elements[pos_item].value;
      car = car + "upper("+descricao+")+like+'"+escape(val_item.toUpperCase()+"*")+"'";
      if (parametros != "") {
         file://car = car + "+and+"
         var parms = parametros + ",";
         var pos = parms.indexOf(",");
         while (pos > 0) {
            var elemento = parms.substr(0, pos);
            var pos_elemento  = elemento_no_formulario(elemento);
            parms = parms.substr(pos + 1, parms.length - pos);
            if (pos_elemento == -1) {
               alert("Field " + elemento + " not exist in the form.");
               return;
            }
            if (document.forms[0].elements[pos_elemento].type == "select-one" ) {
               if (document.forms[0].elements[pos_elemento].length > 0)
               {
                  var opcao = document.forms[0].elements[pos_elemento].selectedIndex;
                  var valor = document.forms[0].elements[pos_elemento].options[opcao].value;
               }
            }
            else {
               var valor = document.forms[0].elements[pos_elemento].value;
            }
            valor = valor.toUpperCase();
            if (valor != "") {
               car = car + "+and+" + elemento.substr(2) + "='" + escape(valor)+"'";
            }
            else {
               if (p_not != ""){
                  car = car + "+and+" + "+" + p_not + "+" + elemento.substr(2) + "='.'";
               }
            }
            pos = parms.indexOf(",");
            //file://if (pos > 0) {car = car + "+and+";}
         }
      }
      //file://alert(car);
      url = url + car + tab + chv + des + ret + vis + lst + tit + "&LOV_CHAMADOR=" + escape(location.protocol + '//' +
            location.host + location.pathname + location.search)+ "&LOV_VOLTA_DESC=" + volta_desc+ "&LOV_VOLTA_CHAV=" + volta_chav;
      frmLOV = window.open(url ,
            "Love", "scrollbars=yes,resizable=yes,width=600,height=400");
      frmLOV.focus();
      if (frmLOV.opener == null) {
         frmLOV.opener = self;
      }
   }

   function chama_orgao(chave, descricao, pj) {
      var volta_chav = 0
      volta_chav = elemento_no_formulario(chave);
      if (volta_chav == -1) {
        alert("Field " + chave + " not exist in the form.");
        return;
      }
      volta_desc = elemento_no_formulario(descricao);
      if (volta_desc == -1) {
        alert("Field " + descricao + " not exist in the form.");
        return;
      }
      ur_pj = "&pj=N";
      if (pj != "N")
        ur_pj = "&pj=S";

      url = "/siscontas/jsp/orgaoentidadelista/body.jsp?LOV_CHAMADOR=" + escape(location.protocol + '//' +
            location.host + location.pathname + location.search)+ "&LOV_VOLTA_DESC=" + descricao+ "&LOV_VOLTA_CHAV=" + chave + ur_pj;
      frmLOV = window.open(url ,
            "Orgao", "scrollbars=yes,resizable=yes,width=640,height=480");
      frmLOV.focus();
      if (frmLOV.opener == null) {
         frmLOV.opener = self;
      }
   }

   function elemento_no_formulario_chamador(elemento) {
      var _fim   = opener.document.forms.length;
      var volta = -1;
      for (var k=0; k < _fim; k++) {
         var fim   = opener.document.forms[k].elements.length;
         for (var i=0; i < fim; i++) {
            if (opener.document.forms[k].elements[i].name == elemento) {
               volta = i;
               break;
            }
         }
      }
      return volta;
   }
   function formulario_do_elemento_chamador(elemento) {
      var _fim   = opener.document.forms.length;
      var volta = -1;
      for (var k=0; k < _fim; k++) {
         var fim   = opener.document.forms[k].elements.length;
         for (var i=0; i < fim; i++) {
            if (opener.document.forms[k].elements[i].name == elemento) {
               volta = k;
               break;
            }
         }
      }
      return volta;
   }
   function Retorna_Love(valor, descricao) {
      if (opener.location.href != document.forms[0].LOV_CHAMADOR.value) {
         alert("List is not in context.");
         return;
      }
      var fim   = document.forms[0].elements.length;
      var elemento_chav = -1;
      var elemento_desc = -1;
      for (var i=0; i < fim; i++) {
         if (document.forms[0].elements[i].name == "LOV_VOLTA_CHAV") {
            elemento_chav = document.forms[0].LOV_VOLTA_CHAV.value;
            break;
         }
      }
      for (var i=0; i < fim; i++) {
         if (document.forms[0].elements[i].name == "LOV_VOLTA_DESC") {
            elemento_desc = document.forms[0].LOV_VOLTA_DESC.value;
            break;
         }
      }
      if (elemento_chav == -1) {
         alert("Reference window is not found.");
         return;
      }
      if (elemento_desc == -1) {
         alert("Reference window is not found.");
         return;
      }
      var pos_elemento = elemento_no_formulario_chamador(elemento_chav);
      var form_elemento = formulario_do_elemento_chamador(elemento_chav);
      opener.document.forms[form_elemento].elements[pos_elemento].value = valor;
      var pos_elemento_desc = elemento_no_formulario_chamador(elemento_desc);
      opener.document.forms[form_elemento].elements[pos_elemento_desc].value = descricao;
      if (opener.document.forms[form_elemento].elements[pos_elemento_desc].type != "hidden") {
          opener.document.forms[form_elemento].elements[pos_elemento_desc].focus();
         }
      close();
   }
   function Voltar() {
      close();
   }
   function printNumber(numero_val,p_inteiro,p_decimal,campo_nome,numero_obj)
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
            camposcheckdosOk = false;
               alert("Invalid value!"); //+ numero_val.substring(cont_d-1,cont_d));
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
           camposcheckdosOk = false;
           alert("Invalid size!");
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
         camposcheckdosOk = false;
//            alert("Matr�cula Inv�lida ! ");
            alert("Invalid number! ");// + numero_val.substring(cont_d-1,cont_d));
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
         camposcheckdosOk = false;
         alert("Invalid number!");
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
         camposcheckdosOk = false;
            alert("Number out of range: " + p_inicio_intervalo + " to " + p_fim_intervalo);
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

   function check_numero(numero_obj,p_inteiro,p_decimal,campo_nome){
     if (numero_obj.value.length > 0){
       if(p_decimal > 0){
         //substitue o valor do ponto por virgula, quando a semantica indicar
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
         //preenche de 0s a direita do ultimo numero representativo apos a virgula,
         //ate completar as casas decimais.
         var quantNumDec=(numero_obj.value.length - numero_obj.value.indexOf(",")-1);
         if( quantNumDec < p_decimal){
           for(var k=0;k<(p_decimal-quantNumDec); k++){
             numero_obj.value=numero_obj.value+"0";
           }
         }

       }
       return printNumber(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
     }
   }

//   function check_numero(numero_obj,p_inteiro,p_decimal,campo_nome)
//   {
//      if (numero_obj.value.length > 0)
//      {
//
//         if (testa_numero(numero_obj.value,p_inteiro,p_decimal,p_inicio_intervalo,p_fim_intervalo) == false)
//         {
//            numero_obj.value = "";
//            numero_obj.focus();
//         }
//         printNumber(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
//      }
//   }

   function check_number(numero_obj,p_inteiro,p_decimal,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
      }
   }

   function check_nome(numero_obj,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_nome(numero_obj.value,campo_nome);
      }
   }

   function check_doc(numero_obj,campo_nome)
   {
      if (numero_obj.value.length > 0)
      {
         erro_numero(numero_obj.value,p_inteiro,p_decimal,campo_nome,numero_obj);
      }
   }



function check_date(campo) {
  var c;
  a = campo.value;
  if (a.length == 8) {
    a = a.substring(0,2) + "/" + a.substring(2,4) + "/" + a.substring(4,8);
  }
  check(campo);
  campo.value = a;
}

function check(campo) {
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
  alert('Date format must be DD/MM/YYYY');
  return false;
  }
  else{
    return true;
  }
}

function VerificaCampos(Campo){
  if (Campo.value.length==0){
    Campo.focus();
    alert('Field cannot be left blank!!');
    event.returnValue=false;
  }
}

function tamanhoMaximo(objeto, max , nomecampo){
  var campo = eval(objeto);

  if(campo.value.length>max){
    alert( nomecampo + " cannot have more than" + max + " characters." );
    campo.focus();
  }
}

function check_formatStr(formatStr, evento, objeto, size){
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
  arrTexto = formatStr.split('.');
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

function formatStr(formato, evento, objeto, size){
  if (window.innerHeight)
    keypress=evento.which;
  else
    keypress=evento.keyCode;

  campo = eval(objeto);

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
             numero_val.substring(cont_d-1,cont_d) != "." && numero_val.substring(cont_d-1,cont_d) != ","){
            if (cont_i == cont_p && cont_p > 0) {
               numero_fmt = "," + numero_fmt;
               cont_p = cont_i + 4;
               ++cont_i;
            }
            if (cont_i == p_decimal && p_decimal > 0){
               numero_fmt = "." + numero_fmt;
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
function telaAnterior(){
  history.go(-1);
}

var mensagemDeErro;


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
  var campo = eval(objeto);
//  alert("Msg "+msg);
  aux=trim(campo.value);
  if (aux =="")
    { alert( msg + " cannot be left blank !");
      return false;
    }
  return true;
  }

function e_Num(objeto,msg){
      var campo = eval(objeto);
      en=true;
      st="0123456789,.";
      aux=trim(campo.value);

      if (aux =="")
      { alert( msg + " cannot be left blank !");
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
      {alert("Field "+ msg + " invalid !");
       return false;
      }
  }

// Campo para checkr campo numerico CASO esteja preenchido!
function e_NumValida(objeto,msg){

      var campo = eval(objeto);
      aux=trim(campo.value);

      if (aux =="")
      { return true;}
      else
       {
         return e_Num(objeto,msg);
       }
}

// Campo para checkr campo INTEIRO!

function e_Int(objeto,msg){

      var campo = eval(objeto);
      en=true;
      st="0123456789";
      aux=trim(campo.value);

      if (aux =="")
      { alert( msg + " cannot be left blank !");
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
      {alert("Field "+ msg + " invalid !");
       return false;
      }

  }

// Campo para checkr campo INTEIRO CASO esteja preenchido!

function e_IntValida(objeto,msg){

   var campo = eval(objeto);
   aux=trim(campo.value);

   if (aux =="")
      {return true;}
   else
   {
    return e_Int(objeto,msg);
   }

  }


function e_Cpf(objeto,msg){

   var obj = eval(objeto);
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
    alert("Field "+ msg + " invalid !");
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
     alert("Field "+ msg + " invalid !");
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
     alert("Field "+ msg + " invalid !");
     obj.focus();
     return false;
    }

    for (var j=0;j<10;j++)  {

     if (campo.substring(j,j+1) != campo.substring(j+1,j+2)) {
       return true;
      }
    }

  } else {
    alert("Field "+ msg + " invalid !");
    obj.focus();
    return false;
  }
}


function e_Data(objeto,msg) {
      var ret   = false;
      var campo = eval(objeto);
      var vlraux = trim(campo.value);

      if (vlraux == "")
       {
        alert( msg + " cannot be left blank !"); campo.value=""; campo.focus(); return false;
       }

      if ((vlraux.length != 10) ||
         (vlraux.substring(2,3) != "/") ||(vlraux.substring(5,6)!= "/")){
         alert("Field  " + msg + " invalid !"); campo.value=""; campo.focus(); return false;
      }

      mes = parseInt(vlraux.substring(0,2),10); 
      dia = parseInt(vlraux.substring(3,5),10);
      ano = parseInt(vlraux.substring(6,10),10);

      if (isNaN(dia) || isNaN(mes) || isNaN(ano) || (mes < 1) || (mes > 12) || (dia < 1)) {
       alert("Field  " + msg + " invalid !"); campo.value=""; campo.focus(); ;return false;
      }
      tabmes = "312831303130313130313031";
      if ((dia == 29) && (mes == 02)){
        if ((ano == 0) || ((ano % 4) != 0)){
          alert("Field  " + msg + " invalid !"); campo.value=""; campo.focus(); return false;
        } else {
       return true;
        }
      }
      k = (mes * 2 - 2)
      if (dia > tabmes.substring(k,k + 2)) {
        alert("Field " + msg + " invalid !"); campo.value=""; campo.focus(); return false;
      } else {
       return true;
      }
    }

function e_DataValida(objeto,msg) {

      var ret   = false;
      var campo = eval(objeto);
      var vlraux = trim(campo.value);
      if (vlraux == "")
       {
        return true;
       }

      if ((vlraux.length != 10) ||
         (vlraux.substring(2,3) != "/") ||(vlraux.substring(5,6)!= "/")){
         alert("Field  " + msg + " invalid !"); return false;
      }

      mes = parseInt(vlraux.substring(0,2),10); 
      dia = parseInt(vlraux.substring(3,5),10);
      ano = parseInt(vlraux.substring(6,10),10);

      if (isNaN(dia) || isNaN(mes) || isNaN(ano) || (mes < 1) || (mes > 12) || (dia < 1)) {
       alert("Field  " + msg + " invalid !"); return false;
      }
      tabmes = "312831303130313130313031";
      if ((dia == 29) && (mes == 02)){
        if ((ano == 0) || ((ano % 4) != 0)){
          alert("Field  " + msg + " invalid !"); return false;
        } else {
       return true;
        }
      }
      k = (mes * 2 - 2)
      if (dia > tabmes.substring(k,k + 2)) {
        alert("Field  " + msg + " invalid !"); return false;
      } else {
       return true;
      }


    }
function e_Cep(objeto,msg) {

      var campo = eval(objeto);
      var ax    = campo.value;
      var vlr   = trim(FiltraCampo(campo.value));

      if (vlr=="" || vlr.length!=8 )
       {alert("Field  " + msg + " invalid !"); return false;}

      campo.value=vlr;

      if (e_Num(objeto,msg))
       {campo.value=ax; return true}
       else
        {campo.value=ax; alert("Field  " + msg + " invalid !"); return false; }
    }

function e_Cnpj(objeto,msg) {
      var campo = eval(objeto);
      var arg   = FiltraCampo(campo.value);

      c=trim(arg); t=c.length; ax=""; dv=""; dv1=0; dv2=0;

      if (t<14  || parseInt(c)==0) {
       alert("Field  " + msg + " invalid !"); campo.value=""; campo.focus(); return false;
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
       alert("Field  " + msg + " invalid !"); campo.value=""; campo.focus(); return false;
      }
    }

function esta_Select(objeto,msg)
{
 var retorno = false;
 Combo = eval(objeto);
//if (Combo.length != 0)
 if (Combo.options) {
   if (Combo.options.selectedIndex != -1){
     var valorSelecionado = Combo.options[Combo.selectedIndex].value;
     if(valorSelecionado != ""){
       retorno = true;
     }
   }
 }
 if (retorno == false){
    alert("Field  " + msg + " must be selected  !");
    return false;}
}


//-----------------------------------------------------------------------------------------
// Valida se existe algum  item selecionados em uma array checkbox.
//-----------------------------------------------------------------------------------------
function esta_Checado(objeto,msg)
 {
  var campoChecado = 0;
  var checkbox = eval(objeto);

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
   {alert("Field " + msg + " must be selected !");
    return false;}

}
function e_Email(objeto,msg)  {
       arg = eval(objeto).value;

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
          alert("Field  " + msg + " invalid !"); return false;
      } else {
         p1= s.indexOf("@"); p2=s.indexOf(".");

         if ((p1<0)||(p2<0)) {
            alert("Field  " + msg + " invalid !"); return false;
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

//-----------------------------------------------------------------------------
// Sub-Rotina: RepassaValorLovet
// Objetivo  : Repassar para as propriedades "value" dos controles da janela
//             "Opener", cujos "names" est�o contidos no "arrayControlesRecebem",
//             os valores separados pelo caracter "|" e armazenados na
//             propriedade "value" do "ControleEntrega" da janela "Lovet".
// Autor(es) : Lauriberto M�ximo e Robson Rabelo
// Data      : 07/02/2001
// Status    : Finalizado e em Uso
//-----------------------------------------------------------------------------
  function RepassaValorLovet(arrayControlesRecebem,nomeControleEntrega,tipoControleEntrega)
  {

    var i;
    var r = new Array();
    var existeItemChecado = false;
    var wOpener = window .opener;                         //janela opener
    var dOpener = wOpener.document;                       //documento da janela opener
    var cOpener;                                          //controle da janela opener

    var wLovet  = window .self;                           //janela Lovet
    var dLovet  = wLovet .document;                       //documento da janela Lovet
    var cLovet  = dLovet .all.item(nomeControleEntrega);  //controle da janela Lovet

    if(tipoControleEntrega.toLowerCase() == "radio")      //se o controle da janela Lovet for um radio
    {
      for(i = 0; i < cLovet.length; i++)
      {
        if(cLovet[i].checked)                             //se existe um item radio checado
        {
          cLovet            = cLovet[i];                  //o controle Lovet deixa de ser o array de radios e passa a ser radio checado
          existeItemChecado = true;
          break;
        }
      }
    }

    if (existeItemChecado)
    {
      r = DivideString(cLovet.value,"|");                 //retornado um array de strings
      if((r != null) && (r.length == arrayControlesRecebem.length))        //se a quantidade de controles a receberem os valores correspondem a quantidade de strings contidas em "r"
      {
        for(i = 0; i < r.length; i++)
        {
          cOpener = dOpener.all.item(arrayControlesRecebem[i]);
          cOpener.value = r[i];
        }
      }
      else
      {
        window.alert("Invalid window opener!");
      }
      window.close();
    }
    else
    {
      alert('must be one or less!');
    }
  }

//-----------------------------------------------------------------------------
// Sub-Rotina: DivideString
// Objetivo  : Retornar um array de strings no qual cada elemento corresponde
//             as strings, originalmente separadas por um caracter "divisor",
//             contidas na string "s".
// Autor(es) : Lauriberto M�ximo
// Data      : 08/02/2001
// Status    : Finalizado e em Uso
//-----------------------------------------------------------------------------
  function DivideString(s,divisor)
  {
    var r = new Array();
    var j = 0;
    var p = s.indexOf(divisor);
    while(p > 0)
    {
      r[j] = s.substring(0,p);
      s    = s.substring(p+1,s.length);
      j++;
      p    = s.indexOf(divisor);
    }
    r[j] = s;
    return r;
  }

//-----------------------------------------------------------------------------
// Sub-Rotina: AbrirNovaJanela
// Objetivo  : Abrir uma nova janela do browser com valores padr�es de "altura"
//             e "largura", sem barra de menus e ferramentas.
// Autor     : Lauriberto M�ximo Alves
// Data      : 07/02/2001
// Status    : Finalizado
//-----------------------------------------------------------------------------
  function AbrirNovaJanela(url, width, height)
  {
    var horizontal  = window.screen.availWidth;
    var vertical    = window.screen.availHeight;
    var comprimento = 500;
    var altura      = 350;

    if(width != null && height != null) {
    comprimento = width;
    altura      = height;

    }
//status=yes ,toolbar=no

    var x = window.open(url,'x'," scrollbars=yes,width="+ comprimento + ",height=" + altura);

    horizontal = Math.round((horizontal - comprimento) / 2);
    vertical   = Math.round((vertical   - altura) / 2);

    x.moveTo(horizontal, vertical);


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
  return confirm("Do you want to save this record?");
}

function ConfirmaExcluir() {
  return confirm("Do you want to delete this record?");
}


function ConfirmaAlterar() {
  return confirm("Do you want to save this record?");
}

function Testando(valor,descricao) {
  alert(valor+" "+descricao);
}

function MM_preloadImages() {
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_callJS(jsStr) {
  return eval(jsStr);
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

function onkeypressNumero(keypress) {
 if (keypress >= 48 && keypress <= 57)
  {
  event.returnValue = true;
  }
 else event.returnValue=false;

}

/**
 * Recebe o valor da tecla selecionada para checkr somente
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
 * Recebe o valor da tecla selecionada para checkr somente
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
*     Remove relativas a remo��o de um
*     item de um selected
*--------------------------------------------------------*/
function remove(form) {
  if (form.disabled == true) {
    alert("Para tornar dispon�vel a remo��o, selecione, no menu de a��es, a op��o \"Editar Dados\"!");
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

function colocaformatStrNumero(numero_obj0,p_inteiro,p_decimal) {
  var numero_obj = new Object();
  numero_obj.value = numero_obj0 + ""; // para numero_obj0 em um objeto String
  if(p_decimal > 0) {
    //substitue o valor do ponto por virgula, quando a semantica indicar
    if((numero_obj.value.indexOf(".")!=-1) && (p_decimal >= (numero_obj.value.length - numero_obj.value.indexOf(".")-1)))
      numero_obj.value=numero_obj.value.replace(".",",");
    if((numero_obj.value.indexOf(",") == -1) && (numero_obj.value.length <= (p_inteiro - p_decimal)))
      numero_obj.value = numero_obj.value + ",00";
    //coloca 0 antes da ',' ou do ponto caso eles seja o primeiro caracter
    if(numero_obj.value.indexOf(",")==0)
      numero_obj.value= "0" + numero_obj.value;
    //preenche de 0s a direita do ultimo numero representativo apos a virgula,
    //ate completar as casas decimais.
    var quantNumDec=(numero_obj.value.length - numero_obj.value.indexOf(",")-1);
    if( quantNumDec < p_decimal) {
      for(var k=0;k<(p_decimal-quantNumDec); k++)
        numero_obj.value=numero_obj.value+"0";
    }

    cont_i = 0;
    cont_p = 0;
    cont_n = p_inteiro;
    numero_fmt = new String();
    var numero_val = numero_obj.value;
    cont_d = numero_val.length;
    while (cont_d >=0) {
       if (numero_val.substring(cont_d-1,cont_d) != " " && numero_val.substring(cont_d-1,cont_d) != "" &&
           numero_val.substring(cont_d-1,cont_d) != "," && numero_val.substring(cont_d-1,cont_d) != ".") {
          if (numero_val.substring(cont_d-1,cont_d) != "1" && numero_val.substring(cont_d-1,cont_d) != "2" &&
              numero_val.substring(cont_d-1,cont_d) != "3" && numero_val.substring(cont_d-1,cont_d) != "4" &&
              numero_val.substring(cont_d-1,cont_d) != "5" && numero_val.substring(cont_d-1,cont_d) != "6" &&
              numero_val.substring(cont_d-1,cont_d) != "7" && numero_val.substring(cont_d-1,cont_d) != "8" &&
              numero_val.substring(cont_d-1,cont_d) != "9" && numero_val.substring(cont_d-1,cont_d) != "0")
          {
          camposcheckdosOk = false;
             alert("Invalid value!"); //+ numero_val.substring(cont_d-1,cont_d));
             numero_obj.focus();
             break;
          }
          if (cont_i == cont_p && cont_p > 0) {
             numero_fmt = "." + numero_fmt;
             cont_p = cont_i + 4;
             ++cont_i;
          }
          if (cont_i == p_decimal && p_decimal > 0) {
             numero_fmt = "," + numero_fmt;
             cont_p = cont_i + 4;
             ++cont_i;
          } else {
             numero_fmt = numero_val.substring(cont_d-1,cont_d) + numero_fmt;
             --cont_n;
             --cont_d;
             ++cont_i;
          }
          if (p_decimal == 0 && cont_i == 3)
             cont_p = 3;
       } else {--cont_d;}
       if (cont_n < 0) {
          fieldsCheckOK = false;
          alert("Invalid size!");
          numero_fmt = new String();
          numero_obj.focus();
          break;
       }
    }
    return numero_fmt;
  }

 }

// rotina para refazer o body corpo

var corpo = null;
var navegador = null;
var central = null;
var tabGuia = null;
var divBody = null;
var stlCorpo   = null;
var stlNavegador   = null;
var stlCentral   = null;
var stlTabGuia   = null;
var stlDivBody   = null;
var divIndex = null;
var stlDivIndex   = null;
var windowHeight = null;
var windowWidth = null;
var wrapped = false;

function toggleDebug(debugging)
{
  if (debugging.value == '1')
    xbDEBUG.on = true;
  else
    xbDEBUG.on = false;
}

function initCorpo()
{

  divIndex = xbGetElementById('divIndex');

  if (!divIndex)
  {
    alert('divIndex not found during initCorpo()');
    return;
  }

  stlDivIndex = new xbStyle(divIndex);

  if (window.innerHeight){
    windowHeight=window.innerHeight;}
  else if (document.body.clientHeight){
    windowHeight=document.body.clientHeight;}

  stlDivIndex.setHeight(xbToInt(windowHeight + 9));

//  alert(windowHeight);
  // need this for NN4 since our form is in a relative div...
  if (xbDEBUG.on && !wrapped)
  {
    xbDebugTraceObject('window', 'xbStyle');
    xbDebugTraceObject('window', 'xbClipRect');
    wrapped = true;
  }
  if (xbDEBUG.on)
  {
    xbDebugDumpProfile();
  }
}

// funcao para refazer o tamanho do body de acordo com as dimen��es do browse
function initBody()
{

  corpo = xbGetElementById('corpo');
  navegador = xbGetElementById('navegador');
  central = xbGetElementById('central');
  tabGuia = xbGetElementById('tabGuia');

  if (!corpo)
  {
    alert('body not found during initBody()');
    return;
  }

  if (tabGuia){
    stlTabGuia = new xbStyle(tabGuia);
  }

  stlCorpo = new xbStyle(corpo);
  stlNavegador = new xbStyle(navegador);
  stlCentral = new xbStyle(central);

  if (window.innerHeight){
    windowHeight=window.innerHeight;
    windowWidth =window.innerWidth;
  }else if (document.body.clientHeight){
    windowHeight=document.body.clientHeight;
  }

  if (tabGuia){
    stlCorpo.setHeight(xbToInt(windowHeight - stlNavegador.getHeight() - stlTabGuia.getHeight() ));
  } else {
    stlCorpo.setHeight(xbToInt(windowHeight - stlNavegador.getHeight() ));
  }

  if (window.innerHeight && (stlCorpo.getHeight() <= stlCentral.getHeight())){
    stlCentral.setWidth(xbToInt(windowWidth - 16 ));
  } else if (window.innerHeight) {
    stlCentral.setWidth(xbToInt(windowWidth));
  }


  // need this for NN4 since our form is in a relative div...
  if (xbDEBUG.on && !wrapped)
  {
    xbDebugTraceObject('window', 'xbStyle');
    xbDebugTraceObject('window', 'xbClipRect');
    wrapped = true;
  }
  if (xbDEBUG.on)
  {
    xbDebugDumpProfile();
  }
}

var oldBGColor = null;

function setColorOn(linha){
  var vLinha = xbGetElementById(linha);
  var stlLinha = new xbStyle(vLinha);
  oldBGColor = stlLinha.getBackgroundColor();
  stlLinha.setBackgroundColor('#A3C5E7');
}

function setColorOff(linha){
  var vLinha = xbGetElementById(linha);
  var stlLinha = new xbStyle(vLinha);
  stlLinha.setBackgroundColor(oldBGColor);
}

// fun��o utilizada para visualizar ou esconder uma div

function mostraDiv(div){
  var divFrame2 = xbGetElementById(div);
  var stlDivFrame2 = new xbStyle(divFrame2);
  if (stlDivFrame2.getVisibility()=='hidden' || stlDivFrame2.getVisibility()=='inherit'){
    stlDivFrame2.setVisibility('visible');
  }
}

function escodeDiv(div){
  var divFrame2 = xbGetElementById(div);
  var stlDivFrame2 = new xbStyle(divFrame2);
  if (stlDivFrame2.getVisibility()!='hidden' && stlDivFrame2.getVisibility()!='inherit'){
    stlDivFrame2.setVisibility('hidden');
  }
}

// fun��o utilizada na chamada dos campos com pesquisa
// selectList('nome da classe negocial com a package',
//            'nome do metodo de pesquisa que sera executado. Lembrando que o metodo deve receber um valor para ser pesquisado',
//            'a expressao "this" que siguinifica o proprio campo da tela,
//            'campo ID da classe pesquisada|campo que sera retornado como descricao',
//            'campo do formulario atual que sera filtro na classe pesquisada, devem ser iguais e nao � obrigatorio',
//            'campos que serao mostrados na lista separados por "|" seguindo o padrao da TableCheck',
//            'titulos dos campos mostrados separados por "|"',
//            'lagura dos campos de titulo mais um ex: "1%|largura dos outros campos"',
//            'titulo da janela da lista',
//            'Campo do formulario que receber� o retorno do campo ID',
//            'Campo do formulario que receber� o retorno do campo descricao)
function selectList(obj, metodo, campo, chave, filtro, camposLista, titulos, colsWidth, titulo, retornoID, retornoDescricao) {
  var campoFiltro = null;
  var formName = "forms[0]";
  var fullFormName = "";

  if (campo.form.name.length>0){
    formName = campo.form.name;
  }

  fullFormName = 'document.'+formName;

  if (filtro.length>0) {

     campoFiltro = eval('document.'+formName+'.'+filtro);
     if (!campoFiltro){
       alert("The field "+filtro+" do not exist in the form!");
       return false;
     }
  }

  if (filtro.length>0){
    var valorFiltro = campoFiltro.value;
    var url = "/pge/jsp/common/selectList.jsp?objeto="+obj+"&metodo="+metodo+"&valor="+escape(campo.value)+
            "&chave="+chave+"&camposLista="+camposLista+"&titulos="+titulos+"&colsWidth="+escape(colsWidth)+
            "&campoDescricao="+campo.name+"&campoFiltro="+filtro+"&valorFiltro="+valorFiltro+"&titulo="+titulo+
            "&formRetorno="+fullFormName+"&retornoID="+retornoID+"&retornoDescricao="+retornoDescricao;
  }else{
    var url = "/pge/jsp/common/selectList.jsp?objeto="+obj+"&metodo="+metodo+"&valor="+escape(campo.value)+
            "&chave="+chave+"&camposLista="+camposLista+"&titulos="+titulos+"&colsWidth="+escape(colsWidth)+
            "&campoDescricao="+campo.name+"&titulo="+titulo+"&formRetorno="+fullFormName+"&retornoID="+
            retornoID+"&retornoDescricao="+retornoDescricao;
  }

//  if (window.innerHeight){ // verifica se o browser � Mozila
    frmLOV = window.open(url ,
          "SelectList", "scrollbars=yes,resizable=no,width=550,height=380px");
    frmLOV.focus();
    if (frmLOV.opener == null) {
       frmLOV.opener = self;
    }
//  }else if (document.body.clientHeight){ // verifica se o browser � IE5.5 ou maior
//    var vReturn = window.showModelessDialog(url, this.window, "dialogHeight:340px; dialogWidth:600px; scroll:no")
//    if (vReturn){
//      document.forms[0].elements[elemento_no_formulario1(campo.name,0)].value = vReturn.substring(vReturn.indexOf('|')+1);
//      if (elemento_no_formulario1(chave.substring(0,chave.indexOf('|')),0)<0){
//        alert("A refer�ncia "+chave.substring(0,chave.indexOf('|'))+" Não foi encontrada no formul�rio!");
//      }else{
//       document.forms[0].elements[elemento_no_formulario1(chave.substring(0,chave.indexOf('|')),0)].value = vReturn.substring(0,vReturn.indexOf('|'));
//      }
//    }
//  }
}

   function retornaSelectList(campoDesc, campoChave, valorChave, formRetorno) {
//     alert(campoDesc);
//     alert(valorChave.substring(valorChave.indexOf('|')+1));
//     alert(camposChave.substring(0,camposChave.indexOf('|')));
//     alert(valorChave.substring(0,valorChave.indexOf('|')));
     eval('opener.'+formRetorno.value+'.'+campoDesc+'.value = "'+ valorChave.substring(valorChave.indexOf("|")+1)+'"');
     eval('opener.'+formRetorno.value+'.'+campoChave+'.value = "'+valorChave.substring(0,valorChave.indexOf("|"))+'"');
     window.close();
   }

function verificaExclusao(form){
  var isExcluido = false;
  if (form.isExcluido){
    if (form.objIds.length){
      for (var i=0; i < form.objIds.length; i++) {
        if (form.objIds[i].checked)
          if (form.isExcluido[i].value=='Sim')
            isExcluido = true;
      }
    }else{
      if (form.objIds.checked)
        if (form.isExcluido.value=='Sim')
          isExcluido = true;
    }
  }
  return isExcluido;
}

function SaltaCampo (objeto,prox,tammax,teclapres){
  campo = eval(objeto);

  var tecla = teclapres.keyCode;
  vr = campo.value;
  if( tecla == 109 || tecla == 188 || tecla == 110 || tecla == 111 || tecla == 223 || tecla == 108 ){
    campo.value = vr.substr( 0, vr.length - 1 ); }
  else{
    vr = vr.replace( "-", "" );
    vr = vr.replace( "/", "" );
    vr = vr.replace( "/", "" );
    vr = vr.replace( ",", "" );
    vr = vr.replace( ".", "" );
    vr = vr.replace( ".", "" );
    vr = vr.replace( ".", "" );
    vr = vr.replace( ".", "" );
    tam = vr.length;
  }
}




function somat(s,valor,pesos){
    var        z=0;
    var        y=0;
    var        u=0;
    var     soma=0;
    var       sA=10;
    var       sB=11;
  for(x=0;x<=s-1;x++)
    {
        if (pesos.substr(x,1) == 'A' || pesos.substr(x,1) == 'B'){
           y=eval('s'+ pesos.substr(x,1));
        }
        else y=parseInt(pesos.substr(x,1));
        z=parseInt(valor.substr(x,1));
        u=y*z;
        soma=soma+u;
      }
      return soma;
}

function calculodg(s,valor,pesos,mdl){
    var    dg1  =0;
    var    resto=0;
    var     soma=0;
    soma=somat(s,valor,pesos);
  resto=soma % mdl;
  dg1=(mdl-resto);
    return dg1;
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
function desmarcar(form){
   for (var i=1; i < form.objIds.length; i++) {
      form.objIds[i].value="";
   }
}
function verifyUtilization(){
   var utilization = parseFloat(document.all.utilization.value);
   if (utilization == 0 || utilization > 1 || utilization < -1){
      alert("Utilization value must be in between -1 and 1 , and not equal to 0!");
      document.all.utilization.focus();
      return false;
   }else{
      return true;
   }
}
function setObjIds(form,value){
   if (form.objIds.length) {
      form.objIds[0].value=value;
   }else{
      form.objIds.value=value;
   }
}

function ConfirmaDisplayList(campoId, action) {
  alert(campoId);
  objCampoId=eval(campoId);
  alert(objCampoId);
  if(action == 'editar'){
    if(VerificaQtosCamposChecados(objCampoId)==0){
      alert("Nenhum registro foi selecionado!");
      return false;
    }else if(VerificaQtosCamposChecados(objCampoId)>1){
      alert("Apenas um registro pode ser selecionado!");
      return false;
    }
  }else if(action == 'excluir'){
    if(VerificaQtosCamposChecados(objCampoId)==0){
      alert("Nenhum registro foi selecionado!");
      return false;
    }else{
      msg="Confirma a exclusão dos registros?";
      if (confirm(msg)){
         return true;}
      else{
         return false;
      }
    }
  }
  return true;
}

