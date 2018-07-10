<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content" onmouseover="called()">

	<div class="row">
		<!-- left column -->

		<div id="aboutScheme">

			<div class="LongTable">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<th><b>DN NO</b></th>
							<th><b>DN DATE</b></th>
							<th><b>INVOICE/BILL NO</b></th>
							<th><b>VAT (%)</b></th>
							<th><b>CST (%)</b></th>
							<th><b>WAY BILL NO</b></th>
							<th><b>DETAILS</b></th>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{stockDTOList.size>0}">
							<s:iterator value="stockDTOList">
								<tr>
									<td><s:property value="dnNo" /></td>
									<td><s:property value="dnDoc" /></td>
									<td><s:property value="billNo" /></td>
									
									<td><s:property value="vat" /></td>
									<td><s:property value="cst" /></td>
									<td><s:property value="waybill" /></td>
									<td><img
										src="<%=request.getContextPath()%>/img/products.png"
										width="45px" height="45px"
										onclick="getDNDetails('<s:property value="dnNo" />','<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
										style="cursor: pointer;" /></td>
								</tr>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>