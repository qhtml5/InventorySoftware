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
<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	function called() {
		$("#example1").dataTable();
	}
</script>
<%@include file="../upp.jsp"%>

<link href="css/modalShow.css" rel="stylesheet" />

<script type="text/javascript">
function exportingStockDetails2(context, sId,fromdate, todate)
{
// 	var e = document.getElementById("vatcst");
// 	var cstvat = e.options[e.selectedIndex].value;

		var g=context + "/exportingStockDetails.action?sId="+sId+"&fromdate="+ fromdate + "&todate=" + todate;
	
		document.getElementById("exportingStockDetails").action = g;
		document.getElementById("exportingStockDetails").submit();
	
}

</script>
</head>
<body onload="clearDate();noBack();"
	onpageshow="if (event.persisted) noBack();" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Purchase Master <small> View All Purchased Details <img
				src="img/purchase.png" height="60px" width="60px"
				style="margin: -20px -21px -18px -6px" />
			</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Purchase Master List</li>
		</ol>
		</section>
		
		<section onmouseover="called()" class="content">
		<div id="validation"></div>
		<div class="row">
			<!-- left column -->
			<div class="LongTable">
				<!-- general form elements -->
				<div class="box box-primary">
					<s:form name="exportingStockDetails" id="exportingStockDetails"
						method="post">
						<div class="box-header">
							<h3 class="box-title">Purchased Report </h3>
						</div>

							<div style="margin: 32px 38px -20px 199px">
								Select Supplier:
								<s:select cssStyle="cursor: pointer; " headerKey="0" onchange=""
									headerValue="-Select Supplier-" list="supList"
									listKey="SupplierId" listValue="SUPPLIERNAME" name="SupplierId"
									id="SupplierId" theme="simple" />
							</div>
							
							<%-- <div style="margin: 0px 8px -6px 595px;">
								Search by Vat/Cst: 
								<select id="vatcst">
								<option value="" >--Select--</option>
								<option value="VAT" >Vat</option>
								<option value="CST" >Cst</option>
								</select>
							</div>--%>
							
							<div style="margin: -33px 39px -12px 227px">

								From Date: <input type="text" id="startDate"
									class="textboxStockloc" name="fromdate" />
								To Date : <input
									type="text" class="textboxStockloc" id="endDate"
									name="fromdate" /> 
								<input type="hidden" name="fYearS" id="fYearS" value="${sessionScope['fYear']}">	
								<img src="img/searchDate.png" width="45px" height="45px"
									style="margin: 38px 53px -20px 152px; cursor: pointer;"
									onclick="searchPurchaseDetailsByDATEorSup('<%=request.getContextPath()%>',document.getElementById('SupplierId').value,document.getElementById('startDate').value,document.getElementById('endDate').value)" />

								<img src="img/ExcelExport.png" width="65px" height="45px"
									style="margin: 38px 53px -20px -42px; cursor: pointer;"
									onclick="exportingStockDetails2('<%=request.getContextPath()%>',document.getElementById('SupplierId').value,document.getElementById('startDate').value,document.getElementById('endDate').value)" />
							</div>
							<hr id="salesHR2" />
							<br /> <br />
							</s:form>
							<div id="stockDetailsDiv">

								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th><b>SERIAL NO.</b></th>
											<th><b>BILL NO / INVOICE NO.</b></th>
											<th><b>SUPPLIER</b></th>
											<th><b>PURCHASE DATE</b></th>
											<th><b>AVAILABLE STOCK</b></th>
											<th><b>PURCHASED HISTORY</b></th>
										</tr>
									</thead>
									<tbody>
										<s:if test="stockDTOList.size>0">
											<%
												int k = 1;
											%>
											<s:iterator value="stockDTOList">
												<tr>
													<td><%=k%></td>
													<td><s:property value="billNo" /></td>
													<td><s:property value="suppliername" /></td>
													<td><s:property value="purchaseDate" /></td>
													<td><img
														src="<%=request.getContextPath()%>/img/purchase.png"
														width="45px" height="45px"
														onclick="getAllDetailsOfStock('<s:property value="billNo" />', '<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
														style="cursor: pointer;" /></td>
													<td><img
														src="<%=request.getContextPath()%>/img/purchase.png"
														width="45px" height="45px"
														onclick="getLedgerDetails('NA','<s:property value="billNo" />','<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
														style="cursor: pointer;" /></td>
												</tr>
												<input type="hidden" value='<%=k++%>' />
											</s:iterator>
										</s:if>
									</tbody>
								</table>

							</div>
						</div>
					
				</div>
			</div>
		</div>

		</section> </aside>
		<div id="schDIV" class="white_content_login">
			<a href="#"
				onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>

			<div id="lDetailsDiv"></div>
		</div>
		<!-- /.right-side -->
	</div>
</body>
</html>