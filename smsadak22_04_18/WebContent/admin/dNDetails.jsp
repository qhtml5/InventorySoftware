<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content">

	<div class="row">
		<!-- left column -->
		<div style="font-size: 17px; font-family: monospace;" align="left">
			<p>
				<b>Following are the Purchase Details For DN Number:
					&nbsp;&nbsp; "${requestScope['dn']}"</b>
			</p>
			<br />
		</div>

		<div>
			<div class="LongTable">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<td>ITEM ID</td>
							<td>ITEM NAME</td>
							<td>ITEM SIZE</td>
							<td>QTY</td>
							<td>BUY RATE</td>
							<td>TOTAL</td>
							<td>CN NO</td>
							<td>CN DATE</td>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{stockDTOList.size>0}">
							<s:iterator value="stockDTOList">
								<tr>
									<td><s:property value="returnItemId" /></td>
									<td><s:property value="itemname" /></td>
									<td><s:property value="itemSize" /></td>
									<td><s:property value="returnItemQty" /></td>
									<td><s:property value="buyRate" /></td>
									<td><s:property value="returnItemTotal" /></td>
									<td><s:property value="cnNo" /></td>
									<td><s:property value="" /></td>

								</tr>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
			</div>
			<div style="float: right;"><p><b>Grand Total::<span style="color:blue;"> ${requestScope['gtot'] }</span></b> </p></div>
		</div>
	</div>
</section>