<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="dTO.SalesMasterDto" %>
    <%@ page import="dTO.StockMasterDTO" %>
    <%@ taglib uri="/struts-tags"  prefix="s"%>

<body>



<div style="margin:-13px 37px 1px 225px">


<s:select cssStyle="cursor: pointer;" headerKey="0"
											onchange="getCustomerPayBill(this.value)"
											headerValue="-Select Customer-" list="cPayList"
											listKey="regcustomerId" listValue="customerName"
											name="cPayDto.customerId" id="customerId" theme="simple" />
</div>



<%-- <select name="articles" id="articlesCodes" style="width:200 px;" onchange="test('<%=request.getContextPath()%>' )">
										<option value="0">-Select customer-</option>
										<s:iterator value="customerList">
											<option value='<s:property value="customerId" />'>
												
												<s:property value="customerName" />
											</option>
										</s:iterator>
									</select>--%>
									
</body>
</html>