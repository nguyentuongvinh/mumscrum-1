$(function(){
	/* var CurrentDate = new Date();    
    $("#DateFrom").val(pad(CurrentDate.getDate()) + "/" + (pad(CurrentDate.getMonth() + 1)) + "/" + CurrentDate.getFullYear());
    $("#DateTo").val(pad(CurrentDate.getDate()) + "/" + (pad(CurrentDate.getMonth() + 1)) + "/" + CurrentDate.getFullYear());
    function pad(n) {
        return (n < 10) ? ("0" + n) : n;
    } */
//	pathArray = location.href.split( '/' );
//	protocol = pathArray[0];
//	host = pathArray[2];
//	url = protocol + '//' + host;
	
	var appName='';
	if(location.href.indexOf('PruQuote')>0){
		appName = "/PruQuote";
	}
	
	if (!location.origin){
		location.origin = location.protocol + "//" + location.host;				
	}
//	alert(location.origin);
    $('#btnRefresh').click(function(){
        window.myLine.destroy();
    	generateChart();
    });
    generateChart();
    function generateChart(){
    	$.ajax({
    	    type: "GET",
    	    url: location.origin+appName+'/statistic/logcountjson',  
    	    data: {          
                "DateFrom": $("#DateFrom").val(),
                "DateTo": $("#DateTo").val()          
            },                                  
    	    success: function (json) {
    	    	//alert(json[0][0]);
    	        //json = JSON.parse(json);
    	        //alert(json);return;
    	        var label = [];
    	        var value = []
    	        var valueDetail = [];
    	        
//    	        alert(json);
    	        for (var j in json) {
    		        if(j==json.length-1) break;
    	            var d = new Date(json[j].TXN_Date);
    	            label.push(json[j][0]);
    	            value.push(json[j][1]);
    	            valueDetail.push(json[j][2]);
    	        }
    	        var lineChartData = {
    	            labels: label,
    	            datasets: [                   
    	                {
    	                    label: "Login Count",
    	                    fillColor: "rgba(220,220,220,0.2)",
    	                    strokeColor: "rgba(220,220,220,1)",
    	                    pointColor: "rgba(220,220,220,1)",
    	                    pointStrokeColor: "#fff",
    	                    pointHighlightFill: "#fff",
    	                    pointHighlightStroke: "rgba(220,220,220,1)",
    	                    data: valueDetail
    	                },
    	                {
    	                    label: "Active",
    	                    fillColor: "rgba(151,187,205,0.2)",
    	                    strokeColor: "rgba(151,187,205,1)",
    	                    pointColor: "rgba(151,187,205,1)",
    	                    pointStrokeColor: "#fff",
    	                    pointHighlightFill: "#fff",
    	                    pointHighlightStroke: "rgba(151,187,205,1)",
    	                    data: value
    	                }
    	            ]

    	        }	        
    	        var ctx = document.getElementById("canvas").getContext("2d");
    	        window.myLine = new Chart(ctx).Line(lineChartData, {
    	            responsive: true, scaleBeginAtZero: true,
    	            multiTooltipTemplate: "<%= datasetLabel  %> : <%= value %>" 
    	        });	        
    	    },
    	    complete: function () {
    	       
    	    }
    	});
    }
	
	$('.date').datepicker({
	    //todayBtn: true,
	    format: "dd/mm/yyyy",
	    autoclose: true,
	    todayHighlight: true
	})
	.on('changeDate', function (e) {
	});
});