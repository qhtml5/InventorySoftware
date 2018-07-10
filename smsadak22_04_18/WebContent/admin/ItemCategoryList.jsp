<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>
<section class="content-header">
	<h1>
		Item Master <small> Create your Items</small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">ITEM MASTER</a></li>
		<li class="active">ITEM MASTER FORM</li>
	</ol>
</section>
<section class="content">

	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">View or Edit item category types</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->

				<table class="table table-hover">
					<tr>
						<td><b>ITEM TYPE</b></td>
						<td><b>DATE OF CREATION</b></td>
						<td><b>VIEW/EDIT</b></td>


					</tr>
					<s:if test="iCateoryList.size>0">
						<s:iterator value="iCateoryList">
							<tr>
								<td><s:property value="itemType" /></td>
								<td><s:property value="typeDateofcreation" /></td>
								<td>
									<button class="btnAdd"
										onclick="editItemCategoryCall('<s:property value="itemTypeID"/> ','<%=request.getContextPath()%>');">Show
										Details</button>
								</td>


							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="3"
								style="text-align: center; color: red; font-size: 20px;">Sorry!
								No Content Available.</td>
						</tr>
					</s:else>
				</table>

			</div>
			<!-- /.box -->

			<!-- Form Element sizes -->
			<!-- /.box -->



			<!-- Input addon -->
			<!-- /.box -->

		</div>
		<!--/.col (left) -->
		<!-- right column -->
		<!--/.col (right) -->
	</div>
	<br /> <br /> <br />
</section>