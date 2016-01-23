	<%@ include file="/WEB-INF/view/layout/taglib.jsp" %>
	$(function() {
			if(typeof String.prototype.trim !== 'function') {
			  String.prototype.trim = function() {
			    return this.replace(/^\s+|\s+$/g, ''); 
			  }
			}
			
			<sec:authorize access="hasRole('ACCESS_UNLIMITED_RIDER')" var="isUnlimitedRider">
			</sec:authorize>
			
			<sec:authorize access="hasRole('ACCESS_UNLIMITED_SA')" var="isUnlimitedSA">
			</sec:authorize>
						
			//alert("${isUnlimitedRider}");
			// SA and MB auto calulation
					
			if($('#basicPlanSa').val()!=""){				
				getMBBySA();
			}
			
			$('#basicPlanSa').change(function(){	
				if($('#basicPlanSa').val()!=""){
					var fixed=parseFloat($('#basicPlanSa').val()).toFixed();	
		            fixed=Math.round(fixed / 10) * 10;
		            $('#basicPlanSa').val(fixed);
				}				            		                					
				getMBBySA();						
			});
			$('#MB').change(function(){	
				if($('#MB').val()!=""){								
					getSAByMB();		
				}				
				else{
					$('#basicPlanSa').val(0);
				}
			}); 					
					
			// End SA and MB auto calulation
			 var currentDate = new Date();
			$('#commDate').datetimepicker({
				useCurrent: true,
			    pickTime: false,
			    defaultDate:currentDate
		    });
			//$('#commDate').datetimepicker("setDate",currentDate);
			$('#la1dateOfBirth').datetimepicker({
				useCurrent: false,
		        pickTime: false,
		        viewMode:'years'
		    });
			$('#syndate').datepicker({
				autoclose: true,
			    todayHighlight: true,
			    format: "dd/mm/yyyy"
			 });
			$("#syndate").datepicker("setDate", currentDate);
			$('#la2dateOfBirth').datetimepicker({
				useCurrent: false,
		        pickTime: false,
		        viewMode:'years'
		    });
			var LAPO=$("#coLa1relationship option:selected").text();
			if (LAPO.trim()==="PO = LA")
				 {
				 document.getElementById("poName").readOnly=true;
				 }
			 else
				 {
				 document.getElementById("poName").readOnly=false;
				 }
			 var coPremiumTerm = document.getElementById("coPremiumTerm");
			 coPremiumTerm.remove(coPremiumTerm.length-1);
			 	 
			 document.getElementById("l1Rtr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l1Rsr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l2Rtr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l2Rsr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l1Rtr2Term").value = $("#coPremiumTerm option:selected").text();
			 
		  });
		
		 $('#coPremiumTerm').change(function(){
			 document.getElementById("l1Rtr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l1Rsr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l2Rtr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l2Rsr1Term").value = $("#coPremiumTerm option:selected").text();
			 document.getElementById("l1Rtr2Term").value = $("#coPremiumTerm option:selected").text();
		 });
		 $('#coL1Rtr1').change(function(){
			 var l1Rtr1YN = "";
			 var SA=0;
			 var la1name=""
			 var la1dateOfBirth="";
			 l1Rtr1YN= $("#coL1Rtr1 option:selected").text();
			 SA=document.getElementById("basicPlanSa").value;
			 la1name=document.getElementById("la1name").value;
			 la1dateOfBirth=document.getElementById("la1dateOfBirth").value;
			 if(l1Rtr1YN==="Yes")
			 { 
				 //if(SA>=2000) {	
				 		document.getElementById("l1Rtr1").value =1000;				 		
				 //	}else{
				 		if(la1name===""){
				 			document.getElementById("la1name").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL1Rtr1").selectedIndex  = "Yes";
				 			document.getElementById("l1Rtr1").value =0;
				 			Err.innerHTML = "Input the mandatory field -LA1Name";
				 		}else{
				 			document.getElementById("la1name").style.background = "white";
				 		}
				 		if(la1dateOfBirth===""){
				 			document.getElementById("la1dateOfBirth").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL1Rtr1").selectedIndex  = "Yes";
				 			document.getElementById("l1Rtr1").value =0;
				 			Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field LA1DateOfBirth(It must be between 18 to 50 year-olds)";
				 		}else{
				 			document.getElementById("la1dateOfBirth").style.background = "white";
				 		}
				 		
				 		if(SA>0){
				 			document.getElementById("basicPlanSa").style.background = "white";
				 		}else {
				 			document.getElementById("basicPlanSa").style.background = "yellow";
					 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA >0";
					 		document.getElementById("col1Rtr1").selectedIndex   = "No";
					 		document.getElementById("l1Rtr1").value = 0;
				 		}
				 		if(SA==""){
				 			document.getElementById("basicPlanSa").style.background = "yellow";
					 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA";
					 		document.getElementById("col1Rtr1").selectedIndex   = "No";
					 		document.getElementById("l1Rtr1").value = 0;
				 		}
				 		//document.getElementById("basicPlanSa").style.background = "yellow";
				 		//Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA >=200";
				 		
				 //	}
			 }
			 else {
				 	document.getElementById("l1Rtr1").value =0;
				 	document.getElementById("basicPlanSa").style.background = "white";
				 	document.getElementById("la1dateOfBirth").style.background = "white";
				 	document.getElementById("la1name").style.background = "white";
				 	Err.innerHTML="";
			 } 
		 });
		 $('#coL1Rsr1').change(function(){
			 var l1Rtr1YN = "";
			 var SA=0;
			 var la1name=""
			 var la1dateOfBirth="";
			 l1Rtr1YN= $("#coL1Rsr1 option:selected").text();
			 SA=document.getElementById("basicPlanSa").value;
			 la1name=document.getElementById("la1name").value;
			 la1dateOfBirth=document.getElementById("la1dateOfBirth").value;
			 l1Rsr1YN= $("#coL1Rsr1 option:selected").text();
			 if(l1Rsr1YN==="Yes")
			 	{		
				    //if(SA>=2000) {	
				 			document.getElementById("l1Rsr1").value =(document.getElementById("basicPlanSa").value*10)/100;
				 	//}
				 	//else {
				 		if(la1name===""){
				 			document.getElementById("la1name").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL1Rsr1").selectedIndex  = "Yes";
				 			document.getElementById("l2Rsr1").value =0;
				 			Err.innerHTML = "Input the mandatory field -LA1Name";
				 		}else{
				 			document.getElementById("la1name").style.background = "white";
				 		}
				 		if(la1dateOfBirth===""){
				 			document.getElementById("la1dateOfBirth").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL1Rsr1").selectedIndex  = "Yes";
				 			document.getElementById("l2Rsr1").value =0;
				 			Err.innerHTML =Err.innerHTML+"<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				 		}else{
				 			document.getElementById("la1dateOfBirth").style.background = "white";
				 		}
				 		//document.getElementById("basicPlanSa").style.background = "yellow";
				 		//Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA >=2000";
				 	//}
			 	}
			 else {document.getElementById("l1Rsr1").value =0;} 
		 });
		 $('#coL2Rtr1').change(function(){
			 var l2Rtr1YN = "";
			 var SA=0;
			 var la2name=""
			 var la2dateOfBirth="";
			 l2Rtr1YN= $("#coL2Rtr1 option:selected").text();
			 SA=document.getElementById("basicPlanSa").value;
			 la2name=document.getElementById("la2name").value;
			 la2dateOfBirth=document.getElementById("la2dateOfBirth").value;
			 if(l2Rtr1YN==="Yes")			 
			 { 
			 		document.getElementById("l2Rtr1").value =1000;
			 		if(la2name==="" || la2dateOfBirth==="" || SA===""){
				 		if(la2name===""){
				 			document.getElementById("la2name").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'fast');
				 			document.getElementById("coL2Rtr1").selectedIndex  = "No";
				 			document.getElementById("l2Rtr1").value = 0;
				 			Err.innerHTML = "Input the mandatory field -LA2Name";
				 		}else{
				 			document.getElementById("la2name").style.background = "white";
				 		}
				 		if(la2dateOfBirth===""){
				 			document.getElementById("la2dateOfBirth").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'fast');
				 			document.getElementById("coL2Rtr1").selectedIndex  = "No";
				 			document.getElementById("l2Rtr1").value =0;
				 			Err.innerHTML =Err.innerHTML+"<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				 		}else{
				 			document.getElementById("la2dateOfBirth").style.background = "white";
				 		}
				 		if (SA>0){				 			
					 		document.getElementById("basicPlanSa").style.background = "white";
				 		}else{
					 		document.getElementById("basicPlanSa").style.background = "yellow";
					 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA>0";
					 		document.getElementById("coL2Rtr1").selectedIndex  = "No";
					 		document.getElementById("l2Rtr1").value = 0;
				 		}
				 		if(SA==""){
				 			document.getElementById("basicPlanSa").style.background = "yellow";
					 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA";
					 		document.getElementById("coL2Rtr1").selectedIndex  = "No";
					 		document.getElementById("l2Rtr1").value = 0;
				 		}
				 	}
			 		else { 
			 			document.getElementById("l2Rtr1").value =1000; 
			 			document.getElementById("basicPlanSa").style.background = "white";
					 	document.getElementById("la2dateOfBirth").style.background = "white";
					 	document.getElementById("la2name").style.background = "white";
			 		}
			 }
			 else {
				 	document.getElementById("l2Rtr1").value =0;
				 	document.getElementById("basicPlanSa").style.background = "white";
				 	document.getElementById("la2dateOfBirth").style.background = "white";
				 	document.getElementById("la2name").style.background = "white";
				 	Err.innerHTML="";
			} 
		 });
		 $('#coL2Rsr1').change(function(){
			 var l2Rtr1YN = "";
			 var SA=0;
			 var la2name=""
			 var la2dateOfBirth="";
			 l2Rtr1YN= $("#coL2Rsr1 option:selected").text();
			 SA=document.getElementById("basicPlanSa").value;
			 la2name=document.getElementById("la2name").value;
			 la2dateOfBirth=document.getElementById("la2dateOfBirth").value;
			 l2Rsr1YN= $("#coL2Rsr1 option:selected").text();
			  if(l2Rsr1YN==="Yes")
			 	{		
				    //if(SA>=2000) {	
				 			document.getElementById("l2Rsr1").value =(document.getElementById("basicPlanSa").value*10)/100;				 		
				 	//}
				 	//else {
				 		if(la2name===""){
				 			document.getElementById("la2name").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL2Rsr1").selectedIndex  = "No";
				 			document.getElementById("l2Rsr1").value =0;
				 			Err.innerHTML = "Input the mandatory field -LA2Name";
				 		}else{
				 			document.getElementById("la2name").style.background = "white";
				 		}
				 		if(la2dateOfBirth===""){
				 			document.getElementById("la2dateOfBirth").style.background = "yellow";
				 			$('html, body').animate({ scrollTop: 0 }, 'slow');
				 			document.getElementById("coL2Rsr1").selectedIndex  = "No";
				 			document.getElementById("l2Rsr1").value =0;
				 			Err.innerHTML =Err.innerHTML+"<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				 		}else{
				 			document.getElementById("la2dateOfBirth").style.background = "white";
				 		}
				 		//document.getElementById("basicPlanSa").style.background = "yellow";
				 		//Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA >=2000";
				 		//document.getElementById("coL2Rsr1").selectedIndex  = "No";
				 	//}
			 	}
			 else {document.getElementById("l2Rsr1").value =0;} 
		 });
		
		$('#coL1Rtr2').change(function(){		
			 var l1Rtr2YN = "";
			 var SA=0;
			 var la1name=""
			 var la1dateOfBirth="";
			 l1Rtr2YN= $("#coL1Rtr2 option:selected").text();
			 SA=document.getElementById("basicPlanSa").value;
			 la1name=document.getElementById("la1name").value;
			 la1dateOfBirth=document.getElementById("la1dateOfBirth").value;
			 //alert(l1Rtr2YN);
			 if(l1Rtr2YN==="Yes")
			 { 
			 
			 	if(la1name===""){
		 			document.getElementById("la1name").style.background = "yellow";
		 			$('html, body').animate({ scrollTop: 0 }, 'slow');
		 			document.getElementById("coL1Rtr1").selectedIndex  = "Yes";
		 			document.getElementById("l1Rtr2").value =0;
		 			Err.innerHTML = "Input the mandatory field -LA1Name";
		 		}else{
		 			document.getElementById("la1name").style.background = "white";
		 		}
		 		if(la1dateOfBirth===""){
		 			document.getElementById("la1dateOfBirth").style.background = "yellow";
		 			$('html, body').animate({ scrollTop: 0 }, 'slow');
		 			document.getElementById("coL1Rtr1").selectedIndex  = "Yes";
		 			document.getElementById("l1Rtr2").value =0;
		 			Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field LA1DateOfBirth(It must be between 18 to 50 year-olds)";
		 		}else{
		 			document.getElementById("la1dateOfBirth").style.background = "white";
		 		}
		 		if (SA>0){				 			
			 		document.getElementById("basicPlanSa").style.background = "white";
		 		}else{
			 		document.getElementById("basicPlanSa").style.background = "yellow";
			 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA>0";
			 		document.getElementById("coL1Rtr2").selectedIndex  = "No";
			 		document.getElementById("l1Rtr2").value = 0;
		 		}
		 		if(SA==""){
		 			document.getElementById("basicPlanSa").style.background = "yellow";
			 		Err.innerHTML =Err.innerHTML+"<br/>Input the mandatory field BasicPlan_SA";
			 		document.getElementById("coL1Rtr2").selectedIndex  = "No";
			 		document.getElementById("l1Rtr2").value = 0;
		 		}
			 }
			 else {
				 	document.getElementById("l1Rtr2").value =0;
				 	document.getElementById("basicPlanSa").style.background = "white";
				 	document.getElementById("la1dateOfBirth").style.background = "white";
				 	document.getElementById("la1name").style.background = "white";
				 	Err.innerHTML="";
			 } 
		});
		 $('#coLa1relationship').change(function(){
			 var LAPO=$("#coLa1relationship option:selected").text();
			 
			 if (LAPO.trim()==="PO = LA")
				 {
				 document.getElementById("poName").readOnly=true;
				 document.getElementById("poName").value="";
				 }
			 else
				 {
				 document.getElementById("poName").readOnly=false;
				 document.getElementById("poName").value="";
				 
				 }
		 });
		 
		 $("#la2name,#la1name").keypress(function(event){
			    var ew = event.which;
			    if(ew == 32 || ew==8)
			     {  return true;}
			    else if(ew >=65 && ew <= 90)
			    {	return true;}
			    else if(ew >= 97 && ew <= 122)
			    {  return true;}
			    else{return false;}
			});
		 function Age(monthDob,dayDob,yearDob) {
			 
			}
		function getMBBySA(){
			if($('#basicPlanSa').val()!=""){
				$.ajax({
		            type: "GET",
		            data:{
						SA: $('#basicPlanSa').val(),
						premiumTerm:$('#coPolicyTerm option:selected').text()
			            },
		            url: '<c:url value="/getMBBySA" />',                                    
		            success: function (json) {
		                $('#MB').val(json);
		            }
		        });
			}else{
				$('#MB').val("");
			}
		}
		function getSAByMB(){
			$.ajax({
	            type: "GET",
	            data:{
					MB: $('#MB').val(),
					premiumTerm:$('#coPolicyTerm option:selected').text()
		            },
	            url: '<c:url value="/getSAByMB" />',                                    
	            success: function (json) {
		            var fixed=parseFloat(json).toFixed();	
		            fixed=Math.round(fixed / 10) * 10;				            
	                $('#basicPlanSa').val(fixed);
	                getMBBySA();
	            }
	        });
		}					
		function checkSubmit(){						
				if($('#basicPlanSa').val()=="" && $('#MB').val()!=""){
		    		$.ajax({
			            type: "GET",
			            async: false,
			            data:{
							MB: $('#MB').val(),
							premiumTerm:$('#coPolicyTerm option:selected').text()
				            },
			            url: '<c:url value="/getSAByMB" />',                                    
			            success: function (json) {
				            var fixed=parseFloat(json).toFixed();	
				            fixed=Math.round(fixed / 10) * 10;				            
			                $('#basicPlanSa').val(fixed);				                
			            }
			        });				  			    			    
			    }			
			    return validate();		
		}
			 
			function validate(){
				var clName="";
				var clName2="";
				var SA="";
				var DOB1="";
				var DOB2="";
				Err.innerHTML="";
				var l1Rtr1="";
				var l1Rsr1="";
				var l2Rtr1="";
				var l2Rsr1="";
				var l1Rtr2="";
				var l1Rtr1YN = "";
				var l1Rsr1YN = "";
				var l2Rtr1YN = "";
				var l2Rsr1YN = "";
				var l1Rtr2YN = "";
				var LAPO="";
				var poName="";
				var comDate="";
				var policyTerm="";
				var premuimTerm="";
				
				clName=document.getElementById("la1name").value;
				clName2=document.getElementById("la2name").value;
				SA=document.getElementById("basicPlanSa").value;
				DOB1=document.getElementById("la1dateOfBirth").value;
				DOB2=document.getElementById("la2dateOfBirth").value;
				l1Rtr1=document.getElementById("l1Rtr1").value;
				l1Rsr1=document.getElementById("l1Rsr1").value;
				l2Rtr1=document.getElementById("l2Rtr1").value;
				l2Rsr1=document.getElementById("l2Rsr1").value;
				l1Rtr2=document.getElementById("l1Rtr2").value;
				l1Rtr1YN=$("#coL1Rtr1 option:selected").text();
				l1Rsr1YN=$("#coL1Rsr1 option:selected").text();
				l2Rtr1YN= $("#coL2Rtr1 option:selected").text();
				l2Rsr1YN= $("#coL2Rsr1 option:selected").text();
				l1Rtr2YN= $("#coL1Rtr2 option:selected").text();
				LAPO=$("#coLa1relationship option:selected").text();
				policyTerm=$("#coPolicyTerm option:selected").text();
				premuimTerm=$("#coPremiumTerm option:selected").text();
				poName=document.getElementById("poName").value;
				comDate=document.getElementById("commDate").value;				

			/* Calculate Age 1*/
				var today = comDate;
		        var comDateArray=today.split("/");
		        var newComDate=comDateArray[2] + '/' + comDateArray[1] + '/' + comDateArray[0];
		        var ComDateTo=new Date(newComDate);
		        ComDateTo.setDate(ComDateTo.getDate() +1);
		        var Age1=0;
		        var Age2=0;
		        var date = DOB1;
		        var datearray = date.split("/");
		        var birthDate = new Date(datearray[2], datearray[1]*1-1, datearray[0]);
		        Age1 = Math.floor((ComDateTo.getTime() - birthDate.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
				/* Calculate Age 2 */
				var date = DOB2;
		        var datearray2 = date.split("/");
		        var birthDate = new Date(datearray2[2], datearray2[1]*1-1, datearray2[0]);
			    Age2 = Math.floor((ComDateTo.getTime() - birthDate.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
			    
			    if(clName2==="" && DOB2 ==="" ){$("#la2dateOfBirth").data("DateTimePicker").setDate("01/01/1900");}
				if(l1Rtr1YN==="No"){document.getElementById("l1Rtr1").value=0;}
				if(l2Rtr1YN==="No"){document.getElementById("l2Rtr1").value=0;}
				if (LAPO.trim()==="PO = LA"){ document.getElementById("poName").value=clName;}
				if (policyTerm !== premuimTerm) {
					Err.innerHTML="";
			    	Err.innerHTML=Err.innerHTML+"<br/><b>Premuim Term</b> and <b>Policy Term</b> must be same value!";
			    	document.getElementById("coPremiumTerm").style.background = "yellow";
			    	document.getElementById("coPolicyTerm").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
				}
				if (parseInt(premuimTerm) == 5)  {
					Err.innerHTML="";
			    	Err.innerHTML=Err.innerHTML+"<br/>Premuim Term can select only 10,12 and 15 Term!";
			    	document.getElementById("coPremiumTerm").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
				}
				if(LAPO.trim() !="PO = LA" && poName==="" ){
					Err.innerHTML="";
			    	Err.innerHTML=Err.innerHTML+"<br/>Input the mandatory <b>Policy Owner</b>";
			    	document.getElementById("poName").style.background = "yellow";
			    	document.getElementById("la1dateOfBirth").style.background = "white";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
				if(clName2!="" && DOB2 !="" ){
			         if(Age2<18 || Age2>50){
			        	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				    	document.getElementById("la2dateOfBirth").style.background = "yellow";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la2name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			        }
			        else if(parseInt(Age2)+parseInt(policyTerm)>60){
				        	Err.innerHTML="";
					    	Err.innerHTML="<br/><br/>Life 2 can not choose <b>policy term="+policyTerm+"</b> becuase life2's <b>Age</b> + <b>Policy Term</b>  is over 60 years!";
					    	document.getElementById("la2dateOfBirth").style.background = "yellow";
					    	document.getElementById("la1dateOfBirth").style.background = "white";
					    	document.getElementById("basicPlanSa").style.background = "white";
					    	document.getElementById("la1name").style.background = "white";
					    	$('html, body').animate({ scrollTop: 0 }, 'slow');
					    	return false;
					}
			    }
				if(clName===""){
			    	Err.innerHTML="";
			    	Err.innerHTML="<br/>Input the mandatory field -LA1Name";
			    	document.getElementById("la1name").style.background = "yellow";
			    	document.getElementById("basicPlanSa").style.background = "white";
			    	document.getElementById("la1dateOfBirth").style.background = "white";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
				else if(DOB1===""){
			    	Err.innerHTML="";
			    	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
			    	document.getElementById("la1dateOfBirth").style.background = "yellow";
			    	document.getElementById("basicPlanSa").style.background = "white";
			    	document.getElementById("la1name").style.background = "white";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
				else if(comDate===""){
			    	Err.innerHTML="";
			    	Err.innerHTML="<br/>Input the mandatory Policy commencement date";
			    	document.getElementById("commDate").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
				else if(DOB1===""){
			    	Err.innerHTML="";
			    	Err.innerHTML=Err.innerHTML+"<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
			    	document.getElementById("la1dateOfBirth").style.background = "yellow";
			    	document.getElementById("basicPlanSa").style.background = "white";
			    	document.getElementById("la1name").style.background = "white";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    	}
			    else if (SA===""){			    				    
			    	Err.innerHTML=Err.innerHTML+"<br/>Input the mandatory field <b>BasicPlan_SA >= 2000</b>";
			    	document.getElementById("basicPlanSa").style.background = "yellow";
			    	document.getElementById("la1name").style.background = "white";
			    	document.getElementById("la1dateOfBirth").style.background = "white";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if ('${isUnlimitedSA}'=='false' && SA<2000 && Age1>=18 && Age1<=39){
			    	
				    	Err.innerHTML=Err.innerHTML+"<br/>Input the mandatory field <b>BasicPlan_SA >= 2000</b>";
				    	document.getElementById("basicPlanSa").style.background = "yellow";
				    	document.getElementById("la1name").style.background = "white";
				    	document.getElementById("la1dateOfBirth").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			    }
			    else if ('${isUnlimitedSA}'=='false' && SA<3000 && Age1>=40 && Age1<=50){
				    	Err.innerHTML=Err.innerHTML+"<br/>Input the mandatory field <b>BasicPlan_SA >= 3000</b>";
				    	document.getElementById("basicPlanSa").style.background = "yellow";
				    	document.getElementById("la1name").style.background = "white";
				    	document.getElementById("la1dateOfBirth").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			    }
			    else if	('${isUnlimitedSA}'=='true' && SA<=0){
				    	Err.innerHTML=Err.innerHTML+"<br/>Input the mandatory field <b>BasicPlan_SA > 0</b>";
				    	document.getElementById("basicPlanSa").style.background = "yellow";
				    	document.getElementById("la1name").style.background = "white";
				    	document.getElementById("la1dateOfBirth").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			    }	    
			    else if(l1Rtr1YN==="Yes" && (parseInt(l1Rtr1)<parseInt(1000) || parseInt(l1Rtr1)>parseInt(SA*5) || l1Rtr1=="") && '${isUnlimitedRider}'=='false')
			    {   			    	
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>Min SA = 1000$ US<br/>Max SA = 500% Basic Sum Assured";
			    	document.getElementById("l1Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if(l1Rtr1YN==="Yes" && (parseInt(l1Rtr1)<=parseInt(0) || l1Rtr1=="") && '${isUnlimitedRider}'=='true')
			    {   			    	
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>Min SA = 1000$ US<br/>Max SA = 500% Basic Sum Assured";
			    	document.getElementById("l1Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if((l1Rsr1YN==="Yes" && (parseInt((SA*0.1))!= parseInt(l1Rsr1)))){
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>SA =10% Basic Sum Assured.";
			    	document.getElementById("l1Rsr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if (l1Rtr1YN==="Yes" && (l1Rtr1%1 !==0)){
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>SA can not content with decimal";
			    	document.getElementById("l1Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if(l2Rtr1YN==="Yes" && (parseInt(l2Rtr1)<parseInt(1000) || parseInt(l2Rtr1)>parseInt(SA) || l2Rtr1=="") && '${isUnlimitedRider}'=='false')
			    {   			    	
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<Br/>Min SA = 1000$ US<br/>Max SA = 100% Basic Sum Assured";
			    	document.getElementById("l2Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if(l2Rtr1YN==="Yes" && (parseInt(l2Rtr1)<=parseInt(0) || l2Rtr1=="") && '${isUnlimitedRider}'=='true')
			    {   			    	
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<Br/>Min SA = 1000$ US<br/>Max SA = 100% Basic Sum Assured";
			    	document.getElementById("l2Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    /*else if((l2Rtr1YN==="Yes" && parseInt(l2Rtr1)>parseInt(SA)))
			    {   
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<Br/>Min SA = 1000$ US<br/>Max SA = 100% Basic Sum Assured";
			    	document.getElementById("l2Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }*/
			    else if((l2Rsr1YN==="Yes" && (parseInt((SA*0.1))!= parseInt(l2Rsr1)))){
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>SA =10% Basic Sum Assured.";
			    	document.getElementById("l2Rsr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if (l2Rtr1YN==="Yes" && (l2Rtr1%1 !==0)){
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input Sum Assured again!<br/>SA can not content with decimal";
			    	document.getElementById("l2Rtr1").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
				else if(l1Rtr2YN==="Yes" && l1Rtr2=="")
			    {   			    				    
			    	Err.innerHTML=Err.innerHTML+"<br/>PruSaver ride value required!";
			    	document.getElementById("l1Rtr2").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if (l1Rtr2YN==="Yes" && (l1Rtr2%1 !==0)){
			    	Err.innerHTML=Err.innerHTML+"<br/>Please input premium again!<br/>PruSaver premium can not content with decimal";
			    	document.getElementById("l1Rtr2").style.background = "yellow";
			    	$('html, body').animate({ scrollTop: 0 }, 'slow');
			    	return false;
			    }
			    else if (l2Rtr1YN==="Yes" || l2Rsr1YN==="Yes" )
				{
			    	if(clName2===""){
			    		Err.innerHTML="";
				    	Err.innerHTML="<br/>Input the mandatory field -LA2Name";
				    	document.getElementById("la2name").style.background = "yellow";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la2dateOfBirth").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			    	}
			    	else if(Age2<18 || Age2>50){
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				    	document.getElementById("la2dateOfBirth").style.background = "yellow";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la2name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			        }
			    	if(parseInt(Age1)<parseInt(18) || parseInt(Age1)>parseInt(50)){
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				    	document.getElementById("la1dateOfBirth").style.background = "yellow";
				    	document.getElementById("la2dateOfBirth").style.background = "white";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la1name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			        }
			    	else if(parseInt(Age1)+parseInt(policyTerm)>60){
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Life 1 can not choose policy term="+policyTerm+" becuase life1's <b>Age</b> + <b>Policy Term</b>  is over 60 years!";
				    	document.getElementById("la1dateOfBirth").style.background = "yellow";
				    	document.getElementById("la2dateOfBirth").style.background = "white";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la1name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
					}
					
			 	}
			    else if(clName2!="" && DOB2 ==="" ){
			    	var today = new Date();
			       
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				    	document.getElementById("la2dateOfBirth").style.background = "yellow";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la2name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			    }
			    else if(DOB1!=""){
			    	if(parseInt(Age1)<parseInt(18) || parseInt(Age1)>parseInt(50)){
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Please Input Value Agian!<br/>Min Age: 18<br/>Max Age: 50";
				    	document.getElementById("la1dateOfBirth").style.background = "yellow";
				    	document.getElementById("la2dateOfBirth").style.background = "white";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la1name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
			        }
			    	else if(parseInt(Age1)+parseInt(policyTerm)>60){
			        	Err.innerHTML="";
				    	Err.innerHTML="<br/><br/>Life 1 can not choose policy term="+policyTerm+" becuase life1's <b>Age</b> + <b>Policy Term</b>  is over 60 years!";
				    	document.getElementById("la1dateOfBirth").style.background = "yellow";
				    	document.getElementById("la2dateOfBirth").style.background = "white";
				    	document.getElementById("basicPlanSa").style.background = "white";
				    	document.getElementById("la1name").style.background = "white";
				    	$('html, body').animate({ scrollTop: 0 }, 'slow');
				    	return false;
					}
				    else{
			        	 document.form.submit();
			  		     return true;
			        }
			    }
			    else{
				    document.form.submit();
				    return true;
			    }
		}