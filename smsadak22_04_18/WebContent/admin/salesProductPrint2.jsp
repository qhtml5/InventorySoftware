<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>
<html>


<head>
<meta charset="utf-8">
<script src="js_user/customerMgmt.js" type="text/javascript"></script>
<%@include file="../upp.jsp"%>
<title>Print bill : <%=request.getAttribute("bill")%></title>
<style type="text/css">
.ta {
	width: 100%;
	background-color: white;
	border-collapse: collapse;
}

.ta tr {
	height: 25px;
}

.ta tr td {
	border: 1px solid #ccc;
}
</style>
<script>
window.print();

</script>
</head>

<body style="background-color: white;">

	<div style="width: 100%; margin: 0 auto;">
		<div id="duePrint">
			<!-- left column -->
			<div>
				<table class="ta" border="1" id="">
					<thead>
						<tr>
							<td colspan="5">&nbsp;
								<div align="center">
									&nbsp;
								</div>
								<div style="margin: 0 auto;">
									<p
										style="text-align: center; font-size: x-large; font-weight: bolder;">
										<%=request.getAttribute("companyName")%>
									</p>
									<p style="text-align: center;"><%=request.getAttribute("companyAddress")%>,&nbsp;
										West Bengal,
									</p>
									<p style="text-align: center;">Contact No: &nbsp; <%=request.getAttribute("companyPhone")%>,
										
									</p>
									<p style="text-align: center;"> Vat No. : <%=request.getAttribute("comVat")%>.
										
									</p>
									

								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;<br> <s:if
									test="%{#request.rCid==0}">
									<b style="font-size: small;"> To : <%=request.getAttribute("tcName")%>
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("tcMob")%>,
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("tcAdd")%>
									</b>
									<br />
									<br />
								</s:if> <s:else>
									<b style="font-size: small;"> To : <%=request.getAttribute("customerName")%>
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("customerAddress")%>,
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("customerState")%>,
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("customerpincode")%>,
										<br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("customeremail")%>
									</b>
									<br />
									<br />
								</s:else>
							</td>
							<td colspan="2">&nbsp;<br> <b style="font-size: small;">
									Date : &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
									&nbsp;&nbsp;<%=request.getAttribute("Doc")%> <br /> Invoice No
									:&nbsp; &nbsp;&nbsp; <%=request.getAttribute("bill")%> <br />
									Challan No: <br />
							</b>
							</td>
						</tr> 
						<tr>
							<td style="text-align: center;" width="16%"><b>Item Name</b></td>
							<td style="text-align: center;" width="13%"><b>Item Size</b></td>
							<td style="text-align: center;" width="14%"><b>Quantity</b></td>
							<td style="text-align: center;" width="14%"><b>MRP</b></td>
							<td style="text-align: center;" width="14%"><b>TOTAL</b></td>
						</tr>
					</thead>
					<tbody>
						<s:if test="%{saleList.size>0}">
							<% int k = 1; %>
							<s:iterator value="saleList">
								<tr>
									<td align="center"><s:property value="itemName" /></td>
									<td align="center"><s:property value="itemSizeName" /></td>
									<td align="center"><s:property value="Qty" /></td>
									<td align="center"><s:property value="buyRate" /></td>
									<td align="right"><s:property value="itemtotal" /></td>
								</tr>
								<% k++; %>
							</s:iterator>
							<tr>
						
								<td colspan="3" align="right">
								<strong>Total Pair :</strong> <br/>
								<strong>SubTotal :</strong> <br/>
								    Less Unit Scheme:<br />
								    
									Discount (<%=request.getAttribute("discount")%>%):<br /> 
									Vat(<%=request.getAttribute("vat") %>%)<br/>
								    Freight Charges:<br/>
									<strong>Grand Total: </strong><br />
									<strong>Amount received: </strong><br />
									<strong>Amount return </strong><br />
									
									
								</td>
								<td align="right" colspan="2">
									<strong>  <%=request.getAttribute("totalpair")%>PCS</strong>
									<br/>
								  <strong>  <%=request.getAttribute("subtotal")%></strong>
								   <br/><%=request.getAttribute("lUnit")%><br />
									<%=request.getAttribute("afterdiscount")%>
									<br/>
									<%=request.getAttribute("vatamt")%>
									<br /> <%=request.getAttribute("lFreight")%>
									<br/>
									<strong><%=request.getAttribute("gTot")%></strong>
									<br />
									
									<%=request.getAttribute("amountreceived")%>
									<br/>
									
									<%=request.getAttribute("amountreturn")%>
									
									
									</td>
							</tr>
							<tr>
								<td colspan="5" align="right">
									<div
										style="margin: 5px 18px 8px 77px; font-weight: bold; font: xx-small;"><%=request.getAttribute("gTotRoundValue")%></div>
								</td>

							</tr>

						</s:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3"><br /> <b> Reg office: </b>
								<div
									style="margin: -15px 30px 19px 81px; font-weight: bold; font: xx-small;"><%=request.getAttribute("companyName")%>&nbsp;,
									<%=request.getAttribute("companyAddress")%>,&nbsp; West Bengal,
									<br />
									<%=request.getAttribute("companyPhone")%>, &nbsp;
									<%=request.getAttribute("companyEmail")%>
								</div></td>
							<td colspan="2">
								
									For &nbsp;
									<%=request.getAttribute("companyName")%>
									<br />  E. & O.E

								
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
