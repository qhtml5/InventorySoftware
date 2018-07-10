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
<label for="PurchaseDate">Select Invoice/Bill no:</label>
	<s:select cssStyle="cursor: pointer;" headerKey="0"
		onchange="getSupPayHistory(this.value)" headerValue="-Select Bill No-"
		list="stockList" listKey="billNo" listValue="billNo"
		name="stockDto.billNo" id="billNo" theme="simple" />
</body>
</html>