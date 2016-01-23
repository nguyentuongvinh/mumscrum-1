<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>		
<%-- <spring:message code="welcome.springmvc" text="default text" />	 --%>
          			<div class="content-panel">
                  	  <%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
                  	  <hr/>             
                  	  <ul id="EmployeeTab" class="nav nav-tabs" >
					        <li class="active"><a data-toggle="tab" href="#tabemployeeDetail">Employee Detail</a></li>
					        <li><a data-toggle="tab" href="#tabemployeeRole">Employee Role</a></li>					        
					  </ul>
    				  <div class="tab-content">
	        		  <div id="tabemployeeDetail" class="tab-pane fade in active" style="padding-top:20px">        
                  	  <form:form commandName="employee">
                  	   <c:if test="${errors != null}">
	             	   <div class="alert alert-warning" role="alert">
	             	   <%-- <c:out value="${errors[0].defaultMessage}" /> --%> 
	             	   <%-- <c:forEach items="${errors}" var="error">				    
					    <div><c:out value="${error.defaultMessage}" /></div>
						</c:forEach>  --%>
						 <form:errors path="*" />
						</div>
						</c:if>
                  	  	<%-- <form:errors path="*" /> --%>                  	  	
                  	  <div class="row space5">             	  	
	            	  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="userId" class="col-sm-3 control-label">User ID:<span class="required-mark">*</span></label>    
	                   	<div class="col-sm-9">
	                   		<form:input path="userId" cssClass="form-control" htmlEscape="true"/>
	                   	</div>  
	                   </div>
	                  </div> 
	                  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control">
		                   	<label for="fullName" class="col-sm-3 control-label">Full Name:<span class="required-mark">*</span></label>    
		                   	<div class="col-sm-9 input-group">
		                   		<form:input path="fullName" cssClass="form-control" htmlEscape="true"/>
		                   		<span class="input-group-addon">
							      <i class="fa fa-text-width"></i>
		                   		</span>
		                   	</div>	                   	  
	                   </div>
                  		</div>
                  	</div>
                     <div class="row space5">
	                  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="username" class="col-sm-3 control-label">Username:<span class="required-mark">*</span></label>    
	                   	<div class="col-sm-9 input-group">
	                   		<form:input path="username" readonly="true" cssClass="form-control"/>
	                   		<span class="input-group-addon">
							      <i class="fa fa-text-width"></i>
		                   	</span>	                        		
	                   	</div>  
	                   </div>
	                  </div>
	                  
	                  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="gender" class="col-sm-3 control-label">Gender:</label>    
	                   	<div class="col-sm-9">
	                   		<form:select path="gender" cssClass="form-control select2combo">
	                   			<form:option value="Male" label="Male"/>
	                   			<form:option value="Female" label="Female"/>
	                   		</form:select>
	                   	</div>  
	                   </div>
	                  </div>	
	                  </div>
                     <div class="row space5">
	                  
	                  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control">
	                   	<label for="email" class="col-sm-3 control-label">E-Mail:<span class="required-mark">*</span></label>    
	                   	<div class="col-sm-9 input-group">
	                   		<form:input path="email" cssClass="form-control"/>
	                   		<span class="input-group-addon">
							      @
		                   	</span>
	                   	</div>  
	                   </div>
	                  </div>
	                  <div class="col-sm-6 ">
	                        <div class="form-group fixed-form-control">
	                        	<label for="maxAttempNo" class="col-sm-3 control-label">Max Attempt:<span class="required-mark">*</span></label>    
	                        	<div class="col-sm-9 input-group">
			                   		<form:input path="maxAttempNo" cssClass="form-control" />
			                   		<span class="input-group-addon">
									      #
				                   	</span>
			                   	</div>  
	                        </div>
                        </div>	  
	                  </div>
	                  <div class="row space5">          
	                   <div class="col-sm-6 ">
	                        <div class="form-group fixed-form-control">
	                        	<label for="pwdExpiredDate" class="col-sm-3 control-label">PWD Expired:</label>    
	                        	<div class="col-sm-9 input-group">
			                   		<form:input path="pwdExpiredDate" cssClass="form-control date" placeholder="Password Expired Date (dd/mm/yyyy)"/>
			                   		<span class="input-group-addon">
									      <i class="glyphicon glyphicon-th"></i>
				                   	</span>
			                   	</div>  
	                        </div>
                        </div>	  
                        <div class="col-sm-6">
	                        <div class="form-group fixed-form-control">
	                        	<label for="accountExpiredDate" class="col-sm-3 control-label">Acc Expired:</label>    
	                        	<div class="col-sm-9 input-group">
			                   		<form:input path="accountExpiredDate" cssClass="form-control date" placeholder="Account Expired Date (dd/mm/yyyy)"/>
			                   		<span class="input-group-addon">
									      <i class="glyphicon glyphicon-th"></i>
				                   	</span>
			                   	</div>  
	                        </div>
                        </div>	                                      
                        
                       </div>
                       <div class="row space5"> 
                       
                        <%-- <div class="col-sm-6">
	                   <div class="form-group fixed-form-control" >
	                   	<label for="fullNameKH" class="col-sm-3 control-label">Full Name KH:<span class="required-mark">*</span></label>    
	                   	<div class="col-sm-9 input-group">
	                   		<form:input path="user.fullNameKH" cssClass="form-control"/>
	                   		<span class="input-group-addon">
							      <i class="fa fa-text-width"></i>
		                   	</span>	                        		
	                   	</div>  
	                   </div>
	                  </div> --%>
                     </div>
                     
                    <div class="row space5"> 
                     <div class="col-sm-6 fixed-form-control">	                             	         
	                        <div class="checkbox">
	                        	<label class="col-sm-3 control-label" style="font-weight:bold">Status:</label>
	                        	<c:choose>
								    <c:when test="${pageContext.request.userPrincipal.name==employee.username}">
								        <label class="col-sm-3"><form:checkbox path="enabled" disabled="${'true'}"/> Enable</label>    	                        	
	                        			<label class="col-sm-3"><form:checkbox path="firstLogin" disabled="${'true'}"/> First Login</label>
	                        			<label class="col-sm-3"><form:checkbox path="locked" disabled="${'true'}"/> Locked</label>
								    </c:when>
								    <c:otherwise>
										<label class="col-sm-3"><form:checkbox path="enabled" /> Enable</label>    	                        	
	                        			<label class="col-sm-3"><form:checkbox path="firstLogin" /> First Login</label>
	                        			<label class="col-sm-3"><form:checkbox path="locked" /> Locked</label>
								    </c:otherwise>
								</c:choose>
	                        	
	                        </div>
                        </div>
                     </div>
                        
<%--                         <form:input type="hidden" path="employeeRoleId" /><!--  --> --%>
                        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
		                 <div class="row space5">
		                  <div class="form-group col-sm-6 btNotFixed" >
						  	<button  type="submit" class="btn btn-danger">Save</button>
						  	<a href="#" data-target="#resetpwd"  data-toggle="modal" class="btn btn-danger">Reset Password</a>
						  </div>
						  </div>
						  <div class="btFixed">
								<div class="text-center">
									<button type="submit" class="btn btn-danger">
									    Save
									</button>
									<a href="#" data-target="#resetpwd"  data-toggle="modal" class="btn btn-danger">Reset Password</a>      
								</div>
							</div>
                  	  </form:form>               
                  	  </div> <!--  end Role detail -->
                  	  	<div id="tabemployeeRole" class="tab-pane fade" style="padding-top:20px">
                  	  		<c:url value="/employee/${username}/edit/employeerole" var="employeeRoleAction" />
                  	  		<form:form commandName="employeeRole" action="${employeeRoleAction}" >
                  	  			<div class="row space5">
	                  	  			<div class="col-sm-6 form-group fixed-form-control">                  	  			
		                  	  				<label for="role.roleId" class="col-sm-4 control-label">Add Role:</label>
		                  	  				<div class="col-sm-8">
			                  	  				<form:select path="role.roleId" items="${roles}" itemValue="roleId" itemLabel="roleName" cssClass="form-control select2combo" />
			                  	  			</div>
		                  	  		</div>
		                  	  		<div class="form-group col-sm-1" >
							  		<button  type="submit" class="btn btn-danger">Add</button>
							 		</div>
	                  	  		</div>
	                  	  			                  	  		
                  	  		</form:form>
                  	  	
                  	  	<table id="employeerole_grid" class="table table-striped table-advance table-hover"> <!-- style="border:1px solid #ccc;" -->                            
	              	  	  <thead>
	                           <tr>                          	  
								  <th>#</th>
	                          	  <th>Role Id</th>
	                          	  <th>Role Name</th>
	                          	  <th>Role Description</th>                          	  
								  <th>Action</th>
	                           </tr>
	                      </thead>
	                         <c:set var="id" value="${1}"/>
	                         <tbody>
	                          <c:forEach items="${employeeRoles}" var="employeeRole">
				   			 <tr> 
	                          	 <td>${id}</td>
	                          <c:set var="id" value="${id+1}"/>
	                          <td><c:out value="${employeeRole.role.roleId}" /></td>
	                          <td><c:out value="${employeeRole.role.roleName}" /></td>
	                          <td><c:out value="${employeeRole.role.roleDesc}" /></td>
	                             <td>
	                                  <button value="${employeeRole.employeeRoleId}" class="btnRemoveEmployeeRole btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button>
	                              </td>
	                          </tr>
	                          </c:forEach>
	                        </tbody>
	                     </table>    
                  	  	</div> <!-- end Role Permission -->
                  	  </div> <!-- end tab content -->                                  
          			</div><!-- /form-panel -->          		
   	    
   	    
<!-- Modal -->
<div class="modal fade" id="resetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Reset Password</h4>
      </div>
      <div class="modal-body">
        <form id="formResetPwd" method="post" action="<spring:url value="/resetpwd" />" class="form-horizontal">
           <div class="form-group">
               <label class="col-md-4 control-label">Enter New Password</label>
               <div class="col-md-8">
                   <input type="password" class="form-control" id="newpwd" name="newpwd" placeholder="New Password" autocomplete="off"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-md-4 control-label">Re-enter New Password</label>
               <div class="col-md-8">
                   <input type="password" class="form-control" id="cnewpwd" name="cnewpwd" placeholder="Re-enter New Password" autocomplete="off"/>
               </div>
           </div>
           <input id="username" name="username" type="hidden" value=""/>
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           <div class="form-group">     
               <div class="col-md-offset-4 col-md-4">
                   <button type="submit" id="btnNew" class="btn btn-primary " >Save</button>  
                   <button class="btn " data-dismiss="modal" aria-hidden="true">Close</button>                         
               </div>
           </div>
       </form>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){		
		$('.date').datepicker({		    
			autoclose: true,
		    todayHighlight: true,
		    format: "dd/mm/yyyy"
		});	
		$("#username").val($( "input[name='username']" ).val());
		$.validator.addMethod(
		        "regex",
		        function(value, element, regexp) {
		            var re = new RegExp(regexp);
		            return this.optional(element) || re.test(value);
		        },
		        "Please check your input."
		);
		
		var validate=$('#formResetPwd').validate({
			errorClass: "text-danger",
			rules: {			    
			    newpwd: {
				      required: true,
				      regex: "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$&+,:;=?@#|'<>.^*()%!]).{8,20})" ,				      
				},
				cnewpwd: {
				      required: true,
				      equalTo: "#newpwd"
				}
			},
			messages: {				
				newpwd:{
					required:"New password is required!",
					regex:"Password must contains one digit from 0-9,one lowercase characters,uppercase characters,special characters,length at least 8 characters",					
				},
				cnewpwd:"Confirm password again!"
			},			
			highlight:function(element){				
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');				
				
			},
			unhighlight:function(element){
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');				
			}							
		});

		$('#resetpwd').on('hidden.bs.modal', function() {			
			$('#formResetPwd').find('input[type=password]').val('');
			$('#formResetPwd').find('.form-group').removeClass('has-error').removeClass('has-success')
			validate.resetForm();
			
		});
		
		$("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
	        var id = $(e.target).attr("href").substr(1);	        
	        window.location.hash = id;	        
	        $('html,body').scrollTop(0);
	    });
	
	    // on load of the page: switch to the currently selected tab
	    var hash = window.location.hash;
	    $('#EmployeeTab a[href="' + hash + '"]').tab('show');
    		$('#employeerole_grid').dataTable({
    			//        "data": data,
    			/* "scrollY":        "200px",
    		        "scrollCollapse": true,
    		        "paging":         false, */
    		        	/* responsive: true, */
    					stateSave: true,
    			       /*  dom: 'TC<"clearfix">lfrtip',
    			        columnDefs: [
    			            { visible: false, targets: [0,3] }
    			        ],
    			        tableTools: {
    			            "aButtons": ["copy", "csv", "pdf"],
    			            "sSwfPath": "<c:url value="/resources/TableTools/swf/copy_csv_xls_pdf.swf"/>"
    			        }, */
    			        "fnDrawCallback": function (oSettings, json) {
    			            //showLoading(false);
    			        }
    			       
    			    });
		          	                	
        	  var token = $("meta[name='_csrf']").attr("content");
        	  var header = $("meta[name='_csrf_header']").attr("content");
        	  $("body").bind("ajaxSend", function(elm, xhr, s){
        		   if (s.type == "POST") {
        		      xhr.setRequestHeader('X-CSRF-Token', getCSRFTokenValue());
        		   }
        		});
        	  $(document).ajaxSend(function(e, xhr, options) {
        	    xhr.setRequestHeader(header, token);
        	  });
        	$(".btnRemoveEmployeeRole").click(function(){			
            	var employeeRoleId=$(this).val();
            	var data={"${_csrf.parameterName}" :"${_csrf.token}" };
            	<c:url value="/employee/${username}/remove/employeerole/" var="url"/>	
        		$.post( "${url}"+employeeRoleId, function() {
        			  location.reload();
        		});
				
			}); 
	});
	
</script>