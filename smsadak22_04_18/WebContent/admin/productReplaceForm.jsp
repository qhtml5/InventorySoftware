<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>

<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<html>
<head>

<script src="js_user/customerMgmt.js" type="text/javascript"></script>


<%@include file="../upp.jsp"%>

<link href="css/modalShow.css" rel="stylesheet" />



</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="resetSaleValue()" class="skin-blue">

	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<%@include file="../aside.jsp"%>

		<aside onchange="called()" id="addContent" class="right-side">
			<section class="content-header">
			<h1>
				SALES MASTER <small><b>Replace damaged product</b> <img
					src="img/sales.png" height="60px" width="60px"
					style="margin: -14px -21px -15px 2px" /></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="adminIndexCall.action">Home</a></li>
				<li class="active">Product Replacement</li>
			</ol>
			</section> 
			
			<section class="content">
				<div id="validation"></div>
				<s:form action="replaceProduct.action" id="salesAdd" method="post"
					theme="simple">
					<div class="row">
						<div class="LongTable">
							<!-- general form elements -->
							<div class="box box-primary">
								<div class="box-header"></div>
		
								<div style="float: none; padding: 0px 0px 0px 300px;">
									<label for="SalesDate" style="float: left;">Sales Date:</label>
									<s:textfield name="saleDto.Doc" id="salesDate"
										cssStyle="width:158px; float: left;" theme="simple" />
									<input type="hidden" id="fYearS" name="fYearS"
										value="${sessionScope['fYear']}"> <label for="Bill"
										style="float: left; margin-left: 30px;">Bill</label>
									<s:textfield id="saleBill" cssStyle="width: 158px; float: left;"
										onfocus="clearZero(this)" name="saleDto.billno"
										onkeyup="" />
		
								</div>
								<div style="clear: both;"></div>
								<fieldset>
									<div style="margin: 37px 0px 0px 10px; background-color: #F8F3E8;">
										<hr id="salesHR2" />
											<legend>
												<label>Add Articles </label>
											</legend>
			
											<div style="width: 50%; height: 100px; float: left;">
												<div id="panelSale1">
			
													<label for="customerSearch">Search Customer:</label>
													
												<select name="customerBarcode" id="customerBarcode"
														
														onchange="getCreditNoteList()" style="width: 300px;"> 
														
 														
															<option value="0">--Select Customer--</option>
															<s:iterator value="cListSales">
																<option value="<s:property value='customerId'/>">
																	<s:property value="cName" />
																	=>
																	<s:property value="address" />
																</option>
															</s:iterator>
														</select>
														
														<label for="customerSearch" style="margin: 50px 0 0 80px">Search Credit Note No:</label>
														<div id="cnListDiv" style="width: 300px; float: right; margin: 50px 0 0 0px">
															
														</div>
												</div>
											</div>
			
											
											<div style="clear: both;"></div>
											<hr id="salesHR2" />
											<!-- -------------------------------- Design for Sales calculation panel start here ------------------------------------------------------------- -->
			
											<div style="width: 90%; ! important; margin: 30px 0 0 0;">
			
												Item Code :
												<s:if test="itemList.size>0">
													<select name="saleDto.itemId" id="saleArticlesCode"
														style="width: 300 px;"
														onchange="getItemFromStock('<%=request.getContextPath()%>')">
														<option value="0">-Select Item-</option>
														<s:iterator value="itemList">
															<option value='<s:property value="itemId" />'>
																<s:property value="itemId" />
																-
																<s:property value="itemName" />
															</option>
														</s:iterator>
													</select>
												</s:if>
												<s:else>
													<p style="color: red;">No Item Found. Please Add New Item.</p>
												</s:else>
			
												<br /> <br />
												<div id="articleNameDiv"
													style="margin: 4px 0px 0px 68px; font: italic;"></div>
											</div>
											<br /> <br />
			
											<hr id="salesHR2" />
											<br /> <br /> <br />
											<div
												style="margin: -23px 9px 75px 113px; height: 300px; border: 1px; border-color: black;">
												<table id="dataTable" class="CSSTable" border="1">
													<TR>
														<td width="10px">SERIAL NO</td>
														<td>ItemCode</td>
														<td>Item Name</td>
														<td>Size</td>
														<td>Qty</td>
														<td>Rate</td>
														<td>Total</td>
													</TR>
												</table>
												<div style="height: 180px; overflow-y: scroll;"
													id="salesItemRows"></div>
											</div>
											<!-- Here dynamic table will be created automatically !! -->
			
											<hr id="salesHR" />
											<br />
											<div style="margin: 30px 10px 25px;">
												Sub TOTAL:
												<s:textfield id="salesSubTotal" cssStyle="width: 85px;"
													cssClass="textboxStockRateQuantityTotal"
													name="saleDto.subtotal" readonly="readonly" value="0" />
			
												Less Unit Scheme(Rs):
												<s:textfield cssClass="textboxStockRateQuantityTotal"
													onkeyup="calSaleGrandTot();" onfocus="clearZero(this)"
													value="0" id="saleslessUnit" name="saleDto.lessUnit" size="4" />
			
												Less Discounts(Rs):
												<s:textfield cssClass="textboxStockRateQuantityTotal"
													onkeyup="calSaleGrandTot();" onfocus="clearZero(this)"
													value="0" id="salesDiscounts" name="saleDto.lessDiscount"
													size="4" />
			
												Add VAT(%):
												<s:textfield cssClass="textboxStockRateQuantityTotal"
													onkeyup="calSaleGrandTot();" onfocus="clearZero(this)"
													value="0" id="salesVat" name="saleDto.Vat" size="4" />
			
												Less Lorry Freight(Rs):
												<s:textfield cssClass="textboxStockRateQuantityTotal" value="0"
													id="salesLFreight" onfocus="clearZero(this)"
													name="saleDto.lessloryFreight" size="4"
													onkeyup="calSaleGrandTot();" />
												<br />
											</div>
											<hr id="salesHR" />
			
											<div style="float: right;">
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
											<div id="addSaleBt">
												<s:submit cssClass="btnstock" id="sub" value="Add Sale"
													onclick="this.value='Saling Please wait..';this.disabled='disabled'; return validateProReplace();" />
											</div>
									</div>
								</fieldset>
								<div id="validation1" style="margin: 0px 0px 0px -327px"></div>
							</div>
						</div>
					</div>
				</s:form>
			</section>
		</aside>
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

	<div id="schDIV3" class="white_content_SalesCustomerDetailsView">
		<a href="#"
			onclick="document.getElementById('schDIV3').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="tCusBuyDiv"></div>
	</div>


	<div id="fade1" class="black_overlay"></div>
	</div>
</body>
</html>