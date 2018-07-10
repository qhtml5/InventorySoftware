<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.SalesMasterDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content" onmouseover="called()">
	<div class="row">
		<!-- left column -->
		<div>

			<div class="LongTable"
				style="width: 100%; height: 250px; overflow-y: scroll;">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<td>Customer Name.</td>
							<td>Bill No.</td>
							<td>Paid Amount</td>
							<td>Due Amount</td>
							<td>Pay Date</td>
							<td>Pay Mode</td>
							<td>Cheque No</td>
							<td>Paid Status</td>
						</TR>
					</thead>
					<tbody>
						<s:if test="%{listsize>0}">
							<s:iterator value="cPayList">
								<tr>
									<td><s:property value="customerName" /></td>
									<td><s:property value="billno" /></td>
									<td><b style="color: green;"><s:property
												value="cPaidAmt" /></b></td>
									<td><b style="color: red;"><s:property value="dueAmt" /></b></td>
									<td><s:property value="cPayDate" /></td>
									<td><s:property value="cPayMode" /></td>
									<td><s:property value="chequeNo" /></td>
									<td><s:property value="cPaidStatus" /></td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>
			</div>
			<s:if test="%{listsize>0}">

				<s:if test="%{#request.tDue=='0.0'}">
					<div style="margin: 23px 32px 31px 21px">
						<b style="color: green;">Customer has already paid amount <%=request.getAttribute("gtot")%>.
						</b>
					</div>


				</s:if>
				<s:else>

					<div
						style="width: 80%; height: 300px; background-color: rgba(145, 249, 165, 0.47); margin: 0 0 0 100px;">
						<br />

						<div style="margin: 0 0 0 180px;">
							<label for="customerSearch">Grand Total:</label> <b
								style="color: blue;"><%=request.getAttribute("gtot")%></b> <input
								type="hidden" name="grandTotal" class="textboxForScheme"
								id="grandTotal" value="<%=request.getAttribute("gtot")%>"
								readonly="readonly" /> &nbsp; <label for="customerSearch">Total
								Paid:</label> <b style="color: blue;"><%=request.getAttribute("tPaid")%></b>
							<input type="hidden" name="totalPaid" class="textboxForScheme"
								id="totalPaid" value="<%=request.getAttribute("tPaid")%>"
								readonly="readonly" /> &nbsp; <label for="customerSearch">Total
								Due:</label> <b style="color: blue;"><%=request.getAttribute("tDue")%></b>
							<input type="hidden" name="totaldue" class="textboxForScheme"
								id="totalDue" value="<%=request.getAttribute("tDue")%>"
								readonly="readonly" />
							<input type="hidden" name="regcustomerId"
								class="textboxForScheme" id="regcustomerId"
								value="<%=request.getAttribute("cusId")%>" readonly="readonly" />
							<input type="hidden" name="saleDate"
								class="textboxForScheme" id="saleDate"
								value="<%=request.getAttribute("saleDate")%>" readonly="readonly" />
						</div>
						<div
							style="width: 50%; height: 100px; float: left; margin: 50px 0 0 0">
							<button type="button" id="flipPay" class="flipPay1"
								onclick="cashDiv()">Cash Payment</button>
							<div id="panelPay" style="height: 80px;">
								<br /> <label for="customerSearch">Amount:</label> <input
									type="text" name="cPaidAmt" onfocus="clearZero(this)"
									id="paidAmt" size="8" onkeyup="amtValidation()" theme="simple" />
							</div>
						</div>

						<div
							style="width: 50%; height: 100px; float: left; margin: 50px 0 0 0;">
							<button type="button" id="flipPay1" class="flipPay1"
								onclick="chequeDiv()">Cheque Payment</button>
							<br /> <br />
							<div id="panelPay1" style="height: 80px; display: none">

								<table style="width: 100%">
									<tr>
										<td><label for="customerSearch">Amount:</label></td>
										<td><s:textfield name="chechPaidAmt"
												onfocus="clearZero(this)" id="cpaidAmt"
												onkeyup="amtValidation()" size="28" theme="simple" /></td>
									</tr>
									<tr>
										<td><label for="customerSearch">Cheque No:</label></td>
										<td><s:textfield name="cPayDto.chequeNo"
												onfocus="clearZero(this)" id="chqNo"
												onkeyup="chqValidation()" size="28" theme="simple" /></td>
									</tr>
									<tr>
										<td><label for="customerSearch">Cheque Date:</label></td>
										<td>
											<div>
												<select name="year" id="year">
													<option value="">year</option>
													<option value="2000">2000</option>
													<option value="2001">2001</option>
													<option value="2002">2002</option>
													<option value="2003">2003</option>
													<option value="2004">2004</option>
													<option value="2005">2005</option>
													<option value="2006">2006</option>
													<option value="2007">2007</option>
													<option value="2008">2008</option>
													<option value="2009">2009</option>
													<option value="2010">2010</option>
													<option value="2011">2011</option>
													<option value="2012">2012</option>
													<option value="2013">2013</option>
													<option value="2014">2014</option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
												</select> - <select name="month" id="month">
													<option value="">month</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="11">12</option>
												</select> - <select name="days" id="days">
													<option value="">days</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>


												</select>

											</div> <s:hidden name="cPayDto.chequeDate"
												onfocus="clearZero(this)" id="chqDoc"
												onkeyup="chqValidation()" theme="simple" />
										</td>
									</tr>
									<tr>
										<td><label for="customerSearch">Bank Name:(Press F1))</label></td>
										<td><s:textfield name="cPayDto.chequeBank"
												onfocus="clearZero(this)" id="chqBnk"
												onkeyup="chqValidation()" theme="simple" /></td>
									</tr>
								</table>
							</div>
						</div>
						<br />
						<div style="clear: both;"></div>
						<div id="addSalePayBt" style="margin-top: 50px;">
							<s:submit cssClass="btnstock" id="sub" value="Proceed"
								cssStyle="margin: 0px 350px 0px 0px;"
								onclick="this.value='Paying Please wait..';this.disabled='disabled'; return validateCustomerPay();" />
						</div>
					</div>

				</s:else>
			</s:if>
			<div id="validation1"></div>
		</div>
	</div>
</section>