<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<html>
<head>
<%@include file="../upp.jsp"%>

<script>
	function called() {
		$("#example1").dataTable();
	}
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">

		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Customer Payment Due Status
			<small> View All customer due payment
				status <img src="img/payment.png" height="60px" width="60px"
				style="margin: -14px -22px -21px 0px" />
			</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Customer Payment Due Status</li>
		</ol>
		</section> <section onmouseover="called()" class="content">

		<div class="row">
			<label for="customerSearch">Select Customer:</label>
			<s:select cssStyle="cursor: pointer;" headerKey="0"
			onchange="getDueDetails(this.value)" headerValue="-Select Customer-"
			list="cPayList" listKey="regcustomerId" listValue="customerName"
			name="cPayDto.billno" id="customerId" theme="simple" />
			
			<div id="customerDueDet">
				<label style="font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px">Select
					Any Customr to Display Data !! </label>
			</div>
		</div>
		</section> </aside>
	</div>
</body>
</html>