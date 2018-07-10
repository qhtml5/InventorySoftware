<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<html>
	<head>
	<%@include file="../upp.jsp"%>
		<script>
			function called() {
				$("#example1").dataTable();
			}
		
			function banknames(val) {
				var chkamt = document.getElementById("cpaidAmt").value;
				if (chkamt != "" || chkamt != "0.0") {
					document.getElementById("chqBnk").value = val;
					document.getElementById('schDIV2').style.display = 'none';
					document.getElementById('fade1').style.display = 'none';
				}
			}
		
			var t_cel, tc_ln;
			if (document.addEventListener) {
				document.addEventListener("keypress", keyCapt, false);
			} else {
				document.attachEvent("onkeypress", keyCapt);
			}
		
			function keyCapt(e) {
				var t = e.keyCode;
				if (t == 112) {
					document.getElementById('schDIV2').style.display = 'block';
				} else if (t == 13) {
					document.getElementById('schDIV2').style.display = 'none';
					document.getElementById('fade1').style.display = 'none';
		
				}
			}
		</script>
	</head>
	
	<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="resetValue()" class="skin-blue">
	
		<!-- header logo: style can be found in header.less -->
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="wrapper row-offcanvas row-offcanvas-left">
			
			<%@include file="../aside.jsp"%>
			
			<aside onchange="called()" id="addContent" class="right-side">
				<section class="content-header">
					<h1>
						Customer Payment With Details<small> Payment From Customer
							and Payment History <img src="img/payment.png" height="60px"
							width="60px" style="margin: -14px -22px -21px 0px" />
						</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="adminIndexCall.action">Home</a></li>
						<li class="active">Customer Payment</li>
					</ol>
				</section>
				<section class="content">
					<div id="validation"></div>
			
					<s:form action="cuatomrPayment.action" id="cPay" method="post" theme="simple">
						<div class="row">
							<div class="LongTable">
								<!-- general form elements -->
								<div class="box box-primary">
			
									<div class="box-header">
										<br />
									</div>      
									<div>
										<label for="PurchaseDate">Date of Payment :</label>
										<s:textfield cssClass="textboxForScheme" name="cPayDto.cPayDate"
											id="sDoc" theme="simple" />
										<input type="hidden" id="fYearS" name="fYearS"  value="${sessionScope['fYear']}">
									
									
										<div style="margin:-21px 37px 18px 225px"><input id="searchCuste" type="text" placeHolder="Search Customer"  onkeyup="rtCustomerList(document.getElementById('searchCuste').value)" name="searchCust" /></div>
										
										
										
					                    <div id="customerList"	>			
										<div style="margin:-13px 37px 1px 225px"><s:select cssStyle="cursor: pointer;" headerKey="0"
											onchange="getCustomerPayBill(this.value)"
											headerValue="-Select Customer-" list="cPayList"
											listKey="regcustomerId" listValue="customerName"
											name="cPayDto.customerId" id="customerId" theme="simple" /></div>
											
											</div>	
										<%-- onchange="getPayDetailsofCustomer(this.value)" --%>
										<div id="customerPayBill" style="float: right; margin-right: 180px;">
											
										</div>
			
										
									</div>
									<div id="customerPayDet">
										<label style="font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px">Select Any Customer And Then Bill No to Display Data !! </label>
									</div>
								</div>
							</div>
						</div>
					</s:form>
				</section>
			</aside>
		</div>
		<div id="schDIV2" class="white_content_BankDetails">
			<a href="#"
				onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>
			<div style="margin: -7px 28px -73px 28px">
				<b style="color: blue">Select</b>
			</div>
			<div style="margin: 58px 29px 22px 112px">
				<b style="color: blue">Bank Names</b>
			</div>
			<div id="lDetailsDiv2" style="height: 400px; overflow: auto; margin: 32px 23px 28px 26px">
	
				<table class="table table-hover" id="example1">
					<thead>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<s:if test="%{banknamesDtoList.size>0}">
							<%
								int k = 1;
							%>
							<s:iterator value="banknamesDtoList">
								<tr>
									<td>
										<input type="button" name="selectbank" id="selectbank<%=k%>"
										value="<s:property value="bankId" />"
										onclick="banknames('<s:property value="banknames" />')" />
									</td>
									<td><s:property value="banknames" /></td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>