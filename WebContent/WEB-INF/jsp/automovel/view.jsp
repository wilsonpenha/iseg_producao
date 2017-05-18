<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" />"></link>

<div align="left">
<table width="100%" border="0">
<tr>
<td>
  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
	<tr>
	  <td colspan="6">
		<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		  <tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupTitle_MaxSize">Automóvel</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
	<tr>
	  <td colspan="4">
		<div id="divMessages"></div>
	  </td>
	</tr>
	<tr>
	  <td width="100%" colspan="4">
		  <table id="tableItemSegurado" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
			<tr>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelRenovacao">Renovação:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly TextBox_100percent_width" id="automovelRenovacao"  name="automovel.renovacao" readonly="true"/>
			  </td>
			  <td width="10%" class="TitleCell"></td>
			  <td width="15%" class="TextBox_ContentCell"></td>
			  <td width="10%" class="TitleCell"></td>
			  <td width="15%" class="TextBox_ContentCell"></td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCodigoIdentificacao">Código de Identificação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCodigoIdentificacao"  name="automovel.codigoIdentificacao" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNomeProprietario">Nome Proprietário:</label></td>
			  <td class="TextBox_ContentCell" colspan="3">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelNomeProprietario"  name="automovel.nomeProprietario" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelAnoFabricacao">Ano Fabricação:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelAnoFabricacao" name="automovel.anoFabricacao" readonly="true"/>
			  </td>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelAnoModelo">Ano Modelo:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelAnoModelo" name="automovel.anoModelo" readonly="true"/>
			  </td>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelNroNF">Número Nota Fiscal:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelNroNF" name="automovel.nroNf" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCodigoFipe">Código FIPE:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCodigoFipe" name="automovel.codigoFipe" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCepCirculacao">CEP Circulação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCepCirculacao" name="automovel.cepCirculacao" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRegiaoTarifacao">Região Tarifação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelRegiaoTarifacao" name="automovel.regiaoTarifacao" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelTerceiroEixo">Terceiro Eixo:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelTerceiroEixo"  name="automovel.terceiroEixo" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelPossuiAntiFurto">Possui Anti-furto:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelPossuiAntiFurto"  name="automovel.possuiAntiFurto" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRastreamentoSatelite">Rastreamento Satélite:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelRastreamentoSatelite"  name="automovel.rastreamentoSatelite" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelStatus">Status:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelStatus" name="automovel.status" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelQtdePortas">Quantidade de Portas:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelQtdePortas" name="automovel.qtdePortas" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNroChassis">Número Chassis:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelNroChassis" name="automovel.nroChassis" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCapacidade">Capacidade:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCapacidade" name="automovel.capacidade" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRenavan">Renavan:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelRenavan" name="automovel.renavan" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCepPernoite">CEP Pernoite:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCepPernoite" name="automovel.cepPernoite" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelClasseBonus">Classe Bônus:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelClasseBonus" name="automovel.classeBonus" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCorPredominante">Cor Predominante:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCorPredominante" name="automovel.corPredominante" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelZeroKm">Zero KM:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelZeroKm"  name="automovel.zeroKm" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelGravameAlienacao">Gravame Alienação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelGravameAlienacao" name="automovel.gravameAlienacao" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNroPlaca">Número Placa:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelNroPlaca" name="automovel.nroPlaca" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automoveltipoCombustivel">Tipo Combustível:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automoveltipoCombustivel" name="automovel.tipoCombustivel.id" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelModeloVeiculoId">Modelo Veículo:</label></td>
			  <td class="Combo_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelModeloVeiculoId" name="automovel.modeloVeiculo.id" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelTipoFranquiaId">Tipo Franquia:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelTipoFranquiaId" name="automovel.tipoFranquia.id" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCategoriaVeiculoId">Categoria Veículo:</label></td>
			  <td class="Combo_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelCategoriaVeiculoId" name="automovel.categoriaVeiculo.id" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupTitle">Apólice Anterior</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelNroApoliceAnterior">Número Apólice Anterior:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelNroApoliceAnterior" name="automovel.nroApoliceAnterior" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelIniVigApoliceAnterior">Início Vigência Apólice Anterior:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelIniVigApoliceAnterior" name="automovel.iniVigApoliceAnterior" readonly="true"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelFimVigApoliceAnterior">Fim Vigência Apólice Anterior:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly  TextBox_100percent_width" id="automovelFimVigApoliceAnterior" name="automovel.fimVigApoliceAnterior" readonly="true"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupTitle">Acréscimo/Desconto</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableAcrescimoDescontoItens" class="listItens">
				  <tr class="listItensHeader">
					<td width="20%">Acrescimo/Desconto</td>
					<td width="10%">Percentual</td>
					<td width="70%">Descrição</td>
				  </tr>
				  <s:iterator value="automovel.acrescimoDescontoCollection" status="stat">
					<tr>
					  <td><s:property value="acrescimoDesconto"/></td>
					  <td><s:property value="percentual"/></td>
					  <td><s:property value="descricao"/></td>
					</tr>
				  </s:iterator>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupTitle">Serviços</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableServico" class="listItens">
				  <tr class="listItensHeader">
					<td width="60%">Descricao</td>
					<td width="20%">Prêmio</td>
					<td width="20%">Franquia</td>
				  </tr>
				  <s:iterator value="automovel.automovelServicosCollection" status="stat">
					<tr>
					  <td><s:property value="servicos.descricao"/></td>
					  <td><s:property value="premio"/></td>
					  <td><s:property value="franquia"/></td>
					</tr>
				  </s:iterator>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupTitle">Coberturas</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableCobertura" class="listItens">
				  <tr class="listItensHeader">
					<td width="55%">Descricao</td>
					<td width="15%">LMI</td>
					<td width="15%">Prêmio</td>
					<td width="15%">Franquia</td>
				  </tr>
				  <s:iterator value="automovel.automovelCoberturaCollection" status="stat">
					<tr>
					  <td><s:property value="cobertura.descricao"/></td>
					  <td><s:property value="lmi"/></td>
					  <td><s:property value="premio"/></td>
					  <td><s:property value="franquia"/></td>
					</tr>
				  </s:iterator>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupTitle">Acessórios</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableAcessorioItens" class="listItens">
				  <tr class="listItensHeader">
					<td width="100%">Acessório</td>
				  </tr>
				  <s:iterator value="automovel.automovelAcessoriosCollection" status="stat">
					<tr>
					  <td><s:property value="acessorio.valor"/></td>
					</tr>
				  </s:iterator>
				</table>
			  </td>
			</tr>
		  </table>
	  </td>
	</tr>
  </table>
</td>
</tr>
</table>
</div>
<script type="text/javascript">
</script>