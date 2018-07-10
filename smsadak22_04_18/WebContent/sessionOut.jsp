<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>  
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java" %>
<html>
<head>
 
<!--  <META http-equiv="refresh" content="5;URL=logout.action">  -->


<script>

function c()
{
	alert("called");
}
</script>
</head>


<body onloadstart="c()">

<section class="content-header">
	
</section>
<section onmouseover="" class="content">

	<div class="row">
		<!-- left column -->
		<div class="box box-primary">
				<div  style="height: 250px; width: 84%; margin: 60px 2px 4px 259px; ">
					<img onload="c()" src="<%=request.getContextPath()%>/img/session2.png" width="450px" height="500px"
						style=" margin: -43px 0px 0px 138px; display: block;" />
					<h2 style=" margin: 0px 0 0 150px; color: #f00;">
					You will be automatically redirected to Login page in 5 seconds. <br/> Or you may <a href="logout.action" class="btn btn-default btn-flat">Login</a> to Continue...</h2>
					
					
					
					<input type="text" id="sessionStatus" value="<%=request.getAttribute("loginStatus") %>" />
					<%=request.setAttribute("loginStatus", "sessionExpired") %>
					
				</div>				
			</div>
		</div>
</section>
</body>
</html>