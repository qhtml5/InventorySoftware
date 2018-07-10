<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="dupcheck" style="margin: 9px 203px -13px 0px;">
<% 
	String result=(String)request.getAttribute("Msg");
	if(result.trim().equalsIgnoreCase("true")){
%>
	<s:submit cssClass="btn btn-primary" value="Add" onclick="return validateItem();" />
<%
	}else if(result.trim().equalsIgnoreCase("Duplicate for Both Code And Item Name Found!")){
		out.println("<p style='color:red; font-size:20px;'>Duplicate for Both Code And Item Name Found!</p>");
%>	
	<s:submit cssClass="btn btn-primary" value="Add" onclick="return validateItem();" disabled="true" />
      
<%
	} else if(result.trim().equalsIgnoreCase("Duplicate Item Code Found")){
		out.println("<p style='color:red; font-size:20px;'>Duplicate Item Code Found!</p>");
%>	
	<s:submit cssClass="btn btn-primary" value="Add" onclick="return validateItem();" disabled="true" />
      
<%
	} else if(result.trim().equalsIgnoreCase("Duplicate Item Name Found")){
		out.println("<p style='color:red; font-size:20px;'>Duplicate Item Name Found!</p>");
%>	
	<s:submit cssClass="btn btn-primary" value="Add" onclick="return validateItem();" disabled="true" />
      
<%
	}
%>
</div>
