<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
    			<%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
            	  <hr/>  
    			<div class="content-panel">            	                  
            	  <form:form commandName="employeeRole">
            	 
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
	                   		<form:input path="employee.userId" cssClass="form-control" htmlEscape="true"/>
	                   	</div>  
	                   </div>
	                  </div> 
	                  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control">
		                   	<label for="fullName" class="col-sm-3 control-label">Full Name:<span class="required-mark">*</span></label>    
		                   	<div class="col-sm-9 input-group">
		                   		<form:input path="employee.fullName" cssClass="form-control" htmlEscape="true"/>
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
                   		<form:input path="employee.username" cssClass="form-control"/>
                   		<span class="input-group-addon">
						      <i class="fa fa-text-width"></i>
	                   	</span>	                        		
                   	</div>  
                   </div>
                  </div>
                  <div class="col-sm-6">
                   <div class="form-group fixed-form-control">
                   	<label for="password" class="col-sm-3 control-label">Password:<span class="required-mark">*</span></label>    
                   	<div class="col-sm-9">
                   		<form:password path="employee.password" cssClass="form-control" autocomplete="off"/>
                   	</div>  
                   </div>
                  </div>	
                  </div>
                  <div class="row space5">
                  <div class="col-sm-6">
                   <div class="form-group fixed-form-control" >
                   	<label for="gender" class="col-sm-3 control-label">Gender:</label>    
                   	<div class="col-sm-9">
                   		<form:select path="employee.gender" cssClass="form-control select2combo">
                   			<form:option value="Male" label="Male"/>
                   			<form:option value="Female" label="Female"/>
                   		</form:select>
                   	</div>  
                   </div>
                  </div>
                  <div class="col-sm-6">
                   <div class="form-group fixed-form-control">
                   	<label for="email" class="col-sm-3 control-label">E-Mail:<span class="required-mark">*</span></label>    
                   	<div class="col-sm-9 input-group">
                   		<form:input path="employee.email" cssClass="form-control"/>
                   		<span class="input-group-addon">
						      @
	                   	</span>
                   	</div>  
                   </div>
                  </div>	
                  </div>
                  
                  <div class="row space5">
                   <div class="col-sm-6 ">
	                   <div class="form-group fixed-form-control">
	                   	<label for="role" class="col-sm-3 control-label">Role:<span class="required-mark">*</span></label>    
	                   	<div class="col-sm-9">
	                   		<%-- <form:select path="selectedRole" items="${roles}" itemValue="roleId" itemLabel="roleName" cssClass="form-control select2combo" multiple="multiple" /> --%>
	                   		<select multiple="multiple" name="selectRoles" class="form-control select2combo">
					            <c:forEach items="${roles}" var="ro">
					          <option value="${ro.roleId}">${ro.roleName}</option>
					         </c:forEach>
					        </select>
	                   	</div>  
	                   </div>
                  	</div>
                  	<div class="col-sm-6 ">
	                        <div class="form-group fixed-form-control">
	                        	<label for="pwdExpiredDate" class="col-sm-3 control-label">PWD Expired:</label>    
	                        	<div class="col-sm-9 input-group">
			                   		<form:input path="employee.pwdExpiredDate" cssClass="form-control date" placeholder="Password Expired Date (dd/mm/yyyy)"/>
			                   		<span class="input-group-addon">
									      <i class="glyphicon glyphicon-th"></i>
				                   	</span>
			                   	</div>  
	                        </div>
                        </div>	 
                  </div>	
                  <div class="row space5">       
                  	<div class="col-sm-6 ">
                        <div class="form-group fixed-form-control">
                        	<label for="accountExpiredDate" class="col-sm-3 control-label">Acc Expired:</label>    
                        	<div class="col-sm-9 input-group">
		                   		<form:input path="employee.accountExpiredDate" cssClass="form-control date" placeholder="Account Expired Date (dd/mm/yyyy)"/>
		                   		<span class="input-group-addon">
								      <i class="glyphicon glyphicon-th"></i>
			                   	</span>
		                   	</div>  
                        </div>
                    </div>	    
                   <%--  <div class="col-sm-6">
	                   <div class="form-group fixed-form-control">
		                   	<label for="fullNameKH" class="col-sm-3 control-label">Full Name KH:<span class="required-mark">*</span></label>    
		                   	<div class="col-sm-9 input-group">
		                   		<form:input path="employee.fullNameKH" cssClass="form-control" htmlEscape="true"/>
		                   		<span class="input-group-addon">
							      <i class="fa fa-text-width"></i>
		                   		</span>
		                   	</div>	                   	  
	                   </div>   
	                  </div>   	 --%>                   	                                     
                        <div class="col-sm-6 ">
	                        <div class="form-group fixed-form-control">
	                        	<label for="maxAttempNo" class="col-sm-3 control-label">Max Attempt:<span class="required-mark">*</span></label>    
	                        	<div class="col-sm-9 input-group">
			                   		<form:input path="employee.maxAttempNo" cssClass="form-control" />
			                   		<span class="input-group-addon">
									      #
				                   	</span>
			                   	</div>  
	                        </div>
                        </div>	
                  </div>
                <%--   <div class="row space5">
                    
                  	<div class="col-sm-6 fixed-form-control">	                             	         
	                        <div class="checkbox">
	                        	<label class="col-sm-3 control-label" style="font-weight:bold">Status:</label>	                        	    	                        
	                        	<label class="col-sm-3"><form:checkbox path="employee.firstLogin" />First Login</label>	                        	
	                        </div>
                        </div>
                  </div>     --%>
                  <div class="row space5">
                  <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                  <div class="form-group col-sm-1 btNotFixed" >
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
            	  </form:form>                                         
    			</div><!-- /form-panel -->
<script type="text/javascript">
$(document).ready(function(){	
	$("input[name='employee.maxAttempNo']").val(3);
});
var x = 3; //or whatever offset
var CurrentDate = new Date();
CurrentDate.setMonth(CurrentDate.getMonth() + x);
$( "input[name='employee.pwdExpiredDate']" ).val(pad(CurrentDate.getDate())+"/"+(pad(CurrentDate.getMonth()+1))+"/"+CurrentDate.getFullYear());
$('.date').datepicker({		    
	autoclose: true,
    todayHighlight: true,
    format: "dd/mm/yyyy"
});
function pad(n) {
    return (n < 10) ? ("0" + n) : n;
}
</script>


