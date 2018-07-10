<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>
<html>


<head>
<meta charset="utf-8">
<script src="js_user/customerMgmt.js" type="text/javascript"></script>
<%@include file="../upp.jsp"%>
<title>Customer Payment Due Status</title>
<style type="text/css">
.ta {
	width: 100%;
	border-collapse: collapse;
}

.ta tr {
	height: 30px;
}

.ta tr td {
	border: 1px solid #ccc;
}
</style>
<script>
window.print();


</script>
</head>

<body style="background-color: white;" >


	<div style="width: 100%; margin: 0 auto;">
		<%--<br />
		<div style="text-align: center;">
			<button onclick="duePrintF()">Print Due Amount</button>
		</div>
		<br />--%>
		
		<div id="duePrint">
			<!-- left column -->
			
			<div >
				<table id="" class="ta" border="1">
					<thead>
						<tr>
							<td colspan="9">&nbsp;
								<div align="center">
									<img src="${sessionScope['photoUrl']}" height="60px"
										width="60px" />&nbsp;
								</div>
								<div style="margin: 0 auto;">

									<p
										style="text-align: center; font-size: x-large; font-weight: bolder;">
										<%=request.getAttribute("companyName")%></p>

									<p style="text-align: center;"><%=request.getAttribute("companyAddress")%>,&nbsp;
									</p>

									<p style="text-align: center;"><%=request.getAttribute("companyPhone")%>,
										<%=request.getAttribute("companyEmail")%></p>

								</div> <br />
							</td>
						<tr>
							<th><b>SERIAL NO.</b></th>
							<th><b>BILL NO / INVOICE NO.</b></th>
							<th><b>CUSTOMER NAME</b></th>
							<!-- <th><b>PAYMENT DATE</b></th> -->
							<th><b>PAID STATUS</b></th>
							<th><b>SALE AMOUNT</b></th>
							<th><b>PAYMENT AMOUNT</b></th>
							<th><b>DUE AMOUNT</b></th>
							<th><b>DUE DAYS</b></th>
							<th><b>SALE DATE</b></th>
							<!-- <th><b>CHEQUE NUMBER</b></th>
								<th><b>CHEQUE DATE</b></th>
								<th><b>CHEQUE BANK</b></th> -->
						</tr>
					</thead>
					<tbody>
						<s:if test="cPayList.size>0">
							<%
								int k = 1;
							%>
							<s:iterator id="e" value="cPayList">
								<tr>
									<td><%=k%></td>
									<td><s:property value="billno" /></td>
									<td><s:property value="customerName" /></td>
									<%-- <td><s:property value="cPayDate" /></td> --%>
									<td><s:property value="cPaidStatus" /></td>
									<td><b><s:property value="grandTotal" /></b></td>
									<td><s:property value="cPaidAmt" /></td>

									<%--################################################# payment due color changing codes start here########################## --%>
									<s:if test="#e.dateDiff>=120">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:if>

									<s:elseif test="#e.dateDiff>=105">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=90">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=75">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=60">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=45">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=30">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:elseif test="#e.dateDiff>=15">
										<td><b><s:property value="dueAmt" /></b></td>
									</s:elseif>

									<s:else>
										<td><b><s:property value="dueAmt" /></b></td>
									</s:else>


									<%--################################################# payment due color changing codes End here########################## --%>

									<td><b><s:property value="dateDiff" /></b></td>
									<td><b><s:property value="doc" /></b></td>
									<%-- <td><s:property value="chequeNo" /></td>
										<td><s:property value="chequeDate" /></td>
										<td><s:property value="chequeBank" /></td> --%>
								</tr>
								<input type="hidden" value='<%=k++%>' />
							</s:iterator>
						</s:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6"><br /> <b> Reg office: </b>
								<div style="margin: -15px 30px 19px 81px; font-weight: bold; font: xx-small;">
									<%=request.getAttribute("companyName")%>&nbsp;,
									<%=request.getAttribute("companyAddress")%>,&nbsp; <br />
									<%=request.getAttribute("companyPhone")%>, &nbsp;
									<%=request.getAttribute("companyEmail")%>
								</div></td>
							<td colspan="3"><br />
								<div style="text-align: right; margin: -15px 30px 19px 0px; font-weight: bold; font: x-small;">
									For &nbsp;
									<%=request.getAttribute("companyName")%>
									<br /> <br /> <br /> E. & O.E
								</div></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
