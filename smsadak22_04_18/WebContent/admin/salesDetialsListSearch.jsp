<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>

<!-- 
<section onmouseover="called()" class="content">

	<div class="row">
		left column
		<div class="LongTable">
			general form elements
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Sale details of all Items</h3>
				</div> -->
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th><b>SERIAL NO.</b></th>
							<th><b>BILL NO / INVOICE NO.</b></th>
							<th><b>SALE DATE</b></th>
							<th><b>PARTY / CUSTOMER NAME</b></th>
							<th><b>GRAND TOTAL</b></th>
							<th><b>PRODUCT SALE DETAILS</b></th>
							<th><b>CREDIT NOTE/ NO CREDITNOTE</b></th>
							<th><b>PRINT DUPLICATE BILL</b></th>

						</tr>
					</thead>
					<tbody>

						<s:if test="saleList.size>0">
							<%
								int k = 1;
							%>
							<s:iterator id="sl" value="saleList">
								<tr>
									<td><%=k%></td>
									<td><s:property value="billno" /></td>
									<td><s:property value="Doc" />
									
									</td>
									<td><s:property value="customerName" /></td>
									<td><s:property value="grandTotal" /></td>
									<td><img src="<%=request.getContextPath()%>/img/sales.png"
										width="45px" height="45px"
										onclick="getAllDetailsOfSales('<s:property value="billno" />','<s:property value="Doc" />'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
										style="cursor: pointer;" /></td>
										
										
												<td>
													
													<s:if test="#sl.creditnotestatus=='C.N'">
													
													
													<img
													src="<%=request.getContextPath()%>/img/damaged.png"
													width="45px" height="45px"
													
													style="cursor: pointer;" />
													
													</s:if>
													<s:else>
													
													<s:property value="creditnotestatus"/>
													</s:else>
													
													</td>
										
										
										
									<td>
									    
									    <img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" onclick="CenterWindow(800,800,50,'printSalesDetailsByBillno.action','SalesPrint','demo_win','<s:property value="billno" />','<s:property value="Doc" />');" style="cursor: pointer;"/>
<%-- 									<img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" onclick="printSalesDetails('<s:property value="billno" />'); document.getElementById('schDIV2').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/> --%>
									</td>

								</tr>
								<input type="hidden" value='<%=k++%>' />
							</s:iterator>

						</s:if>
					</tbody>
				</table>
<!-- 			</div>
		</div>
	</div>

</section>
<div id="schDIV" class="white_content_login">
	<a href="#"
		onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
		<img src="img/Close-button.png" border="0" />
	</a>

	<div id="slDetailsDiv"></div>
</div>
<div id="schDIV2" class="white_content_PrintLedger">
		<a href="#"
			onclick="document.getElementById('schDIV2').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>
		<div id="slDetailsDiv2" style="height: 555px"></div>
	</div> -->