<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>

<%@include file="../upp.jsp"%>

</head>
<body>


	<%
		String msg = (String) request.getAttribute("Msg");
		System.out.println("msg= " + msg);
		if (msg.equalsIgnoreCase("true")) {
	%>
	<input type="button" id="pbutton2" value="Submit" onclick="calledaz('<%=request.getContextPath()%>')" />
	<input type="button" value="Clear" onclick=" clearfield();" />
	
	<div id="resultUpdate"></div>
	<%
		} else if (msg.equalsIgnoreCase("Duplicate for Both Code And Item Name Found!")) {
	%>
	<input type="button" id="pbutton2" value="Submit" disabled="disabled" />
	<input type="button" value="Clear" onclick=" clearfield();" />
	
	<br />
	<br />
	<b style="color: red;">Duplicate for Both Code And Item Name Found!</b>
	<div id="resultUpdate"></div>
	<%
		} else if (msg.equalsIgnoreCase("Duplicate Item Code Found")) {
	%>
	<input type="button" id="pbutton2" value="Submit" disabled="disabled" />
	<input type="button" value="Clear" onclick=" clearfield();" />
	
	<br />
	<br />
	<b style="color: red;">Duplicate Item Code Found</b>
	<div id="resultUpdate"></div>
	<%
		} else if (msg.equalsIgnoreCase("Duplicate Item Name Found")) {
	%>
	<input type="button" id="pbutton2" value="Submit" disabled="disabled" />
	<input type="button" value="Clear" onclick=" clearfield();" />
	
	<br />
	<br />
	<b style="color: red;">Duplicate Item Name Found</b>
	<div id="resultUpdate"></div>
	<%
		}
	%>
</body>
</html>
