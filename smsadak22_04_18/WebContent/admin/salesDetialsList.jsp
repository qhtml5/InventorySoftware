<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>

<html>
<head>
<style type="text/css" media="screen">
@import "css/simpletabs.css";
</style>

<script type="text/javascript">
	function called() {
		$("#example1").dataTable();
	}
</script>
<%@include file="../upp.jsp"%>

<link href="css/modalShow.css" rel="stylesheet" />

<script type="text/javascript">
function saleExport2(context,cId)
{
	
	var fromdate=document.getElementById('startDate').value;
	var todate= document.getElementById('endDate').value;
	var cnstatus=document.getElementById("checkboxuncheck").value;

	var g=context + "/exportingSaleDetailsgstr.action?cId="+cId+"&fromdate="+ fromdate + "&todate=" + todate+"&cnstatus="+cnstatus;
	document.getElementById("exportingsaleDetails").action = g;
	document.getElementById("exportingsaleDetails").submit();
	
}


function saleExport3(context,cId)
{
	alert("called");
	var fromdate=document.getElementById('startDate').value;
	var todate= document.getElementById('endDate').value;
	var cnstatus=document.getElementById("checkboxuncheck").value;

	var g=context + "/exportingSaleDetailsgstrjson.action?cId="+cId+"&fromdate="+ fromdate + "&todate=" + todate+"&cnstatus="+cnstatus;
	document.getElementById("exportingsaleDetails").action = g;
	document.getElementById("exportingsaleDetails").submit();
	
}


</script>


</head>
<body onload="clearDate();noBack();"
	onpageshow="if (event.persisted) noBack();" onunload="resetValue()"
	class="skin-blue">

	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<%@include file="../aside.jsp"%>
		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			SALE REPORTS <small> View products sale details <img
				src="img/sales.png" height="60px" width="60px"
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
						<h3 class="box-title">Sale details of all Items</h3>
					</div>
					<div>
						<s:form name="exportingsaleDetails" id="exportingsaleDetails"
							method="post">
							<div style="margin: 0px 36px -14px 299px;">
								Select Customer:
								<s:select cssStyle="cursor: pointer;" headerKey="0" onchange=""
									headerValue="---------Select Customer------------" list="cList"
									listKey="customerId" listValue="cName" name="customerId"
									id="customerId" theme="simple" />
							</div>

							<div style="margin:-28px 36px -14px 49px">
								From Date: <input type="text" id="startDate"
									class="textboxStockloc" name="fromdate" /> To Date : <input
									type="text" class="textboxStockloc" id="endDate"
									name="fromdate" /> <input type="hidden" name="fYearS"
									id="fYearS" value="${sessionScope['fYear']}"> 
									
									
									
									<select style="margin: 38px 53px -20px 12px; cursor: pointer;" name="checkboxuncheck" id="checkboxuncheck">
									<option value="">-Select C.N / No C.N items-</option>
									<option value="C.N">C.N items</option>
									<option value="No C.N">NO C.N items</option>
									</select>
									
									
									
									<img
									src="img/searchDate.png" width="45px" height="45px"
									style="margin: 38px 53px -20px -33px; cursor: pointer;"
									onclick="searchSalesDetailsByDATEorCus('<%=request.getContextPath()%>',document.getElementById('customerId').value,document.getElementById('startDate').value,document.getElementById('endDate').value),document.getElementById('checkboxuncheck').value" />




								<img src="img/ExcelExport.png" width="88px" height="63px"
									style="margin: 38px 53px -20px -42px; cursor: pointer;"
						        	onclick="saleExport('<%=request.getContextPath()%>',document.getElementById('customerId').value,document.getElementById('startDate').value,document.getElementById('endDate').value)" />
						        	
						        	
						        		<img src="img/ExcelExportgstr1.png" width="88px" height="63px"
									style="margin: 38px 53px -20px -42px; cursor: pointer;"
						        	onclick="saleExport2('<%=request.getContextPath()%>',document.getElementById('customerId').value,document.getElementById('startDate').value,document.getElementById('endDate').value)" />
						        	
						        	
						        	
						        	
							</div>
						</s:form>
						<hr id="salesHR2" />
						<br /> <br />
						<div id="salesDetailsDiv">
						<br/>
						<b> Please use From Date and To Date to Search Sale Details !!!!</b>
						<br/>
							<%-- ><table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th><b>SERIAL NO.</b></th>
										<th><b>BILL NO / INVOICE NO.</b></th>
										<th><b>SALE DATE</b></th>
										<th><b>PARTY / CUSTOMER NAME</b></th>
										<th><b>CUSTOMER TYPE</b></th>
										<th><b>GRAND TOTAL</b></th>
										<th><b>PRODUCT SALE DETAILS</b></th>
										<th><b>CREDIT NOTE/ NO CREDITNOTE</b></th>
										<th><b>PRINT DUPLICATE BILL</b></th>

									</tr>
								</thead>
								<tbody>

									<s:if test="saleList.size>0">
										<%
											int k = 1;
										%>
										<s:iterator id="sl" value="saleList">
											<tr>
												<td><%=k%></td>
												<td><s:property value="billno" /></td>
												<td><s:property value="Doc" /></td>
												<td><s:property value="customerName" /></td>
												<td><s:property value="customerType" /></td>
												<td><s:property value="grandTotal" /></td>
												<td><img
													src="<%=request.getContextPath()%>/img/sales.png"
													width="45px" height="45px"
													onclick="getAllDetailsOfSales('<s:property value="billno" />','<s:property value="Doc" />'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
													style="cursor: pointer;" /></td>
													
													
													<td>
													
													<s:if test="#sl.creditnotestatus=='C.N'">
													
													
													<img
													src="<%=request.getContextPath()%>/img/damaged.png"
													width="45px" height="45px"
													
													style="cursor: pointer;" />
													
													</s:if>
													<s:else>
													
													<s:property value="creditnotestatus"/>
													</s:else>
													
													</td>
													
													
													
													
													
													
													
													
												<td><img
													src="<%=request.getContextPath()%>/img/printing.png"
													width="45px" height="45px"
													onclick="CenterWindow(800,800,50,'printSalesDetailsByBillno.action','SalesPrint','demo_win','<s:property value="billno" />','<s:property value="Doc" />');"
													style="cursor: pointer;" /> <%-- 									<img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" onclick="printSalesDetails('<s:property value="billno" />'); document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/> --%>
												</td><%-- 

											</tr>
											<input type="hidden" value='<%=k++%>' />
										</s:iterator>

									</s:if>
								</tbody>
							</table>--%>
						</div>
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