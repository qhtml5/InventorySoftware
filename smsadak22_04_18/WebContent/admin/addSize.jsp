<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
<section class="content-header">
	<h1>
		Brand Master <small> Create your Brands <img
			src="img/products.png" height="60px" width="60px"
			style="margin: -14px -22px -21px 0px" /></small>

	</h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i><a
			href="adminIndexCall.action">Home</a></li>
		<li class="active">Add/ View Size</li>
	</ol>
</section>
<section onmouseover="called();" class="content">
<div id="validation"></div>
	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Enter Size Details :</h3>
				</div>
				<s:form action="addSize.action" method="post" id="sizeForm">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Size Name:</label>
							<s:textfield cssClass="form-control" theme="simple"
								name="idto.itemSizeName" id="iSizeName" onkeyup="ChkDupSize()" />
						</div>
					</div>
					<!-- /.box-body -->
					<div id="addItemBt">
						<s:submit cssClass="btn btn-primary" value="Add Size" id="pbutton"
							onclick="return validateSize();" />
					</div>
				</s:form>
			</div>
		</div>
		<div class="col-md-6">
			<div class="RightTable">
				<div class="box-header">
					<h3 class="box-title">Edit Size Details :</h3>
				</div>
				
					<table id="example1" class="table table-hover">
						<thead>
							<tr>
								<td><b>SIZE CODE</b></td>
								<td><b>SIZE NAME</b></td>
								<td><b>DATE OF CREATION</b></td>
								<td><b>VIEW</b></td>
								<th><b>DELETE</b></th>
							</tr>
						</thead>
						<%
								int k = 0;
						%>
						<s:if test="%{sizeList.size>0}">
							<s:iterator value="sizeList">
								<tr>
									<td><b><s:property value="itemSizeId" /></b></td>
									<td><b><s:property value="itemSizeName" /></b></td>
									<td><b><s:property value="itemSizeDOC" /></b></td>
									<td><button class="btnAdd"
											onclick="editSizeCall('<s:property value="itemSizeId" />','<%=request.getContextPath()%>')">View
											& Edit</button></td>
									<td>
									
									<form id="del<%=k%>" action="delSize.action" method="post">
										<input type="hidden" id="itemSizeId" name="itemSizeId"
											value="<s:property value='itemSizeId'/>">
											<a href="#" onclick="confirmDelete('<%=k%>');">
												<img src="<%=request.getContextPath()%>/img/deleteStock.png"
													width="45px" height="45px" style="cursor: pointer;" />
											</a>
									</form>
									<input type="hidden" value='<%=k++%>' />
									</td>

								</tr>
							</s:iterator>
						</s:if>
					</table>
				
			</div>
		</div>
	</div>
	<br /> <br /> <br />
</section>