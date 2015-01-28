package fr.stackoverflowapp

import fr.stackoverflowapp.secureapp.SecUser

class Profile {

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
	
    static constraints = {
		
		user(blank: false)
		firstName(blank: false)
		signInDate(blank: false)
		profileViewsNumber(blank: false)
		photo(blank: false)
    }
	static mapping = {
		
		reputation defaultValue: 1
		profileViewsNumber defaultValue: 0
	}
}
