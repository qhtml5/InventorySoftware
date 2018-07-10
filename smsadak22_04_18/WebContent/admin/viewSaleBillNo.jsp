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
<label for="PurchaseDate">Search Bill no:</label>
		
		<div style="margin: -17px 56px 20px 106px;"> <input type="text" id="billsearch" onkeyup="getCustomerSaleDet2(document.getElementById('billsearch').value)" placeholder="Search bill no" /> </div>
		<div id="bs" style="margin: -14px 42px 41px 105px;">
		<select id="billno" name="billno" style="width: 300px;" onchange="getCustomerSaleDet()">
			<option value="0">Select Bill</option>
			<s:iterator value="saleList">
				<option value='<s:property value="billno" />'>
					<s:property value="billno" />
				</option>
			</s:iterator>
		</select></div>
</body>
</html>