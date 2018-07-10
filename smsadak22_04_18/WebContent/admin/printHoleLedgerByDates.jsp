<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page language="java" import="dTO.PurchaseLedgerDto"%>
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
			LEDGER <small> print hole ledger details <img src="img/ledger.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Print hole Ledger</li>
		</ol>
		</section>
		<section class="content"> <s:form action="#" id="stockAdd" method="post" theme="simple">
		<div id="validation"></div>
			<div class="row">
				<div class="LongTable">

					<div style="height: 50px; margin: 50px -8px -11px 20px">
						<label for="PurchaseDate">Select Supplier:</label>
						<s:select headerKey="0" onchange="#" onmouseover="called()"
							onmousemove="called()" onmouseout="called()"
							headerValue="-Select Supplier-" list="supList"
							listKey="SupplierId" listValue="SUPPLIERNAME"
							name="stockDTO.supplierId" id="supplierId" theme="simple" />
					</div>
					<!-- general form elements -->
					<div class="box box-primary">
						<div style="height: 50px; margin: -44px 11px -3px 432px">
							
							From Date: <input type="text" id="startDate" class="textboxStockloc" name="fromdate" />
							To Date : <input type="text" class="textboxStockloc" id="endDate" name="fromdate" />
							
							<input type="hidden" name="fYearS" id="fYearS" value="${sessionScope['fYear']}" >
							
							<img src="img/searchDate.png" width="45px" height="45px"
								style="margin: -10px 43px -17px 4px; cursor: pointer;"
								onclick="searchHoleLedgerByDATE('<%=request.getContextPath()%>',document.getElementById('startDate').value,document.getElementById('endDate').value)" />
						</div>
						<div id="purchaseLedgerDetails" style="height: 800px">
						
						<%
						System.out.println(request.getContextPath()+"/ledgerReports/printHoleledger.pdf");
						
						%>
						
							<embed src="<%=request.getContextPath() %>/ledgerReports/printHoleledger.pdf" width="100%" height="900px"></embed>
						</div>
					</div>
				</div>
			</div>
		</s:form> </section> </aside>
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