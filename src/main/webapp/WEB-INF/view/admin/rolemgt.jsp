<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
                      <div class="content-panel">
                      	<div class="row">
	                      	<div class="col-sm-6">
	                      		<%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
	                      	</div> 
	                      	<div class="col-sm-6">              	
	                      		<button type="submit" class="pull-right btn btn-danger" onClick="window.location.href='newrole'">New Role</button>
	                      	</div>
                      	</div>                      	
                      	<hr>
                     <table id="role_grid" class="table table-striped table-advance table-hover"> <!-- style="border:1px solid #ccc;" -->                            
              	  	  <thead>
                           <tr>                          	  
							  <th>#</th>
                          	  <th>Role Id</th>
                          	  <th>Role Name</th>
                          	  <th>Role Description</th>                          	  
                          	  <th>Role LV</th>                          	 
                              <th>Status</th>
							  <th>Action</th>
                           </tr>
                      </thead>
                         <c:set var="id" value="${1}"/>
                         <tbody>
                          <c:forEach items="${roles}" var="role">
			   			 <tr> 
                          	 <td>${id}</td>
                          <c:set var="id" value="${id+1}"/>
                          <td><c:out value="${role.roleId}" /></td>
                          <td><c:out value="${role.roleName}" /></td>
                          <td><c:out value="${role.roleDesc}" /></td>
                          <td><c:out value="${role.roleLV eq 1?'Low':(role.roleLV eq 2 ?'Medium':'High')}" /></td>
			     		  <td><c:out value="${role.status eq 1?'Enable':'Disable'}" /></td>
                             <td>
                                  <a href="<c:url value="/role/${role.roleId}/edit"/>" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                              </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                     </table>                                                       
                         <%-- <c:set var="id" value="${1}"/>                        
                         <datatables:table id="roleTable" data="${roles}" row="role" theme="bootstrap3" ext="bootstrap3-responsive" cssClass="table table-striped table-advance table-hover">
						   <datatables:column title="#" data-class="expand"><c:out value="${id}"/></datatables:column>
						   <c:set var="id" value="${id+1}"/>
						   <datatables:column title="Role Id"><c:out value="${role.roleId}"/></datatables:column>
						   <datatables:column title="Role Name"><c:out value="${role.roleName}"/></datatables:column>
						   <datatables:column title="Role Description" data-hide="phone,tablet"><c:out value="${role.roleDesc}"/></datatables:column>
						   <datatables:column title="Role LV" data-hide="phone,tablet"><c:out value="${role.roleLV eq 1?'Low':(role.roleLV eq 2 ?'Medium':'High')}" /></datatables:column>						   
						   <datatables:column title="Status" data-hide="phone,tablet"><c:out value="${role.status eq 1?'Enable':'Disable'}" /></datatables:column>
						   <c:url value="/role/${role.roleId}/edit" var="url"/>
						   <datatables:column title="Action" data-hide="phone,tablet"><a href="${fn:escapeXml(url)}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a></datatables:column>
						</datatables:table> --%>
                      </div><!-- /content-panel -->
                      
                      
<script>
	$(document).ready(function(){	
		$('#role_grid').dataTable({
	//        "data": data,
	/* "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false, */
        	/* responsive: true, */
			stateSave: true,
	        dom: 'TC<"clearfix">lfrtip',
	        columnDefs: [
	            { visible: false, targets: [0,3] }
	        ],
	        tableTools: {
	            "aButtons": ["copy", "csv", "pdf"],
	            "sSwfPath": "<c:url value="/resources/TableTools/swf/copy_csv_xls_pdf.swf"/>"
	        },
	        "fnDrawCallback": function (oSettings, json) {
	            //showLoading(false);
	        }
	       
	    });
		
	});

	  
	</script>                      