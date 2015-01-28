package fr.stackoverflowapp

class Answer {

	String body
	Date editDate
	Date createDate
	int votesNumber
	boolean validated
	
	static belongsTo = [question: Question, profile: Profile]
		
    static constraints = {
		
		body(blank: false, minSize: 10)
		
	}
	
	static mapping = {
		
		votesNumber defaultValue: 0
		validated defaultValue: false
	}
}
