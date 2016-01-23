<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
		<fmt:setBundle basename="version" />  
		<fmt:message var="version" key="version" /> 
      <section id="main-content">
          <section id="welcomeText" class="wrapper" style="min-height:460px; ">
               
          </section>
      </section>
  
<script>
var height=screen.height;
var height1=$('#welcomeText').height();
$('#welcomeText').css({ paddingTop : (height -70-(height1/2)) / 2  + 'px' });
$('#welcomeText').css({ minHeight : height / 2  + 'px' });

</script>