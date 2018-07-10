<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.PurchaseLedgerDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content" onmouseover="called()">



	<div class="row">
		<!-- left column -->
		<div style="font-size: 17px; font-family: monospace;" align="left">
			
			<p>
				<b>Following are the Details For Item:
					&nbsp;&nbsp; "${requestScope['itemName']}"</b>
			</p>
			<br />
		</div>

		<div style="overflow:auto; height:250px;">
			<div class="LongTable"  >
				<table id="example1" class="table table-hover">
					<thead>
						<TR><td><b>PURCHASE DATE</b></td>
							<td><b>Size</b></td>
							<td><b>QTY(Pieces)</b></td>
							<td><b>Buy Rate (RS)</b></td>
							<td><b>Total Item Purchased (RS)</b></td>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{stockDTOList.size>0}">
							<s:iterator id="e" value="stockDTOList">
								<tr>
								    <td><s:property value="purchaseDate" /></td>
									<td><s:property value="itemSize" /></td>
									<td>
									
									
									<s:if test="#e.qty>0">
									<b style="color: blue;"><s:property value="qty" /></b>
									</s:if>
									<s:else>
									<b style="color: red;">Out of stock</b>
									</s:else>
									</td>
									<td>
									
									<b style="color: blue;"><s:property value="buyRate" /></b></td>
									<td>
									<s:if test="#e.itemTotal>0">
									<b style="color: blue;"><s:property value="itemTotal" /></b>
									</s:if>
									<s:else>
									<b style="color: red;"><s:property value="itemTotal" />&nbsp; </b>
									</s:else>
									</td>
								</tr>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
			</div>
                                             <div style="margin:17px 47px 1px 4px">Total  price (RS) :
                                             <% Float itemTotals= (Float)request.getAttribute("itemTotals"); %>
                                             <s:if test="%{#request.itemTotals>0}">
                                             <b style="color: navy;"> <%=request.getAttribute("itemTotals") %></b>
                                             </s:if>
                                             <s:else>
                                              <b style="color: red;"> <%=request.getAttribute("itemTotals") %> &nbsp; (Out of Stock)</b>
                                             </s:else>
                                             
                                             </div>
		</div>
	</div>