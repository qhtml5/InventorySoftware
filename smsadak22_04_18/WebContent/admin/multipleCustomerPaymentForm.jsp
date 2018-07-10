<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>

<section onmouseover="called()" class="content">

	<div class="row">
		<!-- left column -->
		<div class="LongTable">
              <br/>
				<div>
					<p>
						<b>Total Due Amount : ${requestScope['totalDue']} &nbsp;&nbsp;&nbsp;&nbsp;</b>
						<s:if test="totalDue>0">
						<b>Total Payment Amount :</b>
							<input type="text" name="paymentAmount" id="paymentAmount" value="0" onfocus="clearZero(this);" onblur="storevalue('${requestScope['totalDue']}')"/>
						</s:if>
					</p>
					<input type="hidden" name="paymentAmount1" id="paymentAmount1"/>
				</div>
              <br/>
              
				<table id="example1" class="table table-hover">
					<thead>
						<tr>
							<th><b>SERIAL NO</b></th>
							<th><b>BILLNO</b></th>
							<th><b>SALE DATE</b></th>
							<th><b>GRAND TOTAL</b></th>
							<th><b>PAID AMOUNT</b></th>
							<th><b>NEW AMOUNT</b></th>
							<th><b>PAID STATUS</b></th>
							<th><b>DUE AMOUNT</b></th>
							<th><b>CUSTOMER PAY DATE</b></th>
							
						</tr>
					</thead>
					<tbody>
						<%
							int k = 1;
						%>
						<s:if test="saleList.size>0">
							<s:iterator id="e" value="saleList">
								<tr>
									<td><%=k %></td>
									<td>
										<s:property value="billno" />
										<input type="hidden" name="cBillNo[]" id="cBillNo<%=k %>" value='<s:property value="billno"/>'/>
									</td>
									<td><s:property value="Doc" /></td>
									<td><s:property value="grandTotal" /></td>
									<td><s:property value="cPaidAmt"/></td>
									<s:if test="dueAmt>0">
									<td><input type="text" name="cPaidAmt[]" id="cPaidAmt<%=k %>" onfocus="clearZero(this);" value='0' onblur="calPayAmt(document.getElementById('cPaidAmt<%=k %>'),document.getElementById('cDueAmt<%=k %>'))"  /></td>
									</s:if>
									<s:else>
										<td ><input type="text" name="cPaidAmt[]" id="cPaidAmt<%=k %>" style="background-color:#848482; " readonly="readonly"  value="0" /></td>
									</s:else>
									<s:if test="dueAmt<=0">
									<td style="background-color: #90F090;"><strong><s:property value="cPaidStatus" /></strong></td>
									</s:if>
									<s:elseif test="#e.cPaidStatus=='Partial'" >
									<td style="background-color: #FFA07A;"><strong><s:property value="cPaidStatus" /></strong></td>
									</s:elseif>
									<s:else>
									<td style="background-color: #FF0000;"><strong>Due </strong></td>
									</s:else>
									<td>
										<input type="hidden" name="cDueAmt[]" id="cDueAmt<%=k %>" value='<s:property value="dueAmt" />' />
										<s:property value="dueAmt" />
									</td>
									<td><s:property value="cPayDate" /></td>
									
								</tr>
								<input type="hidden" value='<%=k++%>' />
							</s:iterator>
						</s:if>
					</tbody>
				</table>
				<input type="hidden" id="list" value='<%=k%>' />
				
				<br/>
              <div style="margin: -9px 330px 62px -108px">
              	<s:submit cssClass="btnstock" id="sub" value="Submit Payment details" onclick="return validateCusPay()" />
              </div>
			</div>
		</div>
	
	<br /> <br /> <br />
</section>