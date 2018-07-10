<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script src="js_user/customerMgmt.js" type="text/javascript"></script>

<%@include file="../upp.jsp"%>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<hr id="debitNoteHR" />
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<!-- Right side column. Contains the navbar and content of the page -->
		<section class="content" onmouseover="called()">
			<div class="row">
				<!-- left column -->
				<!-- ########################################################################################################################################################## -->
				<!-- ############################################################### Debit Note Calculation area ... start here################################################ -->
				<!-- ########################################################################################################################################################## -->
				<div id="aboutScheme">
					<div class="LongTable">
						<div id="dTab" style="overflow: auto; height: 250px;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><b>Sl. No.</b></th>
										<th><b>Article Number</b></th>
										<th><b>Article Name</b></th>
										<th><b>Size</b></th>
										<th><b>QTY/Updated QTY</b></th>
										<th><B>Return QTY</b></th>
										<th><b>BUY-RATE</b></th>
										<th><b>Item total/Update Item total</b></th>
										<th><b>Return Item total</b></th>
									</tr>
								</thead>
								<tbody>
									<s:if test="%{stockDTOList.size>0}">
										<%
											int k = 0;
											int sr=1;
										%>
										<s:iterator value="stockDTOList">
											<tr>
												<td width="10px" align="center">
													<%=sr %>
													<input type="hidden" name="stockid" id="stockid" value="<s:property value="stockid" />" />
												</td>
												<td>
													<s:property value="itemIds" />
													<input type="hidden" value="<s:property value="itemIds" />" name="itemids" />
												</td>
												<td>
													<s:property value="itemname" />
												</td>
												<td>
													<s:property value="itemSize"  />
													<input type="hidden" name="itemSize" value="<s:property value="itemSize"/>"/> 
												</td>
												<td>
													<input type="text" name="qty" id="qty<%=k%>"
													class="textboxStockRateQuantityTotal" readonly="readonly"
													value="<s:property value="qty" />" />
													
													<input type="text" readonly="readonly" id="uQty<%=k%>" name="uqty"
													style="background-color: #F2EDDF; color: red;" size="2"
													value="0" />
												</td>
												<td>
													<input type="text" name="rqty" id="rqty<%=k%>"
													onfocus="clearZero(this)"
													onkeyup="calculateDebitNote(document.getElementById('qty<%=k%>').value,document.getElementById('rqty<%=k%>').value,document.getElementById('itemTotal<%=k%>').value,<%=k%>,document.getElementById('buyRate<%=k%>').value)"
													onblur="exceedQtyChk(document.getElementById('updateFinalTotal<%=k%>'), document.getElementById('rqty<%=k%>'), document.getElementById('uQty<%=k%>'), document.getElementById('rItemtot<%=k%>'))")"
													style="background-color: #F2EDDF; font-weight: bold;"
													value='0' size="4" />
												</td>
												<td>
													<input type="text" name="buyRate"
													id="buyRate<%=k%>" readonly="readonly"
													class="textboxStockRateQuantityTotal"
													value="<s:property value="buyRate" />" />
												</td>
												<td>
													<input type="text" name="itemTotal"
													id="itemTotal<%=k%>" readonly="readonly"
													class="textboxStockRateQuantityTotal"
													value="<s:property value="itemTotal" />" />
													
													
													<input type="text" style="background-color: #F2EDDF; color: red;"
													name="updItemtot" readonly="readonly"
													id="updateFinalTotal<%=k%>" size="4" value="0" />
												</td>
												<td>
													<input type="text" name="returnItemtotal"
													id="rItemtot<%=k%>" readonly="readonly"
													style="background-color: #F2EDDF; color: red;" value="0"
													size=4 />
												</td>
											</tr>
											<input type="hidden" value='<%=k++%>' />
											<%sr++; %>
										</s:iterator>
									</s:if>
								</tbody>
							</table>
						</div>
						<hr id="debitNoteHR" />
						<br /> Return sub total:
						<s:textfield id="returnSubTotal"
							cssClass="textboxStockRateQuantityTotal" name="stockDTO.subTot"
							value="0" />
							<s:hidden name="stockDTO.taxamount" id="taxamount" />
						<s:hidden id="upstockSubTotal"
							cssClass="textboxStockRateQuantityTotal" name="stockDTO.subTot"
							onkeyup="billCall()" />
						<s:hidden name="stockDTO.subTot" id="stockSubTotal" />
						<%-- Less Unit Scheme(Rs):	<s:textfield  cssClass="textboxStockRateQuantityTotal" onkeyup="calculateGrandTot();" 
												id="lessUnit" name="stockDTO.lessUnitScheme" size="4" />
											Less Discounts(Rs):<s:textfield   cssClass="textboxStockRateQuantityTotal" onkeyup="calculateGrandTot();" 
												id="discounts" name="stockDTO.discounts" size="4" />--%>
						Vat(%):
						<s:textfield cssClass="textboxStockRateQuantityTotal"
							onkeyup="calculateGrandTot();" id="vat" name="stockDTO.vat"
							size="4" />
						or, Cst(%):
						<s:textfield cssClass="textboxStockRateQuantityTotal"
							onkeyup="calculateGrandTot();" id="cst" name="stockDTO.cst"
							size="4" />
							
						Way Bill No:
						<s:textfield cssClass="textboxStockRateQuantityTotal"
							id="waybill" name="stockDTO.waybill"
							size="6" readonly="true" />
						<b>RETURN GRAND TOTAL:</b>
						<s:textfield cssClass="textboxStockRateQuantityTotal"
							id="stockGrandTotal" name="stockDTO.grandTot" size="4" value="0" />
						<s:hidden name="stockDTO.listSize" id="stockDTO" />
						<%--Less Lorry Freight(Rs):<s:textfield   cssClass="textboxStockRateQuantityTotal" 
												id="lFreight" name="stockDTO.lorryFreight" size="4" onkeyup="calculateGrandTot();" /> --%>
						<br />
						<hr id="debitNoteHR" />
						<div style="float: right;">
							<div style="margin: 34px 415px 18px;"></div>
						</div>
						<s:submit cssClass="debitBTN" id="sub" value="Add Debit details"
							onclick="this.value='Adding Please wait..';this.disabled='disabled'; return validateDebitCalc()" />
					</div>
					<div id="schDIV" class="white_content_login">
						<a href="javascript:void(0) "
							onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none',location.reload()">
							<img src="img/Close-button.png" border="0" />
						</a>
						<p id="schemeNameDIV"></p>
					</div>
					<div id="fade1" class="black_overlay"></div>
				</div>
			</div>
			<!-- ########################################################################################################################################################## -->
			<!-- ############################################################### Debit Note Calculation area ... end here################################################ -->
			<!-- ########################################################################################################################################################## -->
			<!-- left column -->
			<br /> <br /> <br />
		</section>
		<!-- /.right-side -->
	</div>
</body>
</html>