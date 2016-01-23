<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="MUM">
    <meta name="keyword" content="MUM">
	<link href="data:image/x-icon;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQEAYAAABPYyMiAAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAAAF0lEQVRIx2NgGAWjYBSMglEwCkbBSAcACBAAAeaR9cIAAAAASUVORK5CYII=" rel="icon" type="image/x-icon" />
	<title>Login Page</title>
 	<link href="<c:url value="${rootURL}webjars/bootstrap/3.2.0/css/bootstrap.min.css" />" rel="stylesheet">
    <!--external css-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="${rootURL}resources/css/style.css"/>" rel="stylesheet"> 
 <%              
  response.setHeader("pragma", "no-cache");              
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
  response.setHeader("Expires", "0");  
%>    

</head>
<body onload='document.loginForm.username.focus();'>
    <div id="login-page">
	  	<div class="container" style="margin-top:50px;">
	  		  <fmt:setBundle basename="version" />  
		      <fmt:message var="version" key="version" /> 
			  
			  <form class="form-login" name='loginForm'   action="<c:url value='/login' />" method='POST' autocomplete="off">
		        <h2 class="form-login-heading" style="background:#fff2f3;">Sign in to <SPAN style="color:#EE1B2E;font-size:20px;"><b>MUM</b></SPAN><i style="text-transform: lowercase; font-size:25px;">Scrum</i> V${version}</h2>
		      
		        <div class="login-wrap">
		            <input type="text" name='username' class="form-control" placeholder="User ID" autocomplete="off" autofocus>
		            <br>
		            <input type="password" name='password' class="form-control" placeholder="Password" autocomplete="off">
		            <label class="checkbox">
		            	<span class="pull-left">
		            		<c:if test="${not empty error}">
							  <div class="text-danger">${error}</div>
							  </c:if>
							  <c:if test="${not empty msg}">
							  <div class="text-success">${msg}</div>
							  </c:if>
							  <c:if test="${not empty expire}">
							 <div class="text-danger">${expire}</div>
							 </c:if>
		            	</span>
		                <!-- <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Forgot credential?</a>		
		                </span> -->
		            </label>
		           
		            <button class="btn btn-danger btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		            <br/>
		             
		            <p class="text-muted">© 2016 MUMScrum All Rights Reserved. </p>
		         </div>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Forgot Password ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Enter your e-mail address below to reset your password.</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-danger" type="button">Cancel</button>
		                          <button class="btn btn-theme" type="button">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
				  <!-- <div class="footerlogin">
			      <div class="container">
			        <p class="text-muted">© 2016 MUMSCrum All Rights Reserved.</p>
			      </div>
		    	  </div> -->
		      </form>
			  
	  	
	  	</div>
	  	 
	  </div>
	 
	<spring:url value="resources/jquery/jquery-1.11.2.min.js" var="jQuery"/>
	<script src="${jQuery}" type="text/javascript"></script>

	<spring:url value="${rootURL}webjars/bootstrap/3.2.0/js/bootstrap.min.js" var="bootstrapJS"/>
	<script src="${bootstrapJS}" type="text/javascript"></script>  
	<!-- bootstrap-session-timeout -->
	<c:url value="${rootURL}resources/bootstrap-session-timeout/bootstrap-session-timeout.js" var="bootstrapSessionTimeout"/>
	<script src="${bootstrapSessionTimeout}" type="text/javascript"></script>
	
	<!--[if lt IE 9]>
      <script src="<c:url value="/resources/html5shiv/src/html5shiv.js" />"></script>
      <script src="<c:url value="/resources/Respond-master/src/respond.js" />"></script>
    <![endif]-->
	
<script>
$( document ).ready(function() {
	 var token = $("meta[name='_csrf']").attr("content");
	 var header = $("meta[name='_csrf_header']").attr("content");
	  $(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	  });
	$.sessionTimeout({
	    message: 'Your session will be locked in one minute.',
	    keepAliveUrl: "<c:url value='/keep-alive'/>",	    
	    redirUrl: "<c:url value='/login?expired'/>",	   
	    onWarn: function(){
	        //alert('Warning!');
	    },
	    /*onRedir: function(){
	        alert('Your session has expired!');
	    },*/
	    ignoreUserActivity:true,
	    warnAfter: 840000,    //14 min
	    redirAfter: 900000  //15 min
	});
});
$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        window.location.reload() 
    }
});
</script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <!-- <script type="text/javascript" src="resources/js/jquery.backstretch.min.js"></script> -->
</body>
</html>