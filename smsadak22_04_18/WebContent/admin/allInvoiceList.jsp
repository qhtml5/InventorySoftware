<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<section class="content-header">
	<h1>
		Stock Master <small> Edit Your Bill</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>
		<li class="active">Purchase Bill Edit</li>
	</ol>
</section>
<section class="content" onmouseover="called()">

	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">View or Edit Invoice/Bill No</h3>
				</div>
				<table class="table table-hover" id="example1">
					<thead>
						<td><b>Invoice/Bill No</b></td>
						<td><b>Invoice Date</b></td>
						<td><b>View and Edit</b></td>
					</thead>
					<tbody>
						<s:if test="stockDTOList.size>0">
							<s:iterator value="stockDTOList">
								<tr>
									<td><s:property value="billNo" /></td>
									<td><s:property value="purchaseDate" /></td>
									<td>
										<button class="btnAdd"
											onclick="viewBillToEdit('<s:property value="billNo"/> ')">Edit
											Details</button>
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<br /> <br /> <br />
</section>