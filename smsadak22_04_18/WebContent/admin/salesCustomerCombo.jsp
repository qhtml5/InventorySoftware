    <%@ page import="dTO.StockMasterDTO" %>
    <%@ taglib uri="/struts-tags"  prefix="s"%>

<html>
<body>
	<select name="customerId" id="customerId" onchange="regcusDivValidation()">
		<option value="0">--Select Customer--</option>
		<s:iterator value="cList">
			<option value="<s:property value='customerId'/>">
				<s:property value="cName" />=><s:property value="address" />
			</option>
		</s:iterator>
	</select>
</body>
</html>