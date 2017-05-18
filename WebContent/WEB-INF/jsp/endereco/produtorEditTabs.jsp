<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/produtor/editar.action" />', false);">Produtor</a>
					</span>
				</div>
			</span>
			<span class="dojoTabcurrentfirst">
				<div>
					<span class="select">Endereço</span>
				</div>
         	</span>
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/contaCorrente/displayList.action" />', false);">Conta Corrente</a>
					</span>
				</div>
			</span>
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formEnderecoTabs, '<s:url value="/smsTelefonesProdutor/displayList.action" />', false);">Telefones SMS</a>
					</span>
				</div>
			</span>
		</div>
	</td>
</tr>