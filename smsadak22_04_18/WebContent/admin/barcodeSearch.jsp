<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
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
					Barcode Search <small> Search and print barcodes of
						products <img src="img/Barcode.png" height="60px" width="60px"
						style="margin: -14px -22px -21px 0px" />
					</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="adminIndexCall.action">Home</a></li>
					<li class="active">product List</li>
				</ol>
			</section>
			<section class="content" onmouseover="called()">
				<div id="validation"></div>
				<div class="row">
					<!-- left column -->
					<div id="aboutScheme">
						<div class="LongTable">
							<div class="box box-primary">
								<div class="box-header">
									<br />
								</div>
								<div style="margin: -32px 36px -14px 299px;">
								
									From Date: <input type="text" id="bStartDate"
										class="textboxStockloc" name="fromdate" /> To Date : <input
										type="text" class="textboxStockloc" id="bEndDate"
										name="fromdate" /> <img src="img/searchDate.png" width="45px"
										height="45px"
										style="margin: 38px 53px -20px 12px; cursor: pointer;"
										onclick="searchBarcodesByDATE('<%=request.getContextPath()%>',document.getElementById('bStartDate').value,document.getElementById('bEndDate').value)" />
								</div>
								<br />
								<div id="dTab">
									<div class="LongTable">

										<s:hidden name="idto.itemsLength" id="itemsLength" />
										<table id="example1"
											class="table table-bordered table-striped">
											<thead style="background-color: #4B5156; color: white;">
												<tr>
													<th><b>Serial</b></th>
													<th><b>Product Name</b></th>
													<th><b>Barcodes</b></th>
													<th><b>Number of print</b><img
														src="<%=request.getContextPath()%>/img/printing.png"
														width="45px" height="45px"
														style="margin: -21px 32px -14px 19px"
														onclick="printDetails()" /></th>
												</tr>
											</thead>
											<tbody>
												<s:if test="itemList.size>0">
													<%
														int k = 1;
													%>
													<s:iterator id="s" value="itemList">
														<tr>
															<td><%=k%></td>
															<td><s:property value="itemName" /></td>
															<td><s:if test="#s.barcode=='NA'">
																	<b style="color: blue;">No barcode generated for
																		this product.</b>
																</s:if> <s:else>
																	<img src="<%=request.getContextPath()%><s:property value="barcode" />" width="190"height="70" />
																</s:else></td>
															<td><s:if test="#s.barcode=='NA'">
																	<b style="color: blue;">No barcode generated for
																		this product.</b>
																</s:if> <s:else>
																	<input type="text" name="cloneImage" id="clone<%=k%>"
																		onchange="cloneImagebySelect('<%=request.getContextPath()%><s:property value="barcode" />','<%=k%>',this);"
																		value="0" size="6" onfocus="clearZero(this)" />
																</s:else> <!--  <select name="cloneImage" onchange="cloneImagebySelect('<s:property value="barcode" />','<%=k%>');" id="clone<%=k%>" >
                                 <option value="0">-copies-</option>
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                                 <option value="6">6</option>
                                 <option value="7">7</option>
                                 <option value="8">8</option>
                                 <option value="9">9</option>
                                 <option value="10">10</option>
                                 <option value="11">11</option>
                                 <option value="12">12</option>
                                 <option value="13">13</option>
                                 <option value="14">14</option>
                                 <option value="15">15</option>
                                 <option value="16">16</option>
                                 <option value="17">17</option>
                                 <option value="18">18</option>
                                 <option value="19">19</option>
                                 <option value="20">20</option>
                                 <option value="21">21</option>
                                 <option value="22">22</option>
                                 </select> --></td>
														</tr>
														<input type="hidden" value='<%=k++%>' />
													</s:iterator>
												</s:if>
											</tbody>
											<tfoot style="background-color: #4B5156; color: white;">
												<tr>
													<th><b>Serial</b></th>
													<th><b>Product Name</b></th>
													<th><b>Barcodes</b></th>
													<th><b>Number of print</b><img
														src="<%=request.getContextPath()%>/img/printing.png"
														width="45px" height="45px"
														style="margin: -21px 32px -14px 19px; cursor: pointer;"
														onclick="printDetails()" /></th>
												</tr>
											</tfoot>
										</table>
									</div>
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
			</section>
		</aside>
	</div>


	<div id="content3" style="display:none;"></div>
</body>
</html>