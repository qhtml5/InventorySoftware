<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page import="dTO.CustomerMasterDTO" language="java"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>

<html>
<head>
<style type="text/css" media="screen">
@import "css/simpletabs.css";
</style>
<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	function called() {
		$("#example1").dataTable();
	}
</script>
<%@include file="../upp.jsp"%>

<link href="css/modalShow.css" rel="stylesheet" />


<script type="text/javascript">


function smsjasoncheck()
{
	
	
	
	
	/*
	
	var jsonget=document.getElementById("smsjason").value;
	
	var obj = JSON.parse(jsonget);
	document.getElementById("demo").innerHTML = obj.name + ", " + obj.age;
	
	document.getElementById("remainsms").value=
		*/
		
		
		
		
	 var xmlhttp = new XMLHttpRequest();
	 xmlhttp.onreadystatechange = function() {
	     if (this.readyState == 4 && this.status == 200) {
	         myObj = JSON.parse(this.responseText);
	       
	         document.getElementById("remainsms").value=myObj.remainingcredits;
	     }
	 };
	 xmlhttp.open("GET", "json/json.txt", true);
	 xmlhttp.send();
		
	 
	 
	}







</script>




</head>
<body onload="smsjasoncheck();noBack();"
	onpageshow="if (event.persisted) noBack();" onunload="resetValue()"
	class="skin-blue">

	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<%@include file="../aside.jsp"%>
		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			SMS <small> Send SMS to your Customer <img
				src="img/sms.png" height="60px" width="60px"
				style="margin: -14px -21px -15px 2px" /></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Sale Report</li>
		</ol>
		</section> <section onmouseover="called()" class="content">
		<div id="validation"></div>

		<div class="row">

			<div class="LongTable">
				<div class="box box-primary">

					<div class="box-header">
						
						<br/>
					<div style="margin:9px 49px 5px 218px">
					
					<p id="demo"></p>
					
						<input type="text" placeholder="Search Customer By Name" id="searchCustomer" size="34" > 
					    &nbsp;	<input type="button" onclick="searchcustomer()" value="Search"/>&nbsp;|&nbsp;  <b>Your SMS Credit Remaining : <input type="text" id="remainsms" name="remainsms" readonly="readonly" />
					
					
					
					</b>
						
						</div>	
						
						
					</div>
					<div id="smsd">
						
						
						
						
						<b> Please enter your customer name and search for sending sms !!</b>
						
						
						
					</div>

				</div>

			</div>
		</div>

		</section>
		<div id="schDIV" class="white_content_login">
			<a href="#"
				onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>

			<div id="slDetailsDiv"></div>
		</div>
		<div id="schDIV2" class="white_content_PrintLedger">
			<a href="#"
				onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>
			<div id="slDetailsDiv2" style="height: 555px"></div>
		</div>

		</aside>
	</div>
</body>
</html>