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
		onchange="selectStocksByBillBo(this)" headerValue="-Select Bill No-"
		list="stockDTOList" listKey="billNo" listValue="billNo"
		name="stockDTO.billNo" id="billNo" theme="simple" />
</body>
</html>