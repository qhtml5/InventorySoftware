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
				<h1>
					Scheme Master <small> Create new Scheme <img src="img/scheme.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

				</h1>
				<ol class="breadcrumb">
					<li><a href="adminIndexCall.action">Home</a></li>
					<li class="active">Scheme List</li>
				</ol>
			</section>
			<section class="content" onmouseover="called()">
				<div id="validation"></div>
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
										<h3 class="box-title">Scheme List:</h3>
										<br/>
										
									</div>
									<div style="margin:-43px 45px 16px 194px">From Date: <input type="text" id="startDate" class="textboxStockloc" name="fromdate" />  To Date : <input type="text" class="textboxStockloc" id="endDate" name="fromdate" /> 
									
									<img src="img/searchDate.png" width="45px" height="45px" style="margin:38px 53px -20px 12px; cursor: pointer;"  onclick="searchSchemeByDATE('<%=request.getContextPath()%>',document.getElementById('startDate').value,document.getElementById('endDate').value)" />
									
									 </div>
									<div id="dTab">
									<table id="example1" class="table table-hover">
										<thead>
											<tr>
												<td><b>SCHEME NAME</b></td>
												<td><b>DATE OF CREATION</b></td>
												<td><b>START DATE</b></td>
												<td><b>END DATE</b></td>
												<td><b>SCHEME QTY</b></td>

												<td><b>MADE BY</b></td>
												<td><b>VIEW PRODUCTS</b></td>
												<td><b>EDIT SCHEME</b></td>
												<td><b>VIEW CUSTOMERS</b></td>
												<td><b>DELETE SCHEME</b></td>
											</tr>
										</thead>
										<tbody>
											<s:if test="%{schemeList.size>0}">
												<s:iterator value="schemeList">
													<tr>
														<td><s:property value="schemeName" /></td>
														<td><s:property value="schemeDoc" /></td>
														<td><s:property value="schemeSdate" /></td>
														<td><s:property value="schemeEdate" /></td>
														<td><s:property value="schemeQty" /></td>

														<td><s:property value="userName" /></td>

														<td>
																<img src="<%=request.getContextPath()%>/img/products.png" width="45px" height="45px" onclick="setProduct('<s:property value="schemeName"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
														</td>
														
														<td>
																<a href="getSchemeDetails.action?schemeName=<s:property value='schemeName'/>"><img src="<%=request.getContextPath()%>/img/edit-icon.png" width="45px" height="45px"/></a>
														</td>
														
														<td>
																<img src="<%=request.getContextPath()%>/img/customers.png" width="45px" height="45px" onclick="setCustomers('<s:property value="schemeName"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
														</td>
														<td>
																<img src="<%=request.getContextPath()%>/img/deleteStock.png" width="45px" height="45px" onclick="delScheme('<s:property value="schemeName"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
														</td>
													</tr>
												</s:iterator>

											</s:if>
											
										</tbody>
									</table>
									</div>
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