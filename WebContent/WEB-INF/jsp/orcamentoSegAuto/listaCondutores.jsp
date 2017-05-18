<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
		    <table id="tableCondutorItens" class="listItens">
			  <tr class="listItensHeader">
				<td colspan="2" width="8%" nowrap="nowrap">Ações</td>
				<td width="20%" nowrap="nowrap">Nome</td>
				<td width="8%" nowrap="nowrap">Principal?</td>
				<td width="8%" nowrap="nowrap">Dt Nasc.</td>
				<td width="8%" nowrap="nowrap">Sexo</td>
				<td width="8%" nowrap="nowrap">Telefone</td>
<!-- 				<td width="8%" nowrap="nowrap">Est. Civil</td> -->
				<td width="8%" nowrap="nowrap">CNH</td>
<!-- 				<td width="8%" nowrap="nowrap">Dt. 1a Habil.</td> -->
<!-- 				<td width="8%" nowrap="nowrap">CPF</td>  -->
			  </tr>
			  <s:iterator value="condutores" status="stat">
			  	<tr style="display:none;">
			  		<td>
			  			<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].orcamentoSeguro.id" value="%{orcamentoSeguro.id}"/>
			  			<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].cnh" value="%{cnh}"/>
			  			<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].cpf" value="%{cpf}"/>
			  			<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].id" value="%{id}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].sexo" value="%{sexo}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].dataNascimento" value="%{dataNascimento}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].data1aHabilitacao" value="%{data1aHabilitacao}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].dataVencHabilitacao" value="%{dataVencHabilitacao}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].tempoHabilitacao" value="%{tempoHabilitacao}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].nome" value="%{nome}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].tipoCondutor" value="%{tipoCondutor}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].telefones" value="%{telefones}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].profissao.id" value="%{profissao.id}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].estadoCivil" value="%{estadoCivil}"/>
						<s:textfield name="orcamentoSeguro.condutoresCollection[%{#stat.index}].isCondutorPrincipal" value="%{isCondutorPrincipal}"/>
			  		</td>
			  	</tr>
				<tr>
				  <td nowrap="nowrap" class="small_image" align="center">
				    <a href="#" onclick="if(confirma('Confirma exclusão?')){removeCondutor('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
				    </a>
				  </td>
				  <td nowrap="nowrap" class="small_image" align="center">
				    <a href="#" onclick="if(confirma('Confirma edição?')){editarCondutor('<s:property value="id"/>');abrirDivCondutor();}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
				    </a>
				  </td>
				  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="%{isCondutorPrincipal == true?'SIM':'NÃO'}" />&nbsp;<input type="hidden" name="ePrincipal[]" value="<s:property value="%{isCondutorPrincipal == true?'SIM':'NÃO'}" />"/></td>
				  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="telefones"/>&nbsp;</td>
<%-- 				  <td nowrap="nowrap"><s:property value="estadoCivil"/>&nbsp;</td> --%>
				  <td nowrap="nowrap"><s:property value="cnh"/>&nbsp;</td>
<%-- 				  <td nowrap="nowrap"><s:property value="data1aHabilitacao"/>&nbsp;</td> --%>
<%-- 				  <td nowrap="nowrap"><s:property value="cpf"/>&nbsp;</td> --%>
				</tr>
			  </s:iterator>
			</table>

<% } catch (Exception e) {e.printStackTrace();}%>