<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
<meta name="GENERATOR" content="JXEd 1.0" />
<meta name="ProgId" content="JXEd.Editor.Document" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="formLista" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  
  <s:if test="proposta == null">
  <table width="100%" cellspacing="0" cellpadding="0" align="center" style="padding: 0px;" class="Main_Client_TableEdition">
	<tr style="background-color: #606060;color: #FFFFFF;">
	  <td class="TextBox_ContentCell tooltipCellContent">Proposta não localizada</td>
	</tr>
  </table>
  </s:if>
  <s:else>
  <table width="100%" cellspacing="0" cellpadding="0" align="center" style="padding: 0px;" class="Main_Client_TableEdition">
	<tr style="background-color: #606060;color: #FFFFFF;">
	  <td class="TextBox_ContentCell tooltipCellContent">Localizador #<s:property value="proposta.numero" /></td>
	  <td class="TextBox_ContentCell tooltipCellContent"><s:property value="proposta.corretora.nome" /></td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Termino Vigência: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap"><s:property value="proposta.terminoVigencia" /></td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Segurado: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap"><s:property value="proposta.cliente.nome" /></td>
	</tr>
	<s:if test="proposta.ramo.id == ramoAutomovel">
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Veículo: </td>
  	  <s:if test="%{proposta.propostaAutomovelCollection[0].automovel.modeloVeiculo != null}">
  		<td class="LabelText tooltipCellContent" nowrap="nowrap" style="font-weight: bold" >
    		<label><s:property value="%{proposta.propostaAutomovelCollection[0].automovel.modeloVeiculo.fabricante.nome+'/'+proposta.propostaAutomovelCollection[0].automovel.modeloVeiculo.descricao}" /></label>
    	</td>
      </s:if>
      <s:else>
    	<td class="LabelText tooltipCellContent" nowrap="nowrap" style="font-weight: bold" >
    		<s:property value="%{proposta.propostaAutomovelCollection[0].automovel.fabricante.nome+'/'+proposta.propostaAutomovelCollection[0].automovel.modeloNome}" />
    	</td>
	  </s:else>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Cor/Placa: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" >
	    <s:property value="proposta.propostaAutomovelCollection[0].automovel.corPredominante+'/'+proposta.propostaAutomovelCollection[0].automovel.nroPlaca" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Nro do Chassi: </td>
	  <td class="LabelText tooltipCellContent" nowrap="nowrap" style="font-weight: bold" >
	    <s:property value="proposta.propostaAutomovelCollection[0].automovel.nroChassis" />
	  </td>
	</tr>
	</s:if>
	<s:if test="proposta.ramo.id == ramoRiscoDiversos">
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Desc Risco: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" width="270px">
	    <s:property value="proposta.riscoDiversosCollection[0].descricaoRisco" />
	  </td>
	</tr>
	</s:if>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Nro da Apólice: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" >
	    <s:property value="proposta.nroApolice" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Nro Prop Seguradora: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap">
	    <s:property value="proposta.nroPropostaSeg" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Seguradora: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap">
	    <s:property value="proposta.seguradora.nome" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">0800: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap">
	    <s:property value="proposta.seguradora.telefone0800" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Produtor: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap">
	    <s:property value="proposta.produtor.nome" />
	  </td>
	</tr>
	<tr>
	  <td class="LabelText tooltipCellLabel" nowrap="nowrap">Usuário: </td>
	  <td class="LabelText tooltipCellContent" style="font-weight: bold" nowrap="nowrap">
	    <s:property value="proposta.usuario.nomeLogin" />
	  </td>
	</tr>
  </table>
  </s:else>
</form>
</body>
</html>