<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<meta name="GENERATOR" content="JXEd 1.0" />
<meta name="ProgId" content="JXEd.Editor.Document" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="formLista" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  
  <table width="100%" cellspacing="0" cellpadding="0" align="center" style="padding: 0px;" class="Main_Client_TableEdition">
	<tr style="background-color: #606060;color: #FFFFFF;">
	  <td colspan="2" class="tooltipCellContent">Terceiro Envolvido</td>
	</tr>
	<tr>
	  <td width="40%" class="TitleCell tooltipCellLabel" nowrap="nowrap">Proprietário: </td>
	  <td width="60%" class="tooltipCellContent"><s:property value="terceiroEnvolvido.cpfOuCnpj" /> / <s:property value="terceiroEnvolvido.nome" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Data Nascimento: </td>
	  <td class="tooltipCellContent"><s:property value="terceiroEnvolvido.dataNascimento" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Endereço: </td>
	  <td class="tooltipCellContent"><s:property value="enderecoTerceiroEnvolvidoText()" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Telefone: </td>
	  <td class="tooltipCellContent"><s:property value="telefoneTerceiroEnvolvidoText()" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Condutor: </td>
	  <td class="tooltipCellContent"><s:property value="terceiroEnvolvido.condutorCpf" /> / <s:property value="terceiroEnvolvido.condutor" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Veículo Envolvido: </td>
	  <td class="tooltipCellContent"><s:property value="veiculoTerceiroEnvolvidoText()" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Oficina: </td>
	  <td class="tooltipCellContent"><s:property value="terceiroEnvolvido.oficina.nome" /></td>
	</tr>
	<tr>
	  <td class="tooltipCellLabel" nowrap="nowrap">Avarias: </td>
	  <td class="tooltipCellContent"><s:property value="terceiroEnvolvido.avarias" /></td>
	</tr>
  </table>