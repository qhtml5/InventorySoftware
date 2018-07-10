<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script src="js_user/customerMgmt.js" type="text/javascript"></script>

<%@include file="../upp.jsp"%>

<!-- Simple Tabs -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/simpletabs_1.3.js"></script>
<style type="text/css" media="screen">
@import "<%=request.getContextPath()%>/css/simpletabs.css";
</style>
<!-- Simple Tabs -->

<script>
	function called() {

		$("#example1").dataTable();
		/* $('#example2').dataTable({
			"bPaginate" : true,
			"bLengthChange" : false,
			"bFilter" : false,
			"bSort" : true,
			"bInfo" : true,
			"bAutoWidth" : false
		}); */
	}
</script>


</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="" class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<%@include file="../aside.jsp"%>
	<!-- Right side column. Contains the navbar and content of the page -->
	<aside onchange="called()" id="addContent" class="right-side">
	<section class="content-header">
	<h1>Check Eligible Customer <small> Search eligible customer for schemes <img src="img/scheme.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>
    </h1><ol class="breadcrumb">
	<li><a href="adminIndexCall.action">Home</a></li>
	<li class="active">Scheme List</li>
	</ol></section>
	<section class="content" onmouseover="called()">
	<div class="row">
					<!-- left column -->
					<div class="simpleTabs">
						<ul class="simpleTabsNavigation">
							<li><a href="addSchemeCall.action" onClick="">Add Scheme</a></li>
							<li><a href="viewSchemeCall.action" onclick="">View
						     Scheme</a></li>
						</ul>
						<div id="aboutScheme">
							<div class="LongTable">
							<div class="box box-primary">
							<div class="box-header">
							<h3 class="box-title">Scheme list:</h3>
							
							<s:select  headerKey="0" onchange="fetchMatchCustomer(this)" headerValue="-Select Schemes-" list="schemeList"
							listKey="schemeName" listValue="schemeName"
							name="schemeDto.schemeId" id="schemeId"  cssStyle="margin: 12px 46px 3px 10px" theme="simple" />
							
							
							<div id="eligibleCustomer" style="margin: -23px 50px -5px 368px;">     </div>    <br/></div>
							
							<div id="eligibleproducts"></div>
							</div>
							</div>
							<div id="schDIV" class="white_content_login">
								<a href="javascript:void(0) "
									onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none',location.reload()">
									<img src="img/Close-button.png" border="0" />
								</a>
								<p id="schemeNameDIV"></p>
							<div id="fade1" class="black_overlay"></div>
						</div>
					</div>
				</div>
			</section>
		</aside>
	</div>
</body>
</html>