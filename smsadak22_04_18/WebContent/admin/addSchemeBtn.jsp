<%@ taglib uri="/struts-tags" prefix="s"%>

<% 
	String result=(String)request.getAttribute("Msg");
	if(result.trim().equalsIgnoreCase("false")){
%>
	<s:submit cssClass="btn btn-primary" value="Add Scheme" id="sub" onclick="this.value='Updating Please wait..';this.disabled='disabled'; return validateScheme();" />
<%
	}else{
		out.println("<p style='color:red; font-size:20px;'>Scheme Already exist!</p>");
%>	
	<s:submit cssClass="btn btn-primary" value="Add Scheme" onclick="return validateScheme();" disabled="true" />
<%
	}
%>