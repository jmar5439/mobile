import alquilerjoven.mobile.Role
import alquilerjoven.mobile.User
import alquilerjoven.mobile.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		def facebookRole = new Role(authority: 'ROLE_FACEBOOK').save(flush: true)
		
			  def testUser = new User(username: 'me', enabled: true, password: 'password')
			  testUser.save(flush: true)
			  
			  def testUser2 = new User(username: 'me2', enabled: true, password: '0password')
			  testUser2.save(flush: true)
		
			  def facebookUser=new FacebookUser(uid:'710058094',user:testUser).save(flush:true)
			  UserRole.create testUser, adminRole, true
			  UserRole.create testUser2, userRole, true
			  UserRole.create testUser2, facebookRole, true
		
			  assert User.count() == 2
			  assert Role.count() == 3
			  assert UserRole.count() == 3
    }
    def destroy = {
    }
}
