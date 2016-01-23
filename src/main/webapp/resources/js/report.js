/**
 * 
 */
document.addEventListener("DOMContentLoaded", function(event) { 
    	 document.getElementById('btnUAB').onclick=function(e){
    	 		//
    	 	    e.preventDefault();
    	 	    openUAB(this.value);
    	 		};
    	});     
	 function openUAB(url){
		 var winHeight="innerHeight" in window 
			? window.innerHeight
    	: document.documentElement.offsetHeight; 	
		 if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
             var popup=window.open(url,"_blank");
             
             //$('#my-link').trigger('click');
         	/* if(!popup || popup.closed || typeof popup.closed=='undefined') 
         	{ 
         	    //POPUP BLOCKED
        	     	alert('Please enable popup blocker in setting!');
         	} */
         }	
         else{		
         	var popup=window.open(url ,'uabwindow'+(new Date()).getTime(),'width=840,height='+winHeight+',scrollbars=yes');
         	if(!popup || popup.closed || typeof popup.closed=='undefined') 
         	{ 
         	    //POPUP BLOCKED
        	     	alert('Please enable popup blocker in setting!');
         	}
         }
	 }