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
	
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->

		
		 <section class="content">
		
		<div id="validation"></div>
		<s:form action="/addPopupItems.action" method="post">
			<div id="panelhjj">
								    Item Name : <input class="textboxStockItemShortAdd" type="text"
								
									id="iName" name="iName" size="12" /> Item type: <select
									id="itemTypeId" name="idto.itemTypeID">
									<option value="0">Select One</option>
									<s:iterator value="iCateoryList">
										<option value="<s:property value='itemTypeID'/>">
											<s:property value='itemType' />
										</option>
									</s:iterator>
								</select><br/><br/> Brand Name:   <select id="itemBrandId" name="idto.itemBrandId"
									>
									<option value="0">Select One</option>
									<s:iterator value="brandList">
										<option value="<s:property value='itemBrandId'/>">
											<s:property value='itemBrandName' />
										</option>
									</s:iterator>
								</select>  Unit: <select id="itemUnit" name="idto.itemUnit">
									<option value="0">Select One</option>
									<option value="PCS">PCS</option>
									<option value="DOZZEN">DOZZEN</option>
								</select>  
								<br/>
								
								<div style="margin:13px 45px -3px -30px;" ><input type="button" class="btn btn-primary" value="Add ItemCode ...." onclick="addMultipleItems(this.form)"  /></div>
					            
					            <div style="margin:  border: 1px; border-color: black;">
									<br/>
									<div style=" margin:-4px 39px 0px 64px;height: 210px; overflow-y: auto;" id="itemRows2"></div>
								
								</div>
								<input type="hidden" name="rowNum" id="rowNum"/>
								
								   <%-- Item Code: <input type="text"
									class="textboxStockItemShortAdd"
									onblur="calledaz2('<%=request.getContextPath()%>');"
									onkeyup="calledaz2('<%=request.getContextPath()%>');"
									name="idto.itemId" id="iCode" /> MRP 
									<input type="text" id="itemMrp" class="textboxStockItemShortAdd" name="itemMrp" />

                                    <a href="#" id="hide" onclick=" clearfield();"> <img
										src="<%=request.getContextPath()%>/img/closeDiv.png"
										width="22px" height="22px"
										style="float: right; margin-right:79px; background-color: white; display: block;" />
									</a>--%>
								<div id="addItemBt"
									style="height: 40px; width: 90%; padding-left: 400px; ">
									<div id="addItemBt" style="display:none;">
							        <s:submit cssClass="btn btn-primary" id="pbutton" cssStyle="display:block;" value="Add Item"    />
						            </div>

									<div id="resultUpdate"></div>
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