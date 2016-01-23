<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>			
                 <div class="content-panel" >
                 	<div class="row">
                  	<div class="col-sm-6">
                  		<%@ include file="/WEB-INF/view/layout/breadcrumb.jsp" %>
                  	</div> 
                  	<div class="col-sm-6">              	
                  		<button type="submit" class="pull-right btn btn-danger" onClick="window.location.href='newemployee'">New Employee</button>
                  	</div>
                 	</div>
                 	<hr>
                 	                     
                    <table id="user_grid" class="table table-striped table-advance table-hover"> <!-- style="border:1px solid #ccc;" -->                            
              	  	  <thead>
                           <tr>
                          	  <!-- <th class="none">#</th>
                          	  <th class="none">User ID</th>
                          	  <th class="all">User Name</th>
                          	  <th class="min-tablet">Full Name</th>                          	  
                          	  <th class="min-tablet">Gender</th>
                          	  <th class="min-tablet">E-Mail</th>
                          	  <th class="min-tablet">Role</th>
                              <th class="min-tablet">Status</th>
							  <th class="min-tablet">Action</th> -->
							  <th>#</th>
                          	  <th>User ID</th>
                          	  <th>User Name</th>
                          	  <th>Full Name</th>                          	  
                          	  <th>Gender</th>
                          	  <th>E-Mail</th>
                          	  <th>Role</th>
                              <th>Status</th>
							  <th>Action</th>
                           </tr>
                      </thead>
                         <c:set var="id" value="${1}"/>
                         <tbody>
                          <c:forEach items="${users}" var="user">
			   			 <tr> 
                          	 <td>${id}</td>
                          	 <c:set var="id" value="${id+1}"/>
                          <td><c:out value="${user.userId}" /></td>
                          <td><c:out value="${user.username}" /></td>
                          <td><c:out value="${user.fullName}" /></td>
                          <td><c:out value="${user.gender}" /></td>
                          <td><c:out value="${user.email}" /></td>
                          <td><c:out value="${user.locked}" /></td>
			     		  <td><c:out value="${user.enabled eq true?'Enable':'Disable'}" /></td>
                             <td>
                                  <a href="<c:url value="/employee/${user.username}/edit"/>" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                              </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                     </table>                         
  				</div><!-- /content-panel -->     
 <script>
	$(document).ready(function(){	
		$('#user_grid').dataTable({
	//        "data": data,
	/* "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false, */
        	/* responsive: true, */
			stateSave: true,
	        dom: 'TC<"clearfix">lfrtip',
	        columnDefs: [
	            { visible: false, targets: [0,1] }
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
