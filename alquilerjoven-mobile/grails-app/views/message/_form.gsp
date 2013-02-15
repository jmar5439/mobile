<%@ page import="alquilerjoven.mobile.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="message.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="255" required="" value="${messageInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="message.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" required="" value="${messageInstance?.message}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="message.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${alquilerjoven.mobile.Message.list()}" optionKey="id" value="${messageInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'readFrom', 'error')} ">
	<label for="readFrom">
		<g:message code="message.readFrom.label" default="Read From" />
		
	</label>
	<g:checkBox name="readFrom" value="${messageInstance?.readFrom}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'readTo', 'error')} ">
	<label for="readTo">
		<g:message code="message.readTo.label" default="Read To" />
		
	</label>
	<g:checkBox name="readTo" value="${messageInstance?.readTo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'userFrom', 'error')} required">
	<label for="userFrom">
		<g:message code="message.userFrom.label" default="User From" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userFrom" name="userFrom.id" from="${alquilerjoven.mobile.User.list()}" optionKey="id" required="" value="${messageInstance?.userFrom?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'userTo', 'error')} required">
	<label for="userTo">
		<g:message code="message.userTo.label" default="User To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userTo" name="userTo.id" from="${alquilerjoven.mobile.User.list()}" optionKey="id" required="" value="${messageInstance?.userTo?.id}" class="many-to-one"/>
</div>

