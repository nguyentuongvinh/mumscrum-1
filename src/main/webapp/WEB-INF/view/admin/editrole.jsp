<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>			
          			<div class="content-panel">
                  	  <%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
                  	  <hr/>                     	        
                  	           
                  	  <ul id="RoleTab" class="nav nav-tabs" >
					        <li class="active"><a data-toggle="tab" href="#tabroleDetail">Role Detail</a></li>
					        <li><a data-toggle="tab" href="#tabrolePermission">Role Permission</a></li>					        
					  </ul>
    				  <div class="tab-content">
	        			<div id="tabroleDetail" class="tab-pane fade in active" style="padding-top:20px">     	        			
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
	                        	<div class="col-sm-6 form-group fixed-form-control">
	                        		<label for="status" class="col-sm-3 control-label">Status:</label>    
		                        	<div class="col-sm-9">
		                        		<form:select path="status" cssClass="form-control select2combo">
		                        			<form:option value="1" label="Enable"/>
		                        			<form:option value="0" label="Disable"/>
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
                  	  	<div id="tabrolePermission" class="tab-pane fade" style="padding-top:20px">
                  	  		<c:url value="/role/${roleId}/edit/rolepermission" var="rolePermissionAction" />
                  	  		<form:form commandName="rolePermission" action="${rolePermissionAction}" >
                  	  			<div class="row space5">
	                  	  			<div class="col-sm-6 form-group fixed-form-control">                  	  			
		                  	  				<label for="permission.permissionId" class="col-sm-4 control-label">Add Permission:</label>
		                  	  				<div class="col-sm-8">
			                  	  				<form:select path="permission.permissionId" items="${permissions}" itemValue="permissionId" itemLabel="permissionName" cssClass="form-control select2combo" />
			                  	  			</div>
		                  	  		</div>
		                  	  		<div class="form-group col-sm-1" >
							  		<button  type="submit" class="btn btn-danger">Add</button>
							 		</div>
	                  	  		</div>
	                  	  			                  	  		
                  	  		</form:form>
                  	  		<%--  <c:set var="id" value="${1}"/>
                        
	                         <datatables:table id="rolePermissionTable" data="${rolePermissions}" row="rolePermission" theme="bootstrap3" ext="bootstrap3-responsive" cssClass="table table-striped table-advance table-hover">
							   <datatables:column title="#" data-class="expand"><c:out value="${id}"/></datatables:column>
							   <c:set var="id" value="${id+1}"/>
							   <datatables:column title="Permission Id"><c:out value="${rolePermission.permission.permissionId}"/></datatables:column>
							   <datatables:column title="Permission Name"><c:out value="${rolePermission.permission.permissionName}"/></datatables:column>
							   <datatables:column title="Permission Description" data-hide="phone,tablet"><c:out value="${rolePermission.permission.permissionDesc}"/></datatables:column>
							   <datatables:column title="Controller" data-hide="phone,tablet"><c:out value="${rolePermission.permission.controller}"/></datatables:column>
							   <datatables:column title="Path" data-hide="phone,tablet"><c:out value="${rolePermission.permission.path}"/></datatables:column>
							   
							   <datatables:column title="Action" data-hide="phone,tablet"><button value="${rolePermission.rolePermissionId}" class="btnRemoveRolePermission btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button></datatables:column>
							</datatables:table> --%>
                  	  	<table id="rolepermission_grid" class="table table-striped table-advance table-hover"> <!-- style="border:1px solid #ccc;" -->                            
	              	  	  <thead>
	                           <tr>                          	  
								  <th>#</th>
	                          	  <th>Permission Id</th>
	                          	  <th>Permission Name</th>
	                          	  <th>Permission Description</th>                          	  
	                              <th>Controller</th>
	                              <th>Path</th>
								  <th>Action</th>
	                           </tr>
	                      </thead>
	                         <c:set var="id" value="${1}"/>
	                         <tbody>
	                          <c:forEach items="${rolePermissions}" var="rolePermission">
				   			 <tr> 
	                          	 <td>${id}</td>
	                          <c:set var="id" value="${id+1}"/>
	                          <td><c:out value="${rolePermission.permission.permissionId}" /></td>
	                          <td><c:out value="${rolePermission.permission.permissionName}" /></td>
	                          <td><c:out value="${rolePermission.permission.permissionDesc}" /></td>
				     		  <td><c:out value="${rolePermission.permission.controller}" /></td>
				     		  <td><c:out value="${rolePermission.permission.path}" /></td>
	                             <td>
	                                  <button value="${rolePermission.rolePermissionId}" class="btnRemoveRolePermission btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button>
	                              </td>
	                          </tr>
	                          </c:forEach>
	                        </tbody>
	                     </table>    
                  	  	</div> <!-- end Role Permission -->
                  	  </div> <!-- end tab content -->                                  
          			</div><!-- /form-panel -->
          		
    <script type="text/javascript">
	 // store the currently selected tab in the hash value
	    $("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
	        var id = $(e.target).attr("href").substr(1);	        
	        window.location.hash = id;	        
	        $('html,body').scrollTop(0);
	    });
	
	    // on load of the page: switch to the currently selected tab
	    var hash = window.location.hash;
	    $('#RoleTab a[href="' + hash + '"]').tab('show');
    	$(document).ready(function() {   
    		$('#rolepermission_grid').dataTable({
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
        	  $(document).ajaxSend(function(e, xhr, options) {
        	    xhr.setRequestHeader(header, token);
        	  });
        	$(".btnRemoveRolePermission").click(function(){			
            	var rolePermissionId=$(this).val();
            	var data={"${_csrf.parameterName}" :"${_csrf.token}" };
            	<c:url value="/role/${roleId}/remove/rolepermission/" var="url"/>	
        		$.post( "${url}"+rolePermissionId, function() {
        			  location.reload();
        		});
				
			}); 
    	});
    </script>
    