package alquilerjoven.mobile

class Favorite {

	User user
	Date dateCreation
	Listing listing
	
    static constraints = {
		id composite: ['user', 'listing']
    }
}
