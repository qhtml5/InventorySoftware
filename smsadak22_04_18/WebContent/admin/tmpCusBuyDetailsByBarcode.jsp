<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>


<section class="content" onmouseover="called()">
	<div class="row">
		<div style="font-size: 17px; font-family: monospace;" align="left">
			<p>
				<b>Following are the Sales Details For: &nbsp;<%=request.getAttribute("tcName")%><br />
				
				Total sale amount to customer :<%=request.getAttribute("totalSellAmount") %></b>
				<br />
			</p>
		</div>

		<div>
			<div class="LongTable" style="overflow-y: scroll; width: 100% " >
				<table id="example1" class="table table-hover" >
					<thead>
						<tr>
							<td align="center"><b>Sr No.</b></td>
							<td align="center"><b>Bill No.</b></td>
							<td align="center"><b>Date</b></td>
							<td align="center"><b>Item Name</b></td>
							<td align="center"><b>Item Size</b></td>
							<td align="center"><b>Quantity</b></td>
							<td align="center"><b>MRP</b></td>
							<td align="center"><b>Item Total</b></td>
							<td align="center"><b>Sub Total</b></td>
							<td align="center"><b>Unit Scheme</b></td>
							<td align="center"><b>Discount</b></td>
							<td align="center"><b>Vat(<%=request.getAttribute("vat")%>)</b></td>
							<td align="center"><b>Freight</b></td>
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
									<td align="center"><s:property value="billno" /></td>
									<td align="center"><s:property value="Doc" /></td>
									<td align="center"><s:property value="itemName" /></td>
									<td align="center"><s:property value="itemSizeName" /></td>
									<td align="center"><s:property value="Qty" /></td>
									<td align="center"><s:property value="buyRate" /></td>
									<td align="center"><s:property value="itemtotal" /></td>
									<td align="center"><s:property value="subtotal" /></td>
									<td align="center"><s:property value="lessUnit" /></td>
									<td align="center"><s:property value="lessDiscount" /></td>
									<td align="center"><s:property value="taxamount" /></td>
									<td align="center"><s:property value="lessloryFreight" /></td>
									<td align="center"><s:property value="grandTotal" /></td>
								</tr>
								<%
									k++;
								%>
							</s:iterator>
						</s:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
