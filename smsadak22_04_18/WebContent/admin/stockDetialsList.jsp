<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<%-- 
<section onmouseover="called()" class="content">

	<div class="row">
		<!-- left column -->
		<div class="LongTable">
			<div class="box-header">
				<h3 class="box-title">Purchased Items List</h3>
			</div>
			<!-- /.box-header -->
			<!-- form start -->
 --%>
			<table id="example1" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th><b>SERIAL NO.</b></th>
						<th><b>BILL NO / INVOICE NO.</b></th>
						<th><b>SUPPLIER</b></th>
						<th><b>PURCHASE DATE</b></th>
						<th><b>AVAILABLE STOCK</b></th>
						<th><b>PURCHASED HISTORY</b></th>
					</tr>
				</thead>
				<tbody>
					<s:if test="stockDTOList.size>0">
						<%
							int k = 1;
						%>
						<s:iterator value="stockDTOList">
							<tr>
								<td><%=k%></td>
								<td><s:property value="billNo" /></td>
								<td><s:property value="suppliername" /></td>
								<td><s:property value="purchaseDate" /></td>
								<td><img
									src="<%=request.getContextPath()%>/img/purchase.png"
									width="45px" height="45px"
									onclick="getAllDetailsOfStock('<s:property value="billNo" />', '<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
									style="cursor: pointer;" /></td>
								<td><img
									src="<%=request.getContextPath()%>/img/purchase.png"
									width="45px" height="45px"
									onclick="getLedgerDetails('NA','<s:property value="billNo" />','<s:property value="supplierId"/>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'"
									style="cursor: pointer;" /></td>
							</tr>
							<input type="hidden" value='<%=k++%>' />
						</s:iterator>
					</s:if>
				</tbody>
			</table>
	<!-- 	</div>
	</div>

</section>
<div id="schDIV" class="white_content_login">
	<a href="#"
		onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
		<img src="img/Close-button.png" border="0" />
	</a>

	<div id="lDetailsDiv"></div>
</div> -->