    <%@ page import="dTO.SalesMasterDto" %>
      <%@ page import="dTO.CustomerMasterDTO" %>
    <%@ taglib uri="/struts-tags"  prefix="s"%>

<html>
<body>
	                             <s:if test="saleList.size>0">
									<select id="productCode" name="productCode" style="width: 300px;"
										onchange="searchCustDetailsByProductcode(this.value)">
										<option value="0">Select product</option>
										<s:iterator value="saleList">
											<option value='<s:property value="itemId" />'>
												<s:property value="itemId" />
											</option>
										</s:iterator>
									</select>
								</s:if>
</body>
</html>