<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
  <table width="100%" border="0">
	<tr>
	  <td>
		<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td colspan="4">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle_MaxSize">Relatórios de Proposta</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			</td>
		  </tr>
		  <tr>
			<td colspan="4">
			  <div id="divMessages" style="padding-bottom: 10px;">
				<s:actionerror/>
				<s:actionmessage/>
				<s:fielderror/>
			  </div>
			</td>
		  </tr>
		  
		  <tr>
				<td width="30%" class="TitleCell"><label class="LabelText" for="inicioPId">Data	Início: </label></td>
				<td width="10%" class="TextBox_ContentCell">
					<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="inicioPId"	name="dataInicio" maxlength="20" onblur="isValidDate(this)"/></td>
				<td width="18%" class="TitleCell"><span class="LabelText">Data	Final: </span></td>
				<td width="32%" class="TextBox_ContentCell">
				    <s:textfield theme="simple" cssClass="dojoValidateValid" id="terminoPId" name="dataTermino" maxlength="20" onblur="isValidDate(this)"/></td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Data inicio proposta: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			   <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="propostaInicio" name="pInicio" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Data Termino proposta: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="propostaTermino" name="pTermino" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Data Inicio Vigência: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="vigenciaInicio"  maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Data Término Vigência: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="vigenciaTermino" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Código do Ramo: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="codigoRamo"  maxlength="15" disabled="false"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Código Seguradora: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="codigoSeguradora" name="codigoSeguradora" maxlength="15" />
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Grupo de Venda: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="grupoVendaId"  maxlength="15" disabled="false"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Produtor: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="produtorId" name="produtor" maxlength="15" />
			</td>
		  </tr>
		  
		  <tr>
		  	<td width="10%" class="TitleCell"><span class="LabelText">Cliente: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="clienteId" name="cliente" maxlength="15" />
			</td>
			<td width="10%" class="TitleCell" align="left"><span class="LabelText">Tipo Do Relatório: </span></td>
		  	<td width="30%" class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_OneCell_width" id="tipoRel" name="codigo" list="#{'1':'DETALHADO','2':'RESUMIDO'}" headerKey="" />
		  	</td>
		  </tr>
		</tr>
		</table>
	  </td>
	</tr>
	<tr>
	
	<table width="100%" cellspacing="0" cellpadding="0" align="center" >
	<tr>
	   <td class="Button_RightAlign_ContentCell">
		<div align="center">
		  <a class="ButtonLink" href="#" onclick="openWinReport();">
		  <!--a class="ButtonLink" href="#" onclick="submitForm(document.formRelatorioProposta, '<s:url value="/propostas.do" includeParams="none"/>', false);"-->
			<table class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; return true;" onmouseout="this.className='Button'; return true;">
			  <tr>
				<td class="Button_left"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" alt="Pesquisar" width="1" height="1" border="0" class="Button_Icon Button_Icon_search" title="Pesquisar"></img></td>
				<td class="Button_text Button_width">Gerar</td>
				<td class="Button_right"></td>
			  </tr>
			</table>
		  </a>
		</div>
	  </td>
	</tr>
  </table>
  </tr>
  </table>
</div>

</form>
<form name="formRelatorioProposta">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<input type="hidden" name="inicioP" value="<s:property value="$('#inicioPId').val()"/>" />
<input type="hidden" name="terminoP" value="<s:property value="$('#terminoPId').val()"/>" />
<input type="hidden" name="codigo" value="<s:property value="$('#tipoRel').val()"/>" />

<script type="text/javascript">
$(document).ready(function(){
	
	MaskInput(document.getElementById('inicioPId'),"99/99/9999");
	MaskInput(document.getElementById('terminoPId'),"99/99/9999");
	MaskInput(document.getElementById('propostaInicio'),"99/99/9999");
	MaskInput(document.getElementById('propostaTermino'),"99/99/9999");
	MaskInput(document.getElementById('vigenciaInicio'),"99/99/9999");
	MaskInput(document.getElementById('vigenciaTermino'),"99/99/9999");
});
function openWinReport(){
	
	    var inicioPid = $('#inicioPId').val();
	    var terminoPid = $('#terminoPId').val();
	    var ptInicio = $('#propostaInicio').val();
	    var ptTermino = $('#propostaTermino').val();
	    var vgInicio  = $('#vigenciaInicio').val();
	    var vgTermino = $('#vigenciaTermino').val();
	    var codigoRamo = $('#codigoSeguradora').val();
	    var codigoSegur = $('#codigoSeguradora').val();
	    var codigoGrupoVenda = $('#codigoSeguradora').val();
	    var codigoProdutor = $('#codigoSeguradora').val();
	    var codigoCliente = $('#clienteId').val();
	    var tipoRelatorio = $('#tipoRel').val();
	    
		if((inicioPid != "")&&(terminoPid != "")){
			url ='<s:url value="/propostas.do" includeParams="none"/>?codigo='+tipoRelatorio+'&inicioP='+inicioPid+'&terminoP='+terminoPid+'&propostaI='+ptInicio+'&propostaT='+ptTermino+'&vigenciaI='+vgInicio+'&vigenciaT='+vgTermino+'&codSeguradora='+codigoSegur+'&codRamo='+codigoRamo+'&codGrupoVenda='+codigoGrupoVenda+'&codCliente='+codigoCliente+'&codProdutor='+codigoProdutor;
			openWin(url, 'report', '750', '500', 'resizable=yes');
		}else{
			alert('Favor, informar o periodo para geração do relatório.');
		}
}

</script>