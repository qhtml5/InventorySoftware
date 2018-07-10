<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<html>
<head>
<%@include file="../upp.jsp"%>

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
	onunload="resetValue()" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">

		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
			<section class="content-header">
			<h1>
				DEBIT NOTE <small> Calculate Debit Note</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="adminIndexCall.action">Home</a></li>
				<li class="active">Debit Note</li>
			</ol>
			</section> <section class="content"> 
				<s:form action="#" id="stockAdd" method="post" theme="simple">
					<div class="row">
						<div class="LongTable">
							<!-- general form elements -->
							<div class="box box-primary">
								<div style="height: 50px; margin: 20px 0 0 350px;">
									<label for="PurchaseDate">Select Supplier:</label>
									<s:select headerKey="0" onchange="selectDNDetails(); called();"
										onmouseover="called()" onmousemove="called()"
										onmouseout="called()" headerValue="-Select Supplier-"
										list="supList" listKey="SupplierId" listValue="SUPPLIERNAME"
										name="stockDTO.supplierId" id="supplierId" theme="simple" />
								</div>
		
								<div id="debitNoteDetails"></div>
							</div>
						</div>
				</s:form>
			</section>
		</aside>
	</div>
	<!-- /.right-side -->
	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="dnDetailsDiv"></div>
	</div>
	<div id="fade1" class="black_overlay"></div>
</body>
</html>