<html>
    <head>
        <title><g:layoutTitle default="An example decorator" /></title>
        <g:layoutHead />
        
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){ 
			$('#header').load('Header.gsp');
		});
    </script>
    
    </head>
    <body>
    	<div id="header">
    	    	
			<table style="width: 100%">
				<tr>
					<td><a href="#" ><g:message code="questions.label" default="Questions" /></a></td>
					<td><g:link controller="Tags" >
						<g:message code="tag.label" default="Tags" />
					</g:link></td>
					<td><a href="#" ><g:message code="user.label" default="User" /></a></td>
					<td><g:link controller="Badge" >
						<g:message code="badge.label" default="Badges" />
					</g:link></td>
					<td><g:link controller="Question" action="createQuestion" >
						<g:message code="askQuestion.label" default="Ask question" />
					</g:link></td>
					<td>
						<form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
							<input type="hidden" name="" value="">
							<a HREF="javascript:document.submitForm.submit()">Logout</a>
						</form>
					</td>
				</tr>
			</table>
			
    	</div>
            <div class="body">
                <g:layoutBody />
            </div>
        <div id="footer"></div>
    </body>
</html>