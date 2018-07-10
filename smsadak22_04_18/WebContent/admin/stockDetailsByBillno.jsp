<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

		<div>
			<div class="LongTable" style="height: 250px;overflow: auto;">
			<b>Followings are the available stocks details of Bill No: &nbsp;</b> <b style="color: blue; "><%=request.getParameter("billNo") %></b>
				<br/><br/><table id="example1" class="table table-hover">
					<thead >
						<TR >
							<td>SERIAL NO</td>
							<td>ITEM NAME</td>
							<td>ITEM SIZE</td>
							<td>QUANTITY</td>
							<td>BUY RATE</td>
							<td>TOTAL</td>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{stockDTOList.size>0}">
						<%int k=1; %>
							<s:iterator id="st" value="stockDTOList">
								<tr>
									<td><%=k %></td>
								
									<td><s:property value="itemname" /></td>
									<td><s:property value="itemSize" /></td>
									<td>
									<s:if test="#st.qty> 0">
									<b style="color: blue;"><s:property value="qty" /></b>
									</s:if>
									<s:else><b style="color: red;"><s:property value="qty" /> (Out of Stock)</b></s:else></td>
									<td><s:property value="buyRate" /></td>
									<td><s:property value="itemTotal" /></td>

								</tr>
								<% k++; %>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
				<div style="margin:17px 47px 1px 405px">Total  price (RS) :<b style="color: navy;"> <%=request.getAttribute("subtotal") %></b></div>
			</div>

		</div>
