<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<html>
<head>
<script language="JavaScript" src="<%=request.getContextPath() %>/js/ts_picker.js"></script>
<script src="<%=request.getContextPath() %>/js/datetimepicker_css.js"></script>
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
			CREDIT NOTE <small> Calculate Credit Note <img src="img/damaged.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Credit Note</li>
		</ol>
		</section> 
			
		<div id="validation"></div>
		
	
		<s:form action="submitCreditNoteDetails.action" id="creditAdd"
			method="post" theme="simple">
			

					<!-- general form elements -->
				

						<div style="margin:-3px 28px -31px 53px">
						
					
							<br/>
							<br/>	
						
							Date of creation : 
							
							<s:textfield cssClass="textboxForScheme" name="crDto.cnDoc"
								id="demo1" theme="simple" />
							
							   <img src="<%=request.getContextPath() %>/img/cal.gif" onclick="javascript:NewCssCal('demo1','yyyyMMdd')" style="cursor:pointer"/>
							
							
							<div style="margin: 12px 62px 3px 203px"> <input type="text" id="billsearch" onkeyup="getCustomerSaleDet2(document.getElementById('billsearch').value)" placeholder="Search bill no" /> || </div>
							
								
							<div style="margin: -23px 40px 33px 365px"><input type="text" name="searchBarcode" id="searchBarcode" size="29" onkeyup="searchCustBarcode(document.getElementById('searchBarcode').value)" placeholder="Search by Customer Barcodes"/> || <input type="text" name="productCode" id="productCode" onkeyup="searchbyProductcode(document.getElementById('productCode').value)" placeholder="Search by ProductCode"/> 
							<div style="margin: -18px 37px 11px 388px;" id="pc">
							
							</div></div>	
							<br/>
								<br/>
								
							<div >
								
								<div id="cust" style="margin:-18px 35px -25px 170px">
								<s:if test="cList.size>0">
									<select id="customerBarcode" name="customerBarcode" style="width: 300px;"onchange="selectSalesDetails()">
										<option value="0">Select Customer</option>
										<s:iterator value="cList">
											<option value='<s:property value="customerBarcode" />'>
												<s:property value="customerBarcode" />-
												<s:property value="cName" />
											</option>
										</s:iterator>
									</select>
								</s:if></div>
								<%-- onchange="getCustomerSaleDet()" --%>
								<%-- <label for="PurchaseDate">Search Itemcode:</label>
								<s:if test="itemList.size>0">
									<select id="itemId" name="itemId" style="width: 300px;">
										<option value="0">Select Item</option>
										<s:iterator value="itemList">
											<option value='<s:property value="itemId" />'>
												<s:property value="itemId" />-
												<s:property value="itemName" />
											</option>
										</s:iterator>
									</select>
								</s:if> --%>
								<div id="billnoDiv" style="float: right;">
									<label for="PurchaseDate">Search Bill no:</label>
									<select id="billno" name="billno" style="width: 300px;">
										<option value="0">Select Bill</option>
									</select>
								</div>
							</div>
							
							
						</div>

						<div id="saleDetCre">
							<br /> <br /> <label
								style="font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px">Select
								any invoice number to display data !! </label>
						</div>

				
			
		</s:form>  </aside>
	</div>

</body>
</html>