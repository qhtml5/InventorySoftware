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
			<%
				String dn=(String)request.getAttribute("dn");
				if(dn.equalsIgnoreCase("NA"))
				{
			%>
			<p>
				<b>Following are the Purchase Details For Bill Number:
					&nbsp;&nbsp; "${requestScope['bill']}"</b>
			</p>
			<%
				}else{
			%>
			<p>
				<b>Following are the Debit Details For:<br/><br/>
				Debit Number: &nbsp;&nbsp; "${requestScope['dn']}" &nbsp;&nbsp; And &nbsp;&nbsp;
					Bill Number: &nbsp;&nbsp; "${requestScope['bill']}"</b>
			</p>
			<%
				}
			%>
			<br />
		</div>

		<div>
			<div class="LongTable" style="height: 250px; overflow-y: scroll;">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<td>CHALLAN NO</td>
							<td>ARTICLE CODE</td>
							<td>ARTICLE NAME</td>
							<td>Size</td>
							<td>QTY</td>
							<td>BUY RATE</td>
							<td>TOTAL</td>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{pLedgerList.size>0}">
							<s:iterator value="pLedgerList">
								<tr>
									<td><s:property value="challanNo" /></td>
									<td><s:property value="itemId" /></td>
									<td><s:property value="itemName" /></td>
									<td><s:property value="itemSize" /></td>
									<td><b style="color: blue;"><s:property value="totalItemQty" /></b></td>
									<td><s:property value="buyRate" /></td>
									<td><s:property value="itemTot" /></td>

								</tr>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
				<!-- <div style="margin:17px 47px 1px 405px"> -->
				<div style="margin: 0">
					SubTotal (RS) :<b style="color: navy;"> <%=request.getAttribute("subtot") %></b><br/>
					Discount (RS) :<b style="color: navy;"> <%=request.getAttribute("dis") %></b><br/>
					Unit Scheme (RS) :<b style="color: navy;"> <%=request.getAttribute("uScheme") %></b><br/>
					Vat (%) :<b style="color: navy;"> <%=request.getAttribute("vat") %></b><br/>
					Cst (%) :<b style="color: navy;"> <%=request.getAttribute("cst") %></b><br/>
					Way Bill No :<b style="color: navy;"> <%=request.getAttribute("waybill") %></b><br/>
					Freight (RS) :<b style="color: navy;"> <%=request.getAttribute("lFreight") %></b><br/>
					<p style="font-size: 15px; font-weight: bolder;color: navy;">Purchase Amount (RS) :<%=request.getAttribute("pamount") %></p>
					
				</div>
			</div>

		</div>
	</div>
	</section>