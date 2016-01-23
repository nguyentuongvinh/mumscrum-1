<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<header class="header">
				<div id="menu-toggle" class="btMenu" >
					<i class="fa fa-bars"></i>
				</div>
				<!-- <a href="#" class="header-logo">MUMScrum</a> -->
				<div class="dropdown-slide-animate">
					<div class="dropdown navbar-right">
					  	<a data-toggle="dropdown" href="#">
					  		<span class="imgProfile"><i class="fa fa-user"></i></span>
					  		<span class="name" style="text-transform: capitalize">${pageContext.request.userPrincipal.name} </span> &nbsp;<i class="fa fa-angle-down"></i>
					  	</a>
					  	<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
					   	 	<li><a href="#"><i class="fa fa-credit-card"></i> <span>Profile</span></a></li>
					   	 	<li><a href="<c:url value="/changepwd"/>"><i class="fa fa-cogs"></i> <span>Change Password</span></a></li>				   	 	
					   	 	<li class="divider"></li>
					   	 	<li>
					   	 	<c:url value="/logout" var="logoutUrl" />
							<form action="${logoutUrl}" method="post" id="logoutForm">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
							<script>
								function formSubmit() {
									document.getElementById("logoutForm").submit();
								}
							</script>
					
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<a href="javascript:formSubmit()"><i class="fa fa-sign-out"></i> <span>Log Out</span></a>
							</c:if>					   	 	
					   	 	</li>
					  	</ul>
					</div>
				</div>
		</header>