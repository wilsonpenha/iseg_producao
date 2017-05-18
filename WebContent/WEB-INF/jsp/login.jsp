<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:="http://www.w3.org/1999/xhtml">
 
<head>    

<title>iSeg - Gestão Inteligente</title>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache"> 

<LINK rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/common/web/images/iseg.ico"></LINK> 
<LINK rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/web/skins/Default/Login/Login.css" id="paramCSS"></LINK>

<script language="JavaScript">
</script>

<SCRIPT language="JavaScript" src="${pageContext.request.contextPath}/common/web/js/utils-pack.js?v=0" type="text/javascript"></SCRIPT>
<script language="javascript" charset="UTF-8" src="${pageContext.request.contextPath}/common/jquery-1.5.1.min.js?v=0"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/common/jquery-form-pack.js?v=0" type='text/javascript'></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/common/jquery.simplemodal-1.1.1.js?v=0" type='text/javascript'></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/common/common-pack.js?v=3" type='text/javascript'></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/common/event-pack.js?v=0" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="${pageContext.request.contextPath}/common/jquery.meiomask-pack.js?v=0"></script>

<script charset="UTF-8" type="text/javascript">defineContext('${pageContext.request.contextPath}/');</script>

<SCRIPT language="JavaScript" type="text/javascript">

function buttonOK_click() {
    var cnpj = document.frmLogin.cnpj.value;
    cnpj = cnpj.replace(/\./g,'').replace(/\//g,'').replace(/\-/g,'');
	document.frmLogin.j_username.value=document.frmLogin.username.value.toUpperCase()+"@"+cnpj;
	document.frmLogin.j_password.value=document.frmLogin.j_password.value.toUpperCase();
    document.frmLogin.submit();
    return false;
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeArea();limpiar();focoPrimerControl();porDefecto('buttonOK_click()');" onresize="resizeArea();">



<FORM method="POST" action="j_security_check" name="frmLogin" id="frmFormulario">
  <TABLE height="100%" border="0" cellpadding="0" cellspacing="0" id="main">
    <TR>
      <TD valign="top">
        
        <DIV class="Main_ContentPane_NavBar" id="tdtopButtons">
          <TABLE cellpadding="0" cellspacing="0" class="Main_ContentPane_NavBar" id="tdtopNavButtons">
            <TR class="Main_NavBar_bg">
              <TD width="100%"></TD>
               <!-- 
              <TD><DIV class="Main_NavBar_bg_logo_left"></DIV></TD>
              <TD class="Main_NavBar_bg_logo" width="1" onclick="window.open('http://www.i9t.com.br','','width=800,height=600,resizable=yes');return false;"><DIV class="Main_NavBar_logo" alt="iseg" title="iseg" border="0" id="openbravoLogo"></DIV></TD>
              <TD><DIV class="Main_NavBar_bg_logo_right"></DIV></TD>
              -->
            </TR>
          </TABLE>
        </DIV>
        <DIV class="Login_ContentPane_ToolBar" id="paramToolBar">
        
          <TABLE class="Login_ContentPane_ToolBar Login_ToolBar_bg" id="tdToolBar">
            <TR>
              <TD width="100%"></TD>
            </TR>
          </TABLE>
        
        </DIV>

      <DIV align="center" class="Login_ContentPane" style="overflow: auto;" id="client">

        <TABLE style="width: 450px">

          <TR class="Login_Block_Separator_Top"><TD></TD></TR>

          <TR>

            <TD class="Login_ContentCell">

              <TABLE cellspacing="0" cellpadding="0" class="Login_TableEdition">

                <TR>
                  <TD class="TableEdition_OneCell_width"></TD>
                  <TD class="TableEdition_OneCell_width"></TD>
                  <TD class="TableEdition_OneCell_width"></TD>
                </TR> 

                <TR>
                  <TD rowspan="4"><DIV class="Login_UserPicture"></DIV>
                  </TD>
                  <TD colspan="2" class="Login_Logo_Company_Container_Cell">
                    <DIV class="Login_Logo_Company_Container"><IMG src="${pageContext.request.contextPath}/common/web/images/blank.gif" width="1" height="1" class="Login_Logo_Company"></IMG></DIV>
                  </TD>
                </TR>


                <TR>
                  <TD colspan="1" class="TitleCell"><SPAN class="LabelText">CNPJ Corretora</SPAN></TD>
                  <TD class="TextBox_ContentCell" >
                    <INPUT id="cnpj" class="dojoValidateValid clCnpj" type="text" maxlength="18" name="cnpj" ></INPUT> 
                  </TD>
                </TR>

                <TR>
                  <TD colspan="1" class="TitleCell"><SPAN class="LabelText">Usuário</SPAN></TD>
                  <TD class="TextBox_ContentCell" >
                    <INPUT id="j_username" type="hidden" name="j_username" ></INPUT> 
                    <INPUT id="username" class="dojoValidateValid " style="text-transform: uppercase;" type="text" maxlength="20" name="username" ></INPUT> 
                  </TD>
                </TR>  
 
                <TR>
                  <TD colspan="1" class="TitleCell"><SPAN class="LabelText">Senha</SPAN></TD>
                  <TD class="TextBox_ContentCell" >
                    <INPUT class="dojoValidateValid " type="password" maxlength="20" name="j_password"></INPUT> 
                  </TD>
                </TR>

                <TR>
                <TD height="20px" ></TD>
                  <TD rowspan="2"><a href="http://www.iseg.net.br/manuais/guia_rapido/index.html" target="new"><DIV class="Login_IconHelp" ></DIV></a></TD>
                </TR>
                <TR>
                	<TD colspan="3" align="center">
		              <TABLE cellspacing="0" cellpadding="0">
		                <TR>
		                  <TD class="Button_CenterAlign_ContentCell">
		                    <DIV>
		                      <A class="ButtonLink" href="#" onfocus="this.className='ButtonLink_hover'; window.status='Login'; return true;" onblur="this.className='ButtonLink'; window.status=''; return true;" onkeypress="this.className='ButtonLink_active'; return true;" onkeyup="this.className='ButtonLink_hover'; return true;" onclick="buttonOK_click();">
		                        <TABLE class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; window.status='Login'; return true;" onmouseout="this.className='Button'; window.status=''; return true;">
		                          <TR>
		                            <TD class="Button_left"><IMG src="${pageContext.request.contextPath}/common/web/images/blank.gif" alt="Logn" width="1" height="1" border="0" class="Button_Icon Button_Icon_ok" title="Entrar"></IMG></TD>
		                            <TD class="Button_text Button_width">Entrar</TD>
		                            <TD class="Button_right"></TD>
		                          </TR>
		                        </TABLE>
		                      </A>
		                    </DIV>
		                  </TD>
		                </TR>
		              </TABLE>
                	</TD>
                </TR>
                <TR><TD height="20px" colspan="3" align="center">
	                  <input type="button" id="btnf3" style="display: none;"/>
	                  <a href="#" onfocus="this.className='ButtonLink_hover'; window.status='Login'; return true;" onblur="this.className='ButtonLink'; window.status=''; return true;" onkeypress="this.className='ButtonLink_active'; return true;" onkeyup="this.className='ButtonLink_hover'; return true;" 
			                         onclick="document.getElementById('btnf3').click()"><SPAN class="LabelText">Alterar Senha</SPAN></a>
                </TD></TR>
                <TR><TD height="20px" colspan="3" align="center">
                <div id="statusAlterarSenha" style="font-style: italic; font-weight: bold">
                </div>
                </TD></TR>
              </TABLE>
            

            </TD>
          </TR>

          <TR class="Login_Block_Separator_Middle"><TD colspan="3"></TD></TR>

          <TR class="Login_Logo_Support_Field">

            <TD class="Login_ContentCell" colspan="3">

              
              <TABLE cellspacing="0" cellpadding="0" class="Login_TableEdition">

                <TR>
                  <TD class="TableEdition_OneCell_width"></TD>
                  <TD class="TableEdition_OneCell_width"></TD>
                  <TD class="TableEdition_OneCell_width"></TD>
                </TR>

                <TR>
                  <TD class="TitleCell" style="vertical-align: middle;"><SPAN class="LabelText">Contato para suporte</SPAN></TD>
    
                  <TD colspan="2" rowspan="2" align="right">
                    <DIV><IMG src="${pageContext.request.contextPath}/common/web/images/CompanyLogo_big.png" width="282" height="65"></IMG></DIV>
                  </TD>
                </TR>

                <TR>
                  <TD class="TitleCell" style="vertical-align: middle;"><a href="http://iseg.net.br" target="_blank"><SPAN class="LabelText">iseg.net.br</SPAN></a></TD>
                </TR>

              </TABLE>

 
            </TD>

          </TR>


          <TR class="Login_Block_Separator_Middle"><TD></TD></TR>
          <TR><TD class="Login_Copyright_Container_Cell"><SPAN class="Login_Copyright_text">Copyright i9 Tecnologia 2003-2011</SPAN></TD></TR>

        </TABLE>

      </DIV>

        <TABLE width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Bottom" id="tdbottomSeparator">
          <TR>
            <TD class="Main_Bottom_bg"><IMG src="${pageContext.request.contextPath}/common/web/images/blank.gif" width="1" height="1" border="0"></IMG></TD>
          </TR>
        </TABLE></TD>
      <!-- 
      <TD valign="top">
        <TABLE width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Right" id="tdrightSeparator">
          <TR><TD class="Main_NavBar_bg_right"></TD></TR>
          <TR><TD class="Main_ToolBar_bg_right" valign="top"></TD></TR>
          <TR><TD class="Main_Client_bg_right"></TD></TR>
          <TR><TD class="Main_Bottom_bg_right"></TD></TR>
        </TABLE>
      </TD>
       -->
    </TR>
  </TABLE>

</FORM>

<div id="paramLoginChange" style="display: none;" >
  <form id="paramForm" name="paramForm">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" colspan="2" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" colspan="2"  style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Alteração de senha de login
			  </span>
		  </td>
		</tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramTipo">CNPJ Corretora: </label></td>
    <td width="50%">
	  <input type="text" class="dojoValidateValid clCnpj requiredField" style="text-transform: uppercase;" id="cnpjLoginId" name="cnpjLogin" maxlength="18"/>
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramTipo">Usuário: </label></td>
    <td width="50%">
	  <input type="text" class="dojoValidateValid requiredField" style="text-transform: uppercase;" id="nomeLoginId" name="nomeLogin" maxlength="15"/>
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Senha atual: </label></td>
    <td width="50%">
	  <input type="password" class="dojoValidateValid requiredField" id="senhaAtual" name="senhaAtual" maxlength="15"/>
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Nova senha: </label></td>
    <td width="50%">
	  <input type="password" class="dojoValidateValid requiredField" id="novaSenha" name="novaSenha" maxlength="15"/>
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Confirma senha: </label></td>
    <td width="50%">
	  <input type="password" class="dojoValidateValid requiredField" id="confirmaSenha" name="confirmaSenha" maxlength="15"/>
    </td>
  </tr>
  <tr>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf2" style="display: none;"/>
        <A class="ButtonLink" href="#" onfocus="this.className='ButtonLink_hover'; window.status='Login'; return true;" onblur="this.className='ButtonLink'; window.status=''; return true;" onkeypress="this.className='ButtonLink_active'; return true;" onkeyup="this.className='ButtonLink_hover'; return true;" 
           onclick="alterarSenha();document.getElementById('btnf2').click()">
          <TABLE class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; window.status='Login'; return true;" onmouseout="this.className='Button'; window.status=''; return true;">
            <TR>
              <TD class="Button_left"><IMG src="${pageContext.request.contextPath}/common/web/images/blank.gif" alt="Logn" width="1" height="1" border="0" class="Button_Icon Button_Icon_ok" title="Confirma"></IMG></TD>
              <TD class="Button_text Button_width" nowrap style="width:70px">Confirma</TD>
              <TD class="Button_right"></TD>
            </TR>
          </TABLE>
        </A>
	 </div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;"/>
        <A class="ButtonLink" href="#" onfocus="this.className='ButtonLink_hover'; window.status='Login'; return true;" onblur="this.className='ButtonLink'; window.status=''; return true;" onkeypress="this.className='ButtonLink_active'; return true;" onkeyup="this.className='ButtonLink_hover'; return true;" 
           onclick="document.getElementById('btnf9').click()">
          <TABLE class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; window.status='Login'; return true;" onmouseout="this.className='Button'; window.status=''; return true;">
            <TR>
              <TD class="Button_left"><IMG src="${pageContext.request.contextPath}/common/web/images/blank.gif" alt="Logn" width="1" height="1" border="0" class="Button_Icon Button_Icon_ok" title="Cancelar"></IMG></TD>
              <TD class="Button_text Button_width" nowrap style="width:70px">Cancelar</TD>
              <TD class="Button_right"></TD>
            </TR>
          </TABLE>
        </A>
		</div>
    <input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>
    </td>
    </tr>
  </table>
  </form>
</div>
</BODY></HTML>

<script language="JavaScript">


jQuery(document).ready(function () {
	$('#btnf3').click(function (e) {
		e.preventDefault();
		$('#paramLoginChange').modal({onShow: modalShow, close: false});
	});

});

// define a mascara padrão para telefone
$().ready(function() {
    $(".clCnpj").setMask({mask : '99.999.999/9999-99'});
 	
 })

function modalShow (dialog) {
	setTimeout(function(){$('#cnpjLoginId').focus();},500);
} 

function alterarSenha(){
	//submitFormAjax('#paramForm', getContextApp()+'/login/alterarSenha.action', '#statusAlterarSenha');
    var cnpj = document.paramForm.cnpjLogin.value;
    cnpj = cnpj.replace(/\./g,'').replace(/\//g,'').replace(/\-/g,'');
	document.paramForm.nomeLogin.value=document.paramForm.nomeLogin.value.toUpperCase()+"@"+cnpj;
	document.paramForm.senhaAtual.value=document.paramForm.senhaAtual.value.toUpperCase();
	$('#paramForm').ajaxSubmit({
					type: "POST",
					url: getContextApp()+'/alterarSenha.do',
					target: $('#statusAlterarSenha')
				});
	$('#cnpj').focus();
}


var vTarget = window.location.href;
if (vTarget.indexOf("doLogin.action")<0){
	window.parent.location='${pageContext.request.contextPath}/login/doLogin.action';
}
</script>
