<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<body>
	<% 
		String msg=(String)request.getAttribute("Msg");
		System.out.println("msg= "+msg);
		if(msg.equalsIgnoreCase("No Data Found")){
	%>
		<b style="color: red;">${requestScope['Msg']}</b>
		<input type="hidden" id="msgChk" value="0">
	<%
		}
		else{
	%>
		<b>${requestScope['Msg']}</b>
		
		<input type="hidden" id="msgChk" value="1">
		<br/>
		<br/>
	<%
		}
	%>
</body>
</html>
