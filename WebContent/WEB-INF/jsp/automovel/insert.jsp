<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
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
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			  <td class="FieldGroupTitle_MaxSize">Automóvel</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
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
				<s:textfield theme="simple" name="automovel.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" name="automovel.proposta.id" cssStyle="display:none;"/>
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="automovelRenovacao" list="#{'sim':'Sim', 'nao':'Não'}" name="automovel.renovacao" headerKey="" headerValue=" -- " />
			  </td>
			  <td width="10%" class="TitleCell"></td>
			  <td width="15%" class="TextBox_ContentCell"></td>
			  <td width="10%" class="TitleCell"></td>
			  <td width="15%" class="TextBox_ContentCell"></td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCodigoIdentificacao">Código de Identificação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCodigoIdentificacao"  name="automovel.codigoIdentificacao" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNomeProprietario">Nome Proprietário:</label></td>
			  <td class="TextBox_ContentCell" colspan="3">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelNomeProprietario" name="automovel.nomeProprietario" maxlength="60"/>
			  </td>
			</tr>
			<tr>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelAnoFabricacao">Ano Fabricação:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelAnoFabricacao" name="automovel.anoFabricacao" />
			  </td>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelAnoModelo">Ano Modelo:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelAnoModelo" name="automovel.anoModelo"/>
			  </td>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="automovelNroNF">Número Nota Fiscal:</label></td>
			  <td width="15%" class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width"  id="automovelNroNF" name="automovel.nroNf" maxlength="15"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCodigoFipe">Código FIPE:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCodigoFipe" name="automovel.codigoFipe" maxlength="20" />
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCepCirculacao">CEP Circulação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCepCirculacao" name="automovel.cepCirculacao" onblur="isValidCep(this);"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRegiaoTarifacao">Região Tarifação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelRegiaoTarifacao" name="automovel.regiaoTarifacao" maxlength="10"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelTerceiroEixo">Terceiro Eixo:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="automovelTerceiroEixo" list="#{'sim':'Sim', 'nao':'Não'}" name="automovel.terceiroEixo" headerKey="" headerValue=" -- " />
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelPossuiAntiFurto">Possui Anti-furto:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="automovelPossuiAntiFurto" list="#{'sim':'Sim', 'nao':'Não'}" name="automovel.possuiAntiFurto" headerKey="" headerValue=" -- " />
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRastreamentoSatelite">Rastreamento Satélite:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="automovelRastreamentoSatelite" list="#{'sim':'Sim', 'nao':'Não'}" name="automovel.rastreamentoSatelite" headerKey="" headerValue=" -- " />
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelStatus">Status:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="automovelStatus" name="automovel.status" maxlength="15"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelQtdePortas">Quantidade de Portas:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelQtdePortas" name="automovel.qtdePortas"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNroChassis">Número Chassis:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelNroChassis" name="automovel.nroChassis" maxlength="20"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCapacidade">Capacidade:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCapacidade" name="automovel.capacidade" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelRenavan">Renavan:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelRenavan" name="automovel.renavan" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCepPernoite">CEP Pernoite:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCepPernoite" name="automovel.cepPernoite" onblur="isValidCep(this);"/>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelClasseBonus">Classe Bônus:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelClasseBonus" name="automovel.classeBonus" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelCorPredominante">Cor Predominante:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelCorPredominante" name="automovel.corPredominante" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelZeroKm">Zero KM:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField 100percent_width" id="automovelZeroKm" list="#{'sim':'Sim', 'nao':'Não'}" name="automovel.zeroKm" headerKey="" headerValue=" -- " />
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelGravameAlienacao">Gravame Alienação:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelGravameAlienacao" name="automovel.gravameAlienacao" maxlength="3"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelNroPlaca">Número Placa:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="automovelNroPlaca" name="automovel.nroPlaca" maxlength="7" />
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automoveltipoCombustivel">Tipo Combustível:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="automoveltipoCombustivel" name="automovel.tipoCombustivel.id" list="tipoCombustivelList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelTipoFranquiaId">Tipo Franquia:</label></td>
			  <td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="automovelTipoFranquiaId" name="automovel.tipoFranquia.id" list="tipoFranquiaList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="marcaId">Marca:</label></td>
			  <td class="Combo_ContentCell">
				<s:select theme="simple" id="marcaId" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" name="automovel.modeloVeiculo.dominioEspPai.id" list="marcaVeiculoList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" onchange="javascript:carregaComboModelo(this.value);"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="modeloId">Modelo:</label></td>
			  <td class="TextBox_ContentCell">
				<sx:div id="divModeloVeiculo">
				  <s:select theme="simple" id="comboModeloVeiculo" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" name="automovel.modeloVeiculo.id" list="modelosList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
				</sx:div>
			  </td>
			</tr>
			<tr>
			  <td class="TitleCell"><label class="LabelText" for="automovelCategoriaVeiculoId">Categoria Veículo:</label></td>
			  <td class="Combo_ContentCell">
				<s:select theme="simple" cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width" id="automovelCategoriaVeiculoId" name="automovel.categoriaVeiculo.id" list="categoriaVeiculoList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
			  </td>
			  <td class="TitleCell"></td>
			  <td class="Combo_ContentCell"></td>
			  <td class="TitleCell"></td>
			  <td class="Combo_ContentCell"></td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle">Apólice Anterior</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
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
				<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="automovelNroApoliceAnterior" name="automovel.nroApoliceAnterior" maxlength="20"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelIniVigApoliceAnterior">Início Vigência Apólice Anterior:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid" id="automovelIniVigApoliceAnterior" name="automovel.iniVigApoliceAnterior" onblur="isValidDate(this)" size="10" onkeyup="addYearAndSetField(this.value, 1, document.getElementById('automovelFimVigApoliceAnterior'));"/>
			  </td>
			  <td class="TitleCell"><label class="LabelText" for="automovelFimVigApoliceAnterior">Fim Vigência Apólice Anterior:</label></td>
			  <td class="TextBox_ContentCell">
				<s:textfield theme="simple" cssClass="dojoValidateValid" id="automovelFimVigApoliceAnterior" name="automovel.fimVigApoliceAnterior" onblur="isValidDate(this)" size="10"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle">Acréscimo/Desconto</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<div id="divMessagesAcrescimoDesconto"></div>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableAcrescimoDesconto" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="20%" class="TitleCell"><span class="LabelText">Acréscimo/Desconto:</span></td>
					<td width="30%" class="TextBox_ContentCell">
					  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width" id="acrescimoDesconto" list="#{'a':'Acréscimo', 'd':'Desconto'}" name="automovel.acrescimoDescontoCollection[].acrescimoDesconto" headerKey="" headerValue="-- Selecione --" />
					</td>
					<td width="20%" class="TitleCell"><span class="LabelText">Percentual:</span></td>
					<td width="30%" class="TextBox_ContentCell">
					  <s:textfield theme="simple" cssClass="dojoValidateValid currency TextBox_100percent_width" id="acrescimoDescontoPercentual" name="automovel.acrescimoDescontoCollection[].percentual" onkeypress="return formatNumber(this, event, 2, 5);" cssStyle="text-align: right;"/>
					</td>
				  </tr>
				  <tr>
					<td width="20%" class="TitleCell"><span class="LabelText">Decrição:</span></td>
					<td colspan="3" width="30%"class="TextBox_ContentCell">
					  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="acrescimoDescontoDescricao" name="automovel.acrescimoDescontoCollection[].descricao" maxlength="30" />
					</td>
					<td class="TitleCell"><img align="top" alt="" style="cursor: pointer;" src="<s:url value="/common/web/images/add.gif" />" onclick="addAcrescimoDesconto();"/></td>
				  </tr>
				</table>
				<table id="tableAcrescimoDescontoItens" class="listItens">
				  <tr class="listItensHeader">
					<td width="20%">Acrescimo/Desconto</td>
					<td width="10%">Percentual</td>
					<td width="67%">Descrição</td>
					<td class="small_image"></td>
				  </tr>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle">Serviços</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
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
					<td width="3%">X</td>
					<td width="57%">Descricao</td>
					<td width="20%">Prêmio</td>
					<td width="20%">Franquia</td>
				  </tr>
				  <s:iterator value="servicoList" status="stat">
					<tr>
					  <td>
						<input type="checkbox" name="checkbox" onclick="changeValueHidden('automovelServico${stat.count}', this);"/>
						<input type="hidden" id="automovelServico${stat.count}" name="automovel.automovelServicosCollection[${stat.index}].servicoContratado" value="Nao" />
						<input type="hidden" name="automovel.automovelServicosCollection[${stat.index}].servicos.id" value="<s:property value="id"/>" />
						<input type="hidden" name="automovel.automovelServicosCollection[${stat.index}].servicos.descricao" value="<s:property value="descricao"/>" />
					  </td>
					  <td><s:property value="descricao"/></td>
					  <td class="element"><input type="text" class="dojoValidateValid currency TextBox_100percent_width" id="servicoPremio" name="automovel.automovelServicosCollection[${stat.index}].premio" onkeypress="return formatNumber(this, event, 2, 8);" style="text-align: right;"/></td>
					  <td class="element"><input type="text" class="dojoValidateValid currency TextBox_100percent_width" id="servicoFranquia" name="automovel.automovelServicosCollection[${stat.index}].franquia" onkeypress="return formatNumber(this, event, 2, 8);" style="text-align: right;"/></td>
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
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle">Coberturas</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
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
					<td width="3%">X</td>
					<td width="52%">Descricao</td>
					<td width="15%">LMI</td>
					<td width="15%">Prêmio</td>
					<td width="15%">Franquia</td>
				  </tr>
				  <s:iterator value="coberturaList" status="stat">
					<tr>
					  <td>
						<input type="checkbox" name="checkbox" onclick="changeValueHidden('automovelCobertura${stat.count}', this);"/>
						<input type="hidden" id="automovelCobertura${stat.count}" name="automovel.automovelCoberturaCollection[${stat.index}].coberturaContratada" value="Nao" />
						<input type="hidden" name="automovel.automovelCoberturaCollection[${stat.index}].cobertura.id" value="<s:property value="id"/>" />
						<input type="hidden" name="automovel.automovelCoberturaCollection[${stat.index}].cobertura.descricao" value="<s:property value="descricao"/>" />
					  </td>
					  <td><s:property value="descricao"/></td>
					  <td class="element"><input type="text" class="dojoValidateValid currency TextBox_100percent_width" id="coberturaLMI" name="automovel.automovelCoberturaCollection[${stat.index}].lmi" onkeypress="return formatNumber(this, event, 2, 8);" style="text-align: right;"/></td>
					  <td class="element"><input type="text" class="dojoValidateValid currency TextBox_100percent_width" id="coberturaPremio" name="automovel.automovelCoberturaCollection[${stat.index}].premio" onkeypress="return formatNumber(this, event, 2, 8);" style="text-align: right;"/></td>
					  <td class="element"><input type="text" class="dojoValidateValid currency TextBox_100percent_width" id="coberturaFranquia" name="automovel.automovelCoberturaCollection[${stat.index}].franquia" onkeypress="return formatNumber(this, event, 2, 8);" style="text-align: right;"/></td>
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
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle">Acessórios</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<div id="divMessagesAcessorio"></div>
			  </td>
			</tr>
			<tr>
			  <td colspan="6">
				<table id="tableAcessorio" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="10%" class="TitleCell"><span class="LabelText">Acessório:</span></td>
					<td width="90%" class="TextBox_ContentCell">
					  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="acessorioId" name="automovel.automovelAcessoriosCollection[].acessorio.id" list="acessorioList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
					</td>
					<td class="TitleCell"><img align="top" alt="" style="cursor: pointer;" src="<s:url value="/common/web/images/add.gif" />" onclick="addAcessorio();"/></td>
				  </tr>
				</table>
				<table id="tableAcessorioItens" class="listItens">
				  <tr class="listItensHeader">
					<td width="97%">Acessório</td>
					<td width="3%">X</td>
				  </tr>
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
</form>
<form id="formLookup" name="formLookup">
	<input type="hidden" id="gpMarcaId" name="marca.id" />

	<s:url var="urlLoadModeloVeiculo" namespace="/automovel" action="getModeloVeiculo.action" includeParams="none"/>
	<sx:submit executeScripts="true" type="button" href="%{#urlLoadModeloVeiculo}" validate="false" label="Update Content" targets="divModeloVeiculo" formId="formLookup" id="bindBtnModeloVeiculo" cssStyle="display:none"/>

<script type="text/javascript" charset="UTF-8">
$(document).ready(function(){
	MaskInput($('#automovelIniVigApoliceAnterior')[0], "99/99/9999");
	MaskInput($('#automovelFimVigApoliceAnterior')[0], "99/99/9999");
	MaskInput($('#automovelCepCirculacao')[0], "99999-999");
	MaskInput($('#automovelCepPernoite')[0], "99999-999");
	MaskInput($('#automovelAnoFabricacao')[0], "9999");
	MaskInput($('#automovelAnoModelo')[0], "9999");
	MaskInput($('#automovelQtdePortas')[0], "9");
	
});

	setTimeout(function(){carregaComboModelo($("#marcaId")[0].options[$("#marcaId")[0].selectedIndex].value)},1000);
</script>