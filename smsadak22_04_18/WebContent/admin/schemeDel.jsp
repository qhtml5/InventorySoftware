<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="dTO.SchemeMasterDto"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

	<div style="font-size: 17px; font-family: monospace;" align="left">
		User Authentication required for deleting scheme : <b><%=request.getAttribute("schemeName")%></b>
	</div>
	<s:form action="/delScheme.action" method="post">

		<br />
		<div>

			Name : <input type="text" readonly="readonly" id="userName"
				name="userName" class="textboxForScheme"
				value="<%=session.getAttribute("login")%>" /> Password :<input
				type="password" name="password" id="password"
				class="textboxForScheme" /> <img
				src="<%=request.getContextPath()%>/img/deleteStock.png" width="45px"
				height="45px"
				onclick="validateSchemeDel('<%=request.getContextPath()%>',document.getElementById('userName').value,document.getElementById('password').value,'<%=request.getAttribute("schemeName")%>')"
				style="margin: -5px 31px -18px 11px; cursor: pointer;" /> <br /> <br />
			<div align="center" id="result"></div>

		</div>

	</s:form>

</body>
</html>