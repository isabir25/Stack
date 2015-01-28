import java.util.Date;

import fr.stackoverflowapp.secureapp.SecRole
import fr.stackoverflowapp.secureapp.SecUser
import fr.stackoverflowapp.secureapp.SecUserSecRole
import fr.stackoverflowapp.Tags
import fr.stackoverflowapp.Profile

class BootStrap {

    def init = { servletContext ->
		def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new SecRole(authority: 'ROLE_USER').save(flush: true)
	
		def testUser = new SecUser(username: 'admin', enabled: true, password: 'admin')
		def testUser2 = new SecUser(username: 'simpleUser', enabled: true, password: 'simpleUser')
		testUser.save(flush: true)
		testUser2.save(flush: true)
	
		SecUserSecRole.create testUser, adminRole, true
		SecUserSecRole.create testUser2, userRole, true
		/******************/
		
		
		def profile = new Profile(firstName: 'sara',lastName: 'qasmi', 
			birthDate: new Date(),aboutMe: "dldk",photo: "kjkk",
			signInDate: new Date(),profileViewsNumber: 0,reputation: 10,
			askedQuestions: null,editededQuestions: null,answers: null,responses: null, badges:null,
			 user: testUser).save(flush: true)
/*
 * 
	String firstName
	String lastName
	Date birthDate
	String aboutMe
	String photo
	
	def signInDate= new Date()
	int profileViewsNumber
	
	// Réputation
	int reputation 
	
	// Question : in time or from the start
	static hasMany = [askedQuestions: Question,
						editededQuestions: Question,
						answers: Question,
						responses: Question,
						badges: Badge]
	
	static belongsTo = [user: SecUser]
 * */
    }
    def destroy = {
    }
}
