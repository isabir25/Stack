package fr.stackoverflowapp

import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class QuestionController {

	def question
	
    def index() {
		
		redirect(action: "list")
	}
	
	def list (){
		
	}
	
	def createQuestion(){

		[tags: Tags.list(params)]
	}
	
	def save(){
		
		question = new Question(params)
		def tagList = []
		def i=0
		
		params.tags.each{ cp -> 
			
			tagList << Tags.get(cp)
		}
		question.tags = tagList
		question.askDate = new Date()
		//add profile
			
		redirect(action: "show")
	}
	def show(){
		
		[myQuestion: question]
	}
	
	def edit(){
		
	}
}
