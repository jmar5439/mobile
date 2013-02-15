package alquilerjoven.mobile

class FacebookUser {
	long uid
	String accessToken
	User user
	Date accessTokenExpires
	static belongsTo = [user: User] //connected to main Spring Security domain
  
	static constraints = {
	  uid unique: true
	}

   
}
