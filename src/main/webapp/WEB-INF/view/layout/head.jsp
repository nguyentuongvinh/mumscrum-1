	<%@ include file="../layout/taglib.jsp" %>
	<%-- <%@ taglib prefix="dandelion" uri="http://github.com/dandelion" %> --%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<c:choose>
	  <c:when test="${sessionScope.desktopmode=='true'}">
	    <meta name="viewport" content="width=1024">
	  </c:when>	  
	  <c:otherwise>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	  </c:otherwise>
	</c:choose>
    
    
    <meta name="description" content="">
    <meta name="author" content="PCLA">
    <meta name="keyword" content="PruQuote PCLA Prudential">
    
	<%-- <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon"> --%>
	<link href="data:image/x-icon;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQEAYAAABPYyMiAAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAAAF0lEQVRIx2NgGAWjYBSMglEwCkbBSAcACBAAAeaR9cIAAAAASUVORK5CYII=" rel="icon" type="image/x-icon" />
    <!-- Bootstrap core CSS -->        
	<link href="<c:url value="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />" rel="stylesheet">
	
	<spring:url value="/resources/js/modernizr-2.6.2.js" var="modernizr"/>
	<script src="${modernizr}" type="text/javascript"></script>
	
	<spring:url value="/resources/jquery/jquery-1.11.2.min.js" var="jQuery"/>
	<script src="${jQuery}" type="text/javascript"></script>

	<spring:url value="/webjars/bootstrap/3.2.0/js/bootstrap.min.js" var="bootstrapJS"/>
	<script src="${bootstrapJS}" type="text/javascript"></script>  
    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <%-- <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" /> --%>
    <%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/zabuto_calendar.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/gritter/css/jquery.gritter.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/lineicons/style.css"/>"    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/bootstrap-datepicker/css/datepicker.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/bootstrap-daterangepicker/daterangepicker.css"/>" />--%> 
       
	<!-- jquery validator -->
	<spring:url value="/webjars/jquery-validation/1.13.0/jquery.validate.js" var="jQueryValidate"/>
	<script src="${jQueryValidate}" type="text/javascript"></script>
	
	<!-- select2 -->
	<spring:url value="/webjars/select2/3.5.1/select2.css" var="select2Css"/>
	<link href="${select2Css}" rel="stylesheet" type="text/css"></link>
	<spring:url value="/webjars/select2-bootstrap-css/1.3.1/select2-bootstrap.css" var="select2BootstrapCss"/>
	<link href="${select2BootstrapCss}" rel="stylesheet" type="text/css"></link>
	<spring:url value="/webjars/select2/3.5.1/select2.js" var="select2JS"/>
	<script src="${select2JS}" type="text/javascript"></script>
	
	<!-- bootstrap-session-timeout -->
	<c:url value="/resources/bootstrap-session-timeout/bootstrap-session-timeout.js" var="bootstrapSessionTimeout"/>
	<script src="${bootstrapSessionTimeout}" type="text/javascript"></script>
	
	<!-- Datetimepicker -->
	<link href="<c:url value="/resources/datetime/css/datepicker.css"/>" rel="stylesheet" media="screen">
	<script type="text/javascript" src="<c:url value="/resources/datetime/js/bootstrap-datepicker.js"/>" charset="UTF-8"></script>
    <!-- Eonasdan-bootstrap-datetimepicker   -->
    <link href="<c:url value="/webjars/Eonasdan-bootstrap-datetimepicker/3.1.3-1/bootstrap-datetimepicker.css"/>" rel="stylesheet" media="screen">
    <script type="text/javascript" src="<c:url value="/webjars/momentjs/2.8.3/min/moment.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/webjars/Eonasdan-bootstrap-datetimepicker/3.1.3-1/bootstrap-datetimepicker.min.js"/>" charset="UTF-8"></script>
		
	 <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">    
    
    <!-- ChartJS -->
    <c:url value="/resources/chartjs/Chart.js" var="ChartJS"/>
	<script src="${ChartJS}" type="text/javascript"></script>
    <%-- <link href="<c:url value="/resources/css/style-responsive.css"/>" rel="stylesheet"> --%>
	<%-- <dandelion:bundle includes="pruquote"/> --%>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<c:url value="/resources/html5shiv/src/html5shiv.js" />"></script>
      <script src="<c:url value="/resources/Respond-master/src/respond.js" />"></script>
    <![endif]-->
    
    <!-- jquery datatables --> 
 	<link href="<c:url value="/resources/jquery_datatables/css/jquery.dataTables.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/jquery_datatables/css/dataTables.colVis.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/TableTools/css/dataTables.tableTools.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/jquery_datatables/css/dataTables.bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/jquery_datatables/css/responsive.dataTables.min.css" />" rel="stylesheet">              
   	<script type="text/javascript" src="<c:url value="/resources/jquery_datatables/js/jquery.dataTables.js"/>" charset="UTF-8"></script>
   	<script type="text/javascript" src="<c:url value="/resources/jquery_datatables/js/dataTables.colVis.js"/>" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value="/resources/TableTools/js/dataTables.tableTools.js"/>" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery_datatables/js/dataTables.bootstrap.js"/>" charset="UTF-8"></script>                                            
    <script type="text/javascript" src="<c:url value="/resources/jquery_datatables/js/dataTables.responsive.min.js"/>" charset="UTF-8"></script>
    
	
	

  	

	