<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
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
	onunload="resetValue()" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">

		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			DEBIT NOTE <small> Calculate Debit Note <img src="img/damaged.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Debit Note</li>
		</ol>
		</section> <section class="content">
		<div id="validation"></div>
		<s:form action="submitDebitNoteDetails.action" id="stockAdd"
			method="post" theme="simple">
			<div class="row">
				<div class="LongTable">
					<!-- general form elements -->
					<div class="box box-primary">

						<div class="box-header">
							<h3 class="box-title">DEBIT CALCULATION:</h3>
							<br />
						</div>

						<div>
							Date of creation :
							<s:textfield cssClass="textboxForScheme" name="stockDTO.dnDoc"
								id="sDoc" theme="simple" />
							<input type="hidden" id="fYearS" name="fYearS"  value="${sessionScope['fYear']}">	
								
							<label for="PurchaseDate">Select Supplier:</label>
							<s:select cssStyle="cursor: pointer;" headerKey="0"
								onchange="selectStockDetails()" headerValue="-Select Supplier-"
								list="supList" listKey="SupplierId" listValue="SUPPLIERNAME"
								name="stockDTO.supplierId" id="supplierId" theme="simple" />

							<div id="billno" style="margin: -22px 58px -23px 610px">
								<label for="PurchaseDate">Select Invoice/Bill no:</label> <select
									style="cursor: pointer;" name=stockDTO.supplierId>
									<option value="0">--Select Bill no--</option>
								</select>
							</div>
						</div>

						<div id="supplierStockDetails">
							<br /> <br /> <label
								style="font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px">Select
								any invoice number to display data !! </label>
						</div>

					</div>
				</div>
			</div>
		</s:form> </section> </aside>
	</div>



</body>
</html>