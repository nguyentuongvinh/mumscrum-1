<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
          			<div class="content-panel">
                  	  <%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
                  	  <hr/>            
                  	  <ul class="nav nav-tabs">
					        <li class="active"><a data-toggle="tab" href="#roleDetail">Role Detail</a></li>
					       					        
					  </ul>
    				<div class="tab-content">
	        			<div id="roleDetail" class="tab-pane fade in active" style="padding-top:20px">     	        			
	                  	  <form:form commandName="role">
	                  	  <c:if test="${errors != null}">
	                   	   <div class="alert alert-warning" role="alert">
	                   	   <%-- <c:out value="${errors[0].defaultMessage}" /> --%> 
	                   	   <c:forEach items="${errors}" var="error">
							    <%-- do want you want with ${error} --%>
							    <div><c:out value="${error.defaultMessage}" /></div>
							</c:forEach> 
							</div>
						 	</c:if>
	                  	  	<%-- <form:errors path="*" /> --%>   
	                  	  	<div class="row space5">               	  	
		                  	  	<div class="col-sm-6 form-group fixed-form-control">			                        
		                        	<label for="userId" class="col-sm-3 control-label">Role ID:</label>    
		                        	<div class="col-sm-9">
		                        		<form:input readonly="true" path="roleId" cssClass="form-control" htmlEscape="true"/>
		                        	</div>  			                        
		                        </div> 
		                        <div class="col-sm-6 form-group fixed-form-control">
		                        	<label for="fullName" class="col-sm-3 control-label">Role Name:<span class="required-mark">*</span></label>    
		                        	<div class="col-sm-9 input-group">
		                        		<form:input path="roleName" cssClass="form-control" htmlEscape="true"/>
		                        		<span class="input-group-addon">
									      <i class="fa fa-text-width"></i>
				                   		</span>
		                        	</div>  
		                        </div>	
	                        </div>
	                        
	                        <div class="row space5">
		                        <div class="col-sm-6 form-group fixed-form-control">
		                        	<label for="username" class="col-sm-3 control-label">Description:</label>    
		                        	<div class="col-sm-9 input-group">
		                        		<form:input path="roleDesc" cssClass="form-control"/>
		                        		<span class="input-group-addon">
									      <i class="fa fa-text-width"></i>
				                   		</span>	                        		
		                        	</div>  
		                        </div>  
		                        
		                        <div class="col-sm-6 form-group fixed-form-control">
	                        	<label for="status" class="col-sm-3 control-label">Role LV:</label>    
	                        	<div class="col-sm-9">
	                        		<form:select path="roleLV" cssClass="form-control select2combo">
	                        			<form:option value="1" label="Low"/>
	                        			<form:option value="2" label="Medium"/>
	                        			<form:option value="3" label="High"/>
                        			</form:select>	                        		
	                        	</div>  
	                        	</div>   
	                        	    
	                        </div>                 
	                        
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
                  	  	</div> <!--  end Role detail -->
                  	  	
                  	  </div> <!-- end tab content -->                                  
          			</div><!-- /form-panel -->          		    


