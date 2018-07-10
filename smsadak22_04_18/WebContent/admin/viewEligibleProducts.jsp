<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ page import="util.EligibleCustomerNames" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<section class="content" onmouseover="called()">

	<div class="row">
		<!-- left column -->

		<div id="aboutScheme">

			<div class="LongTable">
			<div id="totalQuantitySold">
				<b >Total quantity sold to</b> &nbsp; <b style="color: blue;"> <%=request.getAttribute("customername") %> is &nbsp;(<%=request.getAttribute("totalQuantitySold") %>)</b>
				<div style="float: right; width: 300px;">
					<s:if test="%{#request.totalQuantitySold>=#request.schemeQty}">
						<p style="color: green;float: left; font-weight: bolder;">Eligible for this Scheme</p>
						<button style="margin-left: 20px;">Make Eligible</button>
					</s:if>
					<s:else>
						<p style="color: red; font-weight: bolder;">Not Eligible for this Scheme</p>
					</s:else>
				</div>
					
			</div>
			<br/>
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<th><b>SERIAL NO</b></th>
							<th><b>ITEMNAME</b></th>
						
						</TR>
					</thead>
					<tbody>
						<s:if test="%{eList.size>0}">
						<%int k=1; %>
							<s:iterator value="eList">
								<tr>
								    <td><%=k %></td>
									<td><s:property value="itemname" /></td>
								</tr>
								<input type="hidden" value="<%=k++ %>"/>
							</s:iterator>

						</s:if>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>