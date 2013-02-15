package alquilerjoven.mobile

class Message {
	
	boolean readFrom
	boolean readTo
	String title
	String message
	User userTo
	User userFrom
	Message parent
	Date dateCreated
	
	static belongsTo = [userTo: User,userFrom:User] //connected to main Spring Security domain
	
	

    static constraints = {
		title size: 0..255, blank: false
		message blank: false, size: 0..65535
		parent nullable:true
		
    }
}
