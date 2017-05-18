<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class=" dojoTabcurrentfirst">
				<div>
					<span class="select">Automóvel</span>
				</div>
         	</span>
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="${pageContext.request.contextPath}/condutor/displayList.action?condutor.automovel.id=${automovel.id}" onclick="">Condutores</a>
					</span>
				</div>
			</span>
		</div>
	</td>
</tr>