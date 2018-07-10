<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<div class="LongTable">
	<!-- general form elements -->
	<div class="box box-primary">
		<div class="box-header">
			<h3 class="box-title"></h3>
		</div>
		<!-- /.box-header -->
		<!-- form start -->
		<div style="margin: -17px 38px 10px 337px;">

			Colors status according to payment pending days. <br /> <br />
			<div style="background-color: lime; margin: 0px 38px 10px -80px; width: 87px; color:#000;">
				&nbsp; 1-15 days
			</div>
			<div style="background-color: #B6BA2D; margin: -26px 38px 10px 15px; width: 87px; color:#000;">
				&nbsp;16-30 days
			</div>
			<div style="background-color:#A0C623; margin: -26px 41px 10px 110px; width: 87px; color:#000;">
				&nbsp;31-45 day
			s</div>
			<div style="background-color: #DFF444; margin: -26px 38px 10px 204px; width: 87px; color:#000;">
				&nbsp;46-60 days
			</div>
			<div
				style="background-color: #FCF400; margin: -25px 38px 7px 299px; width: 87px; color:#000;">&nbsp;61-75
				days</div>
			<div
				style="background-color: #F7C758; margin: -23px 42px 20px 394px; width: 87px; color:#000;">&nbsp;76-90
				days</div>
			<div
				style="background-color: #EA9815; margin: -36px 38px 1px 487px; width: 87px; color:#fff;">&nbsp;91-105
				days</div>
			<div
				style="background-color: #EF7736; margin: -17px 38px -2px 580px; width: 99px; color:#fff;">&nbsp;106-120
				days</div>
			<div style="background-color: #f00; margin: -17px 38px -2px 684px; width: 65px; color:#fff;">>120days
			</div>
		</div>
		<br /> <br />
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th><b>SERIAL NO.</b></th>
					<th><b>BILL NO<br/>/INVOICE NO.</b></th>
					<th><b>CUSTOMER NAME</b></th>
					<th><b>PAYMENT DATE</b></th>
					<th><b>PAID STATUS</b></th>
					<th><b>SALE AMOUNT</b></th>
					<th><b>PAYMENT AMOUNT</b></th>
					<th><b>DUE AMOUNT</b></th>
					<th><b>DUE DAYS</b></th>
					
					<th><b>SALE DATE</b></th>
					<th><b>CHEQUE NUMBER</b></th>
					<th><b>CHEQUE DATE</b></th>
					<th><b>CHEQUE BANK</b></th>
					<th><b>PAY/<br/>HISTORY</b></th>
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
							<td><s:property value="cPayDate" /></td>
							<td><s:property value="cPaidStatus" /></td>
							<td><b style="color: blue;"><s:property value="grandTotal" /></b></td>
							<td><s:property value="cPaidAmt" /></b></td>
							<%--################################################# payment due color changing codes start here########################## --%>


							<s:if test="#e.dateDiff>=120 && #e.dueAmt!=0">
								<td style="background-color: red; color: #fff;"><b><s:property value="dueAmt" /></b></td>
							</s:if>

							<s:elseif test="#e.dateDiff>=105 && #e.dueAmt!=0">
								<td style="background-color: #EF7736; color: #fff;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=90 && #e.dueAmt!=0">
								<td style="background-color: #EA9815; color: #fff;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=75 && #e.dueAmt!=0">
								<td style="background-color: #F7C758; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=60 && #e.dueAmt!=0">
								<td style="background-color: #FCF400; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=45 && #e.dueAmt!=0">
								<td style="background-color: #DFF444; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=30 && #e.dueAmt!=0">
								<td style="background-color: #A0C623; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>

							<s:elseif test="#e.dateDiff>=15 && #e.dueAmt!=0">
								<td style="background-color: #B6BA2D; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>
							
							<s:elseif test="#e.dateDiff<15 && #e.dueAmt!=0">
								<td style="background-color: lime; color:#000;"><b><s:property value="dueAmt" /></b></td>
							</s:elseif>
							
							<s:else>
								<td ><b><s:property value="dueAmt" /></b></td>
							</s:else>


							<%--################################################# payment due color changing codes End here########################## --%>

							<s:if test="#e.cPaidStatus.equalsIgnoreCase('Paid')">
								<td><b style="color: blue;">0</b></td>
							</s:if>
							<s:else>
								<td ><b><s:property value="dateDiff" /></b></td>
							</s:else>
							
							<td><b style="color: blue;"><s:property value="doc" /></b></td>
							<td><s:property value="chequeNo" /></td>
							<td><s:property value="chequeDate" /></td>
							<td><s:property value="chequeBank" /></td>
							<%-- <s:if test="#e.cPaidStatus.equalsIgnoreCase('Paid')">
								<td></td>
							</s:if>
							<s:else> --%>
								<td ><img src="img/payment.png" height="30px" width="40px" onclick="getPayHistory('<s:property value='billno' />')" style="cursor: pointer;" /></td>
							<%-- </s:else> --%>
						</tr>
						<input type="hidden" value='<%=k++%>' />
						
					</s:iterator>
				</s:if>
			</tbody>
		</table>
	</div>
</div>