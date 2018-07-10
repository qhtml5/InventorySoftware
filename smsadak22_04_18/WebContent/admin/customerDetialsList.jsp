<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>
<section class="content-header">
	<h1>
		Customer Master <small> View all Customer details <img
			src="img/customer.png" height="60px" width="60px"
			style="margin: -20px -32px -20px 3px" /></small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action"><i
				class="fa fa-dashboard"></i> Home</a></li>

		<li class="active">CUSTOMER MASTER LIST</li>
	</ol>
</section>
<section onmouseover="called()" class="content">

	<div class="row">
		<!-- left column -->
		<div class="LongTable">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">View or Edit Supplier list</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->

				<table id="example1" class="table table-hover">
					<thead>
						<tr>
							<th><b>NAME</b></th>
						
							<th><b>ADDRESS</b></th>
						    
							<th ><b>CREATED BY</b></th>
						
							<th><b>VIEW & EDIT</b></th>
							<th><b>DELETE</b></th>
						</tr>
					</thead>
					<tbody>
						<%
							int k = 0;
						%>
						<s:if test="cList.size>0">
							<s:iterator value="cList" id="c">
								<tr>
									<td><s:property value="cName" /></td>
									
									<td><s:property value="address" /></td>
								
									<td><s:property value="userName" /></td>
                           
									<td><img src="img/customer.png" height="60px" width="60px"
										onclick="editCustomerCall('<s:property value="customerId"/> ','<%=request.getContextPath()%>');"
										style="margin: -8px -23px -9px 1px; cursor: pointer;" /></td>
									<td>
										<form id="del<%=k%>" action="delCustomer.action" method="post">
											<input type="hidden" id="customerId" name="customerId"
												value="<s:property value='customerId'/>"> <a
												href="#" onclick="confirmDelete('<%=k%>');"> <img
												src="<%=request.getContextPath()%>/img/deleteStock.png"
												width="45px" height="45px" style="cursor: pointer;" />
											</a>
										</form> <input type="hidden" value='<%=k++%>' />
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<div id="content3" style="display:none"></div>
	<br /> <br /> <br />
</section>