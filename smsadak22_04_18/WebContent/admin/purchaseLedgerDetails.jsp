<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.PurchaseLedgerDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../upp.jsp"%>
<section class="content" onmouseover="called()">
<hr id="debitNoteListHR"/>
 <div style="height: 50px; margin:-5px 11px -32px -2px">
									
	Total Purchase Amount <s:textfield name="pdto.totPurchaseAmount" theme="simple" cssClass="textboxStockRateQuantityTotal" />
	Total Debit Amount<s:textfield name="pdto.totDebitAmount" theme="simple" cssClass="textboxStockRateQuantityTotal" />
    Total OutStanding Amount <s:textfield name="pdto.totOutStandingAmount" theme="simple" cssClass="textboxStockloc" />
</div>
<br/>
<hr id="debitNoteListHR"/>
<div id="dnListId">
	<div>
		<div class="LongTable">
			<table id="example1" class="table table-hover">
				<thead>
					<TR>
						<td>DN NO</td>
						<td>INVOICE/BILL NO</td>
						<td>DATE</td>	
						<td>VAT</td>
						<td>CST</td>
						<td>WAY BILL</td>
						<td>PURCHASE AMOUNT</td>
						<td>DEBIT AMOUNT</td>
						<td>DETAILS</td>
						<td>PRINT COVER LETTER</td>
						<td>PRINT DETAILS</td>
					</TR>
				</thead>
				<tbody>
						<s:if test="%{pLedgerList.size>0}">
							<%
								int k = 0;
							%>
							<s:iterator id="pl" value="pLedgerList">
								<tr>
									<td align="center"><b><s:property value="dnNo" /></b><input type="hidden" name="dnNo" id="dnNo<%=k %>" value="<s:property value="dnNo" />"/> </td>
									<td><b><s:property value="billNo" /></b><input type="hidden" name="billNo" id="billNo<%=k %>" value="<s:property value="billNo" />"/></td>
									<td><s:property value="dnDoc" /></td>
									<td><s:property value="vat" /></td>
									<td><s:property value="cst" /></td>
									<td><s:property value="waybill" /></td>
									<td><s:property value="purchaseAmount" /></td>
									<td><s:property value="debitAmount" /></td>
									
									<td>
									
										<img src="<%=request.getContextPath()%>/img/ledger.png" width="45px" height="45px" onclick="getLedgerDetails('<s:property value="dnNo" />','<s:property value="billNo" />','<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
									</td>
									<td>
									    <s:if test="#pl.dnNo!='NA'"> 
								
										
										<img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" onclick="printCoverLetter(document.getElementById('dnNo<%=k%>').value,document.getElementById('billNo<%=k%>').value,'<%=request.getContextPath()%>');document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
										
										</s:if>
										<s:else>
										<b>Print not available</b>
										
										</s:else>
									</td>
									<td>
										<s:if test="#pl.dnNo!='NA'">
										<img src="<%=request.getContextPath()%>/img/printing.png"
											width="45px" height="45px"
											onclick="printLedgerDetails(document.getElementById('dnNo<%=k%>').value,document.getElementById('billNo<%=k%>').value,'<%=request.getContextPath()%>');document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'"
											style="cursor: pointer;" />
										</s:if>
										<s:else>
											<b>Print not available</b>
										</s:else>
									</td>
								</tr>
								<input type="hidden" value='<%=k++%>' />
							</s:iterator>
						</s:if>
				</tbody>
			</table>
		</div>
		
	</div>
</div>
</section>