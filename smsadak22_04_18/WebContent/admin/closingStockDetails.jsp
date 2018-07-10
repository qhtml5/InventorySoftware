<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page language="java" import="dTO.OpenigAndClosingStockDTO"%>

<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>

<html>
<head>
<style type="text/css" media="screen">
@import "css/simpletabs.css";
</style>
<script src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	function called() {
		$("#example1").dataTable();
	}
</script>
<%@include file="../upp.jsp"%>

<link href="css/modalShow.css" rel="stylesheet" />

</head>
<body onload="clearDate();noBack();"
	onpageshow="if (event.persisted) noBack();" onunload="resetValue()"
	class="skin-blue">

	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<%@include file="../aside.jsp"%>
		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Closing Stock details <small> View last year closing stock <img
				src="img/products.png" height="60px" width="60px"
				style="margin: -14px -21px -15px 2px" /></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Closing stock</li>
		</ol>
		</section> <section onmouseover="called()" class="content">
		<div id="validation"></div>

		<div class="row">

			<div class="LongTable">
				<div class="box box-primary">

					
					<div>
						<s:form action="saveUpdateClosingDetails.action" name="saveUpdateClosingDetails" id="saveUpdateClosingDetails" method="post">
						
					
						
						<br /> <br />
						<div style="margin: -56px 453px 33px -5px">
						      <s:submit cssClass="btnstock"  value="Update" onclick="this.value='Updating wait..';this.disabled='disabled'; " />
						      
						</div>   
						<div id="salesDetailsDiv">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
									   <th><b>SERIAL</b></th>
										<th><b>LAST FINANCIAL YEAR</b></th>
										<th><b>ITEM IDS</b></th>
										<th><b>QTY</b></th>
										<th><b>ALTER QTY</b></th>
										<th><b>REMARKS</b></th>
									

									</tr>
								</thead>
								<tbody>

									<s:if test="closingStockList.size>0">
										<%
											int k = 1;
										%>
										<s:iterator value="closingStockList">
											<tr>
												<td><%=k%></td>
												<td><s:property value="financialYear" />
												
												<input type="hidden" name="financialYear" value="<s:property value="financialYear" />"/>
												<input type="hidden" name="stockid" value="<s:property value="stockId" />"/>
												<input type="hidden" name="id" value="<s:property value="id" />"/>

												</td>
												<td><s:property value="itemIds" />
												<input type="hidden" name="itemIds" value="<s:property value="itemIds" />"/>
												</td>
												<td><s:property value="qty" />
												<input type="hidden" name="qty" value="<s:property value="qty" />"/>


												</td>
												<td><input type="text" name="alterQty" id="alterqty<%=k %>" size="3" value="<s:property value="stockManupulation" />"/></td>
												<td><input type="text" name="remarks" placeholder="Enter your remarks" id="remarks<%=k %>" size="38" value="<s:property value="remarks" />"  /></td>
											
											</tr>
											<input type="hidden" value='<%=k++%>' />
										</s:iterator>

									</s:if>
								</tbody>
							</table>
						</div>
						<div style="margin: -13px 447px 70px 8px">
						      <s:submit cssClass="btnstock"  value="Update" onclick="this.value='Updating wait..';this.disabled='disabled'; " />
						      
						</div>      
						

							</s:form>
					</div>

				</div>

			</div>
		</div>

		</section>
		<div id="schDIV" class="white_content_login">
			<a href="#"
				onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>

			<div id="slDetailsDiv"></div>
		</div>
		<div id="schDIV2" class="white_content_PrintLedger">
			<a href="#"
				onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>
			<div id="slDetailsDiv2" style="height: 555px"></div>
		</div>

		</aside>
	</div>
</body>
</html>