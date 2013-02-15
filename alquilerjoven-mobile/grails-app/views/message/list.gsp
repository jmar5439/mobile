
<%@ page import="alquilerjoven.mobile.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-message" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'message.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="message" title="${message(code: 'message.message.label', default: 'Message')}" />
					
						<th><g:message code="message.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'message.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="readFrom" title="${message(code: 'message.readFrom.label', default: 'Read From')}" />
					
						<g:sortableColumn property="readTo" title="${message(code: 'message.readTo.label', default: 'Read To')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${messageInstanceList}" status="i" var="messageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: messageInstance, field: "message")}</td>
					
						<td>${fieldValue(bean: messageInstance, field: "parent")}</td>
					
						<td><g:formatDate date="${messageInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${messageInstance.readFrom}" /></td>
					
						<td><g:formatBoolean boolean="${messageInstance.readTo}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${messageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
