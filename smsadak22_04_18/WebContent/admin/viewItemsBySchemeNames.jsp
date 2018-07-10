<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="dTO.SchemeMasterDto"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

	<div style="font-size: 17px; font-family: monospace;" align="left">
		Following products available in Scheme: <b><%=request.getAttribute("schemeName")%></b>
	</div>
	<div
		style="font-size: 17px; margin: -20px 10px -6px 542px; width: 119px;">
		Total Items:
		<%=request.getAttribute("itemcount")%>
	</div>


	<br />

	<div style="overflow-y: scroll; height: 300px;">


		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>

					<th onload="called()"><b>Item Name</b></th>
					<th onload="called()"><b>Item Unit</b></th>
					<th onload="called()"><b>MRP</b></th>

				</tr>
			</thead>
			<tbody>

				<s:if test="itemList.size>0">
					<s:iterator value="itemList">
						<tr>
							<td><s:property value="itemName" /></td>
							<td><s:property value="itemUnit" /></td>
							<td><s:property value="itemMrp" /></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="3"
							style="text-align: center; color: red; font-size: 20px;">Sorry!
							No Content Available.</td>
					</tr>
				</s:else>







			</tbody>

		</table>
	</div>


</body>
</html>