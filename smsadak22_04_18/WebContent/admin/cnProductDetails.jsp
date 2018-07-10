<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ page import="dTO.CreditNoteDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content">

	<div class="row">
		<!-- left column -->
		<div style="font-size: 17px; font-family: monospace;" align="left">
			<p>
				<b>Following are the Details OF BILL NO: 
					&nbsp;&nbsp; "${requestScope['billno']}"</b>
			</p>
			<br />
		</div>

		<div>
			<div class="LongTable">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<td>REFUND ITEM </td>
							<td>REFUND ITEM SIZE</td>
							<td>REFUND ITEM QUANTITY</td>
							
						</TR>
					</thead>
					<tbody>
						<s:if test="%{crList.size>0}">
							<s:iterator value="crList">
								<tr>
									<td><s:property value="refundItemId" /></td>
									<td><s:property value="refundItemSize" /></td>
									<td><s:property value="refundItemQty" /></td>
								</tr>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</section>