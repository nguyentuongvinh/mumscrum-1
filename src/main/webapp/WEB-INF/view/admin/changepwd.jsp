<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
<style>
	.error{color:#a94442;}
</style>
    			<%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
            	  <hr/>  
    			<div class="content-panel">            	                  
            	 <form:form commandName="user" cssClass="changepwdForm">            	  
            	  <c:if test="${error != null}">
             	   <div class="alert alert-danger" role="alert">
				    <div><c:out value="${error}" /></div>
					</div> 
					</c:if>
            	  	<form:errors path="*" />
            	  	     
            	  <c:if test="${success != null}">
            	  	<div class="alert alert-success" role="alert">
            	  	${success}
            	  	</div>
            	  </c:if>
            	  <sec:authorize access="hasAnyRole('ROLE_CHANGEPWD')">
            	  	<div class="alert alert-info" role="alert">
            	  		Your password has been expired or reseted, please change your password to continue process the system.
            	  	</div>
            	  </sec:authorize>
            	  <div class="row space5">             	  	
	            	  <div class="col-sm-12">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="userId" class="col-sm-3 control-label">Current Password:</label>    
	                   	<div class="col-sm-9">
	                   		<input type="password" id="oldpwd" name="oldpwd" class="form-control" />
	                   		<%-- <form:input path="user.userId" cssClass="form-control" htmlEscape="true"/> --%>
	                   	</div>  
	                   </div>
	                  </div> 
	                  
                  </div>
                  
                 <div class="row space5">             	  	
	            	  <div class="col-sm-12">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="userId" class="col-sm-3 control-label">New Password:</label>    
	                   	<div class="col-sm-9">
	                   		<input type="password" id="newpwd" name="newpwd" class="form-control" />
	                   		<%-- <form:input path="user.userId" cssClass="form-control" htmlEscape="true"/> --%>
	                   	</div>  
	                   </div>
	                  </div> 
	                  
                  </div>
                  
                 <div class="row space5">             	  	
	            	  <div class="col-sm-12">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="userId" class="col-sm-3 control-label">Confirm Password:</label>    
	                   	<div class="col-sm-9">
	                   		<input type="password" id="cnewpwd" name="cnewpwd" class="form-control" />
	                   		<%-- <form:input path="user.userId" cssClass="form-control" htmlEscape="true"/> --%>
	                   	</div>  
	                   </div>
	                  </div> 	                  
                  </div>
                  <div class="row space5">                 
                 <div class="form-group fixed-form-control col-sm-1 btNotFixed" >
				  	<button  type="submit" class="btn btn-danger">Save</button>
				 </div>
				 </div>
				 <div class="btFixed">
				<div class="text-center">
					<button type="submit" class="btn btn-danger">
					    Save
					</button>
				</div>
				</div>
				<div id="errorDiv" role="alert"></div>
            	  </form:form>                                        
    			</div><!-- /form-panel -->
    


<script type="text/javascript">
	$(document).ready(function(){
		//add regex if don't want to add can use additional-methods.js that contains the method "pattern"
		$.validator.addMethod(
		        "regex",
		        function(value, element, regexp) {
		            var re = new RegExp(regexp);
		            return this.optional(element) || re.test(value);
		        },
		        "Please check your input."
		);
		$('.changepwdForm').validate({
			rules: {
			    oldpwd: {
			      required: true,
			      remote:{
					url:"<spring:url value='/check-password' />",
					type:"post",
					data:{
						password:function(){
							return $('#oldpwd').val();
						}
					}
				  }
			    },
			    newpwd: {
				      required: true,
				      regex: "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$&+,:;=?@#|'<>.^*()%!]).{8,20})" ,
				      remote:{
						url:"<spring:url value='/check-new-password' />",
						type:"post",
						data:{
							password:function(){
								return $('#newpwd').val();
							}
						}
					  }
				},
				cnewpwd: {
				      required: true,
				      equalTo: "#newpwd"
				}
			},
			messages: {
				oldpwd:{
					required: "Current password is required!",
					remote: "Current password is incorrect!"
				},
				newpwd:{
					required:"New password is required!",
					regex:"Password must contains one digit from 0-9,one lowercase characters,uppercase characters,special characters,length at least 8 characters",
					remote: "New password has already been used!"	
				},
				cnewpwd:"Confirm password again!"
			},			
			highlight:function(element){				
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');				
				
			},
			unhighlight:function(element){
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');				
			},			
			/* showErrors: function(errorMap, errorList) {				
				$('#errorDiv').show();
				$('#errorDiv').addClass('alert alert-warning');
				var str="";			
												
				for (var e in errorList) {						
					  str+="<div>"+errorList[e].message+"</div>";
				}
			    $("#errorDiv").html("Your form contains "
			      + this.numberOfInvalids()
			      + " errors, see details below."+str);
			    this.defaultShowErrors();
			}, */
			success: function(label) {
				//$('#errorDiv').hide();
			},
			/* errorPlacement: function(error,element) {
			    return true;
			} */
			
		});

	});

</script>


