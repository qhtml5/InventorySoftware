<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>


<section class="content" onmouseover="called()">
<hr/>
	<div class="row">

		<div>
			<div class="LongTable" style="overflow-y: scroll; width: 100% " >
				<table id="example1" class="table table-hover" >
					<thead>
						<tr>
							<td align="center"><b>Sr No.</b></td>
							<td align="center"><b>Bill No.</b></td>
							<td align="center"><b>Date</b></td>
							<td align="center"><b>Item Name</b></td>
							<td align="center"><b>Item Code</b></td>
							<td align="center"><b>Item Size</b></td>
							<td align="center"><b>Quantity</b></td>
							<td align="center"><b>Return Qty</b></td>
							<td align="center"><b>MRP</b></td>
							<td align="center"><b>Item Total</b></td>
							<td align="center"><b>Sub Total</b></td>
							<td align="center"><b>Vat(<%=request.getAttribute("vat")%>)</b></td>
							<td align="center"><b>Grand Total</b></td>
						</tr>
					</thead>
					<tbody>
						<s:if test="%{saleList.size>0}">
							<%
								int k = 1;
							%>
							<s:iterator value="saleList">
								<tr>
									<td align="center"><%=k %></td>
									<td align="center">
										<s:property value="billno" />
										<input type="hidden" id="crBillNO<%=k%>" name="crBillNO[]" value='<s:property value="billno" />'>
									</td>
									<td align="center"><s:property value="Doc" /></td>
									<td align="center"><s:property value="itemName" /></td>
									<td align="center">
										<s:property value="itemId" />
										<input type="hidden" id="crItemId<%=k%>" name="crItemId[]" value='<s:property value="itemId" />'>
									</td>
									<td align="center">
										<s:property value="itemSizeName" />
										<input type="hidden" id="critemSize<%=k%>" name="critemSize[]" value='<s:property value="itemSizeName" />'>
									</td>
									<td align="center"><s:property value="Qty" /></td>
									<td align="center">
										<input type="text" id="crRtQty<%=k %>" name="crRtQty[]" value="0" onfocus="clearZero(this);"
										onkeyup="calculateCreditNoteVal(document.getElementById('crRtQty<%=k%>'),document.getElementById('crsaleRt<%=k%>'),document.getElementById('critemtotal<%=k%>'),<%=k%>)">
									</td>
									<td align="center">
										<s:property value="buyRate" />
										<input type="hidden" id="crsaleRt<%=k%>" name="crsaleRt[]" value='<s:property value="buyRate" />'>
									</td>
									<td align="center">
										<s:property value="itemtotal" />
										<input type="hidden" id="critemtotal<%=k%>" name="critemtot[]" value="0">
									</td>
									<td align="center">
										<s:property value="subtotal" />
									</td>
									
									<td align="center">
										<s:property value="taxamount" />
										<%-- <input type="hidden" id="crVat<%=k%>" name="crVat[]" value='<s:property value="vat" />'> --%>
									</td>
									
									<td align="center"><s:property value="grandTotal" /></td>
								</tr>
								<%
									k++;
								%>
							</s:iterator>
							<div style="margin: 29px 32px 27px 43px">
							Sub Total: <input type="text" id="crSubTot" style="font: bold;" name="crSubTot" value="0">
							Vat(%)<input type="text" id="crVat" style="font:xx-large;s"  name="crVat" value="<%=request.getAttribute("vat")%>">
							Grand Total<input type="text" id="crGTot" style="font: 15px;"  name="crGTot" value="0">
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total items found: <input type="text" id="crSize" size="3" name="crSize" value="<%=k-1%>">
							</div>
							<hr/>
						</s:if>
						
					</tbody>
				</table>
				
			</div>
			
			<br>
			<br>
			<s:submit cssClass="debitBTN" id="sub" value="Submit Details"
							onclick="" />
		</div>
	</div>
</section>