<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<html>
<head>
<%@include file="../upp.jsp"%>

<script>
	function called() {

		$("#example1").dataTable();
		/* $('#example2').dataTable({
			"bPaginate" : true,
			"bLengthChange" : false,
			"bFilter" : false,
			"bSort" : true,
			"bInfo" : true,
			"bAutoWidth" : false
		}); */
	}
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">

		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Customer Payment Due Status <small> View All customer due
				payment status <img src="img/payment.png" height="60px" width="60px"
				style="margin: -14px -22px -21px 0px" />
			</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Customer Payment Due Status</li>
		</ol>
		</section> <section onmouseover="called()" class="content">

		<div class="row">
			<!-- left column -->
			<div class="LongTable">
				<!-- general form elements -->
				<div class="box box-primary">
					
						<div class="box-header">
							<h3 class="box-title">Customer Payment Due Status</h3>
						</div>

						<!-- Print Details -->
						<div style="margin: 10px 39px -33px 16px">
							<b>Print details :</b>
						</div>
						<s:form id="exlCusDue"  method="post">
						<img src="<%=request.getContextPath()%>/img/printing.png"
							width="45px" height="45px"
							onclick="printDuePay(800,800,50,'printWholeCustomerDuePayStatus.action','PaymentPrint','demo_win','NA');"
							style="cursor: pointer; margin: 2px 39px -32px 108px" />
						<!-- Print Details -->
						
						<!-- Excel Export -->
						<img src="img/ExcelExport.png" width="65px" height="45px"
							style="margin: -10px 0px -36px -17px; cursor: pointer;"
							onclick="excelWholeCustomerDue()" />
						<!-- Excel Export -->
						</s:form>
						<div style="margin: -45px 38px 10px 337px;">

							Colors status according to payment pending days. <br /> <br />
							<div
								style="background-color: lime; margin: 0px 38px 10px -80px; width: 87px; color: #000;">
								&nbsp; 1-15 days</div>
							<div
								style="background-color: #B6BA2D; margin: -26px 38px 10px 15px; width: 87px; color: #000;">
								&nbsp;16-30 days</div>
							<div
								style="background-color: #A0C623; margin: -26px 41px 10px 110px; width: 87px; color: #000;">
								&nbsp;31-45 day s</div>
							<div
								style="background-color: #DFF444; margin: -26px 38px 10px 204px; width: 87px; color: #000;">
								&nbsp;46-60 days</div>
							<div
								style="background-color: #FCF400; margin: -25px 38px 7px 299px; width: 87px; color: #000;">&nbsp;61-75
								days</div>
							<div
								style="background-color: #F7C758; margin: -23px 42px 20px 394px; width: 87px; color: #000;">&nbsp;76-90
								days</div>
							<div
								style="background-color: #EA9815; margin: -36px 38px 1px 487px; width: 87px; color: #fff;">&nbsp;91-105
								days</div>
							<div
								style="background-color: #EF7736; margin: -17px 38px -2px 580px; width: 99px; color: #fff;">&nbsp;106-120
								days</div>
							<div
								style="background-color: #f00; margin: -17px 38px -2px 684px; width: 65px; color: #fff;">>120days
							</div>
						</div>
						<br />
						<br />
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th><b>SERIAL NO.</b></th>
									<th><b>BILL NO / INVOICE NO.</b></th>
									<th><b>CUSTOMER NAME</b></th>
									<th><b>LAST PAYMENT DATE</b></th>
									<th><b>PAID STATUS</b></th>
									<th><b>SALE AMOUNT</b></th>
									<th><b>PAYMENT AMOUNT</b></th>
									<th><b>DUE AMOUNT</b></th>
									<th><b>DUE DAYS</b></th>

									<th><b>SALE DATE</b></th>
									<!-- <th><b>CHEQUE NUMBER</b></th>
								<th><b>CHEQUE DATE</b></th>
								<th><b>CHEQUE BANK</b></th> -->
								</tr>
							</thead>
							<tbody>
								<s:if test="cPayList.size>0">
									<%
										int k = 1;
									%>
									<s:iterator id="e" value="cPayList">
										<tr>
											<td><%=k%></td>
											<td><s:property value="billno" /></td>
											<td><s:property value="customerName" /></td>
											<td><s:property value="cPayDate" /></td>
											<td><s:property value="cPaidStatus" /></td>
											<td><b style="color: blue;"><s:property
														value="grandTotal" /></b></td>
											<td><s:property value="cPaidAmt" /></td>

											<%--################################################# payment due color changing codes start here########################## --%>
											<s:if test="#e.dateDiff>=120">
												<td style="background-color: red; color: #fff;"><b><s:property
															value="dueAmt" /></b></td>
											</s:if>

											<s:elseif test="#e.dateDiff>=105">
												<td style="background-color: #EF7736; color: #fff;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=90">
												<td style="background-color: #EA9815; color: #fff;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=75">
												<td style="background-color: #F7C758; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=60">
												<td style="background-color: #FCF400; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=45">
												<td style="background-color: #DFF444; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=30">
												<td style="background-color: #A0C623; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:elseif test="#e.dateDiff>=15">
												<td style="background-color: #B6BA2D; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:elseif>

											<s:else>
												<td style="background-color: lime; color: #000;"><b><s:property
															value="dueAmt" /></b></td>
											</s:else>


											<%--################################################# payment due color changing codes End here########################## --%>

											<td><b style="color: blue;"><s:property
														value="dateDiff" /></b></td>
											<td><b style="color: blue;"><s:property value="doc" /></b></td>
											<%-- <td><s:property value="chequeNo" /></td>
										<td><s:property value="chequeDate" /></td>
										<td><s:property value="chequeBank" /></td> --%>
										</tr>
										<input type="hidden" value='<%=k++%>' />
									</s:iterator>
								</s:if>
							</tbody>
						</table>
					
				</div>
			</div>
		</div>
		</section> </aside>
	</div>
	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>
		<div id="lDetailsDiv"></div>
	</div>
	<div id="schDIV2" class="white_content_PrintLedger">
		<a href="#"
			onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>
		<div id="lDetailsDiv2" style="height: 555px"></div>
	</div>

	<div id="fade1" class="black_overlay"></div>
</body>
</html>