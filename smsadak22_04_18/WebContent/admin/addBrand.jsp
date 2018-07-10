<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>  
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java" %>
<section class="content-header">
	<h1>
		Brand Master <small> Create your Brands</small>

	</h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i><a href="adminIndexCall.action">Home</a></li>
		<li class="active">Add/View Brand</li>
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
					<h3 class="box-title">Enter Brand Details :</h3>
				</div>
				<s:form action="addBrand.action" method="post" id="brandForm">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Brand Name:</label> 
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemBrandName" id="iBrandName" onkeyup="ChkDupBrand();"/>
						</div>
					</div>
					<!-- /.box-body -->
					<div id="addItemBt">
						<s:submit cssClass="btn btn-primary" value="Add Brand" id="pbutton" onclick="return validateBrand();" />
					</div>
				</s:form>
			</div>
		</div>
		<div class="col-md-6">
			<div class="RightTable">
				<div class="box-header">
					<h3 class="box-title">Edit Brand Details :</h3>
				</div>
				<table id="example1" class="table table-hover">
					<thead>
					<tr>
						<td><b>BRAND CODE</b></td>
						<td><b>BRAND NAME</b></td>
						<td><b>DATE OF CREATION</b></td>
						<td><b>VIEW</b></td>
					</tr>
					</thead>
					<s:if test="%{brandList.size>0}">
						<s:iterator value="brandList">
							<tr>
								<td><b><s:property value="itemBrandId" /></b></td>
								<td><b><s:property value="itemBrandName" /></b></td>
								<td><b><s:property value="itemBrandDOC" /></b></td>
								<td><button class="btnAdd" onclick="editBrandCall('<s:property value="itemBrandId" />','<%=request.getContextPath()%>')">View & Edit</button></td>
							</tr>
						</s:iterator>
					</s:if>
				</table>
			</div>
		</div>
	</div>
	
	<br />
	<br /> <br />
</section>