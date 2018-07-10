<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>

<html>
<head>
<!-- <meta http-equiv="refresh" content="5000"> -->
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

function check()
{
	alert("called");
	
	window.open("<%=request.getContextPath()%>/addItemCall.action", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=400, height=400");
	
}


function calledVal(val)
{
	
	document.getElementById("articlesCode").value=val;
	var page = "getArticleName.action?articleCode="+val;
	ajaxpagefetcher.load("articleName", page, true);
	
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
	 else
		 if(t==13)
	    {
			 document.getElementById('schDIV2').style.display='none';
			 document.getElementById('fade1').style.display='none'; 
		}
	
	 }
	 
	 function callMultipleRows()
	 {
// 		    document.getElementById('schDIV2').style.display='block'; 
// 		    document.getElementById('fade1').style.display='block';
		    var page ="getItemsSizeCall.action";
		    ajaxpagefetcher.load("multipleRows", page, true);
		 
	 }
	 
     var count=1;
	 function refreshRowsThreadEngine()
	 {
// 	       $("#result").load("getItemsSizeCall.action");// a function which will load data from other file after x seconds
	       
	       var page ="conReCall.action";
		   ajaxpagefetcher.load("result", page, true);
 	       document.getElementById('counter').innerHTML="Re-Initialization counter--"+count;
	       count++;
	 }
	  
	   setInterval('refreshRowsThreadEngine()', 60000); // refresh div after 5 secs
	            
	

</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="resetValue()" class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Purchase Master <small> Purchase product <img
				src="img/purchase.png" height="60px" width="60px"
				style="margin: -20px -21px -18px -6px" /></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Purchase Master</li>
		</ol>
		</section> <section class="content">
		
		<div id="validation"></div>
		<s:form action="addStockDetails.action" id="stockAdd" method="post"
			theme="simple">
			<div class="row">
				<div class="LongTable">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header"></div>

						<!-- ################################################################# Stock Form Design Start here ##########################################################  -->

						<!-- -------------------------------- Design for purchase entry panel start here ------------------------------------------------------------- -->
						<fieldset id="StockFieldSet">
						<legend id="stocklegend ">
						<label id="stocklegend">Add Purchase </label>
						</legend>
						<div style="margin: -7px 63px -27px 303px">
							<label for="PurchaseDate">Purchase Date:</label>
							<s:textfield name="stockDTO.purchaseDate" id="purchaseDate"
								cssStyle="width:91px;" theme="simple" />
								<input type="hidden" id="fYearS" name="fYearS"  value="${sessionScope['fYear']}">
								
                                <label for="Bill">Bill</label> <input type="text" id="bill"
									onfocus="clearZero(this)" style="width: 121px;"
									name="stockDTO.billNo" value=""
									onkeyup="checkDupBill(this.value); billCall()" /> <label
									for="CHALLAN">Challan</label> <input type="text" id="challan"
									onfocus="clearZero(this)" style="width: 121px;"
									name="stockDTO.challanNo" value="" onkeyup="billCall()" />
                           </div>
							<div style="margin: 34px 53px 20px 300px">
									<label for="SupplierList">Search Supplier</label>
							<s:textfield cssStyle="width:153px;" name="stockDTO.supplierName"
								id="supplierName" onfocus="clearZero(this)" theme="simple" />
							<img src="img/searchSupplier.png" width="41px" height="40px"
								onclick="supplierComboCall('<%=request.getContextPath()%>')"
								style="margin: 3px 38px -13px -3px; cursor: pointer;" />
							
							<img src="img/resetS.png" width="30px" height="27px"
						    onclick="refreshSupplierComboCall('<%=request.getContextPath()%>')"
							style="margin: 3px 38px -7px -36px; cursor: pointer;" />
							<div id="k" style="margin:-8px 26px 1px -2px">
							<s:select headerKey="0" onchange="callSuppChange('<%=request.getContextPath()%>')"
							headerValue="-Select Supplier-" list="supList"
							listKey="SupplierId" listValue="SUPPLIERNAME"
							name="stockDTO.supplierId"  id="supplierId" cssStyle="margin:-15px 35px 1px 355px" theme="simple" />
							</div>	
								
							</div>
						</fieldset>
						<!-- -------------------------------- Design for purchase entry panel End here ------------------------------------------------------------- -->

						<!-- -------------------------------- Design for Stock calculation panel start here ------------------------------------------------------------- -->
						<fieldset id="StockFieldSet">
							<legend id="stocklegend ">
								<label id="stocklegend">Add Articles </label>
							</legend>
							<br />
							<div id="flip">Add Items </div>
							
							<div id="panel">
								    Item Name : <input class="textboxStockItemShortAdd" type="text"
									onblur="calledaz2('<%=request.getContextPath()%>');"
									onkeyup="calledaz2('<%=request.getContextPath()%>');"
									id="iName" name="iName" size="12" /> Item type: <select
									id="itemTypeId" name="idto.itemTypeID">
									<option value="0">Select One</option>
									<s:iterator value="iCateoryList">
										<option value="<s:property value='itemTypeID'/>">
											<s:property value='itemType' />
										</option>
									</s:iterator>
								</select> Brand: <select id="itemBrandId" name="idto.itemBrandId"
									onchange="calledaz2('<%=request.getContextPath()%>');">
									<option value="0">Select One</option>
									<s:iterator value="brandList">
										<option value="<s:property value='itemBrandId'/>">
											<s:property value='itemBrandName' />
										</option>
									</s:iterator>
								</select> Unit: <select id="itemUnit" name="idto.itemUnit">
									<option value="0">Select One</option>
									<option value="PCS">PCS</option>
									<option value="DOZZEN">DOZZEN</option>
								</select> Generate Item Code: <input type="text"
									class="textboxStockItemShortAdd"
									onblur="calledaz2('<%=request.getContextPath()%>');"
									onkeyup="calledaz2('<%=request.getContextPath()%>');"
									name="idto.itemId" id="iCode" />


                                    <a href="#" id="hide" onclick=" clearfield();"> <img
										src="<%=request.getContextPath()%>/img/closeDiv.png"
										width="22px" height="22px"
										style="float: right; margin-right:79px; background-color: white; display: block;" />
									</a>

								<div id="addItemBt"
									style="height: 40px; width: 90%; padding-left: 400px; margin-top: 12px;">
									<input type="button" id="pbutton2" value="Submit"
										onclick="calledaz('<%=request.getContextPath()%>')" />
									
									<input type="button" value="Clear" onclick=" clearfield();" /> 

									<div id="resultUpdate"></div>
								</div>
							</div>

							<div style="width: 90%; margin: auto;">
								    <s:if test="itemList.size>0">
										<select name="articles" id="articlesCode"
										style="width:200 px;" onchange="test('<%=request.getContextPath()%>' )">
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
								<div id="articleName"
									style="float: none; width: 84px; height: 10px; margin: -21px 75px 27px 255px; font: italic;"></div>

								<div style="margin: -40px 34px 15px 396px">
									Buy-Rate:
									<s:textfield id="1" name="brate" onfocus="clearZero(this)"
										onkeyup="sum(1,3)" cssClass="textboxStockRateQuantityTotal"
										value="0" size="4" theme="simple" />
								</div>
								<br /> <br />

                               <div id="result"> DB Re- Initialization will start after 1 minute..</div><div id="counter"> </div>
                               
								<div id="multipleRows"
									style="width: 579px; margin: -34px 61px 55px 371px">
<%-- 								<input type="hidden" id="sizeListid" value="<%=request.getAttribute("listSize")%>" /> --%>
									<input type="hidden" id="sizeListid" value="<%=request.getAttribute("listSize")%>" />
									 <b
									style="margin: 32px 21px 45px 32px">ITEM Size</b> <b
									style="margin: 37px 21px 45px 93px;">ITEM Quantity</b> <b
									style="margin: 37px 21px 45px 63px;">ITEM Total</b>
									<div style="overflow: auto; height: 160px;">

										<table style="background-color: #F8F3E8;" width="100%;">
											<thead>
											</thead>
											<tbody>
												<s:if test="%{itemSizeList.size>0}">
													<%
														int k = 0;
													%>
													<s:iterator value="itemSizeList">
														<tr>
															<td>
															
																<input type="text" style="color: blue;font: bold;"  name="itemSizeName[]" value="<s:property value="itemSizeName" />" />
															</td>
															<td>
																<input type="text" name="tqty[]" onkeyup="calculateTotalStock(document.getElementById('tqty<%=k%>').value,<%=k%>)" id="tqty<%=k%>" onfocus="clearZero(this)" value="0" />
														</td>
															<td>
																<input type="text" disabled="disabled" name="ttot[]" id="ttot<%=k%>" style="color:blue; font:bold;" value="0" />
															</td>
														</tr>
														<input type="hidden" value="<%=k++%>" />
													</s:iterator>
												</s:if>
											</tbody>
										</table>
									</div>
								</div>



								<div style="margin: -67px 55px -59px 373px">
                             
<%-- 									Item Size:
									<s:select headerKey="0"
										onchange="test2('<%=request.getContextPath()%>')"
										headerValue="-Select Item Size-" list="itemSizeList"
										listKey="itemSizeName" listValue="itemSizeName"
										name="itemSize" id="itemSize" theme="simple" />


									Qty: <input type="text" id="3" onfocus="clearZero(this)"
										onkeyup="sum(1,3)" name="qty" value="0"
										class="textboxStockRateQuantityTotal" size="4" /> Item Total:
									<s:textfield id="tot" name="tot"
										cssClass="textboxStockRateQuantityTotal"
										onkeyup="disableFunction()" disabled="true" value="0" size="4"
										theme="simple" readonly="true" /> --%>
									<br /> <br /> <br />
									<button type="button"
										style="float: right; margin: -23px 339px -14px 0px"
										onclick="addRowEx2(this.form);">Add</button>
									<br /> <br />
									<!-- 											    <button type="button" style="float: right; margin: -24px 17px 0px 0px" onclick="callMultipleRows()">Add Multiple Rows</button> -->
								</div>
								<!-- <div id="paidFree" style="margin: -378px 4px -38px 96px">
									<div id="iMsg" style="float: left; margin: -208px 2px 0px;">
										<b style="color: blue;">(PAID ENTRY)</b>
									</div>
									<div style="clear: both"></div>
								</div>
								<input type="button"
									style="float: left; margin: -178px 71px 20px; border-color: blue; font: bolder;"
									id="freeItem" value="Click to Add Free Item"> <br /> <br /> -->

								<br />
								<hr id="suppLierHR" style="margin: margin:  0px 0px 0px -57px;" />
								<div
									style="margin: 14px -8px 48px 112px; border: 1px; border-color: black;">
									<table id="dataTable" class="CSSTableGenerator" width="350px"
										border="1">
										<TR>
											<td width="10px">SERIAL NO</td>
											<td>Article</td>
											<td>ITEM SIZE</td>
											<td>QTY</td>
											<td>BUY-RATE</td>
											<td>ITEM TOTAL</td>
										</TR>
									</table>
									<div style="height: 180px; overflow-y: auto;" id="itemRows"></div>
								</div>
								<!-- Here dynamic table will be created automatically !! -->


								<hr id="suppLierHR" />
								<br /> Sub Total: <input type="text" id="stockSubTotal"
									style="width: 85px;" class="textboxStockRateQuantityTotal"
									name="stockDTO.subTot" readonly="readonly" onkeyup="billCall()"
									value="0" /> Less Unit Scheme(Rs):
								<s:textfield cssClass="textboxStockRateQuantityTotal"
									onkeyup="calculateGrandTot();" value="0" id="lessUnit"
									name="stockDTO.lessUnitScheme" onfocus="clearZero(this)"
									size="4" />
								Less Discounts(%):
								<s:textfield cssClass="textboxStockRateQuantityTotal"
									onkeyup="calculateGrandTot();" value="0" id="discounts"
									name="stockDTO.discounts" onfocus="clearZero(this)" size="4" />
								
									Discount amount(RS) :
								<s:textfield cssClass="textboxStockRateQuantityTotal"
									onkeyup="calculateGrandTot();" value="0" id="discountamt"
									name="stockDTO.discountamt" onfocus="clearZero(this)" size="4" />
									
								<!-- VAt CST SELECTION -->
								<div style="width: 50%; height: 100px; float: left; margin: 50px 0 0 0">
									<button type="button" id="flipPay2" class="flipPay1"
										onclick="cashDiv1()">GST Rate calculation:</button>
									<div id="panelPay2" style="height: 80px;"><br /> 
										
										<table  style="width:100%">
										
										<tr style="background-color: #f6c792">
										<td>
										GST Rate %
										</td>
										<td>
										Gst AMT
										</td>
										<td>
										CGST Rate %
										</td>
											<td>
										CGST AMT
										</td>
									
											<td>
										SGST Rate %
										</td>
												<td>
										SGST AMT
										</td>
									
										</tr>
										
										<tr>
										<td>
											<s:textfield cssClass="textboxStockRateQuantityTotal"
										onkeyup="disableCst();calculateGrandTot();" value="0" id="vat"
										name="stockDTO.vat" onfocus="clearZero(this)" size="4" />
										</td>
										
										<td>
										<input type="text" name="gstamt" style="font-weight: bold; color: blue; " size="12" readonly="readonly" id="gstamt" value="0"/>
										</td>
										
											<td>
										<input type="text" name="cgstrate" style="font-weight: bold; color: blue; " size="12" readonly="readonly"  id="cgstrate" value="0"/>
										</td>
										
											<td>
										<input type="text" name="cgstamt" style="font-weight: bold; color: blue; "  size="12" readonly="readonly" id="cgstamt" value="0"/>
										</td>
										
											<td>
										<input type="text" name="sgstrate" style="font-weight: bold; color: blue; " size="12" readonly="readonly"  id="sgstrate" value="0"/>
										</td>
										
											<td>
										<input type="text" name="sgstamt" style="font-weight: bold; color: blue; " size="12" readonly="readonly"  id="sgstamt" value="0"/>
										</td>
										
										
										
										
										</table>
										<br/>
										
												<table  style="width:100%">
										
										<tr style="background-color: #f6c792">
										<td>
										IGST Rate %
										</td>
										<td>
										IGST AMT
										</td>
								
										</tr>
										
										<tr>
										<td>
											<s:textfield cssClass="textboxStockRateQuantityTotal"
										 value="0" onkeyup="igstcalculateGrandTot()"  id="igstrate"
										name="stockDTO.igstrate" onfocus="clearZero(this)" size="4" />
										</td>
										
										<td>
										<input type="text" name="igstamt" style="font-weight: bold; color: blue; " size="12" readonly="readonly" id="igstamt"value="0"/>
										</td>
									</tr>
										</table>
										
										
										
									
									</div>
								</div>
		
								<div style="width: 50%; height: 100px; float: left; margin: 50px 0 0 0;">
									<button type="button" id="flipPay3" class="flipPay1"
										onclick="chequeDiv1()">CST</button>
									<br /> <br />
									<div id="panelPay3" style="height: 80px; display: none">
										<table style="width: 100%">
											<tr>
												<td>
												<label for="customerSearch">Add CST(%):</label>
												</td>
												<td><s:textfield cssClass="textboxStockRateQuantityTotal"
													onkeyup="disableVat();calculateGrandTot();" value="0" id="cst"
													name="stockDTO.cst" onfocus="clearZero(this)" size="4" />
												</td>
											</tr>
											<tr>
												<td><label for="customerSearch">Way Bill No:</label></td>
												<td><s:textfield cssClass="textboxStockloc"
													onkeyup="disableVat();" value="" id="waybill"
													name="stockDTO.waybill" size="7" />
												</td>
											</tr>
										</table>
									</div>
								</div>
								
								
								<!-- VAt CST SELECTION -->
								
								
								
								Lorry Freight(Rs):
								<s:textfield cssClass="textboxStockRateQuantityTotal" value="0"
									id="lFreight" name="stockDTO.lorryFreight" size="4"
									onfocus="clearZero(this)" onkeyup="calculateGrandTot();" />
								<br />
								

								<div style="float: right;">
									<div style="margin: 34px 415px 18px;">
									<br/>
<br/>
<br/>
										<b>GRAND TOTAL:</b>
										<s:textfield cssClass="textboxStockRateQuantityTotal"
											value="0" disabled="disabled" id="stockGrandTotal"
											name="stockDTO.grandTot" size="4" />
										<input type="hidden" id="loopSize" value="0" />
									</div>

								</div>
								<div id="addStockBt">
									<s:submit cssClass="btnstock" id="sub" value="Add Purchase"
										onclick="this.value='Uploading Please wait..';this.disabled='disabled'; return validateStock();" />
								</div>

							</div>
							<div id="validation1"></div>
						</fieldset>
						<!-- -------------------------------- Design for Stock calculation panel start here ------------------------------------------------------------- -->

						<!-- ################################################################# Stock Form Design End here ##########################################################  -->
						<div class="box-footer"></div>
					</div>
				</div>
			</div>
		</s:form> </section>
	</div>
	<div id="openModal" class="modalbg"></div>
	<script>
		</script>
	</section>
	</aside>

	<!-- /.right-side -->
	</div>


	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDiv"></div>
	</div>


	<div id="schDIV2" class="white_content_Stock">
		<a href="#"
			onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDiv2" style="height: 450px"></div>
	</div>

	<div id="fade1" class="black_overlay"></div>


</body>
</html>