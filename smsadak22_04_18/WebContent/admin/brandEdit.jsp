<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
<%@ page import="dTO.SupplierMasterDTO" language="java" %>
<section class="content-header">
	<h1>
		Item Master <small> Edit your Brand</small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>
		<li><a href="#" onclick="addBrandCall('<%=request.getContextPath()%>')">Add/View Brand</a></li>
		<li class="active">Item Brand Edit</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<s:form action="/editBrand.action" method="post" theme="simple">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Edit Brand Details :</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Brand Name:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemBrandName" id="iBrandName" />
						</div>
						
						<div class="form-footer">
							<s:hidden id="itemBrandId" name="idto.itemBrandId"  value="%{idto.itemBrandId}" theme="simple" />
							<s:submit value="Edit Brand" theme="simple" id="sub" cssClass="btn btn-primary" onclick="return validateBrand();" />
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>