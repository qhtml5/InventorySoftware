<%@ taglib uri="/struts-tags" prefix="s"%>

<% 
	String result=(String)request.getAttribute("Msg");
	if(result.trim().equalsIgnoreCase("false")){
%>	
		<div style="margin-right: 350px; margin-top: 50px">
			<s:submit cssClass="btnstock" id="sub" value="Add Purchase" 
												 	onclick="this.value='Uploading Please wait..';this.disabled='disabled'; return validateStock();" />
		</div>
<%
	}else{
		
%>	
<div style="margin-right: 350px; margin-top: 50px">
<%
	out.println("<p style='color:red; font-size:15px; '><b>Bill Already exist!</b></p>");
%>
<%-- 	<s:submit cssClass="btnstock" id="sub" value="Add Purchase" onclick=" return validateStock();" disabled="true"/> --%>
</div>
<%
	}
%>