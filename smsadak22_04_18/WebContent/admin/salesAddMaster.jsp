<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>

<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<html>
<head>

<script src="js_user/customerMgmt.js" type="text/javascript"></script>
<!--Css For Sliding Tab -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/liquid-slider.css">
<!--Css For Sliding Tab -->

<style type="text/css" media="screen">
@import "css/simpletabs.css";
</style> 
<%-- <script src="http://www.google.com/jsapi"></script> --%>

<%@include file="../upp.jsp"%>

<!--Js For Sliding Tab -->
<%-- <script --%>
<%-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script> --%>
<script type="text/javascript" src="js/simpletabs_1.3.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery.liquid-slider.min.js"></script>
<!--Js For Sliding Tab -->


<link href="css/modalShow.css" rel="stylesheet" />

<script>

function calledVal(val)
{
	
	document.getElementById("saleArticlesCode").value=val;

	var saleArticlesCode=val;
	if(saleArticlesCode == 0){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if(saleArticlesCode == ""){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else{
		var page ="getItemFromStock.action?articlesCode="+saleArticlesCode;
		ajaxpagefetcher.load("articleNameDiv", page, true);
	}
	
	}
	
	function called() {
		$("#example1").dataTable();
	}
	 var t_cel,tc_ln;
	 if(document.addEventListener){
	   document.addEventListener("keypress",keyCapt,false);
	 }else{
	   document.attachEvent("onkeypress",keyCapt); 
	 }
	 
	 function keyCapt(e)
	 {
     var t=e.keyCode;
	 if(t==112)
		 {
		
	    document.getElementById('schDIV2').style.display='block'; 
	    document.getElementById('fade1').style.display='block';
	    var page ="getItemsCall.action";
	    ajaxpagefetcher.load("lDetailsDiv2", page, true);
		 }
	 if(t==13)
	    {
		   
			 document.getElementById('schDIV2').style.display='none';
			 document.getElementById('fade1').style.display='none'; 
		}
	 }

</script>

</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="resetSaleValue()" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			SALES MASTER <b style="color:red">Now GST ready</b> <small> Sale your product <img src="img/sales.png" height="60px" width="60px" style="margin: -14px -21px -15px 2px"/></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">SALES MASTER</li>
		</ol>
		</section> <section class="content"> 
		<div id="validation"></div>
		
		<s:form action="addSalesDetails.action" id="salesAdd" method="post" theme="simple">
			<div class="row">
				<div class="LongTable">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header"></div>

<!-- ################################################################# Sales Form Design Start here ##########################################################  -->

						<div style="float: none; padding: 0px 0px 0px 300px;">
							<label for="SalesDate" style="float: left;">Sales Date:</label>
							<s:textfield name="saleDto.Doc" id="salesDate"
								cssStyle="width:158px; float: left;" theme="simple" />
							<input type="hidden" id="fYearS" name="fYearS"  value="${sessionScope['fYear']}">
							
							<label for="Bill" style="float: left; margin-left: 30px;">Bill</label>
							 <s:textfield id="saleBill" cssStyle="width: 158px; float: left;" onfocus="clearZero(this)" name="saleDto.billno"
							 onkeyup="checkDupSalesBill(this.value);"  />

						</div>
						<div style="clear: both;"></div>

						<div style="margin: 37px 0px 0px 10px; background-color: #F8F3E8;">
						<hr id="salesHR2" />
							<fieldset>
								<legend>
									<label>Add Articles </label>
								</legend>
								
								<div style="width: 50%; height: 100px; float: left;">
									<div id="flipSale1">Registered Customers</div>
									<div id="panelSale1">
	
											<label for="customerSearch">Search Customer:</label>
											<s:textfield name="" onfocus="clearZero(this)" id="customerName" onkeyup="getCustByName()"
											cssClass="textboxStockloc" theme="simple" />
			
											<div id="custNameDiv" style="padding: 10px 0 0 100px; cursor: pointer;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select name="customerId" id="customerId" onchange="regcusDivValidation()">
													<option value="0">--Select Customer--</option>
													<s:iterator value="cList">
														<option value="<s:property value='customerId'/>">
															<s:property value="cName" />=><s:property value="address" />
														</option>
													</s:iterator>
												</select>
											</div>
									</div>
								</div>
								
								<div style="width: 50%; height: 100px; float: left;">
									<div id="flipSale">One Time Customers</div>
									<div id="panelSale">
	                                    
	                                    <label for="customerSearch">Customer Barcode:</label>
	                                    <s:hidden name="saleDto.incnum"></s:hidden>
	                                    <s:textfield name="saleDto.tempCustBarcode" id="tempCustBarcode" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation(document.getElementById('tempCustBarcode'))" onblur="otcDivValidation(document.getElementById('tempCustBarcode'))" theme="simple" /> &nbsp; <a href="#" onclick="addonttimetempCustomer()" >Add one time customer </a><img src="img/customers.png" height="25px" width="25px" style="margin: 9px 22px -6px 0px;" />   &nbsp; <a href="#" onclick="addtempCustomer()" >Add Customer </a><img src="img/customers.png" height="25px" width="25px" style="margin: 9px 22px -6px 0px;" />
	                                    <br/>
	                                    <br/>
	                                    <br/>
	                                    <br/>
										<div id="tempCust" style="border-style: solid;  border-width: 1px; border-style: solid; margin:-37px 14px 49px -2px; ">
										<label for="customerSearch">Customer Name:</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.tempCustName" id="otcName" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /><br/>
										<label for="customerSearch">Mobile:</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.temCustMobileNo" id="otcMobile" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /><br/>
										<label for="customerSearch">Address:</label>
												<s:textarea name="saleDto.tempCustAddress" id="otcAddr" cols="65" rows="0"  onkeyup="otcDivValidation()" theme="simple" />
										</div>
									</div>
								</div>
						<div style="clear: both;"></div>
						<br/>
						<br/>
						<br/>
						<br/>
						<hr id="salesHR2" />
					<!-- -------------------------------- Design for Sales calculation panel start here ------------------------------------------------------------- -->

									<div style="width: 90%; !important; margin: 30px 0 0 0;">

										Item Code :
											<%--  <input type="text" class="textboxStockloc" id="saleArticlesCode" onfocus="clearZero(this)"
											onkeyup="getItemFromStock('<%=request.getContextPath()%>')"
											name="saleDto.itemId" size="10" /> --%>
											<s:if test="itemList.size>0">
												<select name="saleDto.itemId" id="saleArticlesCode"
												style="width:300 px;" onchange="getItemFromStock('<%=request.getContextPath()%>')">
												<option value="0">-Select Item-</option>
												<s:iterator value="itemList">
													<option value='<s:property value="itemId" />'>
														<s:property value="itemId" /> -
														<s:property value="itemName" />
													</option>
												</s:iterator>
											</select>
											</s:if>
											<s:else><p style="color: red;">No Item Found. Please Add New Item.</p></s:else>
				
											<br/>
											<br/>									
											<div id="articleNameDiv" style="
												 margin:  4px 0px 0px 68px; font: italic;"></div>
										
									</div>
									<br/>
									<br/>
									
									<hr id="salesHR2" />
									<br/>
									<br/>
									<br/>
								
										<table width="90%"
										style="border: 1px;" border="1">
												<tr>
		<td style="background-color: #4CAF50;">
		<b  >Item Names</b></td>
		<td style="background-color: #4CAF50;"><b >HSN code</b></td>
		<td style="background-color: #4CAF50;"><b >Item Size</b></td>
		<td style="background-color: #4CAF50;"><b >Available Qty</b></td>
		<td style="background-color: #4CAF50;"><b >Sale Qty</b></td>
		<td style="background-color: #4CAF50;"><b >MRP</b></td>
		<td style="background-color: #4CAF50;"><b >Base total</b></td>
		<td style="background-color: #4CAF50;"><b >Disc RS</b></td>
		<td style="background-color: #4CAF50;"><b >Disc %</b></td>
		<td style="background-color: #4CAF50;"><b >Disc AMT</b></td>
		
		<td style="background-color: #4CAF50;"><b >GST %</b></td>
		<td style="background-color: #4CAF50;"><b >GST AMT</b></td>
		<td style="background-color: #4CAF50;"><b >Total</b></td>
		<td style="background-color: #4CAF50;"><b >CGST RATE</b></td>
		<td style="background-color: #4CAF50;"><b >CGST AMT</b></td>
		<td style="background-color: #4CAF50;"><b >SGST RATE</b></td>
		<td style="background-color: #4CAF50;"><b >SGST AMT</b></td>
		<td style="background-color: #4CAF50;"><b >IGST RATE</b></td>
		<td style="background-color: #4CAF50;"><b >IGST AMT</b></td>
		<td style="background-color: #4CAF50;"><b >Delete</b></td>
		
		
		
		</tr>
		
		<tbody style="height: 180px; overflow-y: scroll;" id="salesItemRows">
		
		
		</tbody>
										</table>
										
									
									<!-- Here dynamic table will be created automatically !! -->


									<hr id="salesHR" />
									<br />
									<div style="margin: 30px 10px 25px;">
										Sub TOTAL: <s:textfield id="salesSubTotal"
											cssStyle="width: 85px;" cssClass="textboxStockRateQuantityTotal"
											name="saleDto.subtotal" readonly="readonly"
											value="0" />
										
										Less Unit Scheme(Rs):
										<s:textfield cssClass="textboxStockRateQuantityTotal"
											onkeyup="calSaleGrandTot();" onfocus="clearZero(this)" value="0" id="saleslessUnit"
											name="saleDto.lessUnit" size="4" />
									
									
									
									<%-- 
										
										Less Discounts(Rs):
										 <s:textfield cssClass="textboxStockRateQuantityTotal"
											onkeyup="calSaleGrandTot();" onfocus="clearZero(this)" value="0" id="salesDiscountsRupees"
											name="saleDto.lessDiscountst" size="4" />
											
												<select name="saleDto.lessDiscount" id="salesDiscounts" onchange="calSaleGrandTot()">
													<option value="0">--Select Discount--</option>
												    <option value="5">5%</option>
													<option value="10">10%</option>
													<option value="15">15%</option>
													<option value="20">20%</option>
													<option value="25">25%</option>
													<option value="30">30%</option>
													<option value="35">35%</option>
													<option value="40">40%</option>
													<option value="45">45%</option>
													<option value="50">50%</option>
													<option value="55">55%</option>
													<option value="60">60%</option>
													
												</select>
												
												Amount after discount:
										<s:textfield cssClass="textboxStockRateQuantityTotal"
											onkeyup="calSaleGrandTot();" onfocus="clearZero(this)" value="0" id="afterdiscount"
											name="afterdiscount" size="4" />
											
											<br/>
											<br/>
										
										
										<s:textfield cssClass="textboxStockRateQuantityTotal"
											onkeyup="calSaleGrandTot();"  readonly="true" value="0" id="salesVat"
											name="saleDto.Vat" size="4" />
										
										Less Lorry Freight(Rs):
										<s:textfield cssClass="textboxStockRateQuantityTotal"
											value="0" id="salesLFreight" onfocus="clearZero(this)" name="saleDto.lessloryFreight" size="4"
											onkeyup="calSaleGrandTot();" />
										<br />
										--%>
									</div>
									<hr id="salesHR" />
									
									<div style="float: right;">
									
										<div style="margin: 25px 487px 14px;">
										
											<b>Total QTY:</b>
											<input type="text" id="totqtys" class="textboxStockRateQuantityTotal" readonly="readonly" name="totqtys" value="0"/>
										
										</div>
									
									
										<div style="margin: 25px 487px 14px;">
										
											<b>GRAND TOTAL:</b>
											 <s:textfield cssClass="textboxStockRateQuantityTotal"
												value="0" disabled="disabled" id="salesGrandTotal"
												name="saleDto.grandTotal" size="4" />
											<input type="hidden" id="salesLoopSize"  value="0" />
											</br>
											</br>
											<div style=" border-color: black; border-style: dashed;"><b>Due :</b><input type="checkbox" name="DueStatus" id="dueStatus"  value="Due"></div>
										</div>
						
										</div>
									

									</div>
									<div id="addSaleBt">
									<s:submit cssClass="btnstock" id="sub" value="Add Sale"
										onclick="this.value='Saling Please wait..';this.disabled='disabled'; return validateSale();" />
									</div>
								</div>
								
							</fieldset>
							<div id="validation1" style="margin: 0px 0px 0px -327px"></div>
						</div>
						
					<!-- -------------------------------- Design for Sales calculation panel start here ------------------------------------------------------------- -->

<!-- ################################################################# Sales Form Design End here ##########################################################  -->
					</div>
					
				</div>
				
			</div>
		</s:form> </section> </aside>
           <div id="schDIV" class="white_content_login">
				<a href="#" onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				        <img src="img/Close-button.png" border="0" />
				 </a>
				 
				 <div id="lDetailsDiv"></div>
			</div>
			
			
			<div id="schDIV2" class="white_content_Stock">
				<a href="#" onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
				        <img src="img/Close-button.png" border="0" />
				 </a>
				 
				 <div id="lDetailsDiv2"  style="height: 450px"></div>
			</div>
			
			<div id="schDIV3" class="white_content_SalesCustomerDetailsView">
				<a href="#" onclick="document.getElementById('schDIV3').style.display='none';document.getElementById('fade1').style.display='none'">
				        <img src="img/Close-button.png" border="0" />
				 </a>
				 
				 <div id="tCusBuyDiv"></div>
			</div>
			
			
			<div id="fade1" class="black_overlay"></div>
	</div>
</body>
</html>