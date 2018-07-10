<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>




<div>
	<div class="LongTable" style="height: 250px; overflow: auto;">
	<s:if test="%{#request.rCid==0}">
	<b>Following are the products sold to </b>&nbsp;<b style="color: blue;" > <%=request.getAttribute("tcName")%> </b> &nbsp;  <b> in bill No: &nbsp;</b> <b style="color:blue">  <%=request.getAttribute("billNo") %></b>
	</s:if>
	<s:else>
		<b>Following are the products sold to </b>&nbsp;<b style="color: blue;" > <%=request.getAttribute("customerName")%> </b> &nbsp;  <b> in bill No: &nbsp;</b> <b style="color:blue">  <%=request.getAttribute("billNo") %></b>
	</s:else>
	<br/>
		<table id="example1" class="table table-hover">
			<thead>
				<TR>
					<td>SERIAL NO</td>
					<td>ITEM NAME</td>
					<td>ITEM SIZE</td>
					<td>QUANTITY</td>
					<td>MRP</td>
					<td>TOTAL</td>
				</TR>
			</thead>
			<tbody>
				<s:if test="%{saleList.size>0}">
					<%
					int k = 1;
					%>
					<s:iterator value="saleList">
						<tr>
						
							<td><%=k%></td>
							<td><s:property value="itemName" /></td>
							<td><s:property value="itemSizeName" /></td>
							<td><s:property value="Qty" /></td>
							<td><s:property value="buyRate" /></td>
							<td><s:property value="itemtotal" /></td>
                   
						</tr>
						<%
						k++;
						%>
					</s:iterator>

				</s:if>
			</tbody>
		</table>
	
		
		   <div style="margin: 0">
					SubTotal (RS) :<b style="color: navy;"> <%=request.getAttribute("subtotal") %></b><br/>
					Discount (RS) :<b style="color: navy;"> <%=request.getAttribute("dis") %></b><br/>
					Unit Scheme (RS) :<b style="color: navy;"> <%=request.getAttribute("uScheme") %></b><br/>
					Vat (%) :<b style="color: navy;"> <%=request.getAttribute("vat") %></b><br/>
					Freight (RS) :<b style="color: navy;"> <%=request.getAttribute("lFreight") %></b><br/>
					<p style="font-size: 15px; font-weight: bolder;color: navy;">Grand Total (RS) :<%=request.getAttribute("pamount") %></p>
					
				</div>
	</div>

</div>
