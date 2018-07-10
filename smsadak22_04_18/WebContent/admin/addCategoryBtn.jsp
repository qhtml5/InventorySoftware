<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="dupcheck" style="margin: 9px 203px -13px 0px;">
<% 
	String result=(String)request.getAttribute("Msg");
	if(result.trim().equalsIgnoreCase("false")){
%>
	<s:submit cssClass="btn btn-primary" value="Add" onclick="return validateItemType();"/>
<%
	}else{
		out.println("<p style='color:red; font-size:20px;'>Category Already exist!</p>");
%>	
	<s:submit align="center" value="Add" cssClass="btn btn-primary" onclick="return validateItemType();"  disabled="true" />
      
<%
	}
%>
</div>
