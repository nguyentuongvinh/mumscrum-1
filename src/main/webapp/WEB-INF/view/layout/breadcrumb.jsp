<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>	
<div>
<ol class="breadcrumb">
	<i class="fa fa-angle-right"></i>
	<c:forEach var="entry" items="${sessionScope.currentBreadCrumb}">
		<c:choose>
			<c:when test="${entry.currentPage == true}">
				<li>${entry.label}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${entry.url}">${entry.label}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ol>
</div>