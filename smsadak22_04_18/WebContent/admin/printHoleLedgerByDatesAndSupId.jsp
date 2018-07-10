<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page language="java" import="dTO.PurchaseLedgerDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<% System.out.println("http://localhost:8080/sms_11_12_2016/ledgerReports/printHoleledger.pdf"); %>
<embed src="<%=request.getContextPath() %>/ledgerReports/printHoleledger.pdf" width="100%" height="900px"></embed>

</body>
</html>