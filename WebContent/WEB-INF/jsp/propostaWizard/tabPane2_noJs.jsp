<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
	<div id="divForm3" style="height:98%; width:99%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td colspan="4">
			<s:textfield theme="simple" id="itemCorrente" name="itemCorrente" cssStyle="display:none;" />
			<s:textfield theme="simple" id="itens" name="itens" cssStyle="display:none;" />
			<div class="demo" id="demo">
			<div id="accordion" style="height: 0px;width: 100%; line-height: 0px;">
			<a id="itensSegurados" href="#" style="display:none; padding: 0.0em 0.0em 0.0em 0.0em; height: 0px;" onclick="listaAutomoveis();"></a>
			  <div id="accordionContent" style="margin-top: 1px; padding: 1px;background: #E8E8E8 none repeat scroll 0 0; -moz-border-radius: 4px; border: 1px solid #AAAAAA; z-index: 100;">
			  <div id="divListaAutomoveis" style="padding: 0px; background: #E8E8E8 none repeat scroll 0 0;">
				<table id="tableAutomovelItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="10%" nowrap="nowrap">Ações</td>
					<td width="5%" nowrap="nowrap">Item</td>
					<td width="5%" nowrap="nowrap">Placa</td>
					<td width="13%" nowrap="nowrap">Marca</td>
					<td width="27%" nowrap="nowrap">Modelo</td>
					<td width="20%" nowrap="nowrap">Chassis</td>
					<td width="10%" nowrap="nowrap">Cor</td>
					<td width="5%" nowrap="nowrap">Ano Fab</td>
					<td width="5%" nowrap="nowrap">Ano Mod</td>
				  </tr>
				  <s:iterator value="automovelList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerItem('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarImovel('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="numeroItem"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="nroPlaca"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="%{modeloVeiculo != null ? modeloVeiculo.fabricante.nome : fabricante.nome}"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="%{modeloVeiculo != null ? modeloVeiculo.descricao : modeloNome}"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="nroChassis"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="corPredominante"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="anoFabricacao"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="anoModelo"/>&nbsp;</td>
					</tr>
				  </s:if>
				  </s:iterator>
				</table>
			  	<table style="margin-left:10px; -moz-border-radius: 4px;">
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="$('#itensSegurados').click();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Fechar</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  	<td>
				      <a href="#" class="button" onclick="novoItem();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo item</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  </tr>
				</table>
			  </div>
			  </div>
			</div><!-- End accordion -->
			</div><!-- End demo -->
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
	  <div id="divItens" style="z-index: 1000; height: 20px; -moz-border-radius: 4px; border: 1px solid #AAAAAA;">
      </div>
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 1px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="V"><b><u>V</u>eículo</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="2px">
			<tr>
			  <td>
			    <label for="numeroItem">Item</label><br />
			    <s:textfield name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.numeroItem" value="%{proposta.propostaAutomovelCollection[itemCorrente].numeroItem}" cssStyle="display:none"/>
				<s:textfield id="numeroItem" cssClass="clNumero4 currency requiredField" name="proposta.propostaAutomovelCollection[%{itemCorrente}].numeroItem" size="6" theme="simple" onchange="setAutomovelAlterado(true);" />
			  </td>
			  <td colspan="3">
		    	<label for="categoriaVeiculoId">Tipo do veículo</label><br />
			   	<s:select theme="simple" style="width:230px;" cssClass="requiredField" id="tipoVeiculoId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.tipoVeiculo.id" list="tipoVeiculoList" listKey="id" listValue="descricao" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);bloquearHabilitarDadosCaminhao(this);"/>
		      </td>
		    </tr>
		    <tr>
		    	<td>
		    		<label for="codigoFipe">Cod. Fipe</label><br />
			    	<s:textfield theme="simple" id="codigoFipe" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.codigoFipe" size="9" maxlength="20" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td align="right">
			    	<label for="anoFabricacao">Ano /</label><br />
			    	<s:textfield theme="simple"  id="anoFabricacao" cssClass="requiredField" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.anoFabricacao" size="4" maxlength="4" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
				  <label for="anoModelo">Modelo</label><br />
				  <s:textfield theme="simple" cssClass="requiredField"  id="anoModelo" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.anoModelo" size="4" maxlength="4" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td colspan="2">
				    <label for="marcaNome">Marca</label><br />
					<s:textfield theme="simple" id="automovelUsuario" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.usuario.id" value="%{usuarioEmUso.id}" cssStyle="display:none;" />
					<s:textfield theme="simple" id="automovelAlterado" name="automovelAlterado" cssStyle="display:none;" />
					<s:textfield theme="simple" id="automovelLinhaVazia" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.linhaVazia" cssStyle="display:none;" />
				    <s:textfield theme="simple" id="automovelId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.id" cssStyle="display: none"/>
					<s:textfield theme="simple" id="automovelPropostaId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="automovelPropostaId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].propostaOriginal.id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="propostaAutomovelId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="propostaAutomovelDataInclusao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].dataInclusao" cssStyle="display:none;" />
					<s:textfield theme="simple" id="propostaAutomovelDataExclusao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].dataExclusao" cssStyle="display:none;" />
					<s:textfield theme="simple" id="propostaAutomovelDataExclusao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].log.autor.id" cssStyle="display:none;" />
				    <s:textfield id="marcaId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.fabricante.id" value="%{proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo != null ? proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo.fabricante.id : proposta.propostaAutomovelCollection[itemCorrente].automovel.fabricante.id}" theme="simple" cssStyle="display:none;" />
				    <s:textfield id="bloqueadorId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.bloqueadorIseg.id" theme="simple" cssStyle="display:none;" />
				    <s:textfield id="rastreadorId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.rastreadorIseg.id" theme="simple" cssStyle="display:none;" />
					<s:textfield id="marcaNome" cssClass="requiredField clTextoRestrito" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.fabricante.nome" value="%{proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo != null ? proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo.fabricante.nome : proposta.propostaAutomovelCollection[itemCorrente].automovel.fabricante.nome}" theme="simple" onchange="" cssStyle="width:97%;" onblur="if (this.value==''){clearModeloVeiculoValues();}else{setAutomovelAlterado(true);}" />
			  	</td>
			  	<td colspan="3">
				    <label id="labelCover" for="modeloVeiculoDescricao">
				    <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'Link Modelo')">
				    	<a href="#" class="LabelLink" onclick="abrirDivNovoModelo();" tabindex="-1">Modelo</a>
				    </s:if>
				    <s:else>
				    	Modelo
				    </s:else>
				    </label><br />
				    <s:textfield id="modeloVeiculoId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.modeloVeiculo.id" cssStyle="display:none;" theme="simple" />
				    <s:textfield id="modeloVeiculoDescricao" cssClass="requiredField clTextoRestrito" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.modeloNome" value="%{proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo == null ? proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloNome : proposta.propostaAutomovelCollection[itemCorrente].automovel.modeloVeiculo.descricao}" onkeydown="if(event.keyCode!=9){verificarModeloId();}" onchange="if (this.value!=''){setAutomovelAlterado(true);}" onblur="verificarMarcaId();" theme="simple" cssStyle="width:97%;" />
			  	</td>
		    </tr>
		    <tr>
				<td>
					<label for="anoFabricacao">Veiculo Zero</label><br />
					<s:select theme="simple" id="veiculoZero" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.zeroKm" list="{'NAO','SIM'}" onchange="setAutomovelAlterado(true);" onblur="if (this.value=='NAO'){$('#nroNF').attr('readonly',true)}else{$('#nroNF').attr('readonly',false)}" cssStyle="width:55px;" />
				</td>
				<td colspan="2">
					<label for="anoModelo">Nota Fiscal</label><br />
					<s:textfield theme="simple" id="nroNF" readonly="true" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.nroNf" size="15" maxlength="30" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
					<label for="anoModelo">Data Saída.</label><br />
					<s:textfield theme="simple" cssClass="clData" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.dataSaida" size="15" maxlength="30" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
				    <label for="nroPlaca">Placa</label><br />
				    <s:textfield theme="simple" cssClass="clPlaca" id="nroPlaca" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.nroPlaca" size="10" maxlength="7" onchange="setAutomovelAlterado(true);"/>
			  	</td>
			  	<td>
				    <label for="nroChassis">Chassis</label><br />
				    <s:textfield theme="simple" cssClass="requiredField" id="nroChassis" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.nroChassis"  size="20" maxlength="21" onchange="setAutomovelAlterado(true);"/>
			  	</td>
			  	<td>
			  		<label id="labelCover" for="renavam">Renavan</label><br />
		    		<s:textfield theme="simple" id="renavan" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.renavan" size="9" maxlength="9" onchange="setAutomovelAlterado(true);"/>
			  	</td>
			  	<td>
			  		<label for="tipoCombustivel">Combustível</label><br />
			    	<s:select theme="simple"  id="tipoCombustivel" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.tipoCombustivel.id" list="tipoCombustivelList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
			  	</td>
		    </tr>
		    <tr>
		    	<td colspan="3">
				    <label for="categoriaVeiculoId">Uso do Veiculo</label><br />
				    <s:select style="width:99%" cssClass="requiredField" theme="simple"  id="categoriaVeiculoId" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.usoVeiculo.id" list="usoVeiculo" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td colspan="2">
					<label for="regiaoTarifacao">CEP/Região de Risco</label><br />
			    	<s:textfield theme="simple" cssClass="requiredField"  id="regiaoTarifacao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.regiaoTarifacao" cssStyle="width:98%" maxlength="35" onchange="setAutomovelAlterado(true);"/>		    		
		    	</td>
		    	<td>
			  		<label for="corPredominante">Cor</label><br />
			    	<s:textfield theme="simple"  id="corPredominante" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.corPredominante" size="20" maxlength="20" onchange="setAutomovelAlterado(true);"/>
			  	</td>
			  	<td>
			  		<label for="tipoCombustivel">Portas</label><br />
		    		<s:select theme="simple"  id="tipoCombustivel" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.qtdPortas" list="{1,2,3,4,5,6}" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
			  	</td>
		    </tr>
		    <tr id="opcao_caminhao">
		    	<td colspan="2">
		    		<label for="categoriaVeiculoId">Carroceria</label><br />
				    <s:select style="width:99%" theme="simple"  name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.carroceriaIseg.id" list="carroceriaIsegList" listKey="id" listValue="descricao" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td colspan="2">
		    		<label for="categoriaVeiculoId">Semi-Reboque</label><br />
				    <s:select style="width:99%" theme="simple"  name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.semireboqueIseg.id" list="semireboqueIsegList" listKey="id" listValue="descricao" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td>
		    		<label for="categoriaVeiculoId">Eixos</label><br />
				    <s:select style="width:70px" theme="simple"  name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.eixos" list="{2,3}" headerKey="" headerValue="--" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td>
		    		<label for="categoriaVeiculoId">Carga</label><br />
				    <s:select style="width:99%" theme="simple"  name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.cargaIseg.id" list="cargaIsegList" listKey="id" listValue="descricao" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
		    	</td>
		    	<td></td>
		    	<td>
		    		<table width="100%" align="center" style="bottom: 0px;">
						<tr>
							<td align="left">
							  <s:a href="#" cssClass="button" onclick="abrirModalComplemento(%{proposta.propostaAutomovelCollection[itemCorrente].automovel.id});" >
								<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
								  <tr>
									<td class="wButton_left"></td>
									<td class="wButton_text wButton_width">+ Detalhes</td>
									<td class="wButton_right"/>
								  </tr>
								</table>
							  </s:a>
							</td>
						</tr>
					</table>
		    	</td>
		    </tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr><td colspan="6">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="R"><b>Apólice Anterior</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				  <label for="automovelSeguradoraId">Seguradora</label><br />
				  <s:select theme="simple" id="automovelSeguradoraId" headerKey="" headerValue="-- Selecione --" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
				  <label for="nroApoliceAnterior">Nro da Apólice</label><br />
				  <s:textfield theme="simple" id="nroApoliceAnterior" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.nroApoliceAnterior" size="15" maxlength="20" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
				  <label for="codigoIdentificacaoAnterior">C.I.</label><br />
				  <s:textfield theme="simple" id="codigoIdentificacaoAnterior" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.codigoIdentificacaoAnterior" size="20" maxlength="20" onchange="setAutomovelAlterado(true);"/>
				</td>
				<td>
				  <label for="classeBonus">Classe Bônus</label><br />
				  <s:textfield theme="simple" id="classeBonus" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.classeBonus" size="15" maxlength="20" onchange="setAutomovelAlterado(true);"/>
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		  <td>
		  	<fieldset>
				<legend accesskey="R"><b>Apólice Atual</b></legend>
	    		<label for="codigoIdentificacao">C.I.</label><br />
				<s:textfield theme="simple" id="codigoIdentificacao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.codigoIdentificacao" size="20" maxlength="20" onchange="setAutomovelAlterado(true);"/>
			</fieldset>
		  </td>
		</tr>
	  </table>
		</td>
	  </tr>
	  <tr>
		<td colspan="6">
		  <table width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  <td>
				<fieldset>
				<legend accesskey="C"><b><u>C</u>oberturas</b></legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="0">
				  <tr>
					<td width="20%">&nbsp;</td>
					<td width="20%">Tipo</td>
					<td width="15%"><label id="percentualValor">Percentual:</label></td>
					<td width="15%">Franquia</td>
					<td width="15%"></td>
					<td width="15%">Prêmio Líquido Casco</td>
				  </tr>
				  <tr id="rowCasco">
				  	<td>COBERTURA CASCO: </td>
				  	<td>
				  	  <s:select theme="simple" id="tipoIndenizacao" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.tipoIndenizacao" list="%{#{'VR':'Valor Referenciado','VD':'Valor Determinado'}}" onchange="tooglePercValorCoberturaCasco(this.value);setAutomovelAlterado(true);" />
				  	</td>
				  	<td>
				  	  <s:textfield theme="simple" id="percentualReferenciado" cssClass="clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.percentualReferenciado" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/>
				  	  <s:textfield theme="simple" id="valorCasco" cssClass="clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.valorCasco" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/>
				  	</td>
				  	<td>
				  	  <s:textfield theme="simple" id="franquiaCasco" cssClass="clCalculator clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.franquia" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/>
				  	</td>
				  	<td></td>
				  	<td>
				  	  <s:textfield theme="simple" id="premioCasco" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.premio" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/>
				  	</td>
				  </tr>
				</table>
				<div id="divListaCoberturas">
				<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="40%">&nbsp;</td>
					<td width="15%">LMI</td>
					<td width="15%">Franquia</td>
					<td width="15%">Observação Franquia</td>
					<td width="15%">Prêmio Líquido por Cobertura</td>
				  </tr>
				  <s:iterator value="automovelCoberturaList" status="stat">
				  <s:if test="%{(coberturasIseg != null && coberturasIseg.id != null) || (cobertura != null && cobertura.id != null)}">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="automovelCoberturaId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].cobertura.id" value="%{cobertura.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].coberturasIseg.id" value="%{coberturasIseg.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaAutomovelId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].automovel.id" value="%{automovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
					    <s:if test="cobertura.descricao != null">
					    	<s:property value="cobertura.descricao"/>:
					    </s:if>
					    <s:elseif test="coberturasIseg.descricao != null">
					    	<s:property value="coberturasIseg.descricao"/>:
					    </s:elseif>
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clCalculator clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setAutomovelAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="cobertura.blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clCalculator clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="automovelCoberturaId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaAutomovelId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].automovel.id" value="%{automovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaBlnFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].blnInformaFranquia" value="%{blnInformaFranquia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].descricao" value="%{descricao}" onchange="setAutomovelAlterado(true);"/>
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clCalculator clValor3 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setAutomovelAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>
				</div>
				<table>
				  <tr>
				  	<td>
				    <table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
				    </a></label></td></tr>
				    </table>
				    </td>
				  </tr>
				</table>
				</fieldset>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td colspan="6">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td>
				<fieldset>
				<legend accesskey="S"><b><u>S</u>erviços</b></legend>
				<div id="divListaServicos">
				<table id="tableServicos" width="100%" border="0" cellpadding="0" cellspacing="1">
				  <tr>
					<td width="30%">&nbsp;</td>
					<td width="10%">&nbsp;</td>
					<td width="15%">Descrição</td>
					<td width="15%">Franquia</td>
					<td width="15%">Observação Franquia</td>
					<td width="15%">Prêmio Líquido por Serviço</td>
				  </tr>
				  <s:iterator value="automovelServicoList" status="stat">
				  <s:if test="%{(servicos != null && servicos.id != null) || (servicosIseg != null && servicosIseg.id != null)}">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="automovelServicoId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].servicos.id" value="%{servicos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].servicosIseg.id" value="%{servicosIseg.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoAutomovelId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].automovel.id" value="%{automovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoSequencia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
					    <s:if test="servicos.descricao != null">
					    	<s:property value="servicos.descricao"/>:
					    </s:if>
					    <s:elseif test="servicosIseg.descricao != null">
					    	<s:property value="servicosIseg.descricao"/>:
					    </s:elseif>
					  </td>
					  <td><s:select theme="simple" id="servicoContratado%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].servicoContratado" value="%{servicoContratado}" list="{'NAO','SIM'}" onchange="enableDisableDadosServico('%{#stat.index}');setAutomovelAlterado(true);" onkeyup="enableDisableDadosServico('%{#stat.index}');setAlterado(true);" cssStyle="width:55px;" /></td>
					  <td>
					  	  <s:if test="servicos.blnInformaDescricao">
					        <s:textfield theme="simple" id="servicoTextoDescricao%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].descricao" value="%{descricao}" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/>
					  	  </s:if>
					  </td>
					  <s:if test="servicos.blnInformaFranquia">
					    <td><s:textfield theme="simple" id="servicoFranquia%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="servicoTextoFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="servicoPremio%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="automovelServicoId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoId%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].automovel.id" value="%{automovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoBlnFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].blnInformaFranquia" value="%{blnInformaFranquia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="servicoDescricao%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].descricao" value="%{descricao}" onchange="setAutomovelAlterado(true);"/>
					  </td>
					  <td><s:select theme="simple" id="servicoContratado%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].servicoContratado" value="%{servicoContratado}" list="{'NAO','SIM'}" onchange="enableDisableDadosServico('%{#stat.index}');setAutomovelAlterado(true);" onkeyup="enableDisableDadosServico('%{#stat.index}');setAlterado(true);" cssStyle="width:55px;" /></td>
					  <td><s:textfield theme="simple" id="servicoTextoDescricao%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].textoDescricao"  maxlength="60" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
					  <s:if test="blnInformaFranquia">
					    <td><s:textfield theme="simple" id="servicoFranquia%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="servicoTextoFranquia%{#stat.index}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="servicoPremio%{#stat.index}" cssClass="clCalculator clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				</table>
				</div>
				<table>
				  <tr>
				  	<td>
				    <table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovoServico();" >
						  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						    <tr>
							  <td class="wButton_left"></td>
							  <td class="wButton_text wButton_width">Adicionar Serviço</td>
							  <td class="wButton_right"/>
						    </tr>
						  </table>
					  </a></label></td></tr>
				    </table>
				    </td>
				  </tr>
				</table>
				</fieldset>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	</table>
	</div>
<script>
function consultaRenavan(){
	height = '600';
	width = '600';
	var newFeatures = "height=" + height +", innerHeight=" + height;
	newFeatures += ",width=" + width + ",innerWidth=" + width;
	var ah = (screen.availHeight - 30);
	var aw = (screen.availWidth - 10);
	var xc = (( aw - width) / 2);
	var yc = (( ah - height) / 2);
	newFeatures += ",left=" + xc + ",screenX=" + xc;
	newFeatures += ",top=" + yc + ",screenY=" + yc;
	newFeatures += "," + 'resizable=yes,scrollbars=yes,menubar=no,resizable=no,directories=no,location=no';
	var winRenavan = window.open('${pageContext.request.contextPath}/wizard/consultaRenavan.action','ConsultaRenavan',newFeatures);
	winRenavan.focus();
	winRenavan.opener = self;
}
var displayAutomoveisOn = false;

function listaAutomoveis(){

	if (!displayAutomoveisOn){
		displayAutomoveisOn = true;
		$("#gpPropostaId").val($("#propostaId").val());
		submitFormAjax('#formLookup', getContextApp()+'/wizard/listarAutomoveis.action', '#divListaAutomoveis');
		$('#accordionContent').css('height',$('#divListaAutomoveis').css('height'));
		setTimeout(function(){if (navigator.userAgent.indexOf('Chrome') > -1){$('#accordionContent').css('height',$('#divListaAutomoveis').css('height'));};},5400);
	}else
		displayAutomoveisOn = false;
}

function getCpfOuCnpj(){
	if ($('#tipoCliente').val()==0)
		return $("#clienteCpf").val();
	else
		return $("#clienteCnpj").val();
}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>