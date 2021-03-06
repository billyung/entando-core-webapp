<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="%{null != #tableMappingVar && !#tableMappingVar.isEmpty()}">
	<s:iterator var="dataSourceNameVar" value="#tableMappingVar.keySet()" >
		<p>
			<strong><span lang="en">Datasource</span>&#32;<em><s:property value="#dataSourceNameVar" /></em></strong>:
			<s:set var="tableNamesVar" value="%{getTableNames(#tableMappingVar[#dataSourceNameVar])}" />
			<s:if test="null != #tableNamesVar">
				<s:iterator var="tableNameVar" value="#tableNamesVar" status="statusVar">
					<em><s:property value="#tableNameVar" /></em>
					<s:if test="%{!(#statusVar.last)}">,&#32;</s:if>
				</s:iterator>
			</s:if>
			<s:else>
				<p><s:text name="database.management.note.backup.notable" /></p>
			</s:else>
		</p>
	</s:iterator>
</s:if>
<s:else>
	<p>
		<s:text name="database.management.note.backup.notable" />
	</p>
</s:else>

