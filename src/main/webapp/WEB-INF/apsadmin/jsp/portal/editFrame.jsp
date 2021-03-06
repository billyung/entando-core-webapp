<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>

<h1><a href="<s:url action="viewTree" namespace="/do/Page" />" title="<s:text name="note.goToSomewhere" />: <s:text name="title.pageManagement" />"><s:text name="title.pageManagement" /></a></h1>
<p class="noscreen"><a href="#editFrame"><s:text name="note.goToEditFrame" /></a></p>

<div id="main">

<h2><s:text name="title.configPage" /></h2>

<s:set var="breadcrumbs_pivotPageCode" value="currentPage.code" />
<s:include value="/WEB-INF/apsadmin/jsp/portal/include/pageInfo_breadcrumbs.jsp" />
<div class="subsection-light">
<h3><s:text name="title.configPage.youAreDoing" /></h3>

<s:action namespace="/do/Page" name="printPageDetails" executeResult="true" ignoreContextParams="true"><s:param name="selectedNode" value="currentPage.code"></s:param></s:action>

<s:if test="showlet != null">

<s:include value="/WEB-INF/apsadmin/jsp/portal/include/frameInfo.jsp" />
<h3><s:text name="name.showlet" />:&#32;<s:property value="%{getTitle(showlet.type.code, showlet.type.titles)}" /></h3>

<p><s:text name="note.editFrame.noConfigNeeded" /></p>
</s:if>
<s:else>

<h2 id="editFrame"><s:text name="title.editFrame" />: <s:property value="frame" /> &ndash; <s:property value="currentPage.getModel().getFrames()[frame]"/></h2>

<%-- Error message handling --%>
	<s:if test="hasActionErrors()">
<div class="message message_error">
<h3><s:text name="message.title.ActionErrors" /></h3>	
	<ul>
	<s:iterator value="actionErrors">
		<li><s:property escape="false" /></li>
	</s:iterator>
	</ul>
</div>
	</s:if>

<p class="margin-more-bottom"><s:text name="note.editFrame.chooseAShowlet" /></p>

<s:form action="joinShowlet">
	<p class="noscreen">
		<wpsf:hidden name="pageCode" />
		<wpsf:hidden name="frame" />
	</p>
<fieldset>
	<legend><s:text name="title.editFrame.chooseAShowlet" /></legend>
	<p>
	<label for="showletCode" class="basic-mint-label"><s:text name="name.showlet" />:</label>
	<select name="showletTypeCode" tabindex="<wpsa:counter />" id="showletCode">
	<s:iterator var="showletFlavour" value="showletFlavours">
		
		<wpsa:set var="tmpShowletType">tmpShowletTypeValue</wpsa:set>
		
		<s:iterator var="showletType" value="#showletFlavour" >
					
			<s:if test="#showletType.optgroup != #tmpShowletType">
			
				<s:if test="#showletType.optgroup == 'stockShowletCode'">
					<wpsa:set var="optgroupLabel"><s:text name="title.showletManagement.showlets.stock" /></wpsa:set>
				</s:if>
				<s:elseif test="#showletType.optgroup == 'customShowletCode'">
					<wpsa:set var="optgroupLabel"><s:text name="title.showletManagement.showlets.custom" /></wpsa:set>
				</s:elseif>
				<s:elseif test="#showletType.optgroup == 'userShowletCode'">
					<wpsa:set var="optgroupLabel"><s:text name="title.showletManagement.showlets.user" /></wpsa:set>
				</s:elseif>
				<s:else>
					<wpsa:set var="pluginPropertyName" value="%{getText(#showletType.optgroup + '.name')}" />		
					<wpsa:set var="pluginPropertyCode" value="%{getText(#showletType.optgroup + '.code')}" />					
					<wpsa:set var="optgroupLabel"><s:text name="#pluginPropertyName" /></wpsa:set>
				</s:else>
						
			<optgroup label="<s:property value="#optgroupLabel" />">
			</s:if>
				<option value="<s:property value="#showletType.key" />"><s:property value="#showletType.value" /></option>
		
			<wpsa:set var="tmpShowletType"><s:property value="#showletType.optgroup" /></wpsa:set>
		
		</s:iterator>
			</optgroup>	
	</s:iterator>
	</select>
	</p>

</fieldset>
	<p><wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.confirm')}" cssClass="button" /></p>
</s:form>

</s:else>

</div>
</div>
