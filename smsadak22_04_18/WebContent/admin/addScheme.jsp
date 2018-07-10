<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<html>
<head>
<script src="js_user/customerMgmt.js" type="text/javascript"></script>

<%@include file="../upp.jsp"%>


<!-- Simple Tabs -->

<style type="text/css" media="screen">
@import "<%=request.getContextPath()%>/css/simpletabs.css";
</style>
<!-- Simple Tabs -->

<script>


$(document).ready(function() {
    $('#example3').dataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false
        
    } );
} );


	
</script>

</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside onchange="called()" id="addContent" class="right-side">
			<section class="content-header">
				<h1>
					Scheme Master <small> Create new Scheme</small>

				</h1>
				<ol class="breadcrumb">
					<li><a href="adminIndexCall.action">Home</a></li>
					<li class="active">New Scheme Form</li>
				</ol>
			</section>
			<section class="content" onmouseover="called();">
				<div id="validation"></div>
				<div class="row">
					<!-- left column -->
					<div class="simpleTabs">
						<ul class="simpleTabsNavigation">
							<li><a href="addSchemeCall.action" onClick="">Add Scheme</a></li>
							<li><a href="viewSchemeCall.action" onclick="">View
									Scheme</a></li>
						</ul>

						<div id="aboutScheme">
							<s:form action="/addScheme.action" method="post" theme="simple">
							
								<!-- general form elements -->
								
								<div class="longTable">
									<div class="box box-primary">
										<div class="box-header">
											<h3 class="box-title">Enter Scheme Details :</h3>
										</div>
										<div class="box-body">
											Scheme Name: 
											<s:textfield cssClass="textboxForScheme" id="sName" name="schemeDto.schemeName" theme="simple" onkeyup="checkDupScheme();" />

											Date of creation :<s:textfield cssClass="textboxForScheme"
													name="schemeDto.schemeDoc" id="sDoc" disabled="true"
													theme="simple" />

										    Opening Scheme Date:
										    <s:textfield cssClass="textboxForScheme" name="schemeDto.schemeSdate" id="startDate" theme="simple" />
										    
										    Closing Scheme Date:
										    <s:textfield cssClass="textboxForScheme" name="schemeDto.schemeEdate" id="endDate" theme="simple" />			
											
											Qty Eligibility: 
												<s:textfield cssClass="textboxStockRateQuantityTotal"
													name="schemeDto.schemeQty" id="schemeQty" theme="simple" />
										</div>
									</div>
								</div>
								
								
								<!-- Customer list below -->
								
								<div class="col-md-6">
									<div class="RightTable">
										<div style="margin:-5px 50px 3px 306px">
										
										<input type="text" class="textboxStockloc"  id="searchCustomers" placeholder="Search Customers" onkeyup="searchCST('<%=request.getContextPath()%>',document.getElementById('searchCustomers').value)" />
										
										</div>
										<div id="customerDisplay" style="overflow: auto;height: 300px"  >
										<table id="example1" class="table table-hover">
											<thead>
												<tr>
													<td>
														<input type="button" id="checkedCus" class="buttonType3" value="Select all" onclick="checkAllCustomer(),history.go(0)"/>
														<input type="button" class="buttonType3" id="UncheckedCus" value="De Select all" onclick="uncheckCustomer(),history.go(0)"/>
													</td>
													<td><b>CUSTOMER NAME</b></td>
												</tr>
											</thead>
											<tbody>
												<s:if test="%{customerList.size>0}">
													<s:iterator value="customerList">
														<tr>
															<td> 
															<%-- 	<s:checkbox  name="schemeDto.customerIds" cssClass="buttonType3" theme="simple" value="<s:property value='customerId'/>" /> --%>
																<input type="checkbox"  name="customerIds" id="customerIds" class="buttonType3" value="<s:property value='customerId'/>" />
															</td>
															<td><s:property value="cName" /></td>
														</tr>
													</s:iterator>
												</s:if>
												<s:else>
													<tr>
														<td colspan="3"
															style="text-align: center; color: red; font-size: 20px;">Sorry!
															No Content Available.</td>
													</tr>
												</s:else>
											</tbody>
										</table>
										</div>
										<div class="box-footer" style="padding-left: 140px;">
											<div. id="addSchemeBt">
												<s:submit cssClass="btn btn-primary" id="sub" value="Add Scheme" onclick="return validateScheme();" />
											</div.>
										</div>
										
									</div>
								</div>
								
								
								<!-- Item list below -->
								<div class="col-md-6">
									<div class="RightTable">
										
										<div style="margin:-5px 50px 3px 306px">
										<input type="text" class="textboxStockloc"  id="searchItem" placeholder="Search Items" onkeyup="searchItems('<%=request.getContextPath()%>',document.getElementById('searchItem').value)" />
										
										</div>
										<div id="itemDisplay" style="overflow: auto;height: 300px"  >
										<table class="table table-hover">
											<thead>
												<tr>
													<td><input type="button" id="checked" class="buttonType3" value="Select all" onclick="checkAll(),history.go(0)"/>
													<input type="button" class="buttonType3" id="Unchecked" value="De Select all" onclick="uncheck(),history.go(0)"/> </td>
													<td><b>ITEM NAME</b></td>
												</tr>
											</thead>
											<tbody>
												<s:if test="%{itemList.size>0}">
													<s:iterator value="itemList">
														<tr>
															<td>
																<input type="checkbox"  name="checkedId" id="checkedId" value="<s:property value="itemId"/>" />
															</td>
															<td><s:property value="itemName" /></td>
														</tr>
													</s:iterator>
												</s:if>
												<s:else>
													<tr>
														<td colspan="3"
															style="text-align: center; color: red; font-size: 20px;">Sorry!
															No Content Available.</td>
													</tr>
												</s:else>
											</tbody>
										</table>
										</div>
									</div>
								</div>
							
							</s:form>
							<!-- form end -->
						</div>
					</div>
				</div>
					
			</section>
		</aside>
		
		<!-- /.right-side -->
	</div>


	<!-- Page script -->
	<script type="text/javascript">
		$(function() {
			//                 populateProductQty();
			//                 goodsListPapulate();
			//Datemask dd/mm/yyyy
			$("#datemask").inputmask("dd-mm/--yyyy", {
				"placeholder" : "dd-mm-yyyy"
			});
			//Datemask2 mm/dd/yyyy
			$("#datemask2").inputmask("mm/dd/yyyy", {
				"placeholder" : "mm/dd/yyyy"
			});
			//Money Euro
			$("[data-mask]").inputmask();

			//Date range picker
			$('#reservation').daterangepicker();
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			});
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract('days', 1),
									moment().subtract('days', 1) ],
							'Last 7 Days' : [ moment().subtract('days', 6),
									moment() ],
							'Last 30 Days' : [ moment().subtract('days', 29),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract('month', 1).startOf(
											'month'),
									moment().subtract('month', 1)
											.endOf('month') ]
						},
						startDate : moment().subtract('days', 29),
						endDate : moment()
					},
					function(start, end) {
						$('#reportrange span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'));
					});

			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"].minimal, input[type="radio"].minimal')
					.iCheck({
						checkboxClass : 'icheckbox_minimal',
						radioClass : 'iradio_minimal'
					});
			//Red color scheme for iCheck
			$(
					'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-red',
						radioClass : 'iradio_minimal-red'
					});
			//Flat red color scheme for iCheck
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
					.iCheck({
						checkboxClass : 'icheckbox_flat-red',
						radioClass : 'iradio_flat-red'
					});
		});
	</script>
</body>
</html>