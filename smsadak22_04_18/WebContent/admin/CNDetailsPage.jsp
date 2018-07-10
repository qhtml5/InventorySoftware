<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.StockMasterDTO" language="java"%>
<%@ page import="dTO.CreditNoteDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<section class="content">

	<div  class="row">
		<!-- left column -->
		

		<div>
			<div class="LongTable">
				<table id="example1" class="table table-hover">
					<thead>
						<TR>
							<td>CREDIT NOTE NO</td>
							<td>SALE BILL NO</td>
							<td>DATE</td>
							<td>CREDIT AMOUNT</td>
							<td>DETAILS</td>
							<td>PRINT COVER LETTER</td>
							<td>PRINT DETAILS</td>
						
						</TR>
					</thead>
					<tbody>
						<s:if test="%{crList.size>0}">
						  <%
							  int k = 0;
						   %>
							<s:iterator value="crList">
								<tr>
									<td align="center"><s:property value="cnNo" /><input type="hidden" name="cnNo" id="cnNo<%=k %>" value="<s:property value="cnNo" />"/></td>
									<td><s:property value="saleBillNo" /><input type="hidden" name="billNo" id="billNo<%=k %>" value="<s:property value="saleBillNo" />"/></td>
									<td><s:property value="cnDoc" /></td>
									<td><s:property value="creditAmount" /></td>
									<td>
									<img src="<%=request.getContextPath()%>/img/damaged.png"
									width="45px" height="45px"
									onclick="getCNRefundableDetByBillno('<s:property value="saleBillNo" />','<s:property value="cnNo" />'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
									style="cursor: pointer;" />
									</td>
									<td>
									    <s:if test="#cnNo!='NA'"> 
										<img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" onclick="printCreditCoverLetter(document.getElementById('cnNo<%=k%>').value,document.getElementById('billNo<%=k%>').value,'<%=request.getContextPath()%>');document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
										</s:if>
										<s:else>
										<b>Print not available</b>
										</s:else>
									</td>
									<td>
										<s:if test="#cnNo!='NA'">
										<img src="<%=request.getContextPath()%>/img/printing.png"
											width="45px" height="45px"
											onclick="printCreditLedgerDetails(document.getElementById('cnNo<%=k%>').value,document.getElementById('billNo<%=k%>').value,'<%=request.getContextPath()%>');document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'"
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
<div id="schDIV2" class="white_content_PrintLedger">
		<a href="#"
			onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>
		<div id="lDetailsDiv2" style="height: 555px"></div>
</div>

<div id="fade1" class="black_overlay"></div>