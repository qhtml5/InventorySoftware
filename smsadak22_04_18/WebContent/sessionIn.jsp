<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>  
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java" %>
<html>
<head>
<!--  <META http-equiv="refresh" content="5;URL=logout.action">  -->
</head>

<body>
	<input type="hidden" id="sessionStatus" value="<%=request.getAttribute("loginStatus") %>" />
</body>
</html>