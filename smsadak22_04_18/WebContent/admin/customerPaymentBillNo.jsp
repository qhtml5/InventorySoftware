<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dTO.StockMasterDTO" %>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<label for="PurchaseDate">Search By Sales Invoice/Bill No:</label>
	<select style="cursor: pointer;" onchange="getPayHistory(this.value)" id="pBillno" name="pBillno">
		<option value="0">-Select Bill No-</option>
		<s:iterator value="saleList">
			<option value='<s:property value="billno" />'><s:property value="billno" /></option>
		</s:iterator>
	</select>
</body>
</html>