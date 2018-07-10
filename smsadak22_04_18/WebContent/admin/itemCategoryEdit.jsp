<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>
<section class="content-header">
	<h1>
		Item Category <small> Edit your Item Category <img src="img/products.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i><a href="adminIndexCall.action">HOME</a></li>
		<li><a href="#" onClick="itemCategoryCall('<%=request.getContextPath()%>')">CATEGORY ADD/VIEW</a></li>

		<li class="active">ITEM CATEGORY EDIT</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Edit Item Type :</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<s:form action="/editItemType.action" method="post">
					<div class="box-body">
						<div class="form-group">

							<label for="ItemTypeName">Item Type Name:</label>
							<s:textfield cssClass="form-control" name="idto.itemType" theme="simple" id="itemType" />
							<s:hidden cssClass="form-control" name="idto.itemTypeID" value="%{idto.itemTypeID}" theme="simple" id="itemTypeID" />
						</div>
						<div class="form-group">
							<label for="Description">Description</label>

							<s:textarea cssClass="form-control" name="idto.ItemTypeDescription" theme="simple" id="Description" cols="7" rows="9"></s:textarea>
						</div>

						<div class="form-group">
							<label for="Description">Created By</label>

							<s:textfield cssClass="form-control" name="idto.userName" theme="simple" id="itemType" disabled="true" />
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">

						<s:submit align="center" value="Submit" cssClass="btn btn-primary" onclick="return validateItemType();" />
					</div>
				</s:form>
			</div>
		</div>

	</div>
	<br /> <br /> <br />
</section>