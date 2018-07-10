<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<section class="content-header">
	<h1>
		Supplier Master <small> View all supplier list <img
			src="img/supplier.png" height="60px" width="60px"
			style="margin: -8px -23px -28px 2px" /></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action"><i
				class="fa fa-dashboard"></i> Home</a></li>

		<li class="active">SUPPLIER MASTER LIST</li>
	</ol>
</section>
<section onmouseover="called()" class="content">

	<div class="row">
		<!-- left column -->
		<div class="LongTable">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">View or Edit Supplier Details</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->

				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th onload="called()"><b>NAME</b></th>
							<th><b>ADDRESS</b></th>
							<th><b>EMAIL</b></th>
							<th><b>CONTACT PERSON</b></th>
							<th><b>PHONE</b></th>
							<th><b>VAT</b></th>
							<th><b>PAN</b></th>
							<th><b>CREATED BY</b></th>
							<th><b>VIEW & EDIT</b></th>
							<th><b>DELETE</b></th>
						</tr>
					</thead>
					<tbody>
						<%
							int k = 0;
						%>
						<s:if test="sDTOList.size>0">
							<s:iterator value="sDTOList">
								<tr>
									<td><s:property value="SUPPLIERNAME" /></td>
									<td><s:property value="ADDRESS" /></td>
									<td><s:property value="EMAIL" /></td>
									<td><s:property value="ContactPerson" /></td>
									<td><s:property value="PHONE" /></td>
									<td><s:property value="VATNo" /></td>
									<td><s:property value="PAN" /></td>
									<td><s:property value="username" /></td>
									<td><img src="img/supplier.png" height="60px" width="60px"
										onclick="editSupplierCall('<s:property value="SupplierId"/> ','<%=request.getContextPath()%>');"
										style="margin: -8px -23px -9px 1px; cursor: pointer;" /></td>

									<td>
										<form id="del<%=k%>" action="delSupplier.action" method="post">
											<input type="hidden" id="SupplierId" name="SupplierId"
												value="<s:property value='SupplierId'/>"> <a
												href="#" onclick="confirmDelete('<%=k%>');"> <img
												src="<%=request.getContextPath()%>/img/deleteStock.png"
												width="45px" height="45px" style="cursor: pointer;" />
											</a>
										</form>
										<input type="hidden" value='<%=k++%>' />
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</section>