<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>

<section onmouseover="called()" class="content">

	<div class="row">
		<!-- left column -->
	
              <br/>
				<div>
					<p>
						<b>Total Due Amount : ${requestScope['totalDue']} &nbsp;&nbsp;&nbsp;&nbsp;</b>
						<s:if test="totalDue>0">
						<b>Total Payment Amount :</b>
							<input type="text" name="paymentAmount" id="paymentAmount" value="0" onfocus="clearZero(this);" onblur="storeSupvalue('${requestScope['totalDue']}')"/>
						</s:if>
					</p>
					<input type="hidden" name="paymentAmount1" id="paymentAmount1"/>
				</div>
              <br/>
              <div style="margin:2px 36px 58px -21px;">
				<table id="example1" class="table table-hover">
					<thead>
						<tr>
							<th><b>SERIAL NO</b></th>
							<th><b>BILLNO</b></th>
							<th><b>GRAND TOTAL</b></th>
							<th><b>PAID AMOUNT</b></th>
							<th><b>NEW AMOUNT</b></th>
							<th><b>DUE AMOUNT</b></th>
							<th><b>PAYMENT DATE</b></th>
							<th><b>PAYMENT TYPE</b></th>
							<th><b>CHEQUE NO</b></th>
							<th><b>BANK </b></th>
							<th><b>PAID STATUS</b></th>
						</tr>
					</thead>
					<tbody>
						<%
							int k = 1;
						%>
						<s:if test="stockList.size>0">
							<s:iterator value="stockList">
								<tr>
									<td><%=k %></td>
									<td>
										<s:property value="billNo" />
										<input type="hidden" name="sBillNo[]" id="sBillNo<%=k %>" value='<s:property value="billNo"/>'/>
									</td>
									<td><s:property value="grandTot" /></td>
									<td><s:property value="sPaidAmt"/></td>
									<s:if test="dueAmt>0">
										<td><input type="text" name="sPaidAmt[]" id="sPaidAmt<%=k %>" size='4' onfocus="clearZero(this);" value='0' onblur="calSupPayAmt(document.getElementById('sPaidAmt<%=k %>'),document.getElementById('sDueAmt<%=k %>'))"  /></td>
									</s:if>
									<s:else>
										<td><input type="text" name="sPaidAmt[]" value='0' id="sPaidAmt<%=k %>" disabled="disabled"  /></td>
									</s:else>
									<td>
										<input type="hidden" name="sDueAmt[]" id="sDueAmt<%=k %>" value='<s:property value="dueAmt" />' />
										<s:property value="dueAmt" />
									</td>
									<td><s:property value="sPayDate" /></td>
									<td><select name="paymentType" id="paymentType<%=k %>"  onchange="calculatePaymentType(<%=k %>);"   >
									<option value="NA">--Select payment type---</option>
									<option value="cash">cash</option>
									<option value="cheque">cheque</option>
									</select></td>
									<td><input type="text" id="chequeNo<%=k %>" name="chequeno" readonly="true"  value="NA"/></td>
									<td><input type="text" id="bankname<%=k %>" name="bankname" readonly="true"  value="NA"/></td>
									<td><s:property value="sPaidStatus" /></td>
								</tr>
								<input type="hidden" value='<%=k++%>' />
							</s:iterator>
						</s:if>
					</tbody>
				</table>
				<input type="hidden" id="list" value='<%=k%>' />
				</div>
				<br/>
              <div style="margin: -9px 330px 62px -108px">
              	<s:submit cssClass="btnstock" id="sub" value="Submit Payment details" onclick="return validateSupPay()" />
              </div>
			</div>
		
	
	<br /> <br /> <br />
</section>