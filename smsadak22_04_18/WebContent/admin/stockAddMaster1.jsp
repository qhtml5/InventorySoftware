<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>

<html>
<head>
<!-- <meta http-equiv="refresh" content="5000"> -->
<script src="js_user/customerMgmt.js" type="text/javascript"></script>
<!--Css For Sliding Tab -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/liquid-slider.css">
<!--Css For Sliding Tab -->

<style type="text/css" media="screen">
@import "css/simpletabs.css";
</style>
<script src="http://www.google.com/jsapi"></script>

<%@include file="../upp.jsp"%>

<!--Js For Sliding Tab -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="js/simpletabs_1.3.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery.liquid-slider.min.js"></script>
<!--Js For Sliding Tab -->


<link href="css/modalShow.css" rel="stylesheet" />

<script>

function check()
{
	alert("called");
	
	window.open("<%=request.getContextPath()%>/addItemCall.action", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=400, height=400");
	
}


function calledVal(val)
{
	
	document.getElementById("articlesCode").value=val;
	var page = "getArticleName.action?articleCode="+val;
	ajaxpagefetcher.load("articleName", page, true);
	
}
function called() {

	$("#example1").dataTable();
	
}
	
	 var t_cel,tc_ln;
	 if(document.addEventListener){
	   document.addEventListener("keypress",keyCapt,false);
	 }else{
	   document.attachEvent("onkeypress",keyCapt); 
	 }
	 
	 function keyCapt(e)
	 {
     var t=e.keyCode;
	 if(t==112)
		 {
	    document.getElementById('schDIV2').style.display='block'; 
	    document.getElementById('fade1').style.display='block';
	    var page ="getItemsCall.action";
	    ajaxpagefetcher.load("lDetailsDiv2", page, true);
		 }
	 else
		 if(t==13)
	    {
			 document.getElementById('schDIV2').style.display='none';
			 document.getElementById('fade1').style.display='none'; 
		}
	
	 }
	 
	 function callMultipleRows()
	 {
// 		    document.getElementById('schDIV2').style.display='block'; 
// 		    document.getElementById('fade1').style.display='block';
		    var page ="getItemsSizeCall.action";
		    ajaxpagefetcher.load("multipleRows", page, true);
		 
	 }
	 
     var count=1;
	 function refreshRowsThreadEngine()
	 {
// 	       $("#result").load("getItemsSizeCall.action");// a function which will load data from other file after x seconds
	       
	       var page ="conReCall.action";
		   ajaxpagefetcher.load("result", page, true);
 	       document.getElementById('counter').innerHTML="Re-Initialization counter--"+count;
	       count++;
	 }
	  
	   setInterval('refreshRowsThreadEngine()', 60000); // refresh div after 5 secs
	            
	

</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="resetValue()" class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		<aside onchange="called()" id="addContent" class="right-side">
		<section class="content-header">
		<h1>
			Purchase Master <small> Purchase product <img
				src="img/purchase.png" height="60px" width="60px"
				style="margin: -20px -21px -18px -6px" /></small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminIndexCall.action">Home</a></li>
			<li class="active">Purchase Master</li>
		</ol>
		</section> <section class="content">
		 Item Code: <%-- <input type="text"
									class="textboxStockloc" id="articlesCode"
									onfocus="clearZero(this)"
									onkeyup="test('<%=request.getContextPath()%>' )"
									name="articles" size="10" /> --%>
								<s:if test="itemList.size>0">
									<select name="articles" id="articlesCode2"
									style="width:300 px;" onchange="test('<%=request.getContextPath()%>' )">
									<option value="0">-Select Item-</option>
									<s:iterator value="itemList">
										<option value='<s:property value="itemId" />'>
											<s:property value="itemId" /> -
											<s:property value="itemName" />
										</option>
									</s:iterator>
								</select>
								</s:if>
		<div id="validation"></div>
		<s:form action="addStockDetails.action" id="stockAdd" method="post"
			theme="simple">
			<div class="row">
				<div class="LongTable">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header"></div>

						<!-- ################################################################# Stock Form Design Start here ##########################################################  -->

						<!-- -------------------------------- Design for purchase entry panel start here ------------------------------------------------------------- -->
						<fieldset id="StockFieldSet">
						<legend id="stocklegend ">
						<label id="stocklegend">Add Purchase </label>
						</legend>
						<div style="margin: -7px 63px -27px 303px">
							<label for="PurchaseDate">Purchase Date:</label>
							<s:textfield name="stockDTO.purchaseDate" id="purchaseDate"
								cssStyle="width:91px;" theme="simple" />
								<input type="hidden" id="fYearS" name="fYearS"  value="${sessionScope['fYear']}">
								
                                <label for="Bill">Bill</label> <input type="text" id="bill"
									onfocus="clearZero(this)" style="width: 121px;"
									name="stockDTO.billNo" value=""
									onkeyup="checkDupPurchaseBill(this.value); billCall()" /> <label
									for="CHALLAN">Challan</label> <input type="text" id="challan"
									onfocus="clearZero(this)" style="width: 121px;"
									name="stockDTO.challanNo" value="" onkeyup="billCall()" />
                           </div>
							<div style="margin: 34px 53px 20px 300px">
									<label for="SupplierList">Search Supplier</label>
							<s:textfield cssStyle="width:153px;" name="stockDTO.supplierName"
								id="supplierName" onfocus="clearZero(this)" theme="simple" />
							<img src="img/searchSupplier.png" width="41px" height="40px"
								onclick="supplierComboCall('<%=request.getContextPath()%>')"
								style="margin: 3px 38px -13px -3px; cursor: pointer;" />
							
							<img src="img/resetS.png" width="30px" height="27px"
						    onclick="refreshSupplierComboCall('<%=request.getContextPath()%>')"
							style="margin: 3px 38px -7px -36px; cursor: pointer;" />
							<div id="k" style="margin:-8px 26px 1px -2px">
						
							</div>	
								
							</div>
						</fieldset>
						<!-- -------------------------------- Design for purchase entry panel End here ------------------------------------------------------------- -->

						<!-- -------------------------------- Design for Stock calculation panel start here ------------------------------------------------------------- -->
						<fieldset id="StockFieldSet">
						
					
								
						</fieldset>
						<!-- -------------------------------- Design for Stock calculation panel start here ------------------------------------------------------------- -->

						<!-- ################################################################# Stock Form Design End here ##########################################################  -->
						<div class="box-footer"></div>
					</div>
				</div>
			</div>
		</s:form> </section>
	</div>
	<div id="openModal" class="modalbg"></div>
	<script>
		</script>
	</section>
	</aside>

	<!-- /.right-side -->
	</div>


	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDiv"></div>
	</div>


	<div id="schDIV2" class="white_content_Stock">
		<a href="#"
			onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDiv2" style="height: 450px"></div>
	</div>

	<div id="fade1" class="black_overlay"></div>


</body>
</html>