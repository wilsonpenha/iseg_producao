<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class="dojoTabcurrentfirst">
				<div>
					<span class="select">Grupo de Venda</span>
				</div>
         	</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formGrupoDeVendaTabs, '<s:url value="/grupoDeVenda/listaUsuariosPosVenda.action" />', false);">Configurar Pos Venda</a>
					</span>
				</div>
			</span>	
		</div>
	</td>
</tr>