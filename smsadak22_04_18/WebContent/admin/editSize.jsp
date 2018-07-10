<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
<section class="content-header">
	<h1>
		Item Master <small> Edit your Size <img src="img/products.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>
		<li><a href="#" onclick="addSizeCall('<%=request.getContextPath()%>')">Add/View Size</a></li>
		<li class="active">Item Size Edit</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<s:form action="/editSize.action" method="post" theme="simple">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Edit Size Details :</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Size Name:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemSizeName" id="iSizeName" />
						</div>
						
						<div class="form-footer">
							<s:hidden id="itemSizeId" name="idto.itemSizeId"  value="%{idto.itemSizeId}" theme="simple" />
							<s:submit value="Edit Size" theme="simple" id="sub" cssClass="btn btn-primary" onclick="return validateSize();" />
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>