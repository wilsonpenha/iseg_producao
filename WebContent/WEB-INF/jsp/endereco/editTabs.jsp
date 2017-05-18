<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/seguradora/editar.action" />', false);">Seguradora</a>
					</span>
				</div>
			</span>
			<span class=" dojoTabcurrentfirst">
				<div>
					<span class="select">Endereço</span>
				</div>
         	</span>
         	<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/perfil/displayList.action" />', false);">Perfil</a>
					</span>
				</div>
			</span>
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/coberturas/displayList.action" />', false);">Coberturas</a>
					</span>
				</div>
			</span>
         	<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/servicos/displayList.action" />', false);">Serviços</a>
					</span>
				</div>
			</span>
		</div>
	</td>
</tr>