
<html>
	<head>
        <meta name="layout" content="application"/>	
		<g:set var="entityName" value="${message(code: 'askQuestion.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>    
    </head>
    <body>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
	    	<g:hasErrors bean="${myQuestion}">
			    <g:eachError><p><g:message error=""/></p></g:eachError>
			</g:hasErrors>
			
			<!-- Show question -->
			<div>
				<label for="Title">
					<g:message code="${myQuestion?.title}" />
				</label>
			</div>
			<table border="1">
				<tr>
					<td><div>
						<g:message code="Votes : ${myQuestion?.votesNumber}" />
					</div></td>
					<td><div>
						<g:textArea name="body" disabled="true" rows="10" cols="40" value="${myQuestion?.body}"/>
					</div></td>
					<td><div>
						<g:message code="Asked : ${myQuestion?.askDate}" /></br>
						<g:message code="Viewed : ${myQuestion?.viewsNumber}" />
					</div></td>
				</tr>
			</table>		
			<div>
				<table border="1">
					<tr>
						<td>
							<g:select name="tags" disabled="true" multiple="true" from="${myQuestion?.tags}" optionValue="name" />
						</td>
						<td>
							<g:message code="Last edition date : " /></br>
							?????????????
						</td>
						<td>
							Asked By profile ??????
						</td>
					</tr>
				</table>
				<td><g:link action="edit" params="[identifier: myQuestion.id]">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link></td>
			</div>		
			<!-- Answers list -->
			<g:if test="${myQuestion?.answers != null}">
			     <p><g:message code="${myQuestion?.answers } Answers" /></p>
			</g:if>
			<g:else>
			     0 Answer
			</g:else>
			<g:each in="${myQuestion?.answers}" var="answer">
				<table border="1">
					<tr>
						<td><div>
							<g:message code="Votes : ${answer?.votesNumber}" />
						</div></td>
						<td><div>
							<g:textArea name="body" disabled="true" rows="10" cols="40" value="${answer?.body}"/>
						</div></td>
					</tr>
				</table>	
				<div>
					<table border="1">
						<tr>
							<td>
								<td><g:link action="edit" params="[answerIdentifier: answer.id, 
																	questionIdentifier: myQuestion.id]">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link></td>
							</td>
							<td>
								<g:message code="Last edition date : " /></br>
								?????????????
							</td>
							<td>
								Asked By profile ??????
							</td>
						</tr>
					</table>
				</div>		
			</g:each>
			<!-- Your Answer -->
			
			<p><g:message code="Your answer" /></p>
				
			<g:form method="post" >
				<g:hiddenField name="questionId" value="${myQuestion?.id}" />	
				<div>
					<g:textArea name="body" rows="10" cols="40" value="${question?.body}"/>
				</div>
				<!-- render -->
				<td><g:link controller="Answer" action="save">
					<g:message code="default.button.create.label" default="Create" />
				</g:link></td>	
			</g:form>
	</body>
</html>