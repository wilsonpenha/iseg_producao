/* *********************  Constantes ********************/

TIPOFORM_TEXT			=1;
TIPOFORM_DATA			=2;
TIPOFORM_CEP			=3;
TIPOFORM_TEL			=4;
TIPOFORM_CPF			=5;
TIPOFORM_CGC			=6;
TIPOFORM_HORA			=7;
TIPOFORM_MESANO			=8;
TIPOFORM_SELECT			=9;
TIPOFORM_RADIO_CHECK	=10;
TIPOFORM_NUMERICO		=11;
TIPOFORM_INTEIRO		=12;
TIPOFORM_DATAVALIDA		=13;
TIPOFORM_NUMERICOVALIDA	=14;
TIPOFORM_INTEIROVALIDA	=15;
TIPOFORM_INSCRICAO		=16;
TIPOFORM_UTILIZATION	=17;

OP_INSERT			= 1;
OP_UPDATE			= 2;
OP_INSERT_UPDATE	= 1;

OP_COM_CONFIRMA = 0;
OP_SEM_CONFIRMA = 1;

ArrNomeCampo		= new Array();
ArrTipoCampo		= new Array();
ArrLabelCampo		= new Array();
ArrStatusCampo		= new Array();
ArrOperacaoCampo	= new Array();


FORM_DISPLAY_LIST			= "displayList.jsp";
FORM_INSERT					= "insert.jsp";
FORM_INSERT_SEM_CONFIRMA	= "insertsemconfirma.jsp";
FORM_UPDATE					= "update.jsp";
FORM_DELETE					= "delete.jsp";
FORM_PROPOSTA_WIZARD		= "propostaWizard.jsp";
FORM_SINISTRO_WIZARD		= "sinistroWizard.jsp";

ACTION_FORM_VIEW 	      = "26";
ACTION_FORM_UPDATE 	= "21";
ACTION_FORM_INSERT 	= "20";
ACTION_FORM_SEARCH      = "25";
ACTION_SELECT_OBJECT	= "4";
ACTION_TELAANTERIOR 	= "99";
ACTION_DISPLAY_LIST     = "5"
ACTION_INSERT           = "1";
ACTION_UPDATE 	      = "2";
ACTION_DELETE 		= "3";
ACTION_RECOVER 		= "6";
ACTION_SEARCH           ="10";

RAMO_AUTOMOVEL = 2;
RAMO_IMOVEL = 3;
RAMO_RISCO_DIVERSOS = 4;
RAMO_VIDA_EMPRESARIAL = 5;
RAMO_VIDA_INDIVIDUAL = 6;
RAMO_RESIDENCIAL = 7;
RAMO_EMPRESARIAL = 8;
RAMO_CONDOMINIO = 9;
RAMO_TRANSPORTES = 10;

TP_PROP_COMUM = 1;   // NOVA
TP_PROP_RENOVACAO_PROPRIA = 4;  // RENOVACAO DE PROPOSTAS DO ISEG
TP_PROP_RENOVACAO_EXTERNA = 6;  // RENOVACAO DE PROPOSTAS NAO ISEG, SERA UMA NOVA PROPOSTA.

// usar no Protocolo
TP_DOCUMENTO_PROPOSTA = 4000;

function ConfirmaSubmit(tipoForm, op1, op2) {

	if(tipoForm==FORM_INSERT) {
		return ConfirmaCampos(op1,op2);
  	} else
	  if(tipoForm==FORM_UPDATE) {
		  return ConfirmaCampos(op1,op2);
    } 
   
 return true;
}

//*************  VALIDACOES DE CONSULTA ******************************

function ConfirmaDisplayList(str)
 {
  if(str.dbAction.value == ACTION_FORM_UPDATE)
   {
    if(VerificaQtosCamposChecados(str.objIds)==0)
     {alert("Nenhum item foi selecionado.");
      return false;}
    else
    if(VerificaQtosCamposChecados(str.objIds)>1)
     {alert("Apenas um item deve ser selecionado.");
      return false;}
    else if (verificaExclusao(str))
     {alert("Registro excluido nao pode ser editado.");
      return false;}
   }else
  if(str.dbAction.value == ACTION_DELETE || str.dbAction.value == ACTION_RECOVER)
   {
    if(VerificaQtosCamposChecados(str.objIds)==0)
     {alert("Nenhum item foi selecionado.");
      return false;}
     else
      {
        if(str.dbAction.value == ACTION_DELETE){
          msg="Confirma a exclusao dos itens?";
        }else{
          msg="Confirma a recuperacao dos itens?";
        }
        if (confirm(msg))
         {return true;
         }else{return false;}
      }
   }
 return true;
 }

//*************  VALIDACOES DE INSERT ******************************
function ConfirmaCampos(op,op2)
 { var msg="";
   if (op ==1 && op2==OP_COM_CONFIRMA){
     msg="Confirma os dados ?";}
   else if (op ==2 && op2==OP_COM_CONFIRMA)
    {msg="Confirma os dados ?";}
   else if (op ==3 && op2==OP_COM_CONFIRMA)
    { op=1;}

   var confirma = false;

   if (msg=="") {
     confirma = true;
   } else {
     confirma = confirm(msg);
   }

   if (confirma){
       var retorno = false;
       for (var i=0; i < this.ArrNomeCampo.length; i++){
         if (this.ArrTipoCampo[i] == TIPOFORM_TEXT && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno = e_Text($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_DATA && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Data($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_CEP  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Cep($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_TEL  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Data($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_CPF  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Cpf($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_INSCRICAO  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Inscricao($(ArrNomeCampo[i])[0],ArrLabelCampo[i],'document.getElementById("uf")') }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_CGC  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )    { retorno  = e_Cnpj($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_HORA  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )   { retorno  = e_Data($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_MESANO  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno  = e_Data($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_SELECT  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno  = esta_Select($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_RADIO_CHECK  && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) )  { retorno  = esta_Checado($(ArrNomeCampo[i])[0],ArrLabelCampo[i]) }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_NUMERICO && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = e_Num($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_INTEIRO && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = e_Int($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_NUMERICOVALIDA && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = e_NumValida($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_INTEIROVALIDA && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = e_IntValida($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_UTILIZATION && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = verifyUtilization(); }
         else
         if (this.ArrTipoCampo[i] == TIPOFORM_DATAVALIDA && ((op == 1 && this.ArrOperacaoCampo[i]==1) || (op==2 && (this.ArrOperacaoCampo[i]==1 ||this.ArrOperacaoCampo[i]==2)) ) ) { retorno = e_DataValida($(ArrNomeCampo[i])[0],ArrLabelCampo[i]); }
         else { retorno =true;}

//         alert(this.ArrNomeCampo.length);
//         alert(i+' - '+this.ArrNomeCampo[i]+' - '+this.ArrTipoCampo[i]+' - '+retorno);
         
         if (retorno == false){ 
            posicao = $(ArrNomeCampo[i])[0];
            
            if (posicao.type != "hidden" && this.ArrTipoCampo[i] != TIPOFORM_RADIO_CHECK && posicao.disabled == "false" ) {
                posicao.focus();
            }
            return false;
         }
       }

       if (this.ArrNomeCampo.length == 0)
    	   retorno=true;
       
       if (retorno ==false){  
          return false;}else{return true;
       }

     }else{
        return false;
     }
     return true;
 }

function camposLiberados(obj){
  for (var i=0; i < this.ArrCampoReadOnly.length; i++) {
    campo = eval(obj+"."+this.ArrCampoReadOnly[i]);
   // alert(this.ArrCampoReadOnly[i]);
    if (campo.type == "select-one" || campo.type == "select-multiple" || campo.type == "button")
      campo.disabled = false;
    else if (campo.type == "radio") {
      var pos = this.ArrCampoReadOnly[i].indexOf("[");
      campoRadio = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos));
      for (var k=0; k < campoRadio.length; k++) {
        campo = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos)+"["+k+"]");
        campo.disabled = false;
      }
    } else if (campo.type == "checkbox") {
      var pos = this.ArrCampoReadOnly[i].indexOf("[");
      campoRadio = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos));
      for (var k=0; k < campoRadio.length; k++) {
        campo = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos)+"["+k+"]");
        campo.disabled = false;
      }
    } else {
      var pos = this.ArrCampoReadOnly[i].indexOf("[");
      if (pos > 0){
        campoRadio = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos));
        for (var k=0; k < campoRadio.length; k++) {
          campo = eval(obj+"."+this.ArrCampoReadOnly[i].substr(0,pos)+"["+k+"]");
          campo.readOnly = false;
        }
      } else
        campo.readOnly = false;
    }
  }
  document.forms[0].formAction.value = ACTION_FORM_UPDATE;
}

function setaFocusNoPrimeiro(obj){
  for (var i=0; i < this.ArrCampoReadOnly.length; i++) {
    var pos = this.ArrCampoReadOnly[i].indexOf("[");
    if (pos<0)
      campo = eval(obj+"."+this.ArrCampoReadOnly[i]);
      if (campo.type != "hidden"){
        campo.focus();
        break;
      }
  }
}

