package fr.stackoverflowapp

import org.springframework.security.access.annotation.Secured

import fr.stackoverflowapp.secureapp.SecUser;

@Secured('permitAll')
class ProfileController {
	
	def springSecurityService
	
	def index (){
		
		if(session["profile"] == null){
			def user = springSecurityService.getCurrentUser()
			
			def res = Profile.executeQuery("select a from Profile a " +
				"where a.user.id = ?",
				[user.id])
			
			session["profile"] = res
		}
	}
	
	def getProfileFromUser(){
		
	}
	
}
