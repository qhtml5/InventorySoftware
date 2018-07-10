
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.ItemMasterDTO" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div class="row">
		<!-- left column -->
		<div style="font-size: 17px; font-family: monospace;" align="left">
			
			<p>
				    <b>Following are the Details of all items
					</b>
			</p>
			<br />
		</div>

		<div style="overflow:auto; height: 450px;"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"   >
			<div  class="LongTable"   >
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
						<td><b>SELECT</b></td>
						<td><b>ITEM CODE</b></td>
							<td><b>ITEM NAME</b></td>
							
						</TR>
					</thead>
					<tbody>
						<s:if test="%{itemList.size>0}">
							<s:iterator value="itemList">
								<tr>
								<td><input type="radio" onclick="calledVal('<s:property value="itemId" />')" name="selectItemCode" value="<s:property value="itemId" />"></td>
								    <td><s:property value="itemId" /></td>
									<td><s:property value="itemName" /></td>
									
								</tr>
						</s:iterator>

						</s:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</body>
</html>