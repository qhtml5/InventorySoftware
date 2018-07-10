<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script src="js_user/customerMgmt.js" type="text/javascript"></script>
<%@include file="../upp.jsp"%>

<script>
	function called() {
		$("#example1").dataTable();
		$('#example2').dataTable({
			"bPaginate" : true,
			"bLengthChange" : false,
			"bFilter" : false,
			"bSort" : true,
			"bInfo" : true,
			"bAutoWidth" : false
		});
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
		<aside onload="called()" id="addContent" class="right-side">
			<!-- Content Header (Page header) -->

			<section class="content">
				<div class="row">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Message</h3>
							</div>
							<div class="box-body">
								<div>
									${requestScope['Messages']}
										&nbsp;  
									 
									<a href="#" style="cursor: pointer;" onclick="CenterWindow(500,500,50,'printSalesDetailsByBillno.action','SalesPrint','demo_win','<%=request.getAttribute("billno") %>','<%=request.getAttribute("doc") %>');">
										<img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px"  style="margin: -35px 31px 21px 213px"  />
									</a>
									
									
								</div>
								
							</div>
						</div>
				</div>
			</section>			
		</aside>
	</div>

	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="saleDetailsDiv"></div>
	</div>
	<div id="fade1" class="black_overlay"></div>
</body>
</html>