    <%@ page import="dTO.StockMasterDTO" %>
      <%@ page import="dTO.CustomerMasterDTO" %>
    <%@ taglib uri="/struts-tags"  prefix="s"%>

<html>
<body>
	            <s:if test="cList.size>0">
					<select id="customerBarcode" name="customerBarcode" style="width: 300px;"
										onchange="selectSalesDetails()">
										<option value="0">Select Customer</option>
										<s:iterator value="cList">
										<option value='<s:property value="customerBarcode" />'>
												<s:property value="customerBarcode" />-
												<s:property value="cName" />
										</option>
										</s:iterator>
					</select>
			</s:if>
</body>
</html>