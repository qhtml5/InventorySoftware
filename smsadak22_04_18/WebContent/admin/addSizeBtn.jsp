<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="dupcheck" style="margin: 9px 203px -13px 0px;">
<% 
	String result=(String)request.getAttribute("Msg");
	if(result.trim().equalsIgnoreCase("false")){
%>
	<s:submit cssClass="btn btn-primary" value="Add Size" onclick="return validateItem();" />
<%
	}else{
		out.println("<p style='color:red; font-size:20px;'>Size Already exist!</p>");
%>	
	<s:submit cssClass="btn btn-primary" value="Add Size" onclick="return validateSize();" disabled="true" />
      
<%
	}
%>
</div>
