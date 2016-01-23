<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="sidebar-nav">			
			<div class="logo">
				<a href="<c:url value="/"/>">					
					<h4 class="titleLogo" style="margin-top:-10px; padding-top:5px;">
						<b style="color:white;font-size:20px;">MUM</b><i style="text-transform: lowercase; font-size:24px;">scrum</i>
					</h4>
				</a>
			</div>
            <div class="panel-group" id="accordion">
					<!-- user profile -->
					<div class="panel panel-default" id="userSetting" >
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseUser" class="${tab=='user'?'':'collapsed'}">
									<i class="fa fa-user"></i> <span class="menuTitle" style="padding-left:5px;text-transform: capitalize">${pageContext.request.userPrincipal.name}</span>
								</a>
							</h4>
						</div>
						<div id="collapseUser" class="panel-collapse collapse ${tab=='user'?'in':''}">
							<div class="panel-body">
								<ul class="submenu">
									<li class="${current=='profile'?'active':''}" >
										<a href="#user" data-toggle="tab">Profile</a>
									</li>
									<li class=${current=='changepwd'?'active':''}>
										<a href="<c:url value="/changepwd"/>">Change Password</a>
									</li>
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
											 <a href="javascript:formSubmit()">Log out</a>
									</c:if>										
									</li>
								</ul>
							</div>
						</div>
					</div>
					<c:set var="tabcount" value="0"/>
					<!-- administrator -->
					<sec:authorize access="hasAnyRole('HRAdmin')">
					<c:set var="tabcount" value="${tabcount+1}"/>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="${tab=='administrator'?'':'collapsed'}">
									<i class="fa fa-users"></i> <span class="menuTitle">Administrator</span>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="tab-indc panel-collapse collapse ${tab=='administrator'?'in':''}">
							<div class="panel-body">
								<ul class="submenu">
									<sec:authorize access="hasAnyRole('HRAdmin')">
									<li class="${current=='user'?'active':''}" >
										<a href="<c:url value="/employee"/>" >Employee Management</a>
									</li>
									</sec:authorize>
									<sec:authorize access="hasRole('ACCESS_ROLE')">
									<li class="${current=='role'?'active':''}">
										<a href="<c:url value="/role"/>">Role Management</a>
									</li>
									</sec:authorize>
									<sec:authorize access="hasRole('ACCESS_PERMISSION')">
									<li class="${current=='permission'?'active':''}">
										<a href="<c:url value="/permission"/>">Permission Management</a>
									</li>
									</sec:authorize>
									<sec:authorize access="hasRole('ACCESS_LOG')">
									<li class="${current=='log'?'active':''}">
										<a href="<c:url value="/log"/>">Log Management</a>
									</li>
									</sec:authorize>
								</ul>
							</div>
						</div>
					</div>
					</sec:authorize> 
					
					<!-- Quote -->
					<sec:authorize access="hasAnyRole('Tester')">
					<c:set var="tabcount" value="${tabcount+1}"/>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseQuote" class="${tab=='quote'?'':'collapsed'}">
									<i class="fa fa-area-chart"></i> <span class="menuTitle">Tester</span>
								</a>
							</h4>
						</div>
						<div id="collapseQuote" class="tab-indc panel-collapse collapse ${tab=='quote'?'in':''}">
							<div class="panel-body">
								<ul class="submenu">
									<sec:authorize access="hasRole('ACCESS_PRUMYFAMILY')">
									<li class="${current=='prumyfamily'?'active':''}" >
										<a href="<c:url value="/prumyfamily"/>">PruMyFamily</a>
									</li>
									</sec:authorize>
									<sec:authorize access="hasRole('ACCESS_EDUSAVE')">
									<li class="${current=='eduSave'?'active':''}" >
										<a href="<c:url value="/edusave"/>">EduSave</a>
									</li>									
									</sec:authorize>
								</ul>
							</div>
						</div>
					</div>
					</sec:authorize>
					
					<!-- param setup -->
					<sec:authorize access="hasRole('ACCESS_TABLESETUP')">
					<c:set var="tabcount" value="${tabcount+1}"/>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseParam" class="${tab=='param'?'':'collapsed'}">
									<i class="fa fa-cogs"></i> <span class="menuTitle">Param Setup</span>
								</a>
							</h4>
						</div>
						<div id="collapseParam" class="tab-indc panel-collapse collapse ${tab=='param'?'in':''}">
							<div class="panel-body">
								<ul class="submenu">
									<li class="${current=='tablesetup'?'active':''}" >
										<a href="<c:url value="/tablesetup"/>">Table Setup</a>
									</li>									
								</ul>
							</div>
						</div>
					</div>
					</sec:authorize>
					
					<!-- Statistic -->
					<sec:authorize access="hasRole('ACCESS_LOG')">
					<c:set var="tabcount" value="${tabcount+1}"/>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseStatistic" class="${tab=='statistic'?'':'collapsed'}">
									<i class="fa fa-bar-chart"></i> <span class="menuTitle">Statistic</span>
								</a>
							</h4>
						</div>
						<div id="collapseStatistic" class="tab-indc panel-collapse collapse ${tab=='statistic'?'in':''}">
							<div class="panel-body">
								<ul class="submenu">
									<li class="${current=='graphlogcount'?'active':''}" >
										<a href="<c:url value="/statistic/graphlogcount"/>">Log Count Graph</a>
									</li>
									<li class="${current=='logcount'?'active':''}" >
										<a href="<c:url value="/statistic/logcount"/>">Log Count</a>
									</li>								
								</ul>
							</div>
						</div>						
					</div>
					</sec:authorize>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title" id="panel-desktop-mode">
								<!-- <a href="#">
									<i class="fa fa-desktop"></i> <span class="menuTitle">Desktop Mode</span>
								</a> -->
							</h4>
						</div>						
					</div>
				</div>
			</div>
			
			<script>
			$(function() {
				if('${tabcount}'==0){
					alert("There's no function for you to access in this environment!");
				}
				if('${tabcount}'==1){
					$('.tab-indc').addClass('in');
				}
			});
			</script>