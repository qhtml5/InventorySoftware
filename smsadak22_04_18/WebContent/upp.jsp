

<link href="css/modalShow.css" rel="stylesheet" />

<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<!-- jQuery 2.0.2 -->
<!-- <script -->
<!-- 	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
<script src="<%=request.getContextPath() %>/js/jquery-1.11.2.min.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- DATA TABLES -->
<link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />


<!-- fullCalendar -->
<link href="<%=request.getContextPath()%>/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/fullcalendar/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />

<!-- SEARCH SELECT -->
<link href="<%=request.getContextPath() %>/css/select2.css" rel="stylesheet"/>	
		
<!-- Theme style -->
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE App -->
<script src="js/AdminLTE/app.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/AdminLTE/demo.js" type="text/javascript"></script>

<!-- page script -->

<script src="<%=request.getContextPath()%>/js/select2.js"></script>

<!-- bootstrap 3.0.2 -->

<link href="css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- iCheck for checkboxes and radio inputs -->
<link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
<!-- Bootstrap Color Picker -->
<link href="css/colorpicker/bootstrap-colorpicker.min.css"
	rel="stylesheet" />
<!-- Bootstrap time Picker -->
<link href="css/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css" href="css/login.css" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/ajaxpagefetcher.js"></script>
<script type="text/javascript" src="js/adminManager.js"></script>
 <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="screen">

<link href="<%=request.getContextPath()%>/css/jquery.datepick.css"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/js/jquery.plugin.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datepick.js"></script>



<script src="jquery.datepick.js"></script>
<script>
$(function() {
	$('#popupDatepicker').datepick();
	$('#inlineDatepicker').datepick({onSelect: showDate});
});


$(function() {
	$('#bStartDate').datepick();
	$('#inlineDatepicker').datepick({onSelect: showDate});
});

$(function() {
	$('#bEndDate').datepick();
	$('#inlineDatepicker').datepick({onSelect: showDate});
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>



<script>
 
	 $(function() {
		var yRange = document.getElementById("fYearS").value;
	 	var frYearSess=yRange.substring(0, 4);
	 	var toYearSess=yRange.substring(5, 9);
		$('#startDate').datepick({
			minDate: new Date(frYearSess,03,01),
	        maxDate: new Date(toYearSess,02,31),
	        showOn: "button",
	        buttonImage: "images/calendar.gif",
	        buttonImageOnly: true,
	        dateFormat: "D, dd MM, yy",
	        onClose: function(selectedDate, inst) {
	            var selected_date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
	            new_date = new Date(selected_date.getTime() + 86400000);
	            new_date = jQuery.datepicker.formatDate('dd/mm/yy', new_date);
	            $( "#startDate" ).datepicker( "option", "minDate", new_date);
	  }
	    });
		$('#endDate').datepick({
			minDate: new Date(frYearSess,04-1,01),
	        maxDate: new Date(toYearSess,03-1,31),
	        showOn: "button",
	        buttonImage: "images/calendar.gif",
	        buttonImageOnly: true,
	        dateFormat: "D, dd MM, yy",
	        onClose: function(selectedDate, inst) {
	            var selected_date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
	            new_date = new Date(selected_date.getTime() + 86400000);
	            new_date = jQuery.datepicker.formatDate('dd/mm/yy', new_date);
	            $( "#endDate" ).datepicker( "option", "minDate", new_date);
			 }
	    });
		
		$('#purchaseDate').datepick({
			minDate: new Date(frYearSess,04-1,01),
	        maxDate: new Date(toYearSess,03-1,31),
	        showOn: "button",
	        buttonImage: "images/calendar.gif",
	        buttonImageOnly: true,
	        dateFormat: "D, dd MM, yy",
	        onClose: function(selectedDate, inst) {
	            var selected_date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
	            new_date = new Date(selected_date.getTime() + 86400000);
	            new_date = jQuery.datepicker.formatDate('dd/mm/yy', new_date);
	            $( "#purchaseDate" ).datepicker( "option", "minDate", new_date);
			 }
	    });
		
		$('#sDoc').datepick({
			minDate: new Date(frYearSess,04-1,01),
	        maxDate: new Date(toYearSess,03-1,31),
	        showOn: "button",
	        buttonImage: "images/calendar.gif",
	        buttonImageOnly: true,
	        dateFormat: "D, dd MM, yy",
	        onClose: function(selectedDate, inst) {
	            var selected_date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
	            new_date = new Date(selected_date.getTime() + 86400000);
	            new_date = jQuery.datepicker.formatDate('dd/mm/yy', new_date);
	            $( "#sDoc" ).datepicker( "option", "minDate", new_date);
			 }
	    });
		
		$('#salesDate').datepick({
			minDate: new Date(frYearSess,04-1,01),
	        maxDate: new Date(toYearSess,03-1,31),
	        showOn: "button",
	        buttonImage: "images/calendar.gif",
	        buttonImageOnly: true,
	        dateFormat: "D, dd MM, yy",
	        onClose: function(selectedDate, inst) {
	            var selected_date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
	            new_date = new Date(selected_date.getTime() + 86400000);
	            new_date = jQuery.datepicker.formatDate('dd/mm/yy', new_date);
	            $( "#salesDate" ).datepicker( "option", "minDate", new_date);
			 }
	    });
		
	}); 
/* 	$(function() {
		$('#startDate').datepick();
		$('#endDate').datepick();
		$('#sDoc').datepick();
		$('#purchaseDate').datepick();
		$('#salesDate').datepick();
	});
 */	function showDate(date) {
		alert('The date chosen is ' + date);
	}
</script>

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		
		called();
		window.history.forward();
		window.location.hash = "no-back-button";
		window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
		window.onhashchange = function() {
			window.location.hash = "no-back-button";
		}
	}
	
</script>
<script>
		$("#example1").dataTable()
		{
		

		//         $('#example2').dataTable({
		//             "bPaginate": true,
		//             "bLengthChange": false,
		//             "bFilter": false,
		//             "bSort": true,
		//             "bInfo": true,
		//             "bAutoWidth": false
		//         });
	}
</script>



<!-- SEARCH SELECT -->

<script>
	$(document).ready(function() {
		 $("#billno").select2(); 
	    $("#articlesCode").select2(); 
	    $("#articlesCode2").select2(); 
	    $("#saleArticlesCode").select2();
	    $("#customerBarcode").select2();
	    $("#itemId").select2(); 
	});
</script>





<script src="<%=request.getContextPath()%>/jquery.dataTables.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dataTables.bootstrap.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/stockManager.js"
	type="text/javascript"></script>
	
<script src="<%=request.getContextPath()%>/js/salesManager.js"
	type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/js/customerPay.js"
	type="text/javascript"></script>
	
<script src="<%=request.getContextPath()%>/js/supplierPay.js"
	type="text/javascript"></script>
	
<script type="text/javascript">
$('#freeItem').click(function() {
	/* if($('#freeItem').is(':checked')) {
    	alert("hi");      
	} else {
		alert("hello");
  } */
	
})
	$(document).ready(function() {
		$("#freeItem").click(function() {
			
			var valuetxt=$("#freeItem").val();
			if(valuetxt == "Click to Add Free Item"){
				$("#freeItem").val('Click to Add Paid Item');
				document.getElementById("1").value=0;
		    	document.getElementById("tot").value=0;
		    	document.getElementById("iMsg").innerHTML="<b style='color: red;'>(FREE ENTRY)</b>";
		    	document.getElementById("1").disabled = true;
		    	document.getElementById("tot").disabled = true;
			}else{
				$("#freeItem").val('Click to Add Free Item');
				document.getElementById("1").value=0;
		    	document.getElementById("tot").value=0;
		    	document.getElementById("iMsg").innerHTML="<b style='color: blue;'>(PAID ENTRY)</b>";
		    	document.getElementById("1").disabled = false;
		    	document.getElementById("tot").disabled = false;
			}
			
		});
		
		$("#flip").click(function() {
			$("#panel").show();

		});

		$("#hide").click(function() {
			
			$("#panel").hide();
		});
		
		
		
		
		
		$("#panelSale").hide();
		$("#panelSale1").show();
		
		$("#flipSale").click(function() {
			$("#panelSale").show();
			$("#panelSale1").hide();
		});

		$("#flipSale1").click(function() {
			$("#panelSale1").show();
			$("#panelSale").hide();
		});
		
		
	});
</script>


<style>
#panel,#flip {
	width: 73px;
	margin: -35px 69px 10px 106px;
	background-color: #CEEAE3;
	border: 1px solid #095FCE;
	cursor: pointer;
	height: 17px;
}

#panel {
	width: 583px;
	height: 374px;
	margin: 10px 46px 8px 9px;
	display: none;
}



#panelSale,#flipSale {
	width: 200px;
	margin: -17px 73px -9px 168px;
	padding-left:25px;
	background-color: rgba(252, 255, 147, 0.53);
	border: 1px solid #095FCE;
	cursor: pointer;
	height: 17px;
	float: left;
}

#panelSale {
	width: 121%;
	height: 171px;
	margin: 8px 47px 11px -172px;
}

#panelSale1,#flipSale1 {
	width: 200px;
	margin: -16px 77px -19px 157px;
	background-color: rgba(145, 249, 165, 0.47);
	border: 1px solid #095FCE;
	padding-left:25px;
	cursor: pointer;
	height: 17px;
	float: left;
}

#panelSale1 {
	width: 188%;
	height: 118px;
	margin: 10px 47px 11px 2px;

}

</style>

<script>

function checkAll()
{
	 var checkboxes = document.getElementsByName("checkedId");
	 var checkUnchek=document.getElementById("checked").value;
     if (checkUnchek=="Select all") {
    	 checkboxes[2].checked = true;
    	 for(var i=0;i<checkboxes.length;i++)
    		 {
    		 checkboxes[i].checked = true;
    		
    		 }
     }
     else if(checkUnchek="De-select all")
    	 {
    	 for(var i=0;i<checkboxes.length;i++)
		 {
		 checkboxes[i].checked = false;
		
		 }
    	 }
     
     }
     
function uncheck()
{
	 var checkboxes = document.getElementsByName("checkedId");
	 for(var i=0;i<checkboxes.length;i++)
	 {
	 checkboxes[i].checked = false;
	
	 }

}


function checkAllCustomer()
{
	 var checkboxes = document.getElementsByName("customerIds");
	 var checkUnchek=document.getElementById("checkedCus").value;
     if (checkUnchek=="Select all") {
    	 checkboxes[2].checked = true;
    	 for(var i=0;i<checkboxes.length;i++)
    		 {
    		 checkboxes[i].checked = true;
    		
    		 }
     }
     
 }
 
function checkSelectedCustomer()
{
     
     var customerSize=document.getElementById("customerSize").value;
     var customerIds1=document.getElementsByName("customerIds1");
     var itemSize=document.getElementById("itemSize").value;

     var itemIds1=document.getElementsByName("itemIds1");
 
	 var checkboxes = document.getElementsByName("customerIds");
	 var checkedId=document.getElementsByName("checkedId");
    
	     for(var k=0;k<checkedId.length;k++)
		 {
		 
	    	 for(var s=0;s<itemSize;s++)
	    		 {
	    	
	    		 if(checkedId[k].value==itemIds1[s].value)
	    			 {

	    			 checkedId[k].checked = true;
	    			 
	    			 }
	    		
	    		 }
		 }
	 
    	 for(var i=0;i<checkboxes.length;i++)
    		 {
	    	     for(var j=0; j<customerSize;j++){
	    	    	 //alert(customerIds1[i].value);
	    	    	if(checkboxes[i].value==customerIds1[j].value){
	    	    		checkboxes[i].checked = true;
	    	    	}; 
	    	     };  		 
    		 };
 }
     
function uncheckCustomer()
{
	 var checkboxes = document.getElementsByName("customerIds");
	 for(var i=0;i<checkboxes.length;i++)
	 {
	 checkboxes[i].checked = false;
	
	 }
}

function confirmDelete(index){
	var chk=confirm("Do You Really Want To Delete?")
	if(chk==true){
		document.getElementById("del"+index).submit();
	}else{
		return false;
	}
}

	
</script>
