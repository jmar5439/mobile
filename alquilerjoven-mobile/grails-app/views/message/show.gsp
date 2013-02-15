
<%@ page import="alquilerjoven.mobile.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-message" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list message">
			
				<g:if test="${messageInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="message.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${messageInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="message.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${messageInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="message.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="message" action="show" id="${messageInstance?.parent?.id}">${messageInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="message.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${messageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.readFrom}">
				<li class="fieldcontain">
					<span id="readFrom-label" class="property-label"><g:message code="message.readFrom.label" default="Read From" /></span>
					
						<span class="property-value" aria-labelledby="readFrom-label"><g:formatBoolean boolean="${messageInstance?.readFrom}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.readTo}">
				<li class="fieldcontain">
					<span id="readTo-label" class="property-label"><g:message code="message.readTo.label" default="Read To" /></span>
					
						<span class="property-value" aria-labelledby="readTo-label"><g:formatBoolean boolean="${messageInstance?.readTo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.userFrom}">
				<li class="fieldcontain">
					<span id="userFrom-label" class="property-label"><g:message code="message.userFrom.label" default="User From" /></span>
					
						<span class="property-value" aria-labelledby="userFrom-label"><g:link controller="user" action="show" id="${messageInstance?.userFrom?.id}">${messageInstance?.userFrom?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.userTo}">
				<li class="fieldcontain">
					<span id="userTo-label" class="property-label"><g:message code="message.userTo.label" default="User To" /></span>
					
						<span class="property-value" aria-labelledby="userTo-label"><g:link controller="user" action="show" id="${messageInstance?.userTo?.id}">${messageInstance?.userTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${messageInstance?.id}" />
					<g:link class="edit" action="edit" id="${messageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
