package alquilerjoven.mobile

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class MessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [messageInstanceList: Message.list(params), messageInstanceTotal: Message.count()]
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        [messageInstance: new Message(params)]
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save() {
        def messageInstance = new Message(params)
        if (!messageInstance.save(flush: true)) {
            render(view: "create", model: [messageInstance: messageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        redirect(action: "show", id: messageInstance.id)
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        [messageInstance: messageInstance]
    }

    
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def update(Long id, Long version) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (messageInstance.version > version) {
                messageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'message.label', default: 'Message')] as Object[],
                          "Another user has updated this Message while you were editing")
                render(view: "edit", model: [messageInstance: messageInstance])
                return
            }
        }

        messageInstance.properties = params

        if (!messageInstance.save(flush: true)) {
            render(view: "edit", model: [messageInstance: messageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        redirect(action: "show", id: messageInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        try {
            messageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "show", id: id)
        }
    }
}
